---
title: "SkyJEPA: Learning Long-Horizon World Models for Zero-Shot Sim-to-Real Control of Quadrotors"
source: "https://arxiv.org/html/2606.23444v2"
author:
published:
created: 2026-08-06
description:
tags:
  - "clippings"
---
Pratyaksh Rao <sup>1</sup> Wancong Zhang <sup>2</sup> Randall Balestriero <sup>3</sup> Yann LeCun <sup>2</sup> Giuseppe Loianno <sup>1</sup> <sup>1</sup> The authors are with the University of California Berkeley, Department of Electrical Engineering and Computer Sciences, Berkeley, CA 94720, USA. e-mail: pratyaksh10@berkeley.edu, loiannog@eecs.berkeley.edu <sup>2</sup> The authors are with New York University, New York, NY, USA. e-mail: wz1232@nyu.edu, yann@cs.nyu.edu <sup>3</sup> The author is with Brown University, Providence, RI, USA. e-mail: randall\_balestriero@brown.edu

###### Abstract

Accurate dynamics models are critical for informed decision-making in robotic systems, particularly for agile aerial vehicles operating under uncertainty. Neural network dynamics models are attractive for capturing complex nonlinear effects, but existing predictive approaches struggle with long-horizon forecasting because their autoregressive rollout mechanism amplifies errors over time. Joint Embedding Predictive Architectures (JEPAs) offer a compelling alternative by modeling dynamics in latent space, yet prior JEPA-style methods for robot navigation have been studied primarily for kinematic-level planning, with limited investigation in high-frequency control. In this work, we introduce the JEPA-style model for real-time quadrotor control. The proposed approach combines a latent dynamics model with a novel physics-inspired prober that maps frozen latents to interpretable state, enabling physically grounded long-horizon prediction. Additionally, we combine the learned model with a sampling-based optimal control solution to take advantage of its predictive capabilities for real-time control on embedded hardware. Finally, to reduce the dependence on expensive and unsafe real-world data collection, we develop a structured pipeline for automated dataset generation. Extensive open-loop and outdoor closed-loop experiments demonstrate accurate prediction, robust zero-shot sim-to-real transfer, and strong generalization across diverse operating conditions.

## I Introduction

Unmanned Aerial Vehicles (UAVs) have become increasingly important in applications such as package delivery, infrastructure inspection, search and rescue, and environmental monitoring [^28] [^58]. These tasks require aerial robots to operate reliably in complex, uncertain, and often rapidly changing environments while executing agile maneuvers with limited onboard sensing and computation. Achieving this level of autonomy fundamentally depends on the ability to make accurate decisions. For this reason, model-based control has emerged as a particularly attractive paradigm for aerial robotics, as it explicitly reasons about future system evolution and can naturally incorporate task objectives, dynamical constraints, and robustness considerations [^11] [^61] [^42].

A dynamics model, often referred to as predictive or world model, for aerial control should satisfy four key properties (see Figure 1). First, it should provide *accurate long-horizon predictions*. Its rollouts must remain accurate, stable, and physically plausible over the prediction horizons used for control. This requires capturing both the dominant rigid-body dynamics and difficult-to-model effects such as aerodynamic drag, actuator delay, propeller–airframe interactions, wind disturbances, and hardware variations. Second, it should be *interpretable*. The model should be able physically to capture and expose meaningful quantities such as position, velocity, attitude, and angular velocity. This is essential for enforcing constraints, actuator limits, safety bounds, and task costs inside a controller. Third, it should be *real-time*. Real-time aerial control requires repeated high-frequency model evaluations inside resource-constrained onboard optimization loops. Finally, the last property is *zero-shot task generalization*. The same dynamics representation should be reusable across trajectories, controllers, objectives, and platform configurations.

Classical first-principles models satisfy some of these requirements [^35], but fall short in practice. They encode the known structure of quadrotor dynamics and are computationally efficient, yet real-world flight behavior is shaped by complex and platform-specific effects that are difficult to model exactly. Small changes such as payload attachment, propeller replacement, motor degradation, or sensor bias can significantly alter the system response. As a result, analytical models often require extensive system identification [^15] and manual tuning, while still struggling to maintain accuracy across operating regimes.

![Refer to caption](https://arxiv.org/html/2606.23444v2/x1.png)

Figure 1: Desirable properties of a quadrotor world model: accurate long-horizon prediction, interpretable, real-time inference for closed-loop control, and zero-shot task generalization.

This limitation has motivated a large body of work on neural dynamics models [^51] [^9] [^47] [^52] [^14] [^46] [^24]. These methods aim to learn unmodeled nonlinear effects directly from data and have been explored in both offline and online settings. Offline methods train models from pre-collected trajectory datasets [^51] [^9] [^47] [^14] [^46] [^24], while online methods adapt the model during deployment to account for changing dynamics or distribution shift [^18] [^50] [^57] [^32] [^45] [^25]. Despite these differences, most approaches share a common formulation: they learn a predictive encoder–decoder model that estimates the next state or observation and recursively feeds this prediction back as input during rollout.

While intuitive, this autoregressive predictive formulation violates a central requirement for model-based control: long-horizon stability. Since the model is repeatedly conditioned on its own imperfect outputs, small one-step errors arising from uncertainty, approximation, or inaccuracies can accumulate over time, leading to drift, instability, and physically implausible trajectories. In practice, the error may easily compound and can severely degrade rollout fidelity as the prediction horizon increases [^47]. Adding physics-inspired regularization [^51], residual structures [^9], or online adaptation [^50] can improve local prediction accuracy, but does not remove the underlying autoregressive error accumulation mechanism. Moreover, reconstructing the full future state or observation at every step can force the representation to preserve nuisance factors such as sensor noise, bias, or task-irrelevant variation. This becomes especially problematic for high-dimensional observations, where full observation prediction is computationally expensive.

Model-Based Reinforcement Learning (MBRL) provides an alternative route by jointly learning a world model and a task-driven policy from interaction data [^48] [^17] [^62]. Although such approaches can achieve strong task performance, the learned model is often coupled to a particular reward, policy, or visitation distribution. Consequently, the resulting representation hardly generalizes across controllers, reference trajectories, or downstream tasks. For aerial robotics, where the same dynamics model should ideally support different tasks, such task-coupled learning can be restrictive.

A further obstacle is data collection. For any learned dynamics model, the quality of the dataset is as important as the choice of architecture. The data collection process must informative (e.g., efficiently covering the overall flight envelope) and sample efficient and therefore covering a diverse range of states, control inputs, speeds, accelerations, and operating conditions. However, for aerial robots, there is currently no systematic procedure for collecting such a dataset. In practice, data collection often relies on hand-designed trajectories, expert pilots, or task-specific flight logs. This makes the resulting dataset incomplete and biased toward a limited set of behaviors. Collecting broader real-world data is also expensive, risky, and labor-intensive. It often requires controlled environments and aggressive maneuvers, which increase the likelihood of crashes or hardware damage. Moreover, when the platform configuration changes, existing pipelines often require new data collection and retraining, limiting scalability.

These limitations raise the central question of this work: *Can we learn an efficient dynamic model for aerial robots that provides accurate long-horizon prediction, physically interpretable rollouts, real-time control capability, and zero-shot generalization across tasks, while reducing dependence on risky real-world data collection?* To address this question, we propose a domain-randomized simulation-to-real framework for training a JEPA-style latent dynamics model for real-time aerial control. Rather than reconstructing future states or observations autoregressively, our model learns to predict future representations in a structured latent space. This formulation encourages the model to capture control-relevant dynamics while avoiding unnecessary reconstruction of nuisance details. To make the learned representation usable for model-based control, we introduce a physics-inspired prober that maps frozen latent rollouts to physically meaningful state variables through a lightweight kinematic structure. By combining latent predictive representation learning, physical structure, and domain-randomized simulation, our approach enables accurate long-horizon prediction and real-time control while remaining reusable across tasks and platform variations. Our main contributions are summarized as follows:

- We introduce a JEPA-styled latent dynamics model with a physics-inspired prober that maps frozen representations to physically meaningful state variables, enabling physically grounded long-horizon prediction for quadrotor control.
- We demonstrate that by integrating the learned latent dynamics model within a sampling-based optimization framework, we exploit the predictive capabilities of the learned model for real-time control and robust zero-shot sim-to-real transfer on resource-constrained embedded platforms.
- We propose a domain-randomized simulation pipeline for automated dataset generation, reducing the need for extensive and potentially unsafe real-world data collection.
- We extensively evaluate the proposed framework against current dynamics learning baselines and key design choices through open-loop prediction, and outdoor closed-loop control experiments, demonstrating improved long-horizon accuracy, robust control, and generalization across trajectories and platform variations.

## II Related Works

### II-A Predictive Modeling

A large body of work has studied learning robot dynamics from data in both offline [^46] [^10] [^14] and online settings. Prior offline approaches have explored residual learning over nominal models [^9] [^27], improved multi-step training objectives [^47], and physics-inspired regularization [^51]. On the other hand, online methods [^18] [^50] [^57] [^32] [^45] [^25] adapt the model during deployment, typically by finetuning the last few layers of the neural dynamics model. Although these directions improve the ability to capture dynamics, each has an inherent limitation. Residual learning strongly depends on the fidelity of the nominal model. Physics-inspired regularization can guide training toward more plausible solutions, but it does not guarantee physically meaningful rollouts. Online adaptation adds deployment complexity because it requires continual on-robot data collection and model updates, along with extra compute and safeguards to prevent unstable intermediate models from degrading control. Moreover, all these approaches remain based on an autoregressive encoder–decoder paradigm, in which predicted states or observations are recursively reused as inputs for future prediction [^4] [^43] [^36] [^51]. As a result, small one-step errors are propagated forward and accumulate over time, leading to drift and degraded long-horizon fidelity. This compounding-error problem is intrinsic to predictive modeling and is not removed by better losses, residual corrections, or online updates alone, motivating the need for alternatives. In contrast, the proposed JEPA-styled approach produces more accurate long-horizon model predictions compared to these classic predictive models by properly capturing the temporal and spatial context of the problem using a compact abstract representation, avoiding reconstruction altogether.

### II-B Joint Embedding Predictive Architectures

JEPA-style methods offer an appealing alternative to predictive encoder–decoder models by learning to predict future embeddings rather than reconstructing full future observations, yielding compact representations that are naturally scalable to high-dimensional inputs. This idea has shown promise in image representation learning [^1], video prediction [^6] [^2] [^8], and more recently in robotics [^64]. However, most JEPA-style robotics works have focused on vision-centric settings such as manipulation [^19] and navigation [^5], with several demonstrated only on toy problems or in exocentric simulation without real-world validation [^63] [^38] [^54]. Moreover, these methods are typically studied at the level of high-level kinematic planning, where abstract latent predictions are often sufficient. Their use for feedback control remains largely unexplored, particularly for aerial robots, where high-frequency inference of the system dynamics and real-time compute constraints make control-oriented latent modeling significantly more challenging. This is what we address in this work by proposing by proposing the first JEPA framework trained end-to-end for real-time quadrotor control.

### II-C Model-Based Reinforcement Learning

With the rise of deep Reinforcement Learning (DRL), a new class of controllers has emerged that leverage learned models of system dynamics to plan and act [^29] [^11] [^61] [^48] [^33]. These approaches aim to improve data efficiency and generalization by explicitly reasoning about future system evolution, rather than relying solely on reactive, model-free policies. Early model-based RL methods primarily focused on learning dynamics in state space [^21], and have since been extended to handle high-dimensional sensory inputs such as images [^41]. However, predicting directly in observation space is often data-intensive and computationally expensive, particularly for vision-based inputs, and can lead to the learning of noisy features when the training data distribution is imperfect. Latent-space prediction offers a more compact alternative, but many existing approaches rely on reconstruction-based objectives [^22], inheriting similar limitations associated with observation reconstruction. Moreover, a large class of model-based RL methods incorporate reward prediction, either explicitly or as an auxiliary objective, when learning latent representations [^56] [^26] [^49] [^44], which inherently couples the learned world model to a specific task. In contrast, in this work we, decouple task-dependent information from latent dynamics prediction to enable general-purpose, real-time quadrotor control without any task-specific reward conditioning.

## III Background

### III-A Learning System Dynamics

We consider a discrete-time dynamical system with state $\mathbf{x}_{t}\in\mathbb{R}^{D_{s}}$ and control action $\mathbf{a}_{t}\in\mathbb{R}^{D_{a}}$. The dynamics are described by a transition function $f:\mathbb{R}^{D_{s}}\times\mathbb{R}^{D_{a}}\rightarrow\mathbb{R}^{D_{s}}$

$$
\mathbf{x}_{t+1}=f(\mathbf{x}_{t},\mathbf{a}_{t}).
$$

For a quadrotor, we define the state as

$$
\mathbf{x}_{t}=\begin{bmatrix}\mathbf{p}_{t}^{\top}&\mathbf{v}_{t}^{\top}&\mathbf{r}_{x,t}^{\top}&\mathbf{r}_{y,t}^{\top}&\mathbf{r}_{z,t}^{\top}&\bm{\omega}_{t}^{\top}\end{bmatrix}^{\top}.
$$

Here, $\mathbf{p}_{t}\in\mathbb{R}^{3}$ and $\mathbf{v}_{t}\in\mathbb{R}^{3}$ denote position and velocity in the inertial frame. The attitude is represented by the rotation matrix $\mathbf{R}_{t}=\begin{bmatrix}\mathbf{r}_{x,t}&\mathbf{r}_{y,t}&\mathbf{r}_{z,t}\end{bmatrix}\in\mathrm{SO}(3)$, whose columns are $\mathbf{r}_{x,t},\mathbf{r}_{y,t},\mathbf{r}_{z,t}\in\mathbb{R}^{3}$. This rotation matrix represents the attitude of the body frame in the inertial frame. The angular velocity $\bm{\omega}_{t}\in\mathbb{R}^{3}$ is expressed in the body frame. The action $\mathbf{a}_{t}=[f_{0,t},f_{1,t},f_{2,t},f_{3,t}]^{\top}\in\mathbb{R}^{4}$ denotes the four motor forces.

### III-B Predictive Modeling

A common approach to learning dynamics is to train a predictive model on state-action transitions. Let $\mathcal{D}=\{(\mathbf{x}_{i},\mathbf{a}_{i},\mathbf{x}_{i+1})\}_{i=1}^{N}$ be a dataset of $N$ transitions. The goal is to approximate the dynamics using a neural network $h$, parameterized by weights $\bm{\theta}$. Formally, the state at the next time index, $i+1$ is given by

$$
\tilde{\mathbf{x}}_{i+1}=h_{\bm{\theta}}(\mathbf{x}_{i},\mathbf{a}_{i}).
$$

The model is trained by minimizing the prediction loss

$$
\min_{\bm{\theta}}\frac{1}{N}\sum_{i=1}^{N}\left\|\mathbf{x}_{i+1}-h_{\bm{\theta}}(\mathbf{x}_{i},\mathbf{a}_{i})\right\|_{2}^{2}.
$$

This objective encourages accurate local predictions. However, model-based control requires prediction over a sequence of future actions. Given an action sequence, the model is rolled out recursively

$$
\hat{\mathbf{x}}_{t+T}=h_{\bm{\theta}}(\dots h_{\bm{\theta}}(h_{\bm{\theta}}(\mathbf{x}_{t},\mathbf{a}_{t}),\mathbf{a}_{t+1})\dots,\mathbf{a}_{t+T}).
$$

This recursive formulation introduces compounding error. Let the vector prediction error be $\bm{\epsilon}_{t+k}=\mathbf{x}_{t+k}-\tilde{\mathbf{x}}_{t+k}$. During rollout, each prediction is used as the input to the next step,

$$
\displaystyle\tilde{\mathbf{x}}_{t+1}
$$
 
$$
\displaystyle=h_{\bm{\theta}}(\mathbf{x}_{t},\mathbf{a}_{t}),
$$
$$
\displaystyle\tilde{\mathbf{x}}_{t+2}
$$
 
$$
\displaystyle=h_{\bm{\theta}}(\mathbf{x}_{t+1}-\bm{\epsilon}_{t+1},\mathbf{a}_{t+1}),
$$
$$
\displaystyle\vdots
$$
 
$$
\displaystyle\tilde{\mathbf{x}}_{t+T}
$$
 
$$
\displaystyle=h_{\bm{\theta}}(\mathbf{x}_{t+T-1}-\bm{\epsilon}_{t+T-1},\mathbf{a}_{t+T-1}).
$$

This makes the source of compounding explicit. At each step, the model is evaluated on a state that is shifted from the true trajectory by the accumulated prediction error. As the horizon increases, these errors alter the future inputs to the model. Thus, small one-step errors can grow into large rollout errors. This can lead to drift and physically implausible trajectories.

![Refer to caption](https://arxiv.org/html/2606.23444v2/x2.png)

Figure 2: Overview of the proposed framework. We learn a JEPA-style latent dynamics model with a physics-inspired prober that maps abstract embeddings to physically meaningful states, enabling stable long-horizon quadrotor prediction. Trained entirely on domain-randomized simulation data and deployed within a sampling-based controller, the model achieves real-time execution and robust zero-shot sim-to-real transfer validated in outdoor flight experiments.

## IV Methodology

In this section, we describe the methodology underlying our approach (see Figure 2). We first introduce our proposed JEPA-styled dynamics learning formulation. Next, we present the training objective for learning dynamics. We then describe a sampling-based optimization framework that leverages the learned model for optimal real-time quadrotor control. Lastly, we describe automated data collection framework, including trajectory generation, closed-loop control, and domain randomization strategy used to generate diverse trajectory-level data.

### IV-A Problem Formulation

We seek to learn a dynamics model that supports long-horizon prediction for model-based quadrotor control. As discussed in Section III-B, directly predicting future states in an autoregressive manner can lead to compounding errors. Therefore, we formulate dynamics learning in a compact latent space. This follows the JEPA principle of predicting representations rather than reconstructing inputs [^31]. The goal is to learn a representation that captures the evolution of the system while avoiding unnecessary reconstruction of task-irrelevant details. At each time step, the UAV receives an estimated full-state observation $\mathbf{x}_{t}$. To provide temporal context and promote better sim-to-real transfer, we condition the model on histories of states and actions over a window of length $H$. The state history and action history are defined as

$$
\mathbf{X}_{t}=\begin{bmatrix}\mathbf{x}_{t-H}^{\top}&\cdots&\mathbf{x}_{t}^{\top}\end{bmatrix}^{\top},\qquad\mathbf{A}_{t}=\begin{bmatrix}\mathbf{a}_{t-H}^{\top}&\cdots&\mathbf{a}_{t}^{\top}\end{bmatrix}^{\top}.
$$

This history-based formulation gives the model access to recent motion and actuation trends. It also helps account for effects that are not fully captured by a single state, such as actuator delay, drag, sensor noise, and platform-dependent dynamics. The state and action histories are encoded into latent representations $\mathbf{s}_{t}=\text{Enc}_{\theta}(\mathbf{X}_{t})$ and $\mathbf{z}_{t}=\text{Enc}_{\phi}(\mathbf{A}_{t})$. The latent dynamics predictor then estimates the next latent state as $\tilde{\mathbf{s}}_{t+1}=\text{Pred}_{\varphi}(\mathbf{s}_{t},\mathbf{z}_{t})$. For a prediction horizon of $T$, the predictor is recursively unrolled using the encoded actions

$$
\tilde{\mathbf{s}}_{t+T}=\text{Pred}_{\varphi}(\dots\text{Pred}_{\varphi}(\text{Pred}_{\varphi}(\mathbf{s}_{t},\mathbf{z}_{t}),\mathbf{z}_{t+1}),\dots,\mathbf{z}_{t+T-1}).
$$

Thus, the learning problem is to train the encoders and predictor so that the latent rollout $\{\tilde{\mathbf{s}}_{t+1},\dots,\tilde{\mathbf{s}}_{t+T}\}$ remains consistent with the encoded future trajectory $\{\mathbf{s}_{t+1},\dots,\mathbf{s}_{t+T}\}$. This formulation avoids direct reconstruction of future states while preserving the information needed for long-horizon dynamics.

### IV-B Training Objective

The objective is to learn latent representations that support accurate multi-step dynamics prediction for long-horizon forecasting (see Figure 3). The proposed loss contains two terms. The first term enforces predictive consistency between rolled-out latent predictions and encoded future states. The second term regularizes the latent space to prevent representation collapse. We define the multi-step latent prediction loss as

$$
\mathcal{L}_{\mathrm{pred}}=\frac{1}{T}\sum_{k=1}^{T}\|\tilde{\mathbf{s}}_{t+k}-\mathbf{s}_{t+k}\|_{2}^{2}.
$$

This loss encourages the encoder and predictor to learn representations that remain predictive over the full rollout horizon. However, minimizing this term alone admits degenerate solutions. For example, the encoder could map all inputs to nearly constant embeddings, yielding low prediction error without preserving meaningful system dynamics. We therefore utilize an anti-collapse regularization term. We employ Sketched Isotropic Gaussian Regularization (SIGReg) [^3], which encourages the latent embeddings to match an isotropic Gaussian distribution. This promotes diversity and isotropy in the representation space.

To apply SIGReg over a rollout during training, we collect the predicted latent embeddings into a tensor $\mathbf{S}\in\mathbb{R}^{T\times B\times D}$, where $B$ is the training batch size during training, and $D$ is the embedding dimension. Instead of matching the full $D$ -dimensional latent distribution directly, SIGReg compares random one-dimensional projections of the latent distribution to a standard Gaussian. We sample $M$ random unit vectors, where the directions are sampled uniformly on the hypersphere, $\{\bm{\xi}_{m}\}_{m=1}^{M}\subset\mathbb{S}^{D-1}$ and project the latent tensor along each direction $\mathbf{h}^{(m)}=\mathbf{S}\bm{\xi}_{m}\in\mathbb{R}^{T\times B}$. For each projection, we evaluate the univariate Epps–Pulley test statistic, measuring the distribution mismatch. Let

$$
\phi_{N}(t;\mathbf{h}^{(m)})=\frac{1}{B}\sum_{b=1}^{B}e^{ith_{b}^{(m)}},
$$

denote the empirical characteristic function of the projected samples, and let $\phi_{0}(t)$ denote the characteristic function of the standard Gaussian $\mathcal{N}(0,1)$. The projected discrepancy is

$$
T^{(m)}=\int_{-\infty}^{\infty}w(t)\left|\phi_{B}(t;\mathbf{h}^{(m)})-\phi_{0}(t)\right|^{2}dt,
$$

where $w(t)$ is a weighting function, typically chosen as a Gaussian kernel. The SIGReg penalty is then

$$
\mathcal{L}_{\mathrm{SIGReg}}=\frac{1}{M}\sum_{m=1}^{M}T^{(m)}.
$$

By the Cramér–Wold theorem, matching all one-dimensional marginals is equivalent to matching the full joint distribution. Therefore, minimizing these projected discrepancies encourages the latent distribution to approach an isotropic Gaussian. In practice, the integral in $T^{(m)}$ is evaluated numerically using quadrature, following [^3]. We average this SIGReg penalty across the temporal dimension. The final objective combines multi-step prediction consistency with SIGReg regularization

$$
\mathcal{L}_{\mathrm{total}}=\mathcal{L}_{\mathrm{pred}}+\lambda_{\mathrm{sig}}\mathcal{L}_{\mathrm{SIGReg}}.
$$

Here, $\lambda_{\mathrm{sig}}$ controls the strength of the anti-collapse regularization relative to the prediction objective. The SIGReg component introduces only two practical hyperparameters, $M$ and $\lambda_{\mathrm{sig}}$, with $\lambda_{\mathrm{sig}}$ being the main parameter to tune. Following [^3], we also find that performance is not highly sensitive to the number of random projections $M$. This is in contrast to many self-supervised representation learning objectives that require balancing several regularization terms [^7] [^54], stop-gradient [^20] design choices, exponential moving averages, or reconstruction weights.

![Refer to caption](https://arxiv.org/html/2606.23444v2/x3.png)

Figure 3: Two-stage training pipeline of our proposed approach. In the first stage, an encoder maps a history of past states into a latent representation, and a predictor propagates this latent forward in time conditioned on a sequence of control actions; in the second stage, a physics-inspired prober is trained on frozen latent embeddings to map them to physically grounded states.

### IV-C Physics-Inspired Probing Mechanism

For model-based control, latent predictions must be converted into physically meaningful quantities. This is necessary for evaluating tracking costs, enforcing state constraints, and respecting actuator limits. However, the JEPA-style dynamics model predicts future evolution in an abstract representation space. We therefore introduce a physics-inspired probing mechanism that maps latent rollouts to interpretable state trajectories through a differentiable kinematic model. After training the latent dynamics model with eq. (13), we perform a second training stage for metric-state recovery. During this stage, the encoders and predictor $(\mathrm{Enc}_{\theta},\mathrm{Enc}_{\phi},\mathrm{Pred}_{\varphi})$, are frozen and only the probing network is optimized. This separation prevents the supervised state-recovery objective from altering the learned latent dynamics, while allowing the prober to learn a physically grounded map from frozen latent rollouts to metric state trajectories.

Given the predicted latent sequence $\{\tilde{\mathbf{s}}_{t+1},\dots,\tilde{\mathbf{s}}_{t+T}\}$, the current estimated state $\mathbf{x}_{t}$, and the control sequence $\{\mathbf{a}_{t},\dots,\mathbf{a}_{t+T-1}\}$ used for latent rollout which in our specific case will be generated using the optimal control procedure presented in Section IV-D. The probing network $\psi$ predicts residual correction terms

$$
\{\Delta\mathbf{\dot{v}}_{t+k},\mathbf{K}_{t+k}\}=\psi(\tilde{\mathbf{s}}_{t+k}).
$$

Here, $\Delta\mathbf{\dot{v}}_{t+k}\in\mathbb{R}^{3}$ represents a residual translational acceleration, $\mathbf{K}_{t+k}\in\mathbb{R}^{3\times 4}$ parameterizes residual angular acceleration, and $k$ is the unroll index. The control input is the individual rotor forces as mentioned in Section III. The predicted state trajectory is obtained by integrating a residual-corrected kinematic model. At each step, the translational acceleration is given by the nominal thrust-induced acceleration plus the learned residual

$$
\displaystyle\mathbf{\dot{v}}_{t}
$$
 
$$
\displaystyle=\frac{\sum_{i=0}^{3}f_{i,t}}{m}\mathbf{R}_{t}\mathbf{e}_{3}-\mathbf{g}+\Delta\mathbf{\dot{v}}_{t},
$$
$$
\displaystyle\Delta\bm{\tau}_{t}
$$
 
$$
\displaystyle=\mathbf{K}_{t}\mathbf{a}_{t}.
$$

Here, $\mathbf{e}_{3}=[0\penalty 10000\ 0\penalty 10000\ 1]^{\top}$, and $\Delta\bm{\tau}_{t+k}$ denotes the latent-conditioned residual angular acceleration. The state is then propagated using

$$
\displaystyle\mathbf{p}_{t+1}
$$
 
$$
\displaystyle=\mathbf{p}_{t}+\mathbf{v}_{t}\Delta t,
$$
$$
\displaystyle\mathbf{v}_{t+1}
$$
 
$$
\displaystyle=\mathbf{v}_{t}+\mathbf{\dot{v}}_{t}\Delta t,
$$
$$
\displaystyle\mathbf{R}_{t+1}
$$
 
$$
\displaystyle=\mathbf{R}_{t}\exp\!\left([\bm{\omega}_{t}]_{\times}\Delta t\right),
$$
$$
\displaystyle\bm{\omega}_{t+1}
$$
 
$$
\displaystyle=\bm{\omega}_{t}+\Delta\bm{\tau}_{t}\Delta t.
$$

This compact integrator preserves the geometric structure of the attitude dynamics through the $\mathrm{SO}(3)$ exponential map, while allowing the latent representation to correct for unmodeled translational and rotational dynamics effects.

During prober training, a stop-gradient operation is applied to the predicted latent embeddings before they are passed to $\psi$. This prevents the supervised state-recovery loss from modifying the learned latent dynamics. Let $\tilde{\mathbf{x}}_{t+k}$ denote the state obtained by integrating eq. (16). The probing network is optimized using the supervised rollout loss.

$$
\mathcal{L}_{\text{prober}}=\frac{1}{T}\sum_{k=1}^{T}\|\tilde{\mathbf{x}}_{t+k}-\mathbf{x}_{t+k}\|_{2}^{2}.
$$

By combining frozen latent predictions with a structured differentiable integrator, the probing mechanism converts abstract representations into physically meaningful rollouts suitable for control.

### IV-D Sampling-Based Control with Learned Dynamics

We consider the problem of tracking a reference trajectory over a finite horizon $T$. At each control timestep $t$, given the current estimated state history $\mathbf{X}_{t}$ and action history $\mathbf{A}_{t}$, the objective is to compute a sequence of future control inputs $\{\mathbf{a}_{t},\dots,\mathbf{a}_{t+T-1}\}$ that minimizes a trajectory tracking cost with respect to desired reference states $\{\mathbf{x}^{\mathrm{ref}}_{t+1},\dots,\mathbf{x}^{\mathrm{ref}}_{t+T}\}$.

We integrate our learned dynamics model within a sampling-based optimization framework, MPPI, where future action sequences are optimized using Monte Carlo sampling.

Action Sampling. Let the current nominal action sequence be $\mathbf{a}^{\mathrm{nom}}=\{\mathbf{a}^{\mathrm{nom}}_{0},\dots,\mathbf{a}^{\mathrm{nom}}_{T-1}\}$. We generate $S$ candidate sequences by perturbing it

$$
\mathbf{a}^{(s)}_{k}=\mathbf{a}^{\mathrm{nom}}_{k}+\bm{\epsilon}^{(s)}_{k},\qquad\bm{\epsilon}^{(s)}_{k}\sim\mathcal{N}(0,\bm{\Sigma}),
$$

for $s=1,\dots,S$ and $k=0,\dots,T-1$, with covariance matrix $\bm{\Sigma}$. The admissible action set is defined element-wise as

$$
\mathcal{A}=\left\{\mathbf{a}\in\mathbb{R}^{4}\;\middle|\;\mathbf{a}_{\min}\leq\mathbf{a}\leq\mathbf{a}_{\max}\right\},
$$

where $\mathbf{a}_{\min}$ and $\mathbf{a}_{\max}$ denote lower and upper limits. Each sampled action is projected onto $\mathcal{A}$ via element-wise clamping

$$
\mathbf{a}^{(s)}_{k}\leftarrow\Pi_{\mathcal{A}}\!\left(\mathbf{a}^{(s)}_{k}\right),
$$

where $\Pi_{\mathcal{A}}(\cdot)$ denotes element-wise clamping.

Latent Rollout and State Prediction. For each sampled action sequence, we append these actions to the action history previously executed to construct the updated action sequence $\{\mathbf{a}^{(s)}_{t-H},\dots,\mathbf{a}^{(s)}_{t},\dots,\mathbf{a}^{(s)}_{t+T-1}\}$. The context states and actions are encoded using $\text{Enc}_{\theta}$ and $\text{Enc}_{\phi}$, respectively. For each rollout sample $s$, the latent dynamics are recursively unrolled using $\mathrm{Pred}_{\varphi}$. The predicted latent sequence $\{\tilde{\mathbf{s}}^{(s)}_{t+1},\dots,\tilde{\mathbf{s}}^{(s)}_{t+T}\}$ is mapped to physically grounded states via the probing mechanism, eqs. (14)–(16), yielding predicted physical states $\{\tilde{\mathbf{x}}^{(s)}_{t+1},\dots,\tilde{\mathbf{x}}^{(s)}_{t+T}\}$.

Trajectory Cost. Each sampled trajectory is evaluated using a running cost of the form

$$
\mathcal{J}^{(s)}=\frac{1}{T}\sum_{k=1}^{T}\ell\!\left(\tilde{\mathbf{x}}^{(s)}_{t+k},\mathbf{x}^{\mathrm{ref}}_{t+k},\mathbf{a}^{(s)}_{t+k-1}\right),
$$

where the per-step cost consists of weighted quadratic tracking errors and control effort:

$$
\displaystyle\ell(.)
$$
 
$$
\displaystyle=\|\tilde{\mathbf{x}}^{(s)}-\mathbf{x}^{\mathrm{ref}}\|_{\mathbf{Q}_{\text{x}}}^{2}+\|\mathbf{a}^{(s)}-\mathbf{a}^{\mathrm{ref}}\|_{\mathbf{Q}_{\text{a}}}^{2},
$$

where $\mathbf{Q}_{\text{x}}$ and $\mathbf{Q}_{\text{a}}$ are constant positive diagonal weight matrices for state and control, respectively.

Softmax Weighting and Control Update. Following the MPPI formulation [^61], we compute importance weights

$$
w^{(s)}=\frac{\exp\!\left(-\frac{1}{\lambda}(\mathcal{J}^{(s)}-\mathcal{J}_{\min})\right)}{\sum_{r=1}^{S}\exp\!\left(-\frac{1}{\lambda}(\mathcal{J}^{(r)}-\mathcal{J}_{\min})\right)},
$$

where $\mathcal{J}_{\min}=\min_{s}\mathcal{J}^{(s)}$ and $\lambda>0$ is the temperature parameter. The nominal sequence is then updated as

$$
\mathbf{a}^{\mathrm{nom}}_{k}\leftarrow\mathbf{a}^{\mathrm{nom}}_{k}+\sum_{s=1}^{S}w^{(s)}\,\delta\mathbf{a}^{(s)}_{k},\qquad\delta\mathbf{a}^{(s)}_{k}=\mathbf{a}^{(s)}_{k}-\mathbf{a}^{\mathrm{nom}}_{k}.
$$

Only the first action $\mathbf{a}^{\mathrm{nom}}_{0}$ is executed, and the procedure is repeated in a receding-horizon fashion.

### IV-E Automated Data Synthesis

The performance of a learned dynamics model is strongly determined by the data distribution used for training. In our case, we show a princpled procedure to synthetize data in simuation to effectively learn zero-shot sim2real transfer. A useful dataset should satisfy three requirements. First, it should be *diverse* to properly represent the overall flight envelope: the trajectories must cover a broad range of positions, velocities, accelerations, attitudes, angular velocities, and control inputs. Second, it should be *dynamically feasible*: the recorded transitions should arise from closed-loop execution of physically valid quadrotor dynamics, rather than from arbitrary state sampling. Third, it should be *robust*: the data should include variations in physical parameters so that the learned model does not overfit to a single nominal platform.

Reference Trajectory Generation. The first step in our data collection pipeline is to generate reference trajectories that excite diverse regions of the quadrotor state space. Manually designed trajectories, such as circles, figure-eights, or straight-line paths, cover only a narrow set of flight behaviors. They can also bias the learned model toward a small number of hand-selected motion patterns. To avoid this, we use Gaussian processes to automatically generate randomized, smooth, and diverse reference trajectories. For each trajectory, we sample the desired position independently along each spatial axis from a Gaussian process prior. A Gaussian process, denoted by $\mathcal{GP}(0,k_{j})$, defines a distribution over smooth functions with zero mean and covariance kernel $k_{j}(t,t^{\prime})$. We write this as,

$$
p_{j}(t)\sim\mathcal{GP}(0,k_{j}(t,t^{\prime})),\qquad j\in\{x,y,z\}.
$$

Each kernel is chosen as a sum of periodic kernels with different characteristic length scales and periods. This allows the sampled trajectories to contain both slow global motion and faster local variations. The generated references induce a broad range of velocities, accelerations, attitudes, and angular velocities during tracking. We compute the corresponding velocity and acceleration references by differentiation, and then use differential flatness [^40] to obtain the full quadrotor reference. The resulting reference trajectories are randomized, smooth, and dynamically rich. They provide a systematic alternative to manually specified trajectory families and form the basis for collecting diverse state–action rollouts in simulation.

Closed-Loop Trajectory Tracking. The generated references are not used directly as training data. Instead, each reference is tracked in simulation to produce physically feasible state–action trajectories. At each time step, a tracking controller computes the action from the current state and a local reference horizon $\mathbf{x}_{t:t+T}^{\text{ref}}$, $\mathbf{a}_{t}=\pi_{\mathrm{track}}\left(\mathbf{x}_{t},\mathbf{x}_{t:t+T}^{\text{ref}}\right),$ where $\pi_{\mathrm{track}}$ is implemented using a combination of nominal Nonlinear Model Predictive Control (NMPC) and Model Predictive Path Integral (MPPI) [^61]. The two controllers expose the dataset to complementary action distributions. NMPC generates smooth, optimized tracking commands around the nominal dynamics, while MPPI produces sampling-based action sequences with broader local variation. This diversity is important for learning a dynamics model that remains accurate under the control inputs encountered during real-time sampling-based optimization. At the same time, collecting data through closed-loop controllers ensures that the recorded trajectories respect actuator limits, dynamic feasibility, and realistic state–action correlations, unlike independent random sampling of states and controls.

Domain-Randomized Quadrotor Simulation. Data collection is performed in simulation using standard quadrotor rigid-body dynamics [^55], with aerodynamic drag and first-order motor delay included. To improve robustness and sim-to-real transfer, we do not generate data from a single nominal simulator. Instead, each rollout is collected from a randomized quadrotor model using a similar ancestral sampling approach described in [^16]. This sampling approach ensures that the parameter distribution is physical plausible. This allows the dataset to reflect not only the nominal platform, but also nearby systems that may arise from modeling errors, hardware variation, or changes in operating conditions. We define the simulator parameter set as

$$
\bm{\eta}=\left\{m,\;\mathbf{D},\;\mathbf{J},\;\alpha,\;k_{f},\;k_{\tau},\;l\right\},
$$

where $m$ is the mass, $\mathbf{D}$ is the drag matrix, $\mathbf{J}$ is the inertia matrix, $\alpha$ is the motor time constant, $k_{f}$ and $k_{\tau}$ are the thrust and torque coefficients, and $l$ is the arm length. These parameters capture the main sources of mismatch between simulation and the real platform, including payload changes, actuator variation, and inertial differences. For each rollout $r$, we sample a randomized parameter set $\bm{\eta}_{r}$ from a bounded uniform distribution around the nominal parameter set $\bar{\bm{\eta}}$

$$
\bm{\eta}_{r}\sim\mathcal{U}\left(\bar{\bm{\eta}}-\Delta\bm{\eta},\bar{\bm{\eta}}+\Delta\bm{\eta}\right),
$$

where $\Delta\bm{\eta}$ defines the randomization range for each parameter. Each generated reference trajectory is therefore tracked under a different plausible realization of the quadrotor dynamics. This exposes the learned model to a family of systems rather than a single nominal model. Consequently, the learned representation is encouraged to capture dynamics that remain consistent across variations in mass, drag, actuation, and inertial properties.

![Refer to caption](https://arxiv.org/html/2606.23444v2/x4.png)

Figure 4: Closed-loop real-world evaluation settings under trajectory tracking. We test the proposed framework under three scenarios: (a) nominal trajectory tracking, (b) payload variation, and (c) propeller switching.

## V Implementation Details

### V-A Platform Setup

Our experiments are conducted on a $1.3$ -kg quadrotor with a thrust-to-weight ratio of $4{:}1$. The platform uses an NVIDIA Orin NX for onboard computation and a Pixracer Pro flight controller running PX4 [^39] for low-level control, with the full software stack integrated through ROS2. A laptop ground station is used only to issue high-level commands such as takeoff, landing, and reference trajectory upload. State estimation is obtained from onboard GPS-based localization, and the we send collective thrust and body-rate commands to the low-level flight controller. We conducted closed-loop real-world evaluation (see Figure 4) under $3$ trajectory tracking settings: (a) nominal trajectory tracking, (b) payload variation, and (c) propeller switching. All tests are conducted in a larger outdoor flying space $60\times 70$ m <sup>2</sup>.

### V-B Dataset Generation

To promote sim-to-real transfer, we construct the training dataset through automated trajectory generation and large-scale domain randomization in simulation. For each rollout, the quadrotor parameters are sampled independently from uniform distributions around the nominal platform values, as summarized in Table I. We sample $500$ distinct domains, producing a diverse ensemble of dynamic models that span variations in inertial properties, actuation, motor response, and aerodynamic drag according to the procedure presented in Section IV-E. For each domain, we generate smooth randomized reference trajectories using Gaussian processes [^60]. The desired position is sampled independently along the $x$, $y$, and $z$ axes using sums of exponential sine-squared periodic kernels (see eq. (25)). Each axis uses three periodic components: the first has length scale $1.3$, while the remaining two have length scales $3.0$ and $4.0$; the periodicities are chosen differently across axes to avoid repetitive motion patterns. Specifically, the $x$ axis uses periodicities $37$, $61$, and $13$, the $y$ axis uses $17$, $23$, and $52$, and the $z$ axis uses $19$, $29$, and $53$. This multi-frequency GP sampling produces trajectories with both slow global motion and faster local variations, which helps excite a broad range of translational and rotational behaviors and properly explore the flight envelope. We generate $20{,}000$ reference trajectories of $10$ s duration, track them in simulation, and record the complete state–action time series. Finally, all trajectories are resampled using cubic splines at a discrete time step of $0.05$ s, corresponding to $20$ Hz, to match the temporal resolution used for multi-step dynamics learning and control. The resulting dataset is split into $80\%$ for training, $10\%$ for validation, and $10\%$ for testing.

### V-C Network Architecture and Training

Both $\mathrm{Enc}_{\theta}$ and $\mathrm{Enc}_{\phi}$ are implemented as Temporal Convolutional Networks (TCNs) [^30] with channel sizes $[8,8,16]$ and $[4,4,8]$, respectively. Latent dynamics are modeled using a single-layer GRU predictor [^12] with hidden dimension $24$ and trained via recursive unrolling over $T=20$ ($1.0$  s at $20$  Hz) steps. The history length is set to $H=10$ timesteps ($0.5$  s at $20$  Hz). Training is performed for $50$ epochs with batch size $2048$. We employ a SigReg objective with $17$ spline knots and regularization coefficient $\lambda_{\text{sigreg}}=0.02$. Optimization uses Adam with weight decay $10^{-5}$ and gradient clipping at $0.5$. The learning rate follows a linear warmup schedule from $0$ to $5\times 10^{-3}$ over $4{,}000$ steps, followed by cosine decay to $1\times 10^{-4}$ over $20{,}000$ steps.

Table I: Domain randomization parameters used for simulation data collection.

| Parameter | Randomization |
| --- | --- |
| Mass $m$ (kg) | $\pm 50\%$ nominal |
| Inertia $\mathbf{J}$ (kg m <sup>2</sup>) | $\pm 30\%$ nominal |
| Motor time constant $\alpha$ (s) | $[0.01,\,0.1]$ |
| Drag coefficients $\mathbf{D}$ | $[0.1,\,0.5]$ |
| Thrust coefficient $k_{f}$ | $\pm 50\%$ nominal |
| Torque coefficient $k_{m}$ | $\pm 50\%$ nominal |
| No. of domains | 500 |
| Total trajectories | 20000 |
| Trajectory duration (s) | 10 |

Table II: MPPI Parameters

| Parameter | Value |
| --- | --- |
| Prediction timestep $\Delta t$ | 0.05 s |
| Horizon $T$ | 15 |
| Number of samples $S$ | 512 |
| Temperature $\lambda$ | $10^{-4}$ |
| Action noise $\Sigma$ | $\mathrm{diag}(0.60,0.15,0.15,0.05)$ |
| State cost $\mathbf{Q}$ | $\mathrm{diag}(400,40,20,20)$ |
| Control cost $\mathbf{R}$ | $\mathrm{diag}(0.01,0.05,0.05,0.10)$ |

### V-D MPPI Controller Parameters

The controller parameters of the proposed framework are summarized in Table II. To ensure real-time performance, the MPPI controller is implemented entirely in C++. The learned PyTorch latent dynamics model is exported and optimized using NVIDIA TensorRT for accelerated inference on the NVIDIA Jetson Orin NX. This enables high-frequency rollout evaluation and closed-loop control on embedded hardware.

We analyze the runtime performance of the proposed approach on an NVIDIA Jetson Orin, with all computation executed fully on-board. Figure 5 reports the end-to-end control time as a function of rollout horizon $U$ and sample count $S$, where each timing includes repeated queries to the learned latent dynamics model within MPPI. Since $100$ Hz is the minimum rate required for real-time onboard control, the $10$ ms line defines the feasible operating boundary. As expected, runtime increases with both $U$ and $S$, reflecting the higher cost of evaluating more candidate trajectories over longer horizons. The results show that $U=20$ and $S=512$ lies near this boundary, making it an effective operating point that maximizes controller lookahead and sample diversity while remaining close to the real-time budget. This trade-off is enabled by the lightweight latent dynamics model described in Section V-C, which contains only about $9$ K parameters and allows the entire framework to run fully on-board on embedded hardware.

## VI Experiments

We evaluate the proposed world model along two complementary axes: *(i)* offline open-loop prediction, to measure predictive accuracy and long-horizon consistency, and *(ii)* real time onboard closed-loop control on embedded hardware, to assess deployment performance under real-world conditions. Our experimental study is designed to answer the following questions:

1. Latent Dynamics Modeling: Does modeling dynamics in a latent space yield more informative and control-relevant representations than direct autoregressive prediction in state space?
2. Physics Interpretability: Does embedding kinematic structure enable latent rollouts to retain enough information for accurate recovery of metric-state trajectories in open loop?
3. Zero-Shot Sim-to-Real Transfer: Can a model trained entirely on domain-randomized simulation data transfer to real-world quadrotor navigation without any task-specific fine-tuning?
4. Robustness: Does the proposed framework remain effective under changes in platform geometry, such as payload attachment or propeller replacement?
5. Data Quality: How does the quality of the training data distribution affect the predictive accuracy of learned quadrotor dynamics?

![Refer to caption](https://arxiv.org/html/2606.23444v2/x5.png)

Figure 5: Inference speed on NVIDIA Orin NX. Inference time increases with unroll length and number of MPPI rollouts S; the selected horizon is chosen to remain below the 10 ms real-time control budget.

### VI-A Latent Dynamics Modeling

Compounding Error Analysis. We first evaluate whether latent-space dynamics modeling is less susceptible to recursive error accumulation than direct autoregressive prediction in state space. To this end, we use two complementary metrics: the *compounding ratio* (CR) and *error rate* (ER).

The CR compares recursive open-loop rollout against teacher-forced prediction considering the same horizon. Let $e^{\mathbf{x}}_{k,\mathrm{TF}}$ denote the teacher-forced error, where the model is conditioned on the true past states from the dataset, and let $e^{\mathbf{x}}_{k,\mathrm{rollout}}$ denote the open-loop rollout error, where the model is conditioned on its own past predictions. Let as previously defined the state prediction error at time step $k$ as the root-mean-square error between the predicted state $\tilde{\mathbf{x}}_{k}$ and the ground-truth state $\mathbf{x}_{k}$

$$
e_{k}^{\mathbf{x}}=\sqrt{\frac{1}{D_{\mathbf{s}}}\left\|\tilde{\mathbf{x}}_{k}-\mathbf{x}_{k}\right\|_{2}^{2}},
$$

where $D_{\mathbf{s}}$ denotes the dimensionality of the state vector. We then define the compounding ratio as

$$
\mathrm{CR}_{k}=\frac{e^{\mathbf{x}}_{k,\mathrm{rollout}}}{e^{\mathbf{x}}_{k,\mathrm{TF}}}.
$$

This ratio isolates the excess error caused by recursive prediction. Values near $1$ indicate that open-loop rollout remains close to teacher-forced performance, while larger values indicate stronger compounding effects. Values below $1$ indicate that the rollout error is lower than the teacher-forced error at that horizon. This suggests that the model’s own predicted trajectory is locally easier to predict than the ground-truth trajectory, or that teacher-forced inputs introduce larger local inconsistencies.

The second metric is defined as error growth, the expected increase in error between consecutive recursive predictions

$$
\mathrm{ER}_{k}=\mathbb{E}\left[e_{k}^{\mathbf{x}}-e_{k-1}^{\mathbf{x}}\right].
$$
![Refer to caption](https://arxiv.org/html/2606.23444v2/x6.png)

Figure 6: Recursive rollout error analysis. The compounding ratio (left) compares open-loop prediction to teacher-forced prediction; values above 1 indicate error accumulation caused by recursion. The error growth rate (right) measures the additional pose error introduced at each rollout step. Our method stays closer to teacher-forced behavior and has lower error growth than the predictive baseline, showing that latent-space dynamics modeling mitigates long-horizon compounding error.

![Refer to caption](https://arxiv.org/html/2606.23444v2/x7.png)

Figure 7: Temporal straightening analysis of latent rollouts. (a) Example Cartesian trajectory, with shading indicating progression from earlier to later states. (b) PCA projection of the corresponding latent trajectories, showing how each model evolves in representation space over time. (c) Temporal straightening score; higher values indicate smoother and more directionally consistent latent evolution. Temporally straighter latent trajectories suggest that complex system dynamics are represented in a simpler geometry, making recursive prediction easier and reducing directional drift during rollout.

This metric measures the amount of new error introduced at each rollout step. Lower values indicate slower error accumulation and better long-horizon stability. As shown in Fig. 6 on the left, our method has a higher CR than the predictive baseline for the first few rollout steps, particularly for $k<10$. This does not imply that the predictive baseline is better in this regime. At short horizons, both teacher-forced and recursive errors are small, so the ratio can be sensitive to small differences in the denominator of eq. (29). Moreover, values below $1$ indicate that recursive rollout error is still lower than teacher-forced error at that horizon. Therefore, the early-horizon behavior mainly reflects local differences between teacher-forced and rollout trajectories, rather than meaningful long-horizon compounding. The long-horizon trend is more informative. The predictive baseline crosses $\mathrm{CR}_{k}=1$ around $k\approx 12$ and then grows rapidly, reaching approximately $2.4$ by $k=60$. This indicates that its recursive rollout error becomes more than twice as large as its teacher-forced error. In contrast, our method remains close to $1$ for a much longer portion of the horizon and increases more gradually, reaching only about $1.4$ at $k=60$. This shows that the latent-space model remains closer to its teacher-forced behavior under open-loop rollout. The error growth plot in Fig. 6 on the right confirms this interpretation. The predictive baseline introduces larger new error at nearly every rollout step. Around $k\approx 30$, its error growth is approximately $0.14$, while ours is around $0.06$. By the end of the horizon, the predictive baseline reaches about $0.23$, whereas our method remains near $0.11$. Therefore, our method not only has a lower long-horizon compounding ratio, but also injects less new error at each recursive step. These results show that latent-space dynamics modeling substantially mitigates recursive error accumulation compared to direct autoregressive prediction in state space.

<svg id="S6.SS1.p5.pic1" height="161.26" overflow="visible" version="1.1" viewBox="0 0 600 161.26" width="600"><g style="--ltx-stroke-color:#000000;--ltx-fill-color:#000000;" transform="translate(0,161.26) matrix(1 0 0 -1 0 0)" fill="#000000" stroke="#000000" stroke-width="0.4pt"><g style="--ltx-fill-color:#228B22;" fill="#228B22" fill-opacity="1.0"><path style="stroke:none" d="M 0 5.69 L 0 155.57 C 0 158.71 2.55 161.26 5.69 161.26 L 594.31 161.26 C 597.45 161.26 600 158.71 600 155.57 L 600 5.69 C 600 2.55 597.45 0 594.31 0 L 5.69 0 C 2.55 0 0 2.55 0 5.69 Z"></path></g><g style="--ltx-fill-color:#F0F9F0;" fill="#F0F9F0" fill-opacity="1.0"><path style="stroke:none" d="M 0.97 5.69 L 0.97 155.57 C 0.97 158.18 3.08 160.29 5.69 160.29 L 594.31 160.29 C 596.92 160.29 599.03 158.18 599.03 155.57 L 599.03 5.69 C 599.03 3.08 596.92 0.97 594.31 0.97 L 5.69 0.97 C 3.08 0.97 0.97 3.08 0.97 5.69 Z"></path></g><g fill-opacity="1.0" transform="matrix(1.0 0.0 0.0 1.0 8.06 8.9)"><foreignObject style="--ltx-fg-color:#000000;--ltx-fo-width:42.2em;--ltx-fo-height:10.54em;--ltx-fo-depth:0.17em;" width="583.89" height="148.3" transform="matrix(1 0 0 -1 0 145.88)" overflow="visible" color="#000000"><span id="S6.SS1.p5.pic1.1.1.1.1.1" style="width:45.62em;"><span id="S6.SS1.p5.pic1.1.1.1.1.1.1"><span id="S6.SS1.p5.pic1.1.1.1.1.1.1.1" style="font-size:90%;">Takeaway: <span id="S6.SS1.p5.pic1.1.1.1.1.1.1.1.1">Latent-space dynamics modeling reduces compounding error and has a much smaller gap between teacher-forced and recursive rollout predictions.</span></span></span></span></foreignObject></g></g></svg>

Temporal Straightening. We further analyze the geometry of the learned rollouts through the lens of *temporal straightening*, motivated by the hypothesis in [^23] [^59] that complex temporal dynamics can be represented as smoother, straighter trajectories in representation space. The intuition is that a NN model becomes easier to roll out when its internal representation space evolves in a consistent temporal direction: if consecutive latent displacements are well aligned, the trajectory unfolds smoothly over time and future states are easier to extrapolate recursively. In contrast, if the representation repeatedly bends, oscillates, or backtracks, then small local prediction errors can more easily deflect the rollout away from the true temporal progression. Following this idea, we evaluate temporal straightening over $N$ trajectories. For the $i$ -th trajectory, let the sequence of predicted latent representations be $\tilde{s}^{(i)}_{1:T}\in\mathbb{R}^{T\times\bar{D}}$, and define the temporal velocity vectors as $\dot{\tilde{s}}^{(i)}_{t}=\tilde{s}^{(i)}_{t+1}-\tilde{s}^{(i)}_{t}$. The smoothness score for a single trajectory is computed as the mean pairwise cosine similarity between consecutive latent velocities

$$
S_{\text{straight}}^{(i)}=\frac{1}{T-2}\sum_{t=1}^{T-2}\frac{\left\langle\dot{\tilde{s}}^{(i)}_{t},\,\dot{\tilde{s}}^{(i)}_{t+1}\right\rangle}{\|\dot{\tilde{s}}^{(i)}_{t}\|\,\|\dot{\tilde{s}}^{(i)}_{t+1}\|}.
$$

We then report the mean and variance across the $N$ evaluated trajectories. A value close to $1$ is ideal, since it indicates that successive latent displacements are highly aligned and the rollout follows a smooth, nearly straight path. Values near $0$ indicate weak alignment and a more curved or wandering trajectory, while negative values indicate strong directional inconsistency, such as oscillation or backtracking. Figure 7 shows a clear separation between direct predictive modeling and the two latent-space approaches. Averaged over the $N$ evaluated trajectories, the predictive baseline attains a negative mean straightening score of roughly $-0.4$, with a large spread extending from about $-1.0$ to $0.2$, indicating that its rollouts often change direction and evolve along a temporally inconsistent path. In contrast, both latent models remain strongly in the positive regime: the reconstruction-based latent model achieves the highest mean score, around $0.95$, while our JEPA-based model attains a mean of about $0.75$. Thus, despite their different training objectives, both latent models produce substantially smoother and straighter temporal evolution than the predictive baseline. This suggests that an important emergent property of latent dynamics learning is temporal smoothness in representation space, which makes recursive rollouts easier to maintain over long horizons. In our setting, this result helps explain why both latent approaches outperform direct predictive modeling: by organizing temporal evolution into smoother latent trajectories, they reduce directional drift under recursive rollout and are therefore less susceptible to compounding error. While the reconstruction model achieves the highest straightening score, our model remains strongly positive and, when interpreted together with the rollout-error results, indicates that latent-space modeling itself is a key ingredient for learning temporal representations.

<svg id="S6.SS1.p7.pic1" height="161.26" overflow="visible" version="1.1" viewBox="0 0 600 161.26" width="600"><g style="--ltx-stroke-color:#000000;--ltx-fill-color:#000000;" transform="translate(0,161.26) matrix(1 0 0 -1 0 0)" fill="#000000" stroke="#000000" stroke-width="0.4pt"><g style="--ltx-fill-color:#228B22;" fill="#228B22" fill-opacity="1.0"><path style="stroke:none" d="M 0 5.69 L 0 155.57 C 0 158.71 2.55 161.26 5.69 161.26 L 594.31 161.26 C 597.45 161.26 600 158.71 600 155.57 L 600 5.69 C 600 2.55 597.45 0 594.31 0 L 5.69 0 C 2.55 0 0 2.55 0 5.69 Z"></path></g><g style="--ltx-fill-color:#F0F9F0;" fill="#F0F9F0" fill-opacity="1.0"><path style="stroke:none" d="M 0.97 5.69 L 0.97 155.57 C 0.97 158.18 3.08 160.29 5.69 160.29 L 594.31 160.29 C 596.92 160.29 599.03 158.18 599.03 155.57 L 599.03 5.69 C 599.03 3.08 596.92 0.97 594.31 0.97 L 5.69 0.97 C 3.08 0.97 0.97 3.08 0.97 5.69 Z"></path></g><g fill-opacity="1.0" transform="matrix(1.0 0.0 0.0 1.0 8.06 8.9)"><foreignObject style="--ltx-fg-color:#000000;--ltx-fo-width:42.2em;--ltx-fo-height:10.54em;--ltx-fo-depth:0.17em;" width="583.89" height="148.3" transform="matrix(1 0 0 -1 0 145.88)" overflow="visible" color="#000000"><span id="S6.SS1.p7.pic1.1.1.1.1.1" style="width:45.62em;"><span id="S6.SS1.p7.pic1.1.1.1.1.1.1"><span id="S6.SS1.p7.pic1.1.1.1.1.1.1.1" style="font-size:90%;">Takeaway: <span id="S6.SS1.p7.pic1.1.1.1.1.1.1.1.1">Both latent models learn temporally smoother latent trajectories than direct predictive modeling, suggesting that temporal smoothness is an important emergent property.</span></span></span></span></foreignObject></g></g></svg>

![Refer to caption](https://arxiv.org/html/2606.23444v2/x8.png)

Figure 8: Open-loop rollout fidelity across dynamics models. Position, velocity, and attitude RMSE are shown versus unroll length, where lower error indicates more accurate long-horizon prediction. Direct predictive models accumulate error rapidly, especially in attitude, while latent dynamics models grow more slowly. The proposed physics-inspired prober substantially improves metric-state recovery, showing that structured physical decoding is critical for accurate state prediction.

Robustness to Noise. We next evaluate whether the learned dynamics remain reliable under corrupted sensing. To simulate observation noise, we perturb the input observation history with i.i.d. Gaussian noise before passing it to the proposed framework. The corruption is applied only to the model input. The reference ground-truth trajectory remains unchanged for evaluation. We then recursively unroll each model over the prediction horizon and compute the pose RMSE between the predicted trajectory, obtained through the latent dynamics model and physics-inspired prober, and the ground-truth trajectory.

Figure 9 shows that our method remains consistently more robust than the predictive baseline as the observation noise increases. At zero noise, our method reduces the median state RMSE by approximately $55\%$ compared to the predictive baseline. As the noise level increases, this advantage remains clear. At moderate noise levels, our method achieves roughly a $25$ – $30\%$ reduction in median state RMSE. Even at the highest noise level, where both methods degrade, our method still maintains a lower median error, with an improvement of about $10\%$ over the predictive baseline. The distributional trend is also important. The predictive baseline exhibits wider error distributions and heavier upper tails as noise increases, indicating more frequent high-error rollouts. In contrast, our method produces more concentrated distributions across noise levels. This suggests that the latent dynamics model, together with the physics-inspired prober, is less sensitive to input-level perturbations and yields more consistent long-horizon predictions under sensing corruption.

![Refer to caption](https://arxiv.org/html/2606.23444v2/x9.png)

Figure 9: Robustness to observation corruption. Pose RMSE under increasing i.i.d. Gaussian observation noise, showing that the JEPA model consistently outperforms the predictive baseline and remains more robust as corruption increases.

<svg id="S6.SS1.p10.pic1" height="161.26" overflow="visible" version="1.1" viewBox="0 0 600 161.26" width="600"><g style="--ltx-stroke-color:#000000;--ltx-fill-color:#000000;" transform="translate(0,161.26) matrix(1 0 0 -1 0 0)" fill="#000000" stroke="#000000" stroke-width="0.4pt"><g style="--ltx-fill-color:#228B22;" fill="#228B22" fill-opacity="1.0"><path style="stroke:none" d="M 0 5.69 L 0 155.57 C 0 158.71 2.55 161.26 5.69 161.26 L 594.31 161.26 C 597.45 161.26 600 158.71 600 155.57 L 600 5.69 C 600 2.55 597.45 0 594.31 0 L 5.69 0 C 2.55 0 0 2.55 0 5.69 Z"></path></g><g style="--ltx-fill-color:#F0F9F0;" fill="#F0F9F0" fill-opacity="1.0"><path style="stroke:none" d="M 0.97 5.69 L 0.97 155.57 C 0.97 158.18 3.08 160.29 5.69 160.29 L 594.31 160.29 C 596.92 160.29 599.03 158.18 599.03 155.57 L 599.03 5.69 C 599.03 3.08 596.92 0.97 594.31 0.97 L 5.69 0.97 C 3.08 0.97 0.97 3.08 0.97 5.69 Z"></path></g><g fill-opacity="1.0" transform="matrix(1.0 0.0 0.0 1.0 8.06 8.9)"><foreignObject style="--ltx-fg-color:#000000;--ltx-fo-width:42.2em;--ltx-fo-height:10.54em;--ltx-fo-depth:0.17em;" width="583.89" height="148.3" transform="matrix(1 0 0 -1 0 145.88)" overflow="visible" color="#000000"><span id="S6.SS1.p10.pic1.1.1.1.1.1" style="width:45.62em;"><span id="S6.SS1.p10.pic1.1.1.1.1.1.1"><span id="S6.SS1.p10.pic1.1.1.1.1.1.1.1" style="font-size:90%;">Takeaway: <span id="S6.SS1.p10.pic1.1.1.1.1.1.1.1.1">Our JEPA-style approach remains more accurate under input corruption, indicating stronger robustness to corrupted inputs.</span></span></span></span></foreignObject></g></g></svg>

### VI-B Physics Interpretability

Baselines. To evaluate whether injecting physical structure improves the open-loop fidelity of mapping latent rollouts to metric state space, we compare six baselines. *Predictive* is a direct autoregressive state-space predictor. *Predictive + Physics Reg.* augments this baseline with kinematic physics regularization loss during training. *Recon + Prober* is a latent dynamics model in which the embeddings are trained through a reconstruction: collapse is avoided by forcing the predicted embeddings to decode back the full recorded metric state and the prober is a 3-layed MLP. *Recon + PI Prober* replaces the unconstrained prober in this model with the proposed physics-inspired probing mechanism. *Ours + Prober* is our JEPA-based latent dynamics model with a 3-layered MLP prober. Finally, *Ours + PI Prober* is the full method, combining JEPA latent dynamics with the proposed physics-inspired prober. Together, these baselines isolate three design choices: direct predictive versus latent-space dynamics modeling, reconstruction-based versus JEPA-based embedding learning, and unconstrained versus physics-grounded state.

Table III: Open loop prediction analysis of different neural dynamics frameworks.

<table><tbody><tr><td rowspan="2">Approach</td><td colspan="2">Pos. RMSE [m] <math><semantics><mo>↓</mo> <annotation>\downarrow</annotation></semantics></math></td><td colspan="2">Att. Err. [<sup>∘</sup>] <math><semantics><mo>↓</mo> <annotation>\downarrow</annotation></semantics></math></td></tr><tr><td>Mean</td><td>Var.</td><td>Mean</td><td>Var.</td></tr><tr><td>Predictive</td><td><math><semantics><mn>8.80</mn> <annotation>8.80</annotation></semantics></math></td><td><math><semantics><mn>2.3</mn> <annotation>2.3</annotation></semantics></math></td><td><math><semantics><mn>53.4</mn> <annotation>53.4</annotation></semantics></math></td><td><math><semantics><mn>14.9</mn> <annotation>14.9</annotation></semantics></math></td></tr><tr><td>Predictive + Physics Reg. <sup><a href="#fn:51">51</a></sup></td><td><math><semantics><mn>7.12</mn> <annotation>7.12</annotation></semantics></math></td><td><math><semantics><mn>2.1</mn> <annotation>2.1</annotation></semantics></math></td><td><math><semantics><mn>49.1</mn> <annotation>49.1</annotation></semantics></math></td><td><math><semantics><mn>13.2</mn> <annotation>13.2</annotation></semantics></math></td></tr><tr><td>Reconstruction + Prober</td><td><math><semantics><mn>6.82</mn> <annotation>6.82</annotation></semantics></math></td><td><math><semantics><mn>1.6</mn> <annotation>1.6</annotation></semantics></math></td><td><math><semantics><mn>45.2</mn> <annotation>45.2</annotation></semantics></math></td><td><math><semantics><mn>9.7</mn> <annotation>9.7</annotation></semantics></math></td></tr><tr><td>Reconstruction + PI Prober</td><td><math><semantics><mn>1.53</mn> <annotation>1.53</annotation></semantics></math></td><td><math><semantics><mn>0.13</mn> <annotation>0.13</annotation></semantics></math></td><td><math><semantics><mn>5.28</mn> <annotation>5.28</annotation></semantics></math></td><td><math><semantics><mn>0.70</mn> <annotation>0.70</annotation></semantics></math></td></tr><tr><td>Ours + Prober</td><td><math><semantics><mn>5.56</mn> <annotation>5.56</annotation></semantics></math></td><td><math><semantics><mn>1.31</mn> <annotation>1.31</annotation></semantics></math></td><td><math><semantics><mn>40.20</mn> <annotation>40.20</annotation></semantics></math></td><td><math><semantics><mn>9.30</mn> <annotation>9.30</annotation></semantics></math></td></tr><tr><td>Ours + PI Prober</td><td><math><semantics><mn>1.43</mn> <annotation>\mathbf{1.43}</annotation></semantics></math></td><td><math><semantics><mn>0.10</mn> <annotation>\mathbf{0.10}</annotation></semantics></math></td><td><math><semantics><mn>4.71</mn> <annotation>\mathbf{4.71}</annotation></semantics></math></td><td><math><semantics><mn>0.50</mn> <annotation>\mathbf{0.50}</annotation></semantics></math></td></tr></tbody></table>

To evaluate the prediction accuracy of each baseline, we decompose the state error into position and attitude components. Let $\tilde{\mathbf{p}}_{k},\mathbf{p}_{k}\in\mathbb{R}^{3}$ denote the predicted and ground-truth positions at time step $k$, respectively, and let $\tilde{\mathbf{R}}_{k},\mathbf{R}_{k}\in SO(3)$ denote the corresponding predicted and ground-truth rotation matrices. The position error is defined as

$$
e_{k}^{\mathbf{p}}=\left\|\tilde{\mathbf{p}}_{k}-\mathbf{p}_{k}\right\|_{2}.
$$

The attitude error is computed using the relative rotation between the ground-truth and predicted orientations:

$$
\mathbf{R}_{\mathrm{err},k}=\mathbf{R}_{k}^{\top}\tilde{\mathbf{R}}_{k}.
$$

We map this relative rotation to the Lie algebra $\mathfrak{so}(3)$ using the logarithmic map:

$$
\bm{\phi}_{k}=\operatorname{Log}_{\mathcal{SO}(3)}\left(\mathbf{R}_{k}^{\top}\tilde{\mathbf{R}}_{k}\right)^{\vee}\in\mathbb{R}^{3},
$$

where $(\cdot)^{\vee}$ converts a skew-symmetric matrix in $\mathfrak{so}(3)$ to its corresponding vector representation. The scalar attitude error is then given in degrees as

$$
e_{k}^{\mathbf{R}}=\frac{180}{\pi}\left\|\bm{\phi}_{k}\right\|_{2}.
$$

Table IV: Quantitative results of real-world trajectory tracking across reference trajectories. Each trajectory is executed 5 times. The mean and variance are reported.

<table><tbody><tr><td>Trajectory</td><td><math><semantics><msub><mrow><mo>‖</mo> <mi>𝐯</mi> <mo>‖</mo></mrow> <mi>max</mi></msub> <annotation>\|\mathbf{v}\|_{\max}</annotation></semantics></math></td><td><math><semantics><msub><mrow><mo>‖</mo> <mover><mi>𝐯</mi> <mo>˙</mo></mover> <mo>‖</mo></mrow> <mi>max</mi></msub> <annotation>\|\dot{\mathbf{v}}\|_{\max}</annotation></semantics></math></td><td colspan="6">Position RMSE [m]</td><td colspan="6">Attitude Error [<sup>∘</sup>]</td></tr><tr><td></td><td>[m s <sup>-1</sup>]</td><td>[m s <sup>-2</sup>]</td><td colspan="2">Ours</td><td colspan="2">MPPI (Pred.+Phy.)</td><td colspan="2">MPPI (Pred.)</td><td colspan="2">Ours</td><td colspan="2">MPPI (Pred.+Phy.)</td><td colspan="2">MPPI (Pred.)</td></tr><tr><td></td><td></td><td></td><td>Mean</td><td>Var.</td><td>Mean</td><td>Var.</td><td>Mean</td><td>Var.</td><td>Mean</td><td>Var.</td><td>Mean</td><td>Var.</td><td>Mean</td><td>Var.</td></tr><tr><td>Circle</td><td><math><semantics><mn>2.45</mn> <annotation>2.45</annotation></semantics></math></td><td><math><semantics><mn>1.40</mn> <annotation>1.40</annotation></semantics></math></td><td><math><semantics><mn>0.24</mn> <annotation>\mathbf{0.24}</annotation></semantics></math></td><td><math><semantics><mn>0.010</mn> <annotation>\mathbf{0.010}</annotation></semantics></math></td><td><math><semantics><mn>0.36</mn> <annotation>0.36</annotation></semantics></math></td><td><math><semantics><mn>0.022</mn> <annotation>0.022</annotation></semantics></math></td><td><math><semantics><mn>0.39</mn> <annotation>0.39</annotation></semantics></math></td><td><math><semantics><mn>0.024</mn> <annotation>0.024</annotation></semantics></math></td><td><math><semantics><mn>7.87</mn> <annotation>\mathbf{7.87}</annotation></semantics></math></td><td><math><semantics><mn>0.82</mn> <annotation>\mathbf{0.82}</annotation></semantics></math></td><td><math><semantics><mn>10.99</mn> <annotation>10.99</annotation></semantics></math></td><td><math><semantics><mn>3.66</mn> <annotation>3.66</annotation></semantics></math></td><td><math><semantics><mn>11.95</mn> <annotation>11.95</annotation></semantics></math></td><td><math><semantics><mn>3.81</mn> <annotation>3.81</annotation></semantics></math></td></tr><tr><td>Oval</td><td><math><semantics><mn>4.50</mn> <annotation>4.50</annotation></semantics></math></td><td><math><semantics><mn>3.78</mn> <annotation>3.78</annotation></semantics></math></td><td><math><semantics><mn>0.33</mn> <annotation>\mathbf{0.33}</annotation></semantics></math></td><td><math><semantics><mn>0.018</mn> <annotation>\mathbf{0.018}</annotation></semantics></math></td><td><math><semantics><mn>0.44</mn> <annotation>0.44</annotation></semantics></math></td><td><math><semantics><mn>0.083</mn> <annotation>0.083</annotation></semantics></math></td><td><math><semantics><mn>0.48</mn> <annotation>0.48</annotation></semantics></math></td><td><math><semantics><mn>0.096</mn> <annotation>0.096</annotation></semantics></math></td><td><math><semantics><mn>9.11</mn> <annotation>\mathbf{9.11}</annotation></semantics></math></td><td><math><semantics><mn>1.06</mn> <annotation>\mathbf{1.06}</annotation></semantics></math></td><td><math><semantics><mn>15.20</mn> <annotation>15.20</annotation></semantics></math></td><td><math><semantics><mn>5.46</mn> <annotation>5.46</annotation></semantics></math></td><td><math><semantics><mn>16.53</mn> <annotation>16.53</annotation></semantics></math></td><td><math><semantics><mn>5.68</mn> <annotation>5.68</annotation></semantics></math></td></tr><tr><td>Figure 8</td><td><math><semantics><mn>5.20</mn> <annotation>5.20</annotation></semantics></math></td><td><math><semantics><mn>5.44</mn> <annotation>5.44</annotation></semantics></math></td><td><math><semantics><mn>0.35</mn> <annotation>\mathbf{0.35}</annotation></semantics></math></td><td><math><semantics><mn>0.022</mn> <annotation>\mathbf{0.022}</annotation></semantics></math></td><td><math><semantics><mn>0.47</mn> <annotation>0.47</annotation></semantics></math></td><td><math><semantics><mn>0.041</mn> <annotation>0.041</annotation></semantics></math></td><td><math><semantics><mn>0.51</mn> <annotation>0.51</annotation></semantics></math></td><td><math><semantics><mn>0.044</mn> <annotation>0.044</annotation></semantics></math></td><td><math><semantics><mn>9.25</mn> <annotation>\mathbf{9.25}</annotation></semantics></math></td><td><math><semantics><mn>1.18</mn> <annotation>\mathbf{1.18}</annotation></semantics></math></td><td><math><semantics><mn>17.75</mn> <annotation>17.75</annotation></semantics></math></td><td><math><semantics><mn>5.88</mn> <annotation>5.88</annotation></semantics></math></td><td><math><semantics><mn>20.20</mn> <annotation>20.20</annotation></semantics></math></td><td><math><semantics><mn>6.10</mn> <annotation>6.10</annotation></semantics></math></td></tr><tr><td>Fish</td><td><math><semantics><mn>5.70</mn> <annotation>5.70</annotation></semantics></math></td><td><math><semantics><mn>7.68</mn> <annotation>7.68</annotation></semantics></math></td><td><math><semantics><mn>0.40</mn> <annotation>\mathbf{0.40}</annotation></semantics></math></td><td><math><semantics><mn>0.031</mn> <annotation>\mathbf{0.031}</annotation></semantics></math></td><td><math><semantics><mn>0.54</mn> <annotation>0.54</annotation></semantics></math></td><td><math><semantics><mn>0.056</mn> <annotation>0.056</annotation></semantics></math></td><td><math><semantics><mn>0.59</mn> <annotation>0.59</annotation></semantics></math></td><td><math><semantics><mn>0.061</mn> <annotation>0.061</annotation></semantics></math></td><td><math><semantics><mn>10.78</mn> <annotation>\mathbf{10.78}</annotation></semantics></math></td><td><math><semantics><mn>1.42</mn> <annotation>\mathbf{1.42}</annotation></semantics></math></td><td><math><semantics><mn>20.95</mn> <annotation>20.95</annotation></semantics></math></td><td><math><semantics><mn>6.85</mn> <annotation>6.85</annotation></semantics></math></td><td><math><semantics><mn>22.78</mn> <annotation>22.78</annotation></semantics></math></td><td><math><semantics><mn>7.19</mn> <annotation>7.19</annotation></semantics></math></td></tr><tr><td>Lemniscate</td><td><math><semantics><mn>7.20</mn> <annotation>7.20</annotation></semantics></math></td><td><math><semantics><mn>12.5</mn> <annotation>12.5</annotation></semantics></math></td><td><math><semantics><mn>0.45</mn> <annotation>\mathbf{0.45}</annotation></semantics></math></td><td><math><semantics><mn>0.047</mn> <annotation>\mathbf{0.047}</annotation></semantics></math></td><td><math><semantics><mn>0.56</mn> <annotation>0.56</annotation></semantics></math></td><td><math><semantics><mn>0.076</mn> <annotation>0.076</annotation></semantics></math></td><td><math><semantics><mn>0.61</mn> <annotation>0.61</annotation></semantics></math></td><td><math><semantics><mn>0.083</mn> <annotation>0.083</annotation></semantics></math></td><td><math><semantics><mn>19.43</mn> <annotation>\mathbf{19.43}</annotation></semantics></math></td><td><math><semantics><mn>2.65</mn> <annotation>\mathbf{2.65}</annotation></semantics></math></td><td><math><semantics><mn>26.83</mn> <annotation>26.83</annotation></semantics></math></td><td><math><semantics><mn>7.51</mn> <annotation>7.51</annotation></semantics></math></td><td><math><semantics><mn>29.16</mn> <annotation>29.16</annotation></semantics></math></td><td><math><semantics><mn>7.90</mn> <annotation>7.90</annotation></semantics></math></td></tr></tbody></table>

![Refer to caption](https://arxiv.org/html/2606.23444v2/x10.png)

Figure 10: Real-world zero-shot trajectory tracking using the proposed controller. The plots show executed flight trajectories overlaid on the desired references. Color indicates tracking error in centimeters, with darker regions corresponding to lower error. The controller closely follows diverse real-world trajectories using a dynamics model trained only in simulation.

Physics Structure in NN Design. Figure 8 and Table III first reveal a clear advantage of latent dynamics models over direct autoregressive prediction. The weakest performance is obtained by the predictive baseline, which reaches $8.80$ m mean position RMSE and $53.4^{\circ}$ mean attitude error, with large rollout variance ($2.3$ m and $14.9^{\circ}$ respectively). Adding kinematic physics regularization improves this baseline only modestly, reducing the mean position RMSE to $7.12$ m and the mean attitude error to $49.1^{\circ}$, corresponding to relative improvements of only $19\%$ and $8\%$. This indicates that physics-inspired penalties help, but are insufficient to overcome the underlying instability of autoregressive prediction. In contrast, the latent baselines without PI probing already perform better: *Recon + Prober* achieves $6.82$ m position RMSE and $45.2^{\circ}$ attitude error, while *Ours + Prober* improves further to $5.56$ m and $40.2^{\circ}$. Relative to the predictive baseline, this corresponds to reductions of $22.5\%$ and $33.8\%$ in position error, and $15.4\%$ and $24.7\%$ in attitude error, for *Recon + Prober* and *Ours + Prober*, respectively. Qualitatively, the rollout curves in Fig. 8 show the same trend: the predictive variants exhibit rapidly growing position, velocity, and especially attitude error, whereas the latent methods remain consistently lower across the horizon. These results suggest that latent dynamics modeling is already a better design choice than direct autoregressive prediction, and that simply adding physics regularization to a predictive model is not enough.

Training Objective. We next compare the two latent learning paradigms and the effect of injecting kinematic structure into state recovery. Without PI probing, *Ours + Prober* outperforms *Recon + Prober*, reducing mean position RMSE from $6.82$ to $5.56$ m and mean attitude error from $45.2^{\circ}$ to $40.2^{\circ}$. This shows that JEPA-style latent training produces a stronger predictive representation than reconstruction-based training, where embeddings are optimized to reconstruct the recorded state and avoid collapse through decoder supervision. However, the largest gains appear only after introducing the PI Prober. For the reconstruction model, replacing the generic prober with the PI Prober reduces position RMSE from $6.82$ to $1.53$ m and attitude error from $45.2^{\circ}$ to $5.28^{\circ}$, corresponding to roughly $4.5\times$ and $8.6\times$ improvements. For our JEPA model, the same replacement reduces position RMSE from $5.56$ to $1.43$ m and attitude error from $40.2^{\circ}$ to $4.71^{\circ}$, i.e., about $3.9\times$ and $8.5\times$ improvements. Variance is reduced just as sharply, dropping from $1.31$ to $0.10$ in position and from $9.30^{\circ}$ to $0.50^{\circ}$ in attitude for the JEPA model. The qualitative rollout curves (see Figure 8) reinforce the same trend. This suggests that the proposed kinematic structure makes the state-recovery problem substantially easier: instead of learning metric dynamics entirely from scratch through a flexible decoder, the model only needs to predict structured corrections on top of a parameter-free prior. The PI Prober is not learning the full dynamics end-to-end. It rather learns the missing dynamics needed to complement the imposed kinematic structure and recover the full system evolution. Importantly, in our setup this structure can be imposed without requiring nominal parameter estimation. Overall, these results show that JEPA provides the stronger dynamics model, while the PI Prober is the key mechanism that converts embeddings into accurate and stable metric-state trajectories for control.

<svg id="S6.SS2.p7.pic1" height="161.26" overflow="visible" version="1.1" viewBox="0 0 600 161.26" width="600"><g style="--ltx-stroke-color:#000000;--ltx-fill-color:#000000;" transform="translate(0,161.26) matrix(1 0 0 -1 0 0)" fill="#000000" stroke="#000000" stroke-width="0.4pt"><g style="--ltx-fill-color:#228B22;" fill="#228B22" fill-opacity="1.0"><path style="stroke:none" d="M 0 5.69 L 0 155.57 C 0 158.71 2.55 161.26 5.69 161.26 L 594.31 161.26 C 597.45 161.26 600 158.71 600 155.57 L 600 5.69 C 600 2.55 597.45 0 594.31 0 L 5.69 0 C 2.55 0 0 2.55 0 5.69 Z"></path></g><g style="--ltx-fill-color:#F0F9F0;" fill="#F0F9F0" fill-opacity="1.0"><path style="stroke:none" d="M 0.97 5.69 L 0.97 155.57 C 0.97 158.18 3.08 160.29 5.69 160.29 L 594.31 160.29 C 596.92 160.29 599.03 158.18 599.03 155.57 L 599.03 5.69 C 599.03 3.08 596.92 0.97 594.31 0.97 L 5.69 0.97 C 3.08 0.97 0.97 3.08 0.97 5.69 Z"></path></g><g fill-opacity="1.0" transform="matrix(1.0 0.0 0.0 1.0 8.06 8.9)"><foreignObject style="--ltx-fg-color:#000000;--ltx-fo-width:42.2em;--ltx-fo-height:10.54em;--ltx-fo-depth:0.17em;" width="583.89" height="148.3" transform="matrix(1 0 0 -1 0 145.88)" overflow="visible" color="#000000"><span id="S6.SS2.p7.pic1.1.1.1.1.1" style="width:45.62em;"><span id="S6.SS2.p7.pic1.1.1.1.1.1.1"><span id="S6.SS2.p7.pic1.1.1.1.1.1.1.1" style="font-size:90%;">Takeaway: <span id="S6.SS2.p7.pic1.1.1.1.1.1.1.1.1">Embedding kinematic structure enables high-fidelity metric-state recovery, showing that the latent rollouts retain sufficient information to reconstruct the full dynamics.</span></span></span></span></foreignObject></g></g></svg>

### VI-C Zero-Shot Sim-to-Real Transfer

We now evaluate how far the proposed framework performs when trained entirely on domain-randomized simulation data, with no task-specific fine-tuning on real-world trajectories. We compare three controllers in closed loop: *Ours*, which uses the proposed framework; *MPPI (Predictive + Physics Regularization)*, which uses a direct predictive state-space model trained with physics regularization; and *MPPI (Predictive)*, which uses a standard predictive state-space model without additional physical grounding. These experiments therefore test whether the benefits observed in open-loop prediction translate into real control performance under sim-to-real transfer. Each trajectory is executed 5 times and we report the mean and varience of the tracking performance. Table IV shows a consistent advantage of the proposed method across all reference trajectories. In terms of position tracking, *Ours* achieves the lowest mean RMSE on every trajectory, reducing the error from $0.39$ to $0.24$ m on the circle ($\approx 38\%$ improvement over *MPPI (Predictive)*), from $0.48$ to $0.33$ m on the oval ($\approx 31\%$), from $0.51$ to $0.35$ m on the figure-8 ($\approx 31\%$), from $0.59$ to $0.40$ m on the fish trajectory ($\approx 32\%$), and from $0.61$ to $0.45$ m on the lemniscate ($\approx 26\%$). Similar gains are obtained relative to *MPPI (Predictive + Physics Regularization)*, with position-error reductions ranging from about $20\%$ to $33\%$. The same trend appears in attitude tracking. Relative to *MPPI (Predictive)*, our method reduces mean attitude error from $11.95^{\circ}$ to $7.87^{\circ}$ on the circle ($\approx 34\%$), from $16.53^{\circ}$ to $9.11^{\circ}$ on the oval ($\approx 45\%$), from $20.20^{\circ}$ to $9.25^{\circ}$ on the figure-8 ($\approx 54\%$), from $22.78^{\circ}$ to $10.78^{\circ}$ on the fish trajectory ($\approx 53\%$), and from $29.16^{\circ}$ to $19.43^{\circ}$ on the lemniscate ($\approx 33\%$). Variance is also consistently lower for our method in both position and attitude, indicating not only better average tracking but also more repeatable closed-loop behavior across trials.

The qualitative tracking examples in Fig. 10 illustrate representative real-world tracking of the proposed method across multiple reference trajectories. These examples show that the controller is able to track diverse closed-loop paths in the real world using a dynamics model trained entirely in simulation, with the color-coded error remaining generally concentrated along the reference trajectory. The quantitative results in Table IV provide the stronger evidence: across all trajectories, our method consistently achieves lower position and attitude errors than both predictive baselines, and this advantage persists as the trajectories become faster and more aggressive. Overall, these results suggest that simulation alone can be sufficient for real-world control when the learned dynamics model is structured appropriately. A likely reason is that the proposed framework combines three complementary ingredients: latent dynamics modeling reduces the compounding effects of direct autoregressive state prediction, domain randomization broadens the training distribution to better capture real-world variability, and the physics-inspired prober grounds latent rollouts in metric state space so that the model remains useful for control. Together, these components enable more reliable zero-shot transfer from simulation to the real platform than purely predictive alternatives.

Table V: Quantitative results of closed-loop tracking under propeller switching and payload scenarios. All trajectories were executed at an average velocity of 2 ms <sup>-1</sup> and executed 5 times. The table reports the mean and variance.

<table><tbody><tr><td>Scenario</td><td>Trajectory</td><td colspan="6">Position RMSE [m]</td><td colspan="6">Attitude Error [<sup>∘</sup>]</td></tr><tr><td></td><td></td><td colspan="2">Ours</td><td colspan="2">MPPI (Pred. + Phy.)</td><td colspan="2">MPPI (Pred.)</td><td colspan="2">Ours</td><td colspan="2">MPPI (Pred. + Phy.)</td><td colspan="2">MPPI (Pred.)</td></tr><tr><td></td><td></td><td>Mean</td><td>Var.</td><td>Mean</td><td>Var.</td><td>Mean</td><td>Var.</td><td>Mean</td><td>Var.</td><td>Mean</td><td>Var.</td><td>Mean</td><td>Var.</td></tr><tr><td rowspan="3">Propeller Switching</td><td>Circle</td><td><math><semantics><mn>0.33</mn> <annotation>\mathbf{0.33}</annotation></semantics></math></td><td><math><semantics><mn>0.02</mn> <annotation>\mathbf{0.02}</annotation></semantics></math></td><td><math><semantics><mn>0.43</mn> <annotation>0.43</annotation></semantics></math></td><td><math><semantics><mn>0.03</mn> <annotation>0.03</annotation></semantics></math></td><td><math><semantics><mn>0.45</mn> <annotation>0.45</annotation></semantics></math></td><td><math><semantics><mn>0.03</mn> <annotation>0.03</annotation></semantics></math></td><td><math><semantics><mn>9.54</mn> <annotation>\mathbf{9.54}</annotation></semantics></math></td><td><math><semantics><mn>1.04</mn> <annotation>\mathbf{1.04}</annotation></semantics></math></td><td><math><semantics><mn>12.40</mn> <annotation>12.40</annotation></semantics></math></td><td><math><semantics><mn>1.35</mn> <annotation>1.35</annotation></semantics></math></td><td><math><semantics><mn>12.88</mn> <annotation>12.88</annotation></semantics></math></td><td><math><semantics><mn>1.40</mn> <annotation>1.40</annotation></semantics></math></td></tr><tr><td>Figure 8</td><td><math><semantics><mn>0.35</mn> <annotation>\mathbf{0.35}</annotation></semantics></math></td><td><math><semantics><mn>0.01</mn> <annotation>\mathbf{0.01}</annotation></semantics></math></td><td><math><semantics><mn>0.46</mn> <annotation>0.46</annotation></semantics></math></td><td><math><semantics><mn>0.01</mn> <annotation>0.01</annotation></semantics></math></td><td><math><semantics><mn>0.47</mn> <annotation>0.47</annotation></semantics></math></td><td><math><semantics><mn>0.01</mn> <annotation>0.01</annotation></semantics></math></td><td><math><semantics><mn>10.21</mn> <annotation>\mathbf{10.21}</annotation></semantics></math></td><td><math><semantics><mn>0.98</mn> <annotation>\mathbf{0.98}</annotation></semantics></math></td><td><math><semantics><mn>13.27</mn> <annotation>13.27</annotation></semantics></math></td><td><math><semantics><mn>1.27</mn> <annotation>1.27</annotation></semantics></math></td><td><math><semantics><mn>13.78</mn> <annotation>13.78</annotation></semantics></math></td><td><math><semantics><mn>1.32</mn> <annotation>1.32</annotation></semantics></math></td></tr><tr><td>Fish</td><td><math><semantics><mn>0.39</mn> <annotation>\mathbf{0.39}</annotation></semantics></math></td><td><math><semantics><mn>0.02</mn> <annotation>\mathbf{0.02}</annotation></semantics></math></td><td><math><semantics><mn>0.51</mn> <annotation>0.51</annotation></semantics></math></td><td><math><semantics><mn>0.03</mn> <annotation>0.03</annotation></semantics></math></td><td><math><semantics><mn>0.53</mn> <annotation>0.53</annotation></semantics></math></td><td><math><semantics><mn>0.03</mn> <annotation>0.03</annotation></semantics></math></td><td><math><semantics><mn>10.89</mn> <annotation>\mathbf{10.89}</annotation></semantics></math></td><td><math><semantics><mn>0.88</mn> <annotation>\mathbf{0.88}</annotation></semantics></math></td><td><math><semantics><mn>14.16</mn> <annotation>14.16</annotation></semantics></math></td><td><math><semantics><mn>1.14</mn> <annotation>1.14</annotation></semantics></math></td><td><math><semantics><mn>14.70</mn> <annotation>14.70</annotation></semantics></math></td><td><math><semantics><mn>1.19</mn> <annotation>1.19</annotation></semantics></math></td></tr><tr><td rowspan="3">Payload Transportation</td><td>Circle</td><td><math><semantics><mn>0.46</mn> <annotation>\mathbf{0.46}</annotation></semantics></math></td><td><math><semantics><mn>0.08</mn> <annotation>\mathbf{0.08}</annotation></semantics></math></td><td><math><semantics><mn>0.60</mn> <annotation>0.60</annotation></semantics></math></td><td><math><semantics><mn>0.10</mn> <annotation>0.10</annotation></semantics></math></td><td><math><semantics><mn>0.62</mn> <annotation>0.62</annotation></semantics></math></td><td><math><semantics><mn>0.11</mn> <annotation>0.11</annotation></semantics></math></td><td><math><semantics><mn>10.11</mn> <annotation>\mathbf{10.11}</annotation></semantics></math></td><td><math><semantics><mn>1.43</mn> <annotation>\mathbf{1.43}</annotation></semantics></math></td><td><math><semantics><mn>13.14</mn> <annotation>13.14</annotation></semantics></math></td><td><math><semantics><mn>1.86</mn> <annotation>1.86</annotation></semantics></math></td><td><math><semantics><mn>13.65</mn> <annotation>13.65</annotation></semantics></math></td><td><math><semantics><mn>1.93</mn> <annotation>1.93</annotation></semantics></math></td></tr><tr><td>Figure 8</td><td><math><semantics><mn>0.49</mn> <annotation>\mathbf{0.49}</annotation></semantics></math></td><td><math><semantics><mn>0.07</mn> <annotation>\mathbf{0.07}</annotation></semantics></math></td><td><math><semantics><mn>0.64</mn> <annotation>0.64</annotation></semantics></math></td><td><math><semantics><mn>0.09</mn> <annotation>0.09</annotation></semantics></math></td><td><math><semantics><mn>0.66</mn> <annotation>0.66</annotation></semantics></math></td><td><math><semantics><mn>0.09</mn> <annotation>0.09</annotation></semantics></math></td><td><math><semantics><mn>9.44</mn> <annotation>\mathbf{9.44}</annotation></semantics></math></td><td><math><semantics><mn>1.37</mn> <annotation>\mathbf{1.37}</annotation></semantics></math></td><td><math><semantics><mn>12.27</mn> <annotation>12.27</annotation></semantics></math></td><td><math><semantics><mn>1.78</mn> <annotation>1.78</annotation></semantics></math></td><td><math><semantics><mn>12.74</mn> <annotation>12.74</annotation></semantics></math></td><td><math><semantics><mn>1.85</mn> <annotation>1.85</annotation></semantics></math></td></tr><tr><td>Fish</td><td><math><semantics><mn>0.53</mn> <annotation>\mathbf{0.53}</annotation></semantics></math></td><td><math><semantics><mn>0.08</mn> <annotation>\mathbf{0.08}</annotation></semantics></math></td><td><math><semantics><mn>0.69</mn> <annotation>0.69</annotation></semantics></math></td><td><math><semantics><mn>0.10</mn> <annotation>0.10</annotation></semantics></math></td><td><math><semantics><mn>0.72</mn> <annotation>0.72</annotation></semantics></math></td><td><math><semantics><mn>0.11</mn> <annotation>0.11</annotation></semantics></math></td><td><math><semantics><mn>11.87</mn> <annotation>\mathbf{11.87}</annotation></semantics></math></td><td><math><semantics><mn>1.92</mn> <annotation>\mathbf{1.92}</annotation></semantics></math></td><td><math><semantics><mn>15.43</mn> <annotation>15.43</annotation></semantics></math></td><td><math><semantics><mn>2.50</mn> <annotation>2.50</annotation></semantics></math></td><td><math><semantics><mn>16.02</mn> <annotation>16.02</annotation></semantics></math></td><td><math><semantics><mn>2.59</mn> <annotation>2.59</annotation></semantics></math></td></tr></tbody></table>

![Refer to caption](https://arxiv.org/html/2606.23444v2/x11.png)

Figure 11: Real-world tracking under platform changes without retraining. (a) Payload transportation modifies the mass and inertial properties of the quadrotor. (b) Propeller switching changes the actuation characteristics. The executed trajectories remain close to the reference paths, with color indicating tracking error in centimeters. These rollouts show that the proposed framework remains effective under non-nominal deployment conditions.

### VI-D Robustness

We finally evaluate whether the proposed framework remains effective when the real platform deviates from its nominal training configuration. In particular, we consider two deployment scenarios that alter the vehicle dynamics without any retraining or task-specific adaptation: *propeller switching*, which changes the actuation characteristics, and *payload transportation*, which modifies the vehicle mass and inertial properties. These scenarios were not covered during data collection. These experiments are significant because such changes are common in real deployments and can induce substantial model mismatch. All trajectories were executed at an average velocity of 2 ms <sup>-1</sup> and executed 5 times. We compare the same three closed-loop controllers as before: *Ours*, *MPPI (Pred.+Phy.)*, and *MPPI (Pred.)*. The goal is to assess whether latent-space dynamics modeling yields a controller that is more robust to platform variations than direct predictive baselines.

Table V shows that our method achieves the best performance across both deployment scenarios. Under *propeller switching*, our method consistently attains about $1.3\times$ lower position RMSE than *MPPI (Pred.)* and about $1.2\times$ lower error than *MPPI (Pred.+Phy.)* across the evaluated trajectories. A similar trend appears in attitude tracking, where our method delivers roughly $1.3\times$ lower error than the predictive baseline and about $1.25\times$ lower error than the physics-regularized variant. Under *payload transportation*, with a payload of $300g$ the same pattern persists. Our method again achieves approximately $1.35\times$ lower position RMSE than *MPPI (Pred.)* and about $1.27\times$ lower error than *MPPI (Pred.+Phy.)*. Attitude error follows a nearly identical trend, with our method consistently providing about $1.4\times$ lower error than the predictive baseline. Variance is also lower across both position and attitude metrics, indicating not only improved tracking accuracy but also more repeatable behavior under model mismatch.

The qualitative examples in Fig. 11 illustrate representative tracking rollouts of our method under both propeller switching and payload attachment. Even under these non-nominal conditions, the controller remains close to the reference path, with tracking error remaining concentrated along the trajectory rather than diverging in curved segments. When interpreted together with the quantitative results, these experiments suggest that the proposed latent dynamics model is more robust than predictive models because it captures a more compact and transferable representation of system evolution, rather than depending directly on precise next-state prediction under a fixed nominal configuration. As a result, when the platform dynamics shift due to changes in actuation or mass properties, the learned latent dynamics appear to degrade more gracefully than direct predictive state-space models.

<svg id="S6.SS4.p4.pic1" height="161.26" overflow="visible" version="1.1" viewBox="0 0 600 161.26" width="600"><g style="--ltx-stroke-color:#000000;--ltx-fill-color:#000000;" transform="translate(0,161.26) matrix(1 0 0 -1 0 0)" fill="#000000" stroke="#000000" stroke-width="0.4pt"><g style="--ltx-fill-color:#228B22;" fill="#228B22" fill-opacity="1.0"><path style="stroke:none" d="M 0 5.69 L 0 155.57 C 0 158.71 2.55 161.26 5.69 161.26 L 594.31 161.26 C 597.45 161.26 600 158.71 600 155.57 L 600 5.69 C 600 2.55 597.45 0 594.31 0 L 5.69 0 C 2.55 0 0 2.55 0 5.69 Z"></path></g><g style="--ltx-fill-color:#F0F9F0;" fill="#F0F9F0" fill-opacity="1.0"><path style="stroke:none" d="M 0.97 5.69 L 0.97 155.57 C 0.97 158.18 3.08 160.29 5.69 160.29 L 594.31 160.29 C 596.92 160.29 599.03 158.18 599.03 155.57 L 599.03 5.69 C 599.03 3.08 596.92 0.97 594.31 0.97 L 5.69 0.97 C 3.08 0.97 0.97 3.08 0.97 5.69 Z"></path></g><g fill-opacity="1.0" transform="matrix(1.0 0.0 0.0 1.0 8.06 8.9)"><foreignObject style="--ltx-fg-color:#000000;--ltx-fo-width:42.2em;--ltx-fo-height:10.54em;--ltx-fo-depth:0.17em;" width="583.89" height="148.3" transform="matrix(1 0 0 -1 0 145.88)" overflow="visible" color="#000000"><span id="S6.SS4.p4.pic1.1.1.1.1.1" style="width:45.62em;"><span id="S6.SS4.p4.pic1.1.1.1.1.1.1"><span id="S6.SS4.p4.pic1.1.1.1.1.1.1.1" style="font-size:90%;">Takeaway: <span id="S6.SS4.p4.pic1.1.1.1.1.1.1.1.1">A well covered diverse domain-randomized simulation data is sufficient for zero-shot sim2real deployment.</span></span></span></span></foreignObject></g></g></svg>

### VI-E Data Quality

Trajectory Distribution Quality. The performance of a learned dynamics model depends strongly on the distribution of transitions used for training (see Section IV-E). We therefore introduce a Trajectory Distribution Quality (TDQ) score to quantify whether $\mathcal{D}$ provides broad, dynamically informative, and robust coverage for learning the transition map. Since the relevant variables are continuous and high-dimensional, measuring coverage of the state–action space is difficult. Therefore, we discretize each normalized feature space using clustering, which provides an empirical partition of the data distribution into local regions. The occupancy of these regions can then be used to compute an entropy-based measure of distributional spread [^53] [^13], while the number of occupied regions measures coverage. This clustering-based discretization is similar in spirit to vector quantization and $K$ -means-based density summarization [^34] [^37]. TDQ measures three properties that directly affect neural dynamics learning: state–action coverage, transition richness, and parameter robustness.

Each trajectory in the dataset is obtained using a simulator parameter vector $\bm{\eta}$ (see eq. (26)), which specifies the physical parameters of the randomized quadrotor model. For each transition $i$, we define the augmented state–action feature vector

$$
\mathbf{y}_{i}=\begin{bmatrix}\mathbf{v}_{i}^{\top}&\mathbf{r}_{x,i}^{\top}&\mathbf{r}_{y,i}^{\top}&\mathbf{r}_{z,i}^{\top}&\bm{\omega}_{i}^{\top}&\mathbf{a}_{i}^{\top}\end{bmatrix}^{\top},
$$

which includes the velocity, attitude, angular velocity, and motor forces. We omit absolute position from $\mathbf{y}_{i}$ because the local quadrotor dynamics are primarily governed by velocity, attitude, angular velocity, and control input. To measure the diversity of local transitions, we define

$$
\mathbf{g}_{i}=\begin{bmatrix}\mathbf{y}_{i}^{\top}&\Delta\mathbf{y}_{i}^{\top}\end{bmatrix}^{\top},\qquad\Delta\mathbf{y}_{i}=\mathbf{y}_{i+1}-\mathbf{y}_{i}.
$$

The feature $\mathbf{y}_{i}$ measures which regions of the state–action space are visited, while $\mathbf{g}_{i}$ measures how the system locally evolves from those regions.

![Refer to caption](https://arxiv.org/html/2606.23444v2/x12.png)

Figure 12: As dataset size increases, TDQ rises from 0.01 to 0.94, while state RMSE e 𝐱 e^{\\mathbf{x}} decreases from 5.4 1.4, showing that higher trajectory distribution quality correlates with better learned dynamics prediction.

After normalizing each feature space, we cluster the state–action features $\mathbf{y}_{i}$, transition features $\mathbf{g}_{i}$, and simulator parameter vectors $\bm{\eta}$ using $K_{y}$, $K_{g}$, and $K_{\eta}$ clusters, respectively. For a generic clustered feature space with $K$ clusters, let $q_{k}$ denote the empirical occupancy probability of cluster $k$, and let $n_{k}$ denote the number of samples assigned to that cluster. We define the entropy–coverage score

$$
S=\left(-\frac{1}{\log K}\sum_{k=1}^{K}q_{k}\log(q_{k})\right)\left(\frac{1}{K}\sum_{k=1}^{K}\mathbb{I}[n_{k}\geq n_{\min}]\right),
$$

where the first term is a normalized Shannon entropy that measures how uniformly the data occupies the clustered feature space, and the second term measures the fraction of clusters that are sufficiently represented. The threshold $n_{\min}$ prevents isolated or rarely visited regions from being counted as meaningfully covered. Applying eq. (37) to $\mathbf{y}_{i}$, $\mathbf{g}_{i}$, and $\bm{\eta}$ gives the state–action coverage score $S_{\mathrm{cov}}$, transition richness score $S_{\mathrm{dyn}}$, and parameter robustness score $S_{\eta}$, respectively. The final TDQ score is defined as the harmonic mean

$$
\mathrm{TDQ}(\mathcal{D})=\frac{3}{\frac{1}{S_{\mathrm{cov}}}+\frac{1}{S_{\mathrm{dyn}}}+\frac{1}{S_{\eta}}}.
$$

The harmonic mean penalizes datasets that score poorly in any one component, ensuring that a high TDQ value requires broad state–action coverage, diverse local transition behavior, and sufficient coverage of the randomized simulator parameters.

To evaluate whether the proposed TDQ score reflects the usefulness of a dataset for dynamics learning, we train the proposed latent dynamics framework using datasets of increasing size and compute the resulting state prediction error $e^{\mathbf{x}}$. For each dataset size, we compute TDQ from the corresponding training distribution and evaluate the trained model on the same held-out test set. Figure 12 shows a clear inverse relationship between TDQ and predictive error: as TDQ increases, the state RMSE $e^{\mathbf{x}}$ decreases. With only $1\mathrm{k}$ samples, the dataset has a very low TDQ of approximately $0.01$, and the model produces a large state error of about $5.4$. Increasing the dataset to $10\mathrm{k}$ samples improves TDQ to roughly $0.08$, reducing $e^{\mathbf{x}}$ to about $2.5$. With $100\mathrm{k}$ samples, TDQ further increases to approximately $0.25$, and the error decreases to about $1.9$, indicating that additional data substantially improves state–action coverage, transition richness, and parameter robustness. Beyond this point, the curve begins to flatten: increasing the dataset size to $1.0\mathrm{M}$ and $1.5\mathrm{M}$ raises TDQ to approximately $0.91$ and $0.94$, respectively, but only reduces $e^{\mathbf{x}}$ from about $1.5$ to $1.4$. This saturation suggests that the dataset increasingly covers the relevant dynamics manifold, and that further gains are likely limited by model capacity, optimization, or residual dynamics complexity rather than data coverage alone.

<svg id="S6.SS5.p5.pic1" height="161.26" overflow="visible" version="1.1" viewBox="0 0 600 161.26" width="600"><g style="--ltx-stroke-color:#000000;--ltx-fill-color:#000000;" transform="translate(0,161.26) matrix(1 0 0 -1 0 0)" fill="#000000" stroke="#000000" stroke-width="0.4pt"><g style="--ltx-fill-color:#228B22;" fill="#228B22" fill-opacity="1.0"><path style="stroke:none" d="M 0 5.69 L 0 155.57 C 0 158.71 2.55 161.26 5.69 161.26 L 594.31 161.26 C 597.45 161.26 600 158.71 600 155.57 L 600 5.69 C 600 2.55 597.45 0 594.31 0 L 5.69 0 C 2.55 0 0 2.55 0 5.69 Z"></path></g><g style="--ltx-fill-color:#F0F9F0;" fill="#F0F9F0" fill-opacity="1.0"><path style="stroke:none" d="M 0.97 5.69 L 0.97 155.57 C 0.97 158.18 3.08 160.29 5.69 160.29 L 594.31 160.29 C 596.92 160.29 599.03 158.18 599.03 155.57 L 599.03 5.69 C 599.03 3.08 596.92 0.97 594.31 0.97 L 5.69 0.97 C 3.08 0.97 0.97 3.08 0.97 5.69 Z"></path></g><g fill-opacity="1.0" transform="matrix(1.0 0.0 0.0 1.0 8.06 8.9)"><foreignObject style="--ltx-fg-color:#000000;--ltx-fo-width:42.2em;--ltx-fo-height:10.54em;--ltx-fo-depth:0.17em;" width="583.89" height="148.3" transform="matrix(1 0 0 -1 0 145.88)" overflow="visible" color="#000000"><span id="S6.SS5.p5.pic1.1.1.1.1.1" style="width:45.62em;"><span id="S6.SS5.p5.pic1.1.1.1.1.1.1"><span id="S6.SS5.p5.pic1.1.1.1.1.1.1.1" style="font-size:90%;">Takeaway: <span id="S6.SS5.p5.pic1.1.1.1.1.1.1.1.1">Higher TDQ leads to lower state prediction error, indicating that broader state–action coverage, richer transitions, and better parameter diversity improve learned dynamics prediction.</span></span></span></span></foreignObject></g></g></svg>

## VII Discussion

The experimental results demonstrate that the proposed framework satisfies the four key properties of a useful world model for quadrotor control. First, the model improves long-horizon prediction by reducing recursive error accumulation, as shown by the compounding ratio and error growth analysis in Fig. 6. Second, the physics-inspired prober makes the latent rollout interpretable by mapping learned representations back to physically meaningful state variables, which is essential for model-based control. This is supported by the open-loop prediction results in Fig. 8 and Table III, where the proposed PI Prober substantially improves metric-state recovery. Third, the resulting model is real-time for real-time control, since it is directly used inside an MPPI controller onboard an embedded device. Finally, the model can zero-shot generalize across tasks: the same learned model is used across multiple trajectories and deployment conditions without task-specific retraining or fine-tuning, as shown in Tables IV and V.

A central result of this work is that a well-designed simulation data pipeline, combined with an appropriate learning framework, can be sufficient for zero-shot sim-to-real transfer. Rather than relying on accurate system identification or task-specific fine-tuning, our approach systematically collects diverse trajectories and exposes the model to a broad family of plausible quadrotor dynamics through domain randomization, as summarized in Fig. 12. The TDQ analysis in Fig. 12 further supports this design choice by showing that higher-quality training distributions consistently lead to lower state prediction error. This indicates that broader state–action coverage, richer transition behavior, and greater parameter diversity improve the usefulness of the dataset for learning dynamics. The improvement is most pronounced when moving from small, poorly covered datasets to larger datasets that better span the relevant dynamics distribution; as coverage increases, the gains begin to saturate, suggesting that further improvements are likely limited by model capacity, optimization, or residual dynamics complexity. The real-world tracking results in Table IV show that this data-generation strategy is sufficient to outperform predictive baselines across diverse reference trajectories. More importantly, the robustness experiments in Table V show that the same model remains effective under deployment changes such as propeller switching and payload transportation. This suggests that the learned representation captures dynamics that are not tied to a single nominal platform. While this work focuses on simulation-only training, the same framework could also be applied directly to real-world data to capture difficult-to-model nonlinear effects, especially at high speeds where aerodynamic and actuator effects become more pronounced.

Another practical advantage of the proposed framework is the simplicity of the SIGReg training objective. Many representation learning methods require multiple carefully tuned loss terms [^7] [^54], target networks, stop-gradient choices [^20], or reconstruction weights. In contrast, SIGReg introduces a compact anti-collapse mechanism with only one main regularization weight, $\lambda_{\mathrm{sig}}$, to tune. This makes the objective easier to use in practice and more appealing for general-purpose dynamics representation learning. Combined with the physics-inspired prober, this leads to a framework that is both expressive and structured: the latent model learns temporally coherent predictive representations, while the prober converts them into interpretable rollouts suitable for control.

## VIII Conclusion and Future Works

In this work, we introduced the first JEPA-style latent dynamics framework for real-time quadrotor control. The proposed approach learns predictive representations of system evolution without directly reconstructing future states, and uses a physics-inspired prober to map frozen latent rollouts into physically meaningful metric states. This design addresses the four key requirements of a useful world model for aerial control. It improves long-horizon prediction by reducing recursive error accumulation, provides interpretable state-space rollouts for evaluating costs and constraints, remains computationally practical for real-time MPPI control, and is task-agnostic across trajectories and deployment conditions. To reduce reliance on costly and risky real-world data collection, we also developed a domain-randomized simulation pipeline for automated dataset generation. Across open-loop prediction, noise robustness, zero-shot sim-to-real transfer, and platform-variation experiments, the proposed framework consistently outperformed direct predictive baselines and demonstrated robust real-world deployment without task-specific fine-tuning.

Future works will extend this framework from low-dimensional state inputs to high-dimensional observations such as RGB and RGB-D images. This setting is a natural fit for JEPA-style learning, since direct predictive reconstruction becomes increasingly expensive and often forces the model to preserve task-irrelevant visual details. Such an extension would open the door to a broad class of visual navigation tasks, including goal-directed flight from onboard camera observations, obstacle avoidance in cluttered environments, and navigation toward semantic targets. This direction is especially important for quadrotors, where observations compared to other domains like in robot manipulation, are egocentric and tightly coupled to the vehicle’s underactuated dynamics. A second direction is to incorporate safety more explicitly into the learned representation and planning objective. We would like to investigate how latent dynamics models can encode safety-relevant structures, such as obstacle proximity, visibility, uncertainty, and recoverability, to support reliable planning in cluttered and uncertain environments.

[^1]: M. Assran, Q. Duval, I. Misra, P. Bojanowski, P. Vincent, M. Rabbat, Y. LeCun, and N. Ballas (2023) Self-supervised learning from images with a joint-embedding predictive architecture. In Proceedings of the IEEE/CVF Conference on Computer Vision and Pattern Recognition, pp. 15619–15629. Cited by: §II-B.

[^2]: M. Assran, A. Bardes, D. Fan, Q. Garrido, R. Howes, M. Muckley, A. Rizvi, C. Roberts, K. Sinha, A. Zholus, et al. (2025) V-jepa 2: self-supervised video models enable understanding, prediction and planning. arXiv preprint arXiv:2506.09985. Cited by: §II-B.

[^3]: R. Balestriero and Y. LeCun (2025) LeJEPA: provable and scalable self-supervised learning without the heuristics. arXiv preprint arXiv:2511.08544. Cited by: §IV-B, §IV-B, §IV-B.

[^4]: S. Bansal, A. K. Akametalu, F. J. Jiang, F. Laine, and C. J. Tomlin (2016) Learning quadrotor dynamics using neural network for flight control. In IEEE 55th Conference on Decision and Control (CDC), pp. 4653–4660. Cited by: §II-A.

[^5]: A. Bar, G. Zhou, D. Tran, T. Darrell, and Y. LeCun (2025) Navigation world models. In Proceedings of the IEEE/CVF Conference on Computer Vision and Pattern Recognition, pp. 15791–15801. Cited by: §II-B.

[^6]: A. Bardes, Q. Garrido, J. Ponce, X. Chen, M. Rabbat, Y. LeCun, M. Assran, and N. Ballas (2023) V-jepa: latent video prediction for visual representation learning. arXiv preprint arXiv:2312.14119. Cited by: §II-B.

[^7]: A. Bardes, J. Ponce, and Y. LeCun (2022) VICReg: variance-invariance-covariance regularization for self-supervised learning. In International Conference on Learning Representations (ICLR), Cited by: §IV-B, §VII.

[^8]: A. Bardes, J. Ponce, and Y. LeCun (2023) MC-jepa: a joint-embedding predictive architecture for self-supervised learning of motion and content features. arXiv preprint arXiv:2307.12698. Cited by: §II-B.

[^9]: L. Bauersfeld, E. Kaufmann, P. Foehn, S. Sun, and D. Scaramuzza (2021) NeuroBEM: hybrid aerodynamic quadrotor model. In Robotics: Science and Systems (RSS), Cited by: §I, §I, §II-A.

[^10]: S. L. Brunton, J. L. Proctor, and J. N. Kutz (2016) Discovering governing equations from data by sparse identification of nonlinear dynamical systems. Proceedings of the National Academy of Sciences 113 (15). Note: pp. 3932–3937 Cited by: §II-A.

[^11]: K. Chua, R. Calandra, R. McAllister, and S. Levine (2018) Deep reinforcement learning in a handful of trials using probabilistic dynamics models. Advances in Neural Information Processing Systems 31. Cited by: §I, §II-C.

[^12]: J. Chung, C. Gulcehre, K. Cho, and Y. Bengio (2015) Gated feedback recurrent neural networks. In Proceedings of the 32nd International Conference on Machine Learning, Vol. 37, pp. 2067–2075. Cited by: §V-C.

[^13]: T. M. Cover and J. A. Thomas (1999) Elements of information theory. Wiley. Cited by: §VI-E.

[^14]: T. Duong and N. Atanasov (2021) Hamiltonian-based neural ode networks on the se(3) manifold for dynamics learning and control. In Robotics: Science and Systems (RSS), Cited by: §I, §II-A.

[^15]: J. Eschmann, D. Albani, and G. Loianno (2024) Data-driven system identification of quadrotors subject to motor delays. In IEEE/RSJ International Conference on Intelligent Robots and Systems (IROS), pp. 8095–8102. Cited by: §I.

[^16]: J. Eschmann, D. Albani, and G. Loianno (2026) RAPTOR: a foundation policy for quadrotor control. Science Robotics 11 (114), pp. eaec1481. Cited by: §IV-E.

[^17]: C. Finn and S. Levine (2017) Deep visual foresight for planning robot motion. In IEEE International Conference on Robotics and Automation (ICRA), pp. 2786–2793. Cited by: §I.

[^18]: J. Fu, S. Levine, and P. Abbeel (2016) One-shot learning of manipulation skills with online dynamics adaptation and neural network priors. In IEEE/RSJ International Conference on Intelligent Robots and Systems (IROS), pp. 4019–4026. Cited by: §I, §II-A.

[^19]: R. G. Goswami, A. Bar, D. Fan, T. Yang, G. Zhou, P. Krishnamurthy, M. Rabbat, F. Khorrami, and Y. LeCun (2026) World models for learning dexterous hand-object interactions from human videos. arXiv preprint arXiv:2512.13644. Cited by: §II-B.

[^20]: J. Grill, F. Strub, F. Altché, C. Tallec, P. Richemond, E. Buchatskaya, C. Doersch, B. Avila Pires, Z. Guo, M. G. Azar, et al. (2020) Bootstrap your own latent: a new approach to self-supervised learning. Advances in Neural Information Processing Systems 33. Note: pp. 21271–21284 Cited by: §IV-B, §VII.

[^21]: D. Hafner, T. Lillicrap, I. Fischer, R. Villegas, D. Ha, H. Lee, and J. Davidson (2019) Learning latent dynamics for planning from pixels. In International Conference on Machine Learning, pp. 2555–2565. Cited by: §II-C.

[^22]: D. Hafner, J. Pasukonis, J. Ba, and T. Lillicrap (2025) Mastering diverse control tasks through world models. Nature 640. Note: pp. 647–653 Cited by: §II-C.

[^23]: O. J. Hénaff, R. L. T. Goris, and E. P. Simoncelli (2019) Perceptual straightening of natural videos. Nature Neuroscience 22 (6). Note: pp. 984–991 Cited by: §VI-A.

[^24]: L. Hewing, J. Kabzan, and M. N. Zeilinger (2019) Cautious model predictive control using gaussian process regression. IEEE Transactions on Control Systems Technology 28 (6). Note: pp. 2736–2743 Cited by: §I.

[^25]: T. Z. Jiahao, K. Y. Chee, and M. A. Hsieh (2023) Online dynamics learning for predictive control with an application to aerial robots. In Conference on Robot Learning, pp. 2251–2261. Cited by: §I, §II-A.

[^26]: M. Krinner, E. Aljalbout, A. Romero, and D. Scaramuzza (2025) Accelerating model-based reinforcement learning with state-space world models. arXiv preprint arXiv:2502.20168. Cited by: §II-C.

[^27]: G. Kulathunga, H. Hamed, and A. Klimchik (2024) Residual dynamics learning for trajectory tracking for multi-rotor aerial vehicles. Scientific Reports 14 (1). Note: pp. 1858 Cited by: §II-A.

[^28]: V. Kumar and N. Michael (2012) Opportunities and challenges with autonomous micro aerial vehicles. The International Journal of Robotics Research 31 (11). Note: pp. 1279–1291 Cited by: §I.

[^29]: N. O. Lambert, D. S. Drew, J. Yaconelli, S. Levine, R. Calandra, and K. S. J. Pister (2019) Low-level control of a quadrotor with deep model-based reinforcement learning. IEEE Robotics and Automation Letters 4 (4). Note: pp. 4224–4230 Cited by: §II-C.

[^30]: C. Lea, M. D. Flynn, R. Vidal, A. Reiter, and G. D. Hager (2017) Temporal convolutional networks for action segmentation and detection. In Proceedings of the IEEE Conference on Computer Vision and Pattern Recognition, pp. 156–165. Cited by: §V-C.

[^31]: Y. LeCun (2022) A path towards autonomous machine intelligence version 0.9.2. Open Review 62 (1). Note: pp. 1–62 Cited by: §IV-A.

[^32]: T. Lew, A. Sharma, J. Harrison, A. Bylard, and M. Pavone (2022) Safe active dynamics learning and control: a sequential exploration–exploitation framework. IEEE Transactions on Robotics 38 (5). Note: pp. 2888–2907 Cited by: §I, §II-A.

[^33]: C. Li, A. Krause, and M. Hutter (2025) Robotic world model: a neural network simulator for robust policy optimization in robotics. In NeurIPS 2025 Workshop on Embodied World Models for Decision Making, Cited by: §II-C.

[^34]: S. P. Lloyd (1982) Least squares quantization in pcm. IEEE Transactions on Information Theory 28 (2), pp. 129–137. Cited by: §VI-E.

[^35]: G. Loianno, C. Brunner, G. McGrath, and V. Kumar (2017) Estimation, control, and planning for aggressive flight with a small quadrotor with a single camera and imu. IEEE Robotics and Automation Letters 2 (2), pp. 404–411. External Links: [Document](https://dx.doi.org/10.1109/LRA.2016.2633290) Cited by: §I.

[^36]: S. Looper and S. L. Waslander (2022) Temporal convolutions for multi-step quadrotor motion prediction. In 2022 19th Conference on Robots and Vision (CRV), pp. 32–39. Cited by: §II-A.

[^37]: J. MacQueen (1967) Some methods for classification and analysis of multivariate observations. In Proceedings of the Fifth Berkeley Symposium on Mathematical Statistics and Probability, pp. 281–297. Cited by: §VI-E.

[^38]: L. Maes, Q. L. Lidec, D. Scieur, Y. LeCun, and R. Balestriero (2026) LeWorldModel: stable end-to-end joint-embedding predictive architecture from pixels. arXiv preprint arXiv:2603.19312. Cited by: §II-B.

[^39]: L. Meier, D. Honegger, and M. Pollefeys (2015) PX4: a node-based multithreaded open source robotics framework for deeply embedded platforms. In 2015 IEEE International Conference on Robotics and Automation (ICRA), pp. 6235–6240. Cited by: §V-A.

[^40]: D. Mellinger and V. Kumar (2011) Minimum snap trajectory generation and control for quadrotors. In IEEE International Conference on Robotics and Automation (ICRA), pp. 2520–2525. Cited by: §IV-E.

[^41]: V. Micheli, E. Alonso, and F. Fleuret (2023) Transformers are sample-efficient world models. In International Conference on Learning Representations (ICLR), Cited by: §II-C.

[^42]: T. M. Moerland, J. Broekens, A. Plaat, and C. M. Jonker (2023) Model-based reinforcement learning: a survey. Foundations and Trends in Machine Learning 16 (1). Note: pp. 1–118 Cited by: §I.

[^43]: N. Mohajerin and S. L. Waslander (2019) Multistep prediction of dynamic systems with recurrent neural networks. IEEE Transactions on Neural Networks and Learning Systems 30 (11). Note: pp. 3370–3383 Cited by: §II-A.

[^44]: F. Nan, H. Ma, Q. Guan, J. Hughes, M. Muehlebach, and M. Hutter (2025) Efficient model-based reinforcement learning for robot control via online learning. arXiv preprint arXiv:2510.18518. Cited by: §II-C.

[^45]: M. O’Connell, G. Shi, X. Shi, K. Azizzadenesheli, A. Anandkumar, Y. Yue, and S. Chung (2022) Neural-fly enables rapid learning for agile flight in strong winds. Science Robotics 7 (66). Note: pp. eabm6597 Cited by: §I, §II-A.

[^46]: A. Punjani and P. Abbeel (2015) Deep learning helicopter dynamics models. In IEEE International Conference on Robotics and Automation (ICRA), pp. 3223–3230. Cited by: §I, §II-A.

[^47]: P. P. Rao, A. Saviolo, T. C. Ferrari, and G. Loianno (2024) Learning long-horizon predictions for quadrotor dynamics. In IEEE/RSJ International Conference on Intelligent Robots and Systems (IROS), pp. 12758–12765. Cited by: §I, §I, §II-A.

[^48]: J. Robine, M. Höftmann, T. Uelwer, and S. Harmeling (2023) Transformer-based world models are happy with 100k interactions. In International Conference on Learning Representations (ICLR), Cited by: §I, §II-C.

[^49]: A. Romero, A. Shenai, I. Geles, E. Aljalbout, and D. Scaramuzza (2026) Dream to fly: model-based reinforcement learning for vision-based drone flight. In IEEE International Conference on Robotics and Automation (ICRA), Cited by: §II-C.

[^50]: A. Saviolo, J. Frey, A. Rathod, M. Diehl, and G. Loianno (2023) Active learning of discrete-time dynamics for uncertainty-aware model predictive control. IEEE Transactions on Robotics 40. Note: pp. 1273–1291 Cited by: §I, §I, §II-A.

[^51]: A. Saviolo, G. Li, and G. Loianno (2022) Physics-inspired temporal learning of quadrotor dynamics for accurate model predictive trajectory tracking. IEEE Robotics and Automation Letters 7 (4). Note: pp. 10256–10263 Cited by: §I, §I, §II-A, Table III.

[^52]: A. Saviolo and G. Loianno (2023) Learning quadrotor dynamics for precise, safe, and agile flight control. Annual Reviews in Control 55. Note: pp. 45–60 Cited by: §I.

[^53]: C. E. Shannon (1948) A mathematical theory of communication. The Bell System Technical Journal 27 (3), pp. 379–423. Cited by: §VI-E.

[^54]: V. Sobal, W. Zhang, K. Cho, R. Balestriero, T. G. J. Rudner, and Y. LeCun (2025) Learning from reward-free offline data: a case for planning with latent dynamics models. arXiv preprint arXiv:2502.14819. Cited by: §II-B, §IV-B, §VII.

[^55]: Y. Song, S. Naji, E. Kaufmann, A. Loquercio, and D. Scaramuzza (2021) Flightmare: a flexible quadrotor simulator. In Conference on Robot Learning, pp. 1147–1157. Cited by: §IV-E.

[^56]: A. Verraest, S. Bahnam, R. Ferede, G. de Croon, and C. De Wagter (2025) SkyDreamer: interpretable end-to-end vision-based drone racing with model-based reinforcement learning. arXiv preprint arXiv:2510.14783. Cited by: §II-C.

[^57]: L. Wang, E. A. Theodorou, and M. Egerstedt (2018) Safe learning of quadrotor dynamics using barrier certificates. In IEEE International Conference on Robotics and Automation (ICRA), pp. 2460–2465. Cited by: §I, §II-A.

[^58]: Y. Wang, Q. Lu, and B. Ren (2023) Wind turbine crack inspection using a quadrotor with image motion blur avoided. IEEE Robotics and Automation Letters 8 (2). Note: pp. 1069–1076 Cited by: §I.

[^59]: Y. Wang, O. Bounou, G. Zhou, R. Balestriero, T. G. Rudner, Y. LeCun, and M. Ren (2026) Temporal straightening for latent planning. arXiv preprint arXiv:2603.12231. Cited by: §VI-A.

[^60]: N. Wiedemann, V. Wüest, A. Loquercio, M. Müller, D. Floreano, and D. Scaramuzza (2023) Training efficient controllers via analytic policy gradient. In IEEE International Conference on Robotics and Automation (ICRA), pp. 1349–1356. Cited by: §V-B.

[^61]: G. Williams, N. Wagener, B. Goldfain, P. Drews, J. M. Rehg, B. Boots, and E. A. Theodorou (2017) Information theoretic mpc for model-based reinforcement learning. In IEEE International Conference on Robotics and Automation (ICRA), pp. 1714–1721. Cited by: §I, §II-C, §IV-D, §IV-E.

[^62]: B. Wu, S. Nair, L. Fei-Fei, and C. Finn (2021) Example-driven model-based reinforcement learning for solving long-horizon visuomotor tasks. In Conference on Robot Learning (CoRL), Cited by: §I.

[^63]: S. Yin, K. Yin, W. Chen, Y. Liu, G. Li, and L. Lin (2026) DDP-wm: disentangled dynamics prediction for efficient world models. arXiv preprint arXiv:2602.01780. Cited by: §II-B.

[^64]: G. Zhou, H. Pan, Y. LeCun, and L. Pinto (2025) DINO-wm: world models on pre-trained visual features enable zero-shot planning. In International Conference on Machine Learning (ICML), Cited by: §II-B.