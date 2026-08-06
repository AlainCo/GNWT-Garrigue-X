---
title: "Active Inference with Dynamic Planning and Information Gain in Continuous Space by Inferring Low-Dimensional Latent States"
source: "https://pmc.ncbi.nlm.nih.gov/articles/PMC12385978/"
author:
  - "[[Takazumi Matsumoto]]"
  - "[[Kentaro Fujii]]"
  - "[[Shingo Murata]]"
  - "[[Jun Tani]]"
published:
created: 2026-08-06
description: "Active inference offers a unified framework in which agents can exhibit both goal-directed and epistemic behaviors. However, implementing policy search in high-dimensional continuous action spaces presents challenges in terms of scalability and ..."
tags:
  - "clippings"
---
. 2025 Aug 9;27(8):846. doi: [10.3390/e27080846](https://doi.org/10.3390/e27080846)

[Takazumi Matsumoto](https://pubmed.ncbi.nlm.nih.gov/?term=%22Matsumoto%20T%22[Author]) <sup>1,</sup><sup>†</sup>, [Kentaro Fujii](https://pubmed.ncbi.nlm.nih.gov/?term=%22Fujii%20K%22[Author]) <sup>2,</sup><sup>†</sup>, [Shingo Murata](https://pubmed.ncbi.nlm.nih.gov/?term=%22Murata%20S%22[Author]) <sup>2,</sup><sup>*</sup>, [Jun Tani](https://pubmed.ncbi.nlm.nih.gov/?term=%22Tani%20J%22[Author]) <sup>1</sup>

Editor: Ivilin Stoianov

PMCID: PMC12385978 PMID: [40870318](https://pubmed.ncbi.nlm.nih.gov/40870318/)

## Abstract

Active inference offers a unified framework in which agents can exhibit both goal-directed and epistemic behaviors. However, implementing policy search in high-dimensional continuous action spaces presents challenges in terms of scalability and stability. Our previously proposed model, T-GLean, addressed this issue by enabling efficient goal-directed planning through low-dimensional latent space search, further reduced by conditioning on prior habituated behavior. However, the lack of an epistemic term in minimizing expected free energy limited the agent’s ability to engage in information-seeking behavior that can be critical for attaining preferred outcomes. In this study, we present EFE-GLean, an extended version of T-GLean that overcomes this limitation by integrating epistemic value into the planning process. EFE-GLean generates goal-directed policies by inferring low-dimensional future posterior trajectories while maximizing expected information gain. Simulation experiments using an extended T-maze task—implemented in both discrete and continuous domains—demonstrate that the agent can successfully achieve its goals by exploiting hidden environmental information. Furthermore, we show that the agent is capable of adapting to abrupt environmental changes by dynamically revising plans through simultaneous minimization of past variational free energy and future expected free energy. Finally, analytical evaluations detail the underlying mechanisms and computational properties of the model.

**Keywords:** free-energy principle, active inference, information gain, goal-directed action planning, curiosity-driven exploration

## 1\. Introduction

Active inference (AIF), rooted in the free-energy principle (FEP) \[[^1]\], is a theory of cognition that provides a unified framework for agent perception and action \[[^2],[^3]\]. An active inference agent selects actions that minimize expected free energy (EFE); when the agent has a prior preferred outcome, searching for the lowest EFE naturally selects actions that change the world state toward the preferred outcome. In most studies, AIF has been applied in discrete action spaces as a Markov decision process; however, in this study we focus on a partially observable continuous action space.

Our previous work proposed a novel approach to active inference for goal-directed planning \[[^4],[^5]\], wherein goal-directed plan search in a continuous action space can be performed efficiently by inferring low-dimensional latent variables. This contrasts with recent related studies that formulate AIF in a continuous space with a policy search scheme \[[^6],[^7]\].

The internal predictive model learns to predict proprioceptive–exteroceptive sequences by which habituated behaviors are generated. Note that the predictive model does not predict motor sequences directly but predicts proprioceptive sequences for generating movement trajectories by using a simple inverse model. Such habituated behaviors are internally represented with prior probability distributions over latent variables in a generative model. Following inference, a goal-directed action plan can then be generated using the predictive posterior distribution, under the constraint of prior preferences or goals.

This makes the search space significantly smaller, as habituation naturally constrains the possible behavior space, i.e., goal-directed planning avoids searching a large space of unfamiliar trajectories. However, a disadvantage of this approach is that the hidden states are under-explored, whereas typical AIF approaches employ an epistemic term (information gain) to generate curiosity-driven exploration \[[^8],[^9]\].

In this study we propose EFE-GLean, an extension to our previous T-GLean model that enables the agent to explore for hidden information in the environment, allowing it to reliably achieve goals by leveraging information gain while still searching for plans in the lower-dimensional latent space. Details of our proposed model are given in [Section 3](#sec3-entropy-27-00846).

Our proposed model is evaluated in [Section 4](#sec4-entropy-27-00846) in a series of simulation experiments within a T-maze with colored floors, following \[[^3]\], under both discrete and continuous action domains. Our experiments demonstrate that our agent is able to (i) generate efficient goal-directed behavior by exploring hidden states in the environment, and (ii) rapidly adapt to sudden environmental changes by error regression.

## 2\. Related Work

The free-energy principle proposed the concept of variational free energy (VFE, also known as evidence free energy $F_{e}$) as an objective function for the brain, where neural dynamics perform variational inference balancing the accuracy of its predictions of observations *x* (evidence) and deviation between the posterior *q* and prior *p* beliefs over hidden states *z* \[[^1]\]. Active inference incorporates the concept of action as a means of reducing VFE \[[^2],[^10]\]. Free-energy minimization has been explored extensively in the literature, and we describe our own approach, based on \[[^5]\], in [Section 3](#sec3-entropy-27-00846).

| $$ \begin{aligned} F_{e} \left(x\right) & = E_{q} \left[ln q \left(z\right) - ln p \left(x , z\right)\right] \\ = \underset{⏟____⏟____⏟}{\underset{⏟____⏟____⏟}{D_{K L} \left[q \left(z\right) \left\|\right\| p \left(z \left\|\right. x\right)\right]}} - \underset{⏟__⏟__⏟}{\underset{⏟__⏟__⏟}{E_{q} \left[ln p \left(x\right)\right]}} \end{aligned} $$ | (1) |
| --- | --- |

Expected free energy (EFE) extends the temporal domain into the future \[[^2],[^11]\] by estimating the free energy of the agent after executing the actions in a given policy $\pi$. A key challenge is thus how can we find an optimal policy (or plan) that has the lowest EFE.

EFE contains two contrasting objectives: goal-directed planning and curiosity-driven exploration. For the former, the agent can generate future actions and predicted observations, and if the agent has a preferred observation, then by maximizing the extrinsic value it is possible to search for plans that have actions that result in that preferred observation \[[^12],[^13]\]. Epistemic value (also referred to as information gain) quantifies the anticipated uncertainty in a given future state. By maximizing the epistemic value, the agent seeks states of high uncertainty, resulting in curiosity-driven exploration behavior \[[^8],[^9]\].

| $$ \begin{aligned} G \left(\pi\right) & = E_{q \left(x , z \left\|\right. \pi\right)} \left[ln q \left(z \left\|\right. x , \pi\right) - ln p \left(z , x\right)\right] \\ = - \underset{⏟______⏟______⏟}{\underset{⏟______⏟______⏟}{E_{q \left(x \left\|\right. \pi\right)} \left[D_{K L} \left[q \left(z \left\|\right. x , \pi\right) \left\|\right\| p \left(z\right)\right]\right]}} - \underset{⏟___⏟___⏟}{\underset{⏟___⏟___⏟}{E_{q \left(x \left\|\right. \pi\right)} \left[ln p \left(x \left\|\right. C\right)\right]}} \end{aligned} $$ | (2) |
| --- | --- |

While AIF provides a powerful framework for exploration–exploitation agents, in many earlier studies, agents have been limited to a discrete action space. This is sufficient for agents in simple environments such as a grid world \[[^2]\] or any environment that can be discretized into several states \[[^3]\]. While our focus is on continuous state spaces, we will also explore a discrete action space based on the T-maze described in \[[^3]\] in [Section 4](#sec4-entropy-27-00846) for the purpose of examining the essential characteristics of AIF in simpler settings.

When scaling up to a continuous domain, enumeration of all possible policies becomes impractical \[[^9]\]. Many proposals employ deep neural networks for the world model and/or policy generation, which can be trained by reinforcement learning (RL) \[[^6],[^14]\]. Such approaches typically also employ a policy search (roll-out) approach that samples many policies to search for a plan with the lowest EFE \[[^9]\]. While this approach is synergistic with traditional RL implementations, the policy generation and roll-out procedure is computationally expensive, with the number of samples to search for the lowest EFE typically on the order of 100 \[[^15]\].

Several approaches avoid policy roll-out completely by considering the current action as a variable to be optimized by gradient descent \[[^16],[^17],[^18]\] using free-energy minimization. While these approaches are fast enough to be employed as robot controllers (updating at several kHz), they lack the ability for long-horizon planning since they only consider variational free energy in order to predict the next step. This limits their ability to plan around sudden obstacles and consider multi-step actions to reach the goal. We compare the performance of agents performing only variational free-energy minimization in the absence of sample-based evaluation of EFE in [Section 4](#sec4-entropy-27-00846).

A prior work \[[^15]\] utilized a world model \[[^19],[^20]\] and a policy suggester that generates candidate policies from a list of all possible policies. The key contribution of that work was the incorporation of a “preference precision” hyperparameter that allows the experimenter to switch the agent’s behavior between an exploratory and goal-directed mode. This was demonstrated on a physical arm robot attempting to move a colored ball that is obscured by a lid. By adjusting preference precision to a small value, the robot preferred to maximize epistemic value by moving the lid, while a large preference precision value caused a preference for actions that led to matching the preferred observation. In the current work, we leverage a predictive-coding-inspired variational recurrent neural network (PV-RNN) as both a world model and policy generator, and directly estimate the preference precision from future uncertainty.

Our prior work on goal-directed action plan generation, T-GLean \[[^4],[^5]\], focused on efficient search in lower-dimensional latent space by maximizing extrinsic value, provided that sufficient human tutoring for appropriate behaviors is offered. The key advantage of this approach is a significantly smaller search space, with gradient descent in the latent space being sufficient to find an optimal plan. However, omitting the epistemic value from expected free energy removes the intrinsic motivation for self-exploring hidden information, which may be critical for generating optimal action plans.

In this work, we propose EFE-GLean, an extension to T-GLean that incorporates epistemic value and preference precision. Our new approach allows our agent to maximize information gain while maintaining action plan generation in lower-dimensional latent space instead of higher-dimensional policy space. This feature can be an advantage which becomes especially salient for real-world robots that have many degrees of freedom, rendering the action space much larger than the latent space.

## 3\. Methodology

### 3.1. Model Architecture

Our newly proposed model, EFE-GLean, extends T-GLean \[[^4]\] and also employs a PV-RNN architecture \[[^21]\]. [Figure 1](#entropy-27-00846-f001) shows an overview of our agent using EFE-GLean with the three main components that we describe in this section.

![Figure 1](https://cdn.ncbi.nlm.nih.gov/pmc/blobs/31c9/12385978/121f6b23b44e/entropy-27-00846-g001.jpg)

( a ) An overview of our EFE-GLean agent with three main components: (i) error regression (ER), (ii) plan generation, and (iii) sample selection. (i) and (ii) are implemented using a 2 layer PV-RNN, as shown in ( b ) for a single time step t. The and variables are learned during training. The computation of the stochastic latent variable z and deterministic variable d are given in this section. Note that to reduce complexity, in subsequent discussion we consider only a single-layer PV-RNN, without the fully connected output.

(i) Error regression (ER) contains both the operation to update states in the past window and predict future states using the past approximate posterior, while (ii) plan generation infers future posterior distributions. (iii) Sample selection calculates EFE and selects the plan to execute on the agent, after which the approximate posterior of (ii) is updated as the average of all candidate plans.

As previously noted, the error regression and plan generation components are implemented using a PV-RNN. A schematic of the PV-RNN is shown in [Figure 1](#entropy-27-00846-f001) b. In this section we describe the most pertinent parts of the model, followed by our proposed extension for exploratory behavior. Note that although the employed PV-RNN has two layers, we describe the methodology using a single layer for simplicity. As in our previous work \[[^4]\], the framework receives the observation and the goal at each time step *t*. Here, the observation comprises both proprioceptive and exteroceptive observations, but we refer to them collectively unless stated otherwise. In this work, the goal depends only on the environment, not on time step *t*. The framework predicts the observation and the goal on the basis of the deterministic latent state . The outputs and are computed using a linear projection; however, for brevity we will omit discussion of the output layer. The deterministic latent state is inferred from the stochastic latent state , which is computed using the reparameterization trick \[[^22]\]. The formulation for is given in Equation ([3](#FD3-entropy-27-00846)). and are learned connectivity weight matrices, with the bias term omitted for brevity. Similarly, we also omit further discussion of the intermediate hidden state and refer directly to .

|  | (3) |
| --- | --- |

As shown in Equation ([4](#FD4-entropy-27-00846)), the prior distribution over the stochastic latent state at time step *t* is conditioned on the deterministic latent state from the previous step. Again, and are learned connectivity weight matrices.

|  | (4) |
| --- | --- |

In contrast, the approximate posterior is conditioned on the corresponding observation and the goal . More precisely, as shown in Equation ([5](#FD5-entropy-27-00846)), the approximate posterior depends on a learnable variable, the adaptive vector ; by updating according to and , the posterior distribution is effectively conditioned.

|  | (5) |
| --- | --- |

### 3.2. Learning

During learning, we minimize the following evidence free energy in Equation ([6](#FD6-entropy-27-00846)) across the entire sequence length by iteratively updating the approximate posterior and the PV-RNN learnable parameters at each time step *t* for the whole training sequence:

|  | (6) |
| --- | --- |

Here, *w* is a deterministic hyperparameter, called the meta-prior, that controls the degree of regularization. The meta-prior regulates the way of adapting the prior distribution of the random latent variables at every time step in the case of learning with minimization of evidence free energy, as shown in \[[^21]\]. In that previous work, it was shown that learning tended to overfit to training data with a high *w* value and vice-versa with a low *w* value. Therefore, adequate setting of *w* is necessary to achieve successful learning of PV-RNN.

The first term of the evidence free energy is the Kullback–Leibler (KL) divergence between the approximate posterior and the prior over the stochastic latent states *z*. The second term is computed as the squared error—i.e., the difference—between the generated output and the training target. Once these terms are evaluated, gradients of the evidence free energy are propagated backward through time (BPTT) \[[^23]\] from the end of the training sequence to the first time step. After learning, all model parameters are frozen except for the adaptive vectors. By optimizing these adaptive vectors, the agent can adapt to a new environment and generate action plans. Effectively, this is a form of deep active inference in which the recurrent neural network supports inference through the optimization of adaptive vectors. Unlike standard amortized inference—which learns a direct mapping from observations to approximate posteriors—posterior beliefs here are determined solely by the optimized adaptive vectors.

### 3.3. Exploratory and Goal-Directed Action Plan Generation

To realize both exploratory and goal-directed behavior while taking current and past observations into account, we compute free energy in two separate windows—past and future. We first describe the free-energy formulation used in each window. For the past window, we minimize the evidence free energy in the same manner as during the learning phase. Conversely, for the future window, we minimize the EFE, defined below, to generate an action plan:

|  | (7) |
| --- | --- |

Here, denotes the prior-preference distribution, which encodes the preferred goal. The first and second terms correspond to the epistemic and extrinsic terms of the EFE in our proposed framework, respectively. In the original literature \[[^2],[^17]\], the expectation in the following equation is taken with respect to the predictive posterior *q*. In our framework, however, the likelihood and the prior fulfill the same role.

Note that the KL divergences in Equations ([6](#FD6-entropy-27-00846)) and ([7](#FD7-entropy-27-00846)) have opposite signs. This means that during inference—based upon past observations—the agent is trying to minimize the divergence between the approximate and true posterior. Conversely, in the future, the expectation over unobserved outcomes means the agent is trying to maximize the divergence to maximize expected information gain (i.e., epistemic value). We assume the prior preference as a Gaussian with mean equal to the preferred goal, and standard deviation . Accordingly, the second term can be calculated as the squared error between the predicted goal and the preferred goal , scaled with the variance of prior preference. We model both the likelihood and the prior preference as Gaussian distributions; for the likelihood, the variance is fixed at ; for the prior preference, the variance is set to the median absolute deviation computed over the predicted observations , where denotes the mean of all samples. This implementation is based on the idea that if the deviation among predicted observations (uncertainty) decreases, the possible information gain is small, so the agent should emphasize goal-directed behavior.

We next describe how the robot generates an action plan by computing free energy in two separate windows. First, for the past window, spanning steps before the current time step , we minimize the evidence free energy in Equation ([6](#FD6-entropy-27-00846)) online by updating the posterior at each time step in order to fit all the latent variables to the observed sensory sequence ([Figure 2](#entropy-27-00846-f002), top left).

![Figure 2](https://cdn.ncbi.nlm.nih.gov/pmc/blobs/31c9/12385978/019963dc4018/entropy-27-00846-g002.jpg)

Overview of action plan generation. The planning procedure consists of four major steps. When time step indices are omitted from variables in the figure, the horizontal axis shown at the bottom indicates the corresponding time steps. The overlapped networks in the background represent N samples being drawn.

Second, at time , we draw *N* samples of the stochastic latent state from the current approximate posterior. Beginning with each sample, we then generate future prior distributions by repeatedly predicting each sampled deterministic latent state forward, predicting the next prior distribution and latent state at every step up to steps into the future ([Figure 2](#entropy-27-00846-f002), top right). From every predicted state, we generate future observations and goals by sampling from the corresponding likelihood distributions. Instead of sampling from the likelihood distribution, we follow the variational autoencoder approach \[[^22]\] and predict its mean directly. Using the predicted observations, we can compute the log marginal likelihood under the prior-preference distribution.

Third, for the future window, we infer approximate posteriors by updating the adaptive vectors so that the evidence free energy is minimized. The KL divergence term of the evidence free energy in the future window can be computed directly from the approximate posterior and the prior distributions. In contrast, the log-likelihood term cannot be evaluated straightforwardly, because the actual future observations and goals are not available in the future window.

In the EFE formulation, the approximate posterior in the future window is conditioned on the predicted observations and predicted goals , because the epistemic value is computed under an expectation with respect to the prior over latent states and the likelihood. Accordingly, the log-likelihood term of the evidence free energy in the future window is computed by treating the predicted observations and the predicted goals as the targets of the prediction from the approximate posterior ([Figure 2](#entropy-27-00846-f002), bottom left).

Finally, having obtained *N* predictive trajectories—each with its prior, approximate posterior, and marginal likelihood under prior preference—we compute the EFE for every trajectory. We then select the proprioceptive observation at the next step from the trajectory with the lowest EFE as the action at the next time step ([Figure 2](#entropy-27-00846-f002), bottom right). Because the EFE comprises the epistemic term that encourages exploration and the extrinsic term that drives goal-directed behavior, this planning procedure supports both exploratory and goal-directed actions. Importantly, the framework can generate actions without relying on explicit policy candidates, a requirement that is common in conventional active-inference approaches. Moreover, the generated action plans remain consistent with past observations because they are produced from the PV-RNN latent state *z*, which encodes information from past observations. Consequently, the framework can exploit this past information to generate action plans that are effective for both environmental exploration and goal achievement.

## 4\. Experimental Results

In order to evaluate our proposed model, and to demonstrate its performance, we undertook a series of simulation experiments based on a modified T-maze environment, shown in \[[^3]\]. Three experiments were considered, from simpler to more complex, so that the logic and findings of the study could be better understood.

In Experiment 1, we first examined the performance of EFE-GLean in a discrete action space, closely following the original experiment in \[[^3]\]. In this environment, we observed that selecting the policy with the lowest EFE allowed the agent to consistently find the goal, but it also showed how the latent states and resulting policies changed following the EFE.

In Experiment 2, we evaluated the proposed model in a continuous action–sensation domain. In this experiment, the agent was placed in a 2D Cartesian space T-maze. Following the original concept image of the T-maze in Experiment 1, a small area at the end of each of the corridors has colored flooring, and the agent possesses a sensor that can determine the color of the floor underneath it. In this environment, we compared our newly proposed model to our previous model, T-GLean, as well as an agent that acts based on habituation by predicting position and color sensation of the next step while minimizing evidence free energy (habituation-only agent). We observed how maximizing information gain is vital for this task and how the prior-preference variance changed over a long sequence of actions for each agent.

In Experiment 3, we examined how the proposed model can modify its action plan to deal with a dynamically changing world. For this purpose, we extended the T-maze environment to include a randomly placed obstacle at the top edge of the maze which could be sensed by the agent using newly added obstacle sensors. We demonstrated how the action plan can be dynamically changed by adapting the approximate posterior in the past window, as well as in the future window, by simultaneously minimizing the evidence free energy and expected free energy. We also tested the robustness of our model by reducing the past observation window, limiting the contribution of evidence free-energy minimization in plan generation.

The PV-RNN parameters used in the subsequent experiments are noted in [Table 1](#entropy-27-00846-t001). The values of these parameters were selected empirically based on our previous studies \[[^24]\]. In particular, it is crucial to allocate a sufficient number of latent units in the model for learning the world model; however, an excessive number of *z* units leads to poor learning due to a large number of independent random variables. These parameters were unchanged between training and testing. The details of how the PV-RNN was trained for each experiment are given in the respective subsections.

### Table 1.

PV-RNN parameters used for all experiments. and refer to the number of deterministic (*d*) units and probabilistic (*z*) units, respectively. is the time constant of the layer, while *w* refers to the meta-prior, excluding the initial time step, where it is fixed to .

<table><tbody><tr><td colspan="5" align="center" rowspan="1">(a) Experiment 1</td></tr><tr><td align="center" rowspan="1" colspan="1">Layer <em>l</em></td><td align="center" rowspan="1" colspan="1"></td><td align="center" rowspan="1" colspan="1"></td><td align="center" rowspan="1" colspan="1"></td><td align="center" rowspan="1" colspan="1"><em>w</em></td></tr><tr><td align="center" rowspan="1" colspan="1">1</td><td align="center" rowspan="1" colspan="1">10</td><td align="center" rowspan="1" colspan="1">2</td><td align="center" rowspan="1" colspan="1">1</td><td align="center" rowspan="1" colspan="1">0.1</td></tr><tr><td colspan="5" align="center" rowspan="1">(b) Experiment 2 & 3</td></tr><tr><td align="center" rowspan="1" colspan="1">Layer <em>l</em></td><td align="center" rowspan="1" colspan="1"></td><td align="center" rowspan="1" colspan="1"></td><td align="center" rowspan="1" colspan="1"></td><td align="center" rowspan="1" colspan="1"><em>w</em></td></tr><tr><td align="center" rowspan="1" colspan="1">1</td><td align="center" rowspan="1" colspan="1">80</td><td align="center" rowspan="1" colspan="1">6</td><td align="center" rowspan="1" colspan="1">2</td><td align="center" rowspan="1" colspan="1">0.005</td></tr><tr><td align="center" rowspan="1" colspan="1">2</td><td align="center" rowspan="1" colspan="1">20</td><td align="center" rowspan="1" colspan="1">3</td><td align="center" rowspan="1" colspan="1">8</td><td align="center" rowspan="1" colspan="1">0.01</td></tr></tbody></table>

[Open in a new tab](https://pmc.ncbi.nlm.nih.gov/articles/PMC12385978/table/entropy-27-00846-t001/)

### 4.1. Experiment 1

Following the experiment in \[[^3]\], we first undertook an experiment in a discrete action space. As shown in [Figure 3](#entropy-27-00846-f003) a, there are four states that correspond to four possible agent positions in a T-maze: (1) center, (2) bottom, (3) left, and (4) right. This position is encoded as a 4D one-hot vector.

![Figure 3](https://cdn.ncbi.nlm.nih.gov/pmc/blobs/31c9/12385978/475cd9bb1264/entropy-27-00846-g003.jpg)

The discrete T-maze simulation. ( a ) The possible transitions between the four states, with 1 corresponding to the state for staying at the center of the T-maze, and 2, 3, and 4 corresponding to the states for the bottom, left, and right ends of each corridor, respectively. The agent always starts at 1, and cannot leave 3 or 4. ( b ) All valid policies following the aforementioned rules, with the preferred policies shown in bold. ( c ) Possible observations at each position. The observation at state 2 is referred to as the conditioning stimulus (CS), as its color indicates the position of the goal (red color, at either state 3 or 4).

At each of the aforementioned states, a color can be observed. State 1 has a fixed color of white; however, the colors of the remaining states are determined by the color of state 2. State 2 has a 50/50 chance to be either green or blue, and is referred to as the conditioning stimulus (CS). If the CS is blue, then state 3 is red and state 4 is white, and if the CS is green, then the colors of states 3 and 4 are reversed. The observation of the current state is encoded as a 4D one-hot vector of the possible colors: blue, green, red, and white. Note that unlike in \[[^3]\], the relationship between the CS and the position of the red color is deterministic.

Along with each state having a self-connection, state 1 has transitions to states 2, 3, and 4, while state 2 has a transition to state 1. States 3 and 4 are terminal states. Using policies of length 3, 10 valid policies are enumerated, as shown in [Figure 3](#entropy-27-00846-f003) b.

Finally, an additional 2D one-hot vector, indicating whether the position with the red observation has been reached, is provided as an extrinsic goal. Note that \[[^3]\] refers to the red color as the unconditioned stimulus (US); however, we refer to it as the goal, following our previous terminology.

The agent always starts at position 1 (center) and has no information on the location of the goal. From an outside observer’s perspective, it is clear that in order to reach the goal reliably, it is desirable to first visit state 2 and check the CS, since it will reveal information on the position of the goal. We note that there are two policies that fit this description (bolded in [Figure 3](#entropy-27-00846-f003) b), and unlike in our previous work, where the human tutor would provide examples of the preferred behavior, the agent must select the appropriate policy from all possible policies. In this context, a preferred policy is one that first checks the CS and then finds the goal.

To train the PV-RNN, 20 training sequences of length 3 were generated, corresponding to all of the valid policies shown in [Figure 3](#entropy-27-00846-f003) b, repeated once for the goal being in either state 2 or 3. The dimensionality of each sequence, as described above, was 10. The PV-RNN was trained for 500,000 epochs using the Adam optimizer and a learning rate of 0.001. The trained PV-RNN was then tested over 100 trials, with each trial having samples. Each trial was conducted with a different random seed. During testing, inference of both the past approximate posterior and future approximate posterior was performed over 100 iterations per time step, with an increased learning rate of 0.1. After sampling, the policy with the lowest EFE (argmin) was selected. We discuss our policy selection methodology in more detail in [Appendix A](#app1-entropy-27-00846). In the following results, we examine the agent at the initial time step, after it has observed state 1 and before it moves to the next state.

The results of Experiment 1 are summarized in [Table 2](#entropy-27-00846-t002). We observe that the PV-RNN-generated policy samples approximating the training distribution—as noted earlier, only 2 of the 10 possible policies follow the preferred pattern, and only one of them will lead to the goal. However, when selecting the lowest-EFE policy, the preferred policy is selected 100% of the time. Moreover, there is a significant difference in the EFE of policies that match our preferences compared to all other policies. We summarize our analysis of this phenomenon in [Figure 4](#entropy-27-00846-f004).

#### Table 2.

Results for Experiment 1. “Preferred policy selected” refers to the percentage of trials () where one of the preferred policies was selected. “Preferred policy samples” refers to the percentage of all samples ( = 10,000) generated that matched one of our preferred policies. “Avg preferred policy EFE” and “Avg other policy EFE” refer to the mean and standard deviation of the computed expected free energy for the preferred policies and the other policies, respectively.

<table><thead><tr><th align="center" rowspan="1" colspan="1">Preferred Policy Selected</th><th align="center" rowspan="1" colspan="1">Preferred Policy Samples</th><th align="center" rowspan="1" colspan="1">Avg Preferred Policy EFE</th><th align="center" rowspan="1" colspan="1">Avg Other Policy EFE</th></tr></thead><tbody><tr><td align="center" rowspan="1" colspan="1"></td><td align="center" rowspan="1" colspan="1"></td><td align="center" rowspan="1" colspan="1"></td><td align="center" rowspan="1" colspan="1"></td></tr></tbody></table>

[Open in a new tab](https://pmc.ncbi.nlm.nih.gov/articles/PMC12385978/table/entropy-27-00846-t002/)

![Figure 4](https://cdn.ncbi.nlm.nih.gov/pmc/blobs/31c9/12385978/36cb8008e625/entropy-27-00846-g004.jpg)

Visual representation of all sampled policies on the discrete T-maze simulation, at the initial time step. ( a ) A heatmap showing all 100 trials (vertical axis) by 100 candidate policies (horizontal axis), sorted by EFE. The policies that match our preferences are highlighted in red. The leftmost column represents the argmin policy that is selected. ( b – e ) Analysis of four sample policies from trial 100, at varying levels of EFE. The four subplots represent, from top to bottom, agent position, observation, goal reached, and the from the stochastic latent states. The red line indicates the first time step has passed, with two time steps in the future.

[Figure 4](#entropy-27-00846-f004) a depicts a graphical representation of the sample selection process when considering all samples. We observed that the preferred policies (highlighted with red boxes) were largely clustered to the left when policies were sorted by lowest EFE. [Figure 4](#entropy-27-00846-f004) b–e break down a single trial, where we observed that the policies with low EFE matched our preferred policies (visiting the CS and then the goal). As the EFE increases, there are policies that have the agent go directly to states 3 or 4, followed by policies that have the agent not move towards the goal at all. From these results we can surmise that the policies likely to be selected, although uncertain about the goal position due to lack of information, will all go to state 2 to maximize information gain.

Observing the latent state activity, there is a difference between policies where the agent visited the CS ([Figure 4](#entropy-27-00846-f004) b,c) compared to those that did not ([Figure 4](#entropy-27-00846-f004) d,e). This may indicate actional intention. Additionally, in this setting, it appears that the cutoff for preferred policies occurs at an EFE value of approximately 2.0, with more diverse policies at higher EFE values.

### 4.2. Experiment 2

Experiment 1 had a limited state space and time horizon; however, our robots operate in a continuous action space and with a much longer time horizon. To simulate this, in this experiment we expanded the discrete T-maze into a 2D T-maze, with the agent position given in 2D Cartesian coordinates. The perception of the agent remained, as in the previous experiment, a 4D one-hot vector encoding the four possible colors. The goal-reached vector was replaced with a goal-sensation vector, a 4D one-hot vector encoding the color of the final sensation, which in this experiment could be red or white. This teleological representation of the goal follows our previous goal-directed planning approach in T-GLean. In addition, to be consistent with our previous work, we use the term plan when describing the generated sequences of actions. We note that while a policy, in the context of active inference, contains only future actions, as our focus is on how to select future action sequences using EFE, we consider the terms plan and policy interchangeable.

As in the discrete T-maze, the agent always starts in the center of the maze, which in this case is at . From there, it can follow four possible trajectories, with a 50/50 chance of ending at the goal position. The possible trajectories are summarized in [Figure 5](#entropy-27-00846-f005). Note that we have removed the cases where the agent remains idle and does not attempt to reach the goal, since as shown in the previous results those plans are very unlikely to be selected by the agent. In this setting, when considered independently, the probability of the agent checking the CS or finding the goal is 0.5.

![Figure 5](https://cdn.ncbi.nlm.nih.gov/pmc/blobs/31c9/12385978/b658b5095eeb/entropy-27-00846-g005.jpg)

The possible trajectories of the agent in the continuous T-maze. As in the discrete T-maze, the agent starts in the center of the maze. From there it can go directly to one of the possible goal positions (top left or top right), or go down to the conditioning stimulus (CS) before going to a possible goal position. The colored areas represent states 2–4 in the discrete T-maze, with the red area representing the goal and the CS area colored blue or green according to the location of the goal. During training, the agent will experience cases where ( a ) the goal is immediately found, ( b ) the goal is not found, ( c ) the CS is visited and then the goal is subsequently found, and ( d ) the CS is visited and the goal is not found.

The agent’s movements were controlled by a simple proportional controller that received and translated it to agent position, while sensor noise was simulated as a Gaussian distribution on the position, with when the agent was in motion and when stationary. The simulation time interval was set at 0.5. To collect training data, the agent followed a series of waypoints to form trajectories traversing the middle of the corridors, with stops in the center of the colored areas at the ends of the corridors. Due to the aforementioned added noise creating some run-to-run variability, each of the possible trajectories was repeated 10 times, for a total of 80 training trajectories. Each trajectory had a length of 25 time steps and a dimensionality of 10. The PV-RNN was trained for 200,000 epochs, with the optimizer settings being identical to Experiment 1.

In this experiment, we examined the behavior of our agent as it moved through the maze, and compared our current EFE-GLean agent to our previous T-GLean and a “habituation-only” agent described previously. As in Experiment 1, each agent undertook 100 trials with random goal placement, and samples.

[Table 3](#entropy-27-00846-t003) summarizes the results of Experiment 2. We note that the EFE-GLean agent was consistently able to find the goal by first checking the CS, as suggested by the previous experiment, while the two baseline approaches, which did not sample EFE, performed significantly worse. The agent applying VFE minimization (habituation-only) showed a CS rate (chance to check the CS) of approximately that of finding it by chance, which follows the training data distribution. The success rate was higher than in the training data, which suggests that the instances where the agent visited the CS had a higher chance of finding the goal.

#### Table 3.

Results for Experiment 2. The algorithms under test are the proposed EFE-GLean, a habituation-only agent, and our previous T-GLean model. CS rate refers to the proportion of trials in which the agent checked the CS at the bottom of the maze. Success rate is the proportion of trials where the agent successfully found the red goal. The best result is highlighted in bold. The number of trials is .

<table><thead><tr><th align="center" rowspan="1" colspan="1">Algorithm</th><th align="center" rowspan="1" colspan="1">CS Rate</th><th align="center" rowspan="1" colspan="1">Success Rate</th></tr></thead><tbody><tr><td align="center" rowspan="1" colspan="1"><strong>EFE-GLean</strong></td><td align="center" rowspan="1" colspan="1"></td><td align="center" rowspan="1" colspan="1"></td></tr><tr><td align="center" rowspan="1" colspan="1">Habituation-only</td><td align="center" rowspan="1" colspan="1"></td><td align="center" rowspan="1" colspan="1"></td></tr><tr><td align="center" rowspan="1" colspan="1">T-GLean</td><td align="center" rowspan="1" colspan="1"></td><td align="center" rowspan="1" colspan="1"></td></tr></tbody></table>

[Open in a new tab](https://pmc.ncbi.nlm.nih.gov/articles/PMC12385978/table/entropy-27-00846-t003/)

Our previously proposed T-GLean, which does not consider information gain, did not move back to check the CS at all, instead it always attempted to go directly to the goal, resulting in a random chance of it succeeding in finding the goal. This result is not unexpected, since T-GLean expects a human tutor to demonstrate the appropriate behavior—in this case, the human tutor would manipulate the agent to go down to check the CS, then go to the correct goal position. However, in this setting where the training data does not bias the agent’s behavior, T-GLean’s lack of intrinsic motivation for self-exploration led it to constantly generate suboptimal action plans.

To investigate this, we compared two cases of selecting the lowest- and highest-EFE plans in [Figure 6](#entropy-27-00846-f006) and [Figure 7](#entropy-27-00846-f007), respectively. [Figure 6](#entropy-27-00846-f006) follows the progression of the agent from the start of the trial to the end. A video with several examples from Experiments 2 and 3 is available at [https://youtu.be/I\_R2tFh\_OxY](https://youtu.be/I_R2tFh_OxY) (accessed on 19 June 2025). The thick black line in the left subplots indicates the selected plan’s trajectory, while the thick black line in the right subplots shows the selected plan’s EFE at each step over the course of the trial. Note that all other candidate plans’ trajectories and EFEs are overlaid in a light gray for reference. At the initial step, where the agent starts with no information, there was a diverse set of candidate plans. The plan with the lowest EFE was selected, which was a plan that moves the agent back to check the CS. During this phase, where the future uncertainty is high (as seen by a diverse set of trajectories the agent could follow), the agent tends to prefer exploratory behavior, as shown by the preference towards plans that move the agent to the CS.

![Figure 6](https://cdn.ncbi.nlm.nih.gov/pmc/blobs/31c9/12385978/d6a1647a66ce/entropy-27-00846-g006.jpg)

Plan generation during a trial in the continuous T-maze. The sequence ( a – d ) shows how the agent’s plans develop as the trial progresses, with the left subplots showing the agent (represented by a circle) in the T-maze, all candidate trajectories (light gray lines), and the selected trajectory (black line), with an arrow indicating the direction the agent will travel. The right subplots show the EFE over time of all candidate plans, with the selected plan’s EFE over time shown as a thick black line. ( ) Initially, with no information about goal position, there is an even distribution of plans going down, left, and right; selecting the plan with the lowest EFE selects a plan that goes down to the CS. Note that the goal position is still not correct at this point. ( b ) Once the agent receives sensory information at the CS (indicated by the agent changing color), the trajectories all converge on the correct goal position. Note that as the agent approaches the CS, the EFE drops and the agent shifts from curiosity-driven behavior to a stable goal-directed behavior. ( c, ) The agent follows the planned trajectory to the goal, with its past trajectory marked with an orange dashed line.

![Figure 7](https://cdn.ncbi.nlm.nih.gov/pmc/blobs/31c9/12385978/1f474207b681/entropy-27-00846-g007.jpg)

A candidate plan from the same trial as Figure 6 with high EFE (1.7068 compared to 0.8252). This plan has a trajectory that proceeds directly to one of the possible goal areas, which is shorter but suboptimal due to not having any information about the true goal position.

As the agent moves and updates its possible future observations and actions, the ceiling on future information gain naturally declines, corresponding to the decreasing EFE, that reached a minimum as the agent approached the CS. This behavior is in line with the expectation that checking the CS grants the agent all the necessary information to reach the goal, and that further exploration is unnecessary. Once the agent observes the CS, the agent preferentially exhibits exploitative goal-seeking behavior, where all candidate plans are optimized to reach the now-known goal position. We examine the activities of latent variables during the exploration and exploitation periods in a comparative manner in [Appendix B](#app2-entropy-27-00846).

[Figure 7](#entropy-27-00846-f007) shows the plan with the highest EFE, plotted in the same way as [Figure 6](#entropy-27-00846-f006) a. While this plan takes the shortest path directly to a possible goal, such plans tend to have a high EFE and are not preferred by EFE-GLean.

We note that in both [Figure 6](#entropy-27-00846-f006) and [Figure 7](#entropy-27-00846-f007), as the trial continues and the agent moves towards the goal, the EFE appears to slowly rise, which could switch the agent back to exploratory behavior. However, this “bored” behavior is not desirable for our goal-directed agent, as this can cause destabilization of the PV-RNN internal states and potentially unsafe movements of the agent.

As such, as described in [Section 3](#sec3-entropy-27-00846), we computed the prior-preference variance in in order to manage the preference between maximizing epistemic and extrinsic values. To analyze the relationship between prior-preference variance and EFE, we present EFE without prior-preference variance (i.e., ). [Figure 8](#entropy-27-00846-f008) compares the EFE of a given plan without considering prior preference variance to the calculated prior-preference variance. In the condition where the agent is certain of its future, the prior preference is strong and thus the agent prefers to maximize extrinsic value, resulting in stable goal-directed behavior over an extended time horizon.

![Figure 8](https://cdn.ncbi.nlm.nih.gov/pmc/blobs/31c9/12385978/51508364493a/entropy-27-00846-g008.jpg)

A plot showing the EFE for the plan in Figure 6 a. Here, EFE (black solid line) is shown without considering prior-preference variance, which results in the EFE increasing as the trial continues. The prior-preference variance (blue dashed line), which is computed as the median absolute deviation over all candidate plans, is a measure of future uncertainty, with low uncertainty favoring extrinsic value maximization. The uncertainty is highest at the beginning, where the agent has no information on the goal position and has the most possible actions.

The results of this experiment in a longer continuous action space demonstrated that our agent was consistently able to exploit information gain maximization until the goal position became certain, at which point stable goal-directed behavior was exhibited with reduction of the prior-preference variance.

Equivalently, when the goal position became certain, there was an increase in the precision of the prior preferences. This is similar to the simulations of dopamine discharges based upon the precision of posteriors over policies explored in prior work \[[^25]\]. Here, we are using a simpler setup and the adaptive precision has been specified heuristically (as opposed to being optimized with respect to variational free energy). However, the similarity in the dynamics of the implicit precision is interesting.

### 4.3. Experiment 3

Our previous study demonstrated that the T-GLean agent can adjust its plan dynamically when the environment changes, and the current study evaluated this capability of EFE-GLean. This was accomplished through optimization of the adaptive vector (), as demonstrated in [Appendix C](#app3-entropy-27-00846). Experiment 3 tested whether the EFE-GLean agent could prepare action plans in an extended T-maze task when anticipating an obstacle hidden in the environment, and could update the plans adequately when the obstacle was actually sensed.

Following on from Experiment 2, the T-maze environment was extended by adding a randomly placed obstacle along the top wall, outside of the goal areas. The obstacle blocked half of the corridor, requiring the agent to take a detour to avoid collision. In order to detect the obstacle, the agent was equipped with four range sensors placed at 45 degrees to the cardinal directions. These four sensors return a floating point value between 0.0 and 0.7, sufficient to sense its immediate surroundings (the corridor width is 1.0). The obstacle is always outside of the range of the sensors at the initial position of the agent. In addition, the color representation was changed from a one-hot vector to a more realistic RGB representation, with each channel being a floating point value between 0.0 and 1.0. The colors in the environment remained unchanged. The agent position remained represented by a Cartesian coordinate; however, the simulator time interval was reduced to 0.2. In this way, the agent was given additional time steps to sense the obstacle, slow down, and maneuver around it if necessary.

The training data was collected in a similar fashion to Experiment 2, except now with each of the eight possible patterns shown in [Figure 5](#entropy-27-00846-f005) —four training sequences had a randomly placed obstacle along the top edge of the maze and another four sequences had no obstacle—for a total of 64 training sequences. While collecting data, the agent attempts to remain centered in the corridor by maintaining an equal distance based on observations from its range sensors, and slows down when taking the narrow path next to the obstacle. The total number of time steps was extended to 60, with each sequence having a dimensionality of 12. The PV-RNN was otherwise configured and trained as in Experiment 2.

To analyze the robustness of EFE-GLean, we conducted an ablation study where we reduced the past window , which reduces the evidence free energy, as given in Equation ([6](#FD6-entropy-27-00846)). The results are summarized in [Table 4](#entropy-27-00846-t004). When we reduced to half length (30 steps), we observed that while the exploration behavior remained intact, the goal-directed behavior became degraded, as the agent appeared to forget the CS in some cases and select a plan to go to the incorrect goal position.

#### Table 4.

Results for Experiment 3, an ablation study on the past window length. CS rate refers to the proportion of trials in which the agent checked the CS at the bottom of the maze. Success rate is the proportion of trials where the agent successfully found the red goal. The number of trials is .

<table><thead><tr><th align="center" rowspan="1" colspan="1">Algorithm</th><th align="center" rowspan="1" colspan="1">CS Rate</th><th align="center" rowspan="1" colspan="1">Success Rate</th></tr></thead><tbody><tr><td align="center" rowspan="1" colspan="1"><strong>Original EFE-GLean</strong> ()</td><td align="center" rowspan="1" colspan="1"></td><td align="center" rowspan="1" colspan="1"></td></tr><tr><td align="center" rowspan="1" colspan="1">EFE-GLean ()</td><td align="center" rowspan="1" colspan="1"></td><td align="center" rowspan="1" colspan="1"></td></tr><tr><td align="center" rowspan="1" colspan="1">EFE-GLean ()</td><td align="center" rowspan="1" colspan="1"></td><td align="center" rowspan="1" colspan="1"></td></tr></tbody></table>

[Open in a new tab](https://pmc.ncbi.nlm.nih.gov/articles/PMC12385978/table/entropy-27-00846-t004/)

Put simply, the minimization of variational free energy provides posterior beliefs about the current states of the world. These beliefs are then used to evaluate the expected free energy using posterior predictive densities in the future. This means if the agent is uncertain about the current state of affairs—due to a reduction in —it will also be uncertain about the future and the consequences of the different policies it could pursue.

In the extreme case where was limited to a single step, the success rate degraded to below the training baseline, largely due to the agent being no longer able to adequately navigate around obstacles.

In the analysis of the plan trajectories dynamically generated during travels of the original EFE-GLean agent, some interesting behavioral properties were observed (a typical example is shown in [Figure 9](#entropy-27-00846-f009)). In [Figure 9](#entropy-27-00846-f009) a, after checking the CS, the agent generated the shortest path going toward the goal which could collide with the obstacle since it had not yet been detected. However, there was some uncertainty in the trajectories due to the possibility of the obstacle being located at various positions. In [Figure 9](#entropy-27-00846-f009) b, immediately after detecting the obstacle, two plan options, one for taking the shortest path to the goal and the other for detouring around the obstacle, were generated before the convergence of the plan. Finally, in [Figure 9](#entropy-27-00846-f009) c, the plan converged to the one that stably arrives at the goal by detouring around the obstacle.

![Figure 9](https://cdn.ncbi.nlm.nih.gov/pmc/blobs/31c9/12385978/0589e129159b/entropy-27-00846-g009.jpg)

Development of the plan trajectory generated by the original EFE-GLean agent in a trial in the extended continuous T-maze with an obstacle placed in it. The thick black trajectory represents the selected plan with the minimum EFE. The obstacle (gray square) can appear with a uniform distribution along the top wall of the maze. ( a ) after checking the CS at time step 23, ( b ) immediately after detecting the obstacle at time step 31, and ( c ) when passing through the obstacle at time step 44.

These experimental results demonstrate that EFE-GLean retains the ability to rapidly adjust its plan independently of its exploration behavior. As shown in our previous work, this is an important ability when operating robots in the physical world with the potential for sudden environmental changes.

## 5\. Discussion

This study proposed and validated EFE-GLean, a novel extension of the T-GLean model, which integrates epistemic value into low-dimensional active inference planning. Our results demonstrate that incorporating expected information gain enables agents to effectively balance exploration and exploitation within continuous action domains. Through a series of experiments in both discrete and continuous T-maze environments—including settings with dynamically changing obstacles—we showed that EFE-GLean not only achieves goal-directed behavior with high success rates, but also adapts in real time to unexpected environmental changes. This performance is driven by the model’s ability to simultaneously minimize past variational free energy and future expected free energy, facilitating dynamic plan revision based on hidden state exploration. These findings highlight the utility of embedding curiosity-driven mechanisms into compact latent planning architectures, supporting robust and flexible behavior in partially observable and dynamically evolving environments.

A key future direction is to apply EFE-GLean to humanoid robots, such as iCub, with high-dimensional motor spaces. Prior work \[[^15]\] has demonstrated an active inference framework for selecting between goal-directed and exploratory behavior on a Rakuda-2 robot, and other works have demonstrated the feasibility of active inference under noisy, uncertain real-world conditions, performing adaptive reaching and head tracking via predictive body perception models \[[^26],[^27]\]. We hypothesize that by constraining the policy search to a low-dimensional latent space, our method can scale to such complex embodiments without exhaustive exploration of the full motor command space. Future experiments with physical humanoids will help verify the scalability and adaptability of EFE-GLean in real-world, high-dimensional action spaces.

While our current implementation uses random sampling in the latent space to select future trajectories, this approach can be computationally costly and suboptimal in scenarios requiring rapid replanning. An alternative strategy is to apply gradient descent in the latent space, which could enable faster convergence and more sample-efficient optimization. Previous research in active inference controllers has shown that optimization-based approaches can yield robust real-time performance, particularly when using continuous approximations of variational free energy \[[^28]\]. Incorporating such gradient-based techniques may improve the responsiveness of EFE-GLean, especially for continuous control tasks.

As our framework leverages PV-RNN, we have relied on conventional BPTT for learning. However, other biologically plausible approaches that use only local information such as eligibility traces \[[^29],[^30]\] and predictive-coding schemes that converge to BPTT solutions \[[^31]\] offer interesting alternatives to BPTT that could be incorporated into our framework in future work.

Another rich avenue for future exploration is combining EFE-GLean with mechanisms for incremental or developmental learning. Robots that accumulate structured experience over time—adjusting their inference and planning strategies as they mature—may more closely mimic human learning patterns. Architectures like SAGG-RIAC have shown how intrinsic motivation and goal exploration can facilitate efficient learning in high-dimensional sensorimotor spaces \[[^32]\]. Extending EFE-GLean with such adaptive learning dynamics could support long-term skill development and autonomous behavior refinement.

## Appendix A

In this study we used the following deterministic rule (argmin) for policy selection, where is the selected policy.

|  | (A1) |
| --- | --- |

It is typical for the expected free-energy values to be converted into a probability distribution over all policies using the softmax function \[[^6],[^33]\], from which a policy can be sampled as follows, where , the inverse of the softmax temperature.

|  | (A2) |
| --- | --- |

Based on the aforementioned formulation, the probability of the deterministic and stochastic sampling diverging can be given as follows, where is the difference between the minimum EFE and the EFE of the *i* -th policy , given is sorted in ascending order and .

|  | (A3) |
| --- | --- |

Rearranging for , it is apparent that for any given probability of selecting argmin , there is a minimum value of that will result in the given probability value.

|  | (A4) |
| --- | --- |

It follows that as , the distribution collapses to the argmin value. This is observed empirically in [Table A1](#entropy-27-00846-t0A1), which extends Experiment 1 with softmax sampling of conducted with different values of . Three examples are also shown in [Figure A1](#entropy-27-00846-f0A1).

### Table A1.

Comparison of different values of when sampling from . is the probability of selecting the same policy as argmin , while is the probability the selected policy is one of the preferred policies.

<table><thead><tr><th align="center" rowspan="1" colspan="1"></th><th align="center" rowspan="1" colspan="1"></th><th align="center" rowspan="1" colspan="1"></th></tr></thead><tbody><tr><td align="center" rowspan="1" colspan="1">0.1</td><td align="center" rowspan="1" colspan="1">0.03</td><td align="center" rowspan="1" colspan="1">0.21</td></tr><tr><td align="center" rowspan="1" colspan="1">1.0</td><td align="center" rowspan="1" colspan="1">0.18</td><td align="center" rowspan="1" colspan="1">0.83</td></tr><tr><td align="center" rowspan="1" colspan="1">10.0</td><td align="center" rowspan="1" colspan="1">0.43</td><td align="center" rowspan="1" colspan="1">1.0</td></tr><tr><td align="center" rowspan="1" colspan="1">100.0</td><td align="center" rowspan="1" colspan="1">0.74</td><td align="center" rowspan="1" colspan="1">1.0</td></tr><tr><td align="center" rowspan="1" colspan="1"><em>argmin</em></td><td align="center" rowspan="1" colspan="1"><em>1.0</em></td><td align="center" rowspan="1" colspan="1"><em>1.0</em></td></tr></tbody></table>

[Open in a new tab](https://pmc.ncbi.nlm.nih.gov/articles/PMC12385978/table/entropy-27-00846-t0A1/)

![Figure A1](https://cdn.ncbi.nlm.nih.gov/pmc/blobs/31c9/12385978/5f8ec0bf8b1c/entropy-27-00846-g0A1.jpg)

A visual representation of the selected policies. Each row shows the sorted; the red highlighted blocks are preferred policies and the pink filled blocks are the selected policies.

We observed that for a sufficiently high value of , the behavior of sampling and argmin converged. Since the epistemic term of already maximizes information gain, sufficient exploration behavior occurs without additional sampling. Thus, argmin is a stable and computationally efficient approximation of softmax sampling in this case.

## Appendix B

While in Experiment 2 we examined the behavior of the agent as it shifted from an exploration preference to an exploitation preference, here we examined the random latent variables of the PV-RNN, focusing on of the posterior distributions (six in layer 1 and three in layer 2). Note that for clarity, we have selected three random latent variables in layer 1 that showed strong activity.

[Figure A2](#entropy-27-00846-f0A2) shows the agent at the starting position at , where the exploration phase begins. Here, several types of future actions are planned: [Figure A2](#entropy-27-00846-f0A2) a shows a candidate plan where the agent goes right after visiting the CS, and [Figure A2](#entropy-27-00846-f0A2) b shows another candidate plan where the agent goes left after visiting the CS. We observed that the activity of between these two plans is quite different.

![Figure A2](https://cdn.ncbi.nlm.nih.gov/pmc/blobs/31c9/12385978/2f2115a1df52/entropy-27-00846-g0A2.jpg)

Two candidate plans generated at that end in different goal positions. Note that the agent has no information on the true goal position at this time step.

After the agent observes the CS, it enters an exploitation phase, where all future plan trajectories converge to a single trajectory that reaches the true goal position as shown in [Figure A3](#entropy-27-00846-f0A3) a,b. It can be seen that in this phase in both layers is very similar between these two plans. It is also noted that in the past window changes significantly once the CS is perceived, suggesting an update of past beliefs.

![Figure A3](https://cdn.ncbi.nlm.nih.gov/pmc/blobs/31c9/12385978/402fe8944fb5/entropy-27-00846-g0A3.jpg)

The two candidate plans from Figure A2 now at, after the agent observes the CS.

## Appendix C

Optimization of the approximate posterior latent variables (adaptive vector ) is the primary method by which our model generates an action plan, and also how plans are adjusted based on the error between predicted and actual observations. Here, we investigated this aspect by examining how was updated during Experiment 3.

As described in [Section 3](#sec3-entropy-27-00846) and in our previous work, during inference the PV-RNN weight matrices are fixed and the variables are optimized using the evidence free energy (Equation ([6](#FD6-entropy-27-00846))) and expected free energy (Equation ([7](#FD7-entropy-27-00846))) as a loss function. The variables are split into and , which map to the approximate posterior as described in Equations ([3](#FD3-entropy-27-00846)) and ([5](#FD5-entropy-27-00846)); however, for clarity of explanation we will focus only on .

The variables are optimized for 100 iterations for every action the agent takes, with initialized as . As shown in [Figure A4](#entropy-27-00846-f0A4) a, the initial generated action plan is far from optimal, and is in fact not a trajectory that has been trained. However, as the variables are optimized, a more feasible action plan is generated. Note that at the initial step , the agent has no useful information other than the preferred goal . Thus, at this point optimization of occurs by minimization of expected free energy.

When the agent senses the obstacle in its path, as shown in [Figure A5](#entropy-27-00846-f0A5), after a number of optimization iterations the planned trajectory begins to shift to avoid collision with the obstacle. Note that, as seen in [Figure A5](#entropy-27-00846-f0A5) c, the optimization makes significant changes in the past variables, which suggests that the agent is updating its past beliefs regarding the presence of the obstacle.

![Figure A4](https://cdn.ncbi.nlm.nih.gov/pmc/blobs/31c9/12385978/9df220ad8075/entropy-27-00846-g0A4.jpg)

Top: Plots of the agent in the T-maze, with the black line representing the planned trajectory. The agent cannot sense the obstacle in the top right from its current position. Bottom: Plot of, with the X axis representing time steps and the Y axis the value of each of the six variables. ( a ) From the initial value, the generated action plan is far from ideal. The plot of shows a small update has occurred after one iteration. ( b ) After 15 optimization iterations, the variables have shifted and are now generating a more plausible action plan. ( c ) At the final iteration, the generated action plan looks close to optimal (note that the agent does not know where the goal is at this time step).

![Figure A5](https://cdn.ncbi.nlm.nih.gov/pmc/blobs/31c9/12385978/765aefb714d0/entropy-27-00846-g0A5.jpg)

The agent at can now sense the obstacle ahead. ( a ) Initially, the planned trajectory would have the agent collide with the object. Note that the variables have only updated slightly since the initial plan at, as expected in a static environment. ( b ) After 25 optimization iterations, the variables have shifted so the agent can try to take a path that avoids the obstacle; however, this does not appear to be sufficient at this point. ( c ) At the final iteration, the variables have shifted considerably and the agent now plans to detour around the obstacle.

## Author Contributions

Conceptualization, T.M., K.F., S.M. and J.T.; methodology, K.F., T.M., S.M. and J.T.; software, T.M.; validation, K.F., S.M. and J.T.; formal analysis, K.F. and T.M.; investigation, T.M. and J.T.; resources, S.M. and J.T.; data curation, T.M.; writing—original draft preparation, T.M., K.F. and J.T.; writing—review and editing, J.T., S.M., T.M. and K.F.; visualization, T.M. and K.F.; supervision, S.M. and J.T.; project administration, J.T. and S.M.; funding acquisition, J.T. and S.M. All authors have read and agreed to the published version of the manuscript.

## Data Availability Statement

The code and datasets used for the experiments in this study are available at [https://github.com/oist-cnru/EFE-GLean](https://github.com/oist-cnru/EFE-GLean) (accessed on 19 June 2025).

## Conflicts of Interest

The authors declare no conflicts of interest. The funders had no role in the design of the study; in the collection, analyses, or interpretation of data; in the writing of the manuscript; or in the decision to publish the results.

## Funding Statement

J.T. was partially funded by the Japan Society for the Promotion of Science (JSPS) KAKENHI, Transformative Research Area (A): unified theory of prediction and action \[24H02175\], and S.M. by JST PRESTO Grant Number JPMJPR22C9.

## Footnotes

**Disclaimer/Publisher’s Note:** The statements, opinions and data contained in all publications are solely those of the individual author(s) and contributor(s) and not of MDPI and/or the editor(s). MDPI and/or the editor(s) disclaim responsibility for any injury to people or property resulting from any ideas, methods, instructions or products referred to in the content.

## References

## Associated Data

*This section collects any data citations, data availability statements, or supplementary materials included in this article.*

### Data Availability Statement

The code and datasets used for the experiments in this study are available at [https://github.com/oist-cnru/EFE-GLean](https://github.com/oist-cnru/EFE-GLean) (accessed on 19 June 2025).

[^1]: 1.Friston K.J. A theory of cortical responses. Philos. Trans. R. Soc. B Biol. Sci. 2005;360:815–836. doi: 10.1098/rstb.2005.1622. \[[DOI](https://doi.org/10.1098/rstb.2005.1622)\] \[[PMC free article](https://pmc.ncbi.nlm.nih.gov/articles/PMC1569488/)\] \[[PubMed](https://pubmed.ncbi.nlm.nih.gov/15937014/)\] \[[Google Scholar](https://scholar.google.com/scholar_lookup?journal=Philos.%20Trans.%20R.%20Soc.%20B%20Biol.%20Sci.&title=A%20theory%20of%20cortical%20responses&author=K.J.%20Friston&volume=360&publication_year=2005&pages=815-836&pmid=15937014&doi=10.1098/rstb.2005.1622&)\]

[^2]: 2.Friston K., Rigoli F., Ognibene D., Mathys C., Fitzgerald T., Pezzulo G. Active inference and epistemic value. Cogn. Neurosci. 2015;6:187–214. doi: 10.1080/17588928.2015.1020053. \[[DOI](https://doi.org/10.1080/17588928.2015.1020053)\] \[[PubMed](https://pubmed.ncbi.nlm.nih.gov/25689102/)\] \[[Google Scholar](https://scholar.google.com/scholar_lookup?journal=Cogn.%20Neurosci.&title=Active%20inference%20and%20epistemic%20value&author=K.%20Friston&author=F.%20Rigoli&author=D.%20Ognibene&author=C.%20Mathys&author=T.%20Fitzgerald&volume=6&publication_year=2015&pages=187-214&pmid=25689102&doi=10.1080/17588928.2015.1020053&)\]

[^3]: 3.Parr T., Friston K.J. Generalised free energy and active inference. Biol. Cybern. 2019;113:495–512. doi: 10.1007/s00422-019-00805-w. \[[DOI](https://doi.org/10.1007/s00422-019-00805-w)\] \[[PMC free article](https://pmc.ncbi.nlm.nih.gov/articles/PMC6848054/)\] \[[PubMed](https://pubmed.ncbi.nlm.nih.gov/31562544/)\] \[[Google Scholar](https://scholar.google.com/scholar_lookup?journal=Biol.%20Cybern.&title=Generalised%20free%20energy%20and%20active%20inference&author=T.%20Parr&author=K.J.%20Friston&volume=113&publication_year=2019&pages=495-512&pmid=31562544&doi=10.1007/s00422-019-00805-w&)\]

[^4]: 4.Matsumoto T., Ohata W., Benureau F.C.Y., Tani J. Goal-Directed Planning and Goal Understanding by Extended Active Inference: Evaluation through Simulated and Physical Robot Experiments. Entropy. 2022;24:469. doi: 10.3390/e24040469. \[[DOI](https://doi.org/10.3390/e24040469)\] \[[PMC free article](https://pmc.ncbi.nlm.nih.gov/articles/PMC9026632/)\] \[[PubMed](https://pubmed.ncbi.nlm.nih.gov/35455132/)\] \[[Google Scholar](https://scholar.google.com/scholar_lookup?journal=Entropy&title=Goal-Directed%20Planning%20and%20Goal%20Understanding%20by%20Extended%20Active%20Inference:%20Evaluation%20through%20Simulated%20and%20Physical%20Robot%20Experiments&author=T.%20Matsumoto&author=W.%20Ohata&author=F.C.Y.%20Benureau&author=J.%20Tani&volume=24&publication_year=2022&pages=469&pmid=35455132&doi=10.3390/e24040469&)\]

[^5]: 5.Matsumoto T., Ohata W., Tani J. Incremental Learning of Goal-Directed Actions in a Dynamic Environment by a Robot Using Active Inference. Entropy. 2023;25:1506. doi: 10.3390/e25111506. \[[DOI](https://doi.org/10.3390/e25111506)\] \[[PMC free article](https://pmc.ncbi.nlm.nih.gov/articles/PMC10670890/)\] \[[PubMed](https://pubmed.ncbi.nlm.nih.gov/37998198/)\] \[[Google Scholar](https://scholar.google.com/scholar_lookup?journal=Entropy&title=Incremental%20Learning%20of%20Goal-Directed%20Actions%20in%20a%20Dynamic%20Environment%20by%20a%20Robot%20Using%20Active%20Inference&author=T.%20Matsumoto&author=W.%20Ohata&author=J.%20Tani&volume=25&publication_year=2023&pages=1506&pmid=37998198&doi=10.3390/e25111506&)\]

[^6]: 6.Fountas Z., Sajid N., Mediano P.A., Friston K.J. Deep active inference agents using Monte-Carlo methods; Proceedings of the 34th International Conference on Neural Information Processing Systems; Vancouver, BC, Canada. 6–12 December 2020; Nice, France: Curran Associates Inc.; 2020. \[[Google Scholar](https://scholar.google.com/scholar_lookup?journal=Proceedings%20of%20the%2034th%20International%20Conference%20on%20Neural%20Information%20Processing%20Systems&title=Deep%20active%20inference%20agents%20using%20Monte-Carlo%20methods&author=Z.%20Fountas&author=N.%20Sajid&author=P.A.%20Mediano&author=K.J.%20Friston&publication_year=2020&)\]

[^7]: 7.Fedosov N., Voskoboynikov A. Deep Active Inference Agent with Continuous Action Space; Proceedings of the 2023 IEEE Ural-Siberian Conference on Computational Technologies in Cognitive Science, Genomics and Biomedicine (CSGB); Novosibirsk, Russia. 28–30 September 2023; pp. 215–220. \[[Google Scholar](https://scholar.google.com/scholar_lookup?journal=Proceedings%20of%20the%202023%20IEEE%20Ural-Siberian%20Conference%20on%20Computational%20Technologies%20in%20Cognitive%20Science,%20Genomics%20and%20Biomedicine%20\(CSGB\)&title=Deep%20Active%20Inference%20Agent%20with%20Continuous%20Action%20Space&author=N.%20Fedosov&author=A.%20Voskoboynikov&pages=215-220&)\]

[^8]: 8.Sajid N., Costa L.D., Parr T., Friston K. Active Inference, Bayesian Optimal Design, and Expected Utility. In: Cogliati Dezza I., Schulz E., Wu C.M., editors. The Drive for Knowledge: The Science of Human Information Seeking. Cambridge University Press; Cambridge, UK: 2022. pp. 124–146. \[[Google Scholar](https://scholar.google.com/scholar_lookup?title=The%20Drive%20for%20Knowledge:%20The%20Science%20of%20Human%20Information%20Seeking&author=N.%20Sajid&author=L.D.%20Costa&author=T.%20Parr&author=K.%20Friston&publication_year=2022&)\]

[^9]: 9.Champion T., Grześ M., Bonheme L., Bowman H. Deconstructing deep active inference. arXiv. 2023 doi: 10.1162/neco\_a\_01697.2303.01618 \[[DOI](https://doi.org/10.1162/neco_a_01697)\] \[[PubMed](https://pubmed.ncbi.nlm.nih.gov/39141805/)\] \[[Google Scholar](https://scholar.google.com/scholar_lookup?journal=arXiv&title=Deconstructing%20deep%20active%20inference&author=T.%20Champion&author=M.%20Grze%C5%9B&author=L.%20Bonheme&author=H.%20Bowman&publication_year=2023&pmid=39141805&doi=10.1162/neco_a_01697&)\]

[^10]: 10.Friston K., Kilner J., Harrison L. A free energy principle for the brain. J. Physiol. 2006;100:70–87. doi: 10.1016/j.jphysparis.2006.10.001. \[[DOI](https://doi.org/10.1016/j.jphysparis.2006.10.001)\] \[[PubMed](https://pubmed.ncbi.nlm.nih.gov/17097864/)\] \[[Google Scholar](https://scholar.google.com/scholar_lookup?journal=J.%20Physiol.&title=A%20free%20energy%20principle%20for%20the%20brain&author=K.%20Friston&author=J.%20Kilner&author=L.%20Harrison&volume=100&publication_year=2006&pages=70-87&pmid=17097864&doi=10.1016/j.jphysparis.2006.10.001&)\]

[^11]: 11.Millidge B., Tschantz A., Buckley C.L. Whence the Expected Free Energy? Neural Comput. 2021;33:447–482. doi: 10.1162/neco\_a\_01354. \[[DOI](https://doi.org/10.1162/neco_a_01354)\] \[[PubMed](https://pubmed.ncbi.nlm.nih.gov/33400900/)\] \[[Google Scholar](https://scholar.google.com/scholar_lookup?journal=Neural%20Comput.&title=Whence%20the%20Expected%20Free%20Energy?&author=B.%20Millidge&author=A.%20Tschantz&author=C.L.%20Buckley&volume=33&publication_year=2021&pages=447-482&pmid=33400900&doi=10.1162/neco_a_01354&)\]

[^12]: 12.Friston K., Mattout J., Kilner J. Action understanding and active inference. Biol. Cybern. 2011;104:137–160. doi: 10.1007/s00422-011-0424-z. \[[DOI](https://doi.org/10.1007/s00422-011-0424-z)\] \[[PMC free article](https://pmc.ncbi.nlm.nih.gov/articles/PMC3491875/)\] \[[PubMed](https://pubmed.ncbi.nlm.nih.gov/21327826/)\] \[[Google Scholar](https://scholar.google.com/scholar_lookup?journal=Biol.%20Cybern.&title=Action%20understanding%20and%20active%20inference&author=K.%20Friston&author=J.%20Mattout&author=J.%20Kilner&volume=104&publication_year=2011&pages=137-160&pmid=21327826&doi=10.1007/s00422-011-0424-z&)\]

[^13]: 13.Ueltzhöffer K. Deep active inference. Biol. Cybern. 2018;112:547–573. doi: 10.1007/s00422-018-0785-7. \[[DOI](https://doi.org/10.1007/s00422-018-0785-7)\] \[[PubMed](https://pubmed.ncbi.nlm.nih.gov/30350226/)\] \[[Google Scholar](https://scholar.google.com/scholar_lookup?journal=Biol.%20Cybern.&title=Deep%20active%20inference&author=K.%20Ueltzh%C3%B6ffer&volume=112&publication_year=2018&pages=547-573&pmid=30350226&doi=10.1007/s00422-018-0785-7&)\]

[^14]: 14.Yeganeh Y.T., Jafari M., Matta A. Deep Active Inference Agents for Delayed and Long-Horizon Environments. arXiv. 20252505.19867 \[[Google Scholar](https://scholar.google.com/scholar_lookup?journal=arXiv&title=Deep%20Active%20Inference%20Agents%20for%20Delayed%20and%20Long-Horizon%20Environments&author=Y.T.%20Yeganeh&author=M.%20Jafari&author=A.%20Matta&publication_year=2025&)\]

[^15]: 15.Igari K., Fujii K., Haddon-Hill G.W., Murata S. Selection of Exploratory or Goal-Directed Behavior by a Physical Robot Implementing Deep Active Inference; Proceedings of the 5th International Workshop on Active Inference, IWAI 2024; Oxford, UK. 9–11 September 2024; pp. 165–178. \[[Google Scholar](https://scholar.google.com/scholar_lookup?journal=Proceedings%20of%20the%205th%20International%20Workshop%20on%20Active%20Inference,%20IWAI%202024&title=Selection%20of%20Exploratory%20or%20Goal-Directed%20Behavior%20by%20a%20Physical%20Robot%20Implementing%20Deep%20Active%20Inference&author=K.%20Igari&author=K.%20Fujii&author=G.W.%20Haddon-Hill&author=S.%20Murata&pages=165-178&)\]

[^16]: 16.Brown H., Friston K. Free-energy and illusions: The Cornsweet effect. Front. Psychol. 2012;3:43. doi: 10.3389/fpsyg.2012.00043. \[[DOI](https://doi.org/10.3389/fpsyg.2012.00043)\] \[[PMC free article](https://pmc.ncbi.nlm.nih.gov/articles/PMC3289982/)\] \[[PubMed](https://pubmed.ncbi.nlm.nih.gov/22393327/)\] \[[Google Scholar](https://scholar.google.com/scholar_lookup?journal=Front.%20Psychol.&title=Free-energy%20and%20illusions:%20The%20Cornsweet%20effect&author=H.%20Brown&author=K.%20Friston&volume=3&publication_year=2012&pages=43&pmid=22393327&doi=10.3389/fpsyg.2012.00043&)\]

[^17]: 17.Friston K., FitzGerald T., Rigoli F., Schwartenbeck P., Pezzulo G. Active Inference: A Process Theory. Neural Comput. 2017;29:1–49. doi: 10.1162/NECO\_a\_00912. \[[DOI](https://doi.org/10.1162/NECO_a_00912)\] \[[PubMed](https://pubmed.ncbi.nlm.nih.gov/27870614/)\] \[[Google Scholar](https://scholar.google.com/scholar_lookup?journal=Neural%20Comput.&title=Active%20Inference:%20A%20Process%20Theory&author=K.%20Friston&author=T.%20FitzGerald&author=F.%20Rigoli&author=P.%20Schwartenbeck&author=G.%20Pezzulo&volume=29&publication_year=2017&pages=1-49&pmid=27870614&doi=10.1162/NECO_a_00912&)\]

[^18]: 18.Pezzato C., Ferrari R., Corbato C.H. A Novel Adaptive Controller for Robot Manipulators Based on Active Inference. IEEE Robot. Autom. Lett. 2020;5:2973–2980. doi: 10.1109/LRA.2020.2974451. \[[DOI](https://doi.org/10.1109/LRA.2020.2974451)\] \[[Google Scholar](https://scholar.google.com/scholar_lookup?journal=IEEE%20Robot.%20Autom.%20Lett.&title=A%20Novel%20Adaptive%20Controller%20for%20Robot%20Manipulators%20Based%20on%20Active%20Inference&author=C.%20Pezzato&author=R.%20Ferrari&author=C.H.%20Corbato&volume=5&publication_year=2020&pages=2973-2980&doi=10.1109/LRA.2020.2974451&)\]

[^19]: 19.Hafner D., Lillicrap T., Fischer I., Villegas R., Ha D., Lee H., Davidson J. Learning latent dynamics for planning from pixels; Proceedings of the International Conference on Machine Learning, PMLR; Long Beach, CA, USA. 10–15 June 2019; pp. 2555–2565. \[[Google Scholar](https://scholar.google.com/scholar_lookup?journal=Proceedings%20of%20the%20International%20Conference%20on%20Machine%20Learning,%20PMLR&title=Learning%20latent%20dynamics%20for%20planning%20from%20pixels&author=D.%20Hafner&author=T.%20Lillicrap&author=I.%20Fischer&author=R.%20Villegas&author=D.%20Ha&pages=2555-2565&)\]

[^20]: 20.Hafner D., Lillicrap T.P., Norouzi M., Ba J. Mastering Atari with Discrete World Models; Proceedings of the International Conference on Learning Representations; Virtual. 3–7 May 2021; pp. 1–26. \[[Google Scholar](https://scholar.google.com/scholar_lookup?journal=Proceedings%20of%20the%20International%20Conference%20on%20Learning%20Representations&title=Mastering%20Atari%20with%20Discrete%20World%20Models&author=D.%20Hafner&author=T.P.%20Lillicrap&author=M.%20Norouzi&author=J.%20Ba&pages=1-26&)\]

[^21]: 21.Ahmadi A., Tani J. A novel predictive-coding-inspired variational RNN model for online prediction and recognition. Neural Comput. 2019;31:2025–2074. doi: 10.1162/neco\_a\_01228. \[[DOI](https://doi.org/10.1162/neco_a_01228)\] \[[PubMed](https://pubmed.ncbi.nlm.nih.gov/31525309/)\] \[[Google Scholar](https://scholar.google.com/scholar_lookup?journal=Neural%20Comput.&title=A%20novel%20predictive-coding-inspired%20variational%20RNN%20model%20for%20online%20prediction%20and%20recognition&author=A.%20Ahmadi&author=J.%20Tani&volume=31&publication_year=2019&pages=2025-2074&pmid=31525309&doi=10.1162/neco_a_01228&)\]

[^22]: 22.Kingma D.P., Welling M. Auto-Encoding Variational Bayes; Proceedings of the 2nd International Conference on Learning Representations, ICLR 2014; Banff, AB, Canada. 14–16 April 2014. \[[Google Scholar](https://scholar.google.com/scholar_lookup?journal=Proceedings%20of%20the%202nd%20International%20Conference%20on%20Learning%20Representations,%20ICLR%202014&title=Auto-Encoding%20Variational%20Bayes&author=D.P.%20Kingma&author=M.%20Welling&)\]

[^23]: 23.Rumelhart D.E., Hinton G.E., Williams R.J. Parallel Distributed Processing: Explorations in the Microstructure of Cognition, Vol. 1: Foundations. MIT Press; Cambridge, MA, USA: 1986. Learning internal representations by error propagation; pp. 318–362. \[[Google Scholar](https://scholar.google.com/scholar_lookup?title=Parallel%20Distributed%20Processing:%20Explorations%20in%20the%20Microstructure%20of%20Cognition,%20Vol.%201:%20Foundations&author=D.E.%20Rumelhart&author=G.E.%20Hinton&author=R.J.%20Williams&publication_year=1986&)\]

[^24]: 24.Matsumoto T., Tani J. Goal-Directed Planning for Habituated Agents by Active Inference Using a Variational Recurrent Neural Network. Entropy. 2020;22:564. doi: 10.3390/e22050564. \[[DOI](https://doi.org/10.3390/e22050564)\] \[[PMC free article](https://pmc.ncbi.nlm.nih.gov/articles/PMC7517093/)\] \[[PubMed](https://pubmed.ncbi.nlm.nih.gov/33286336/)\] \[[Google Scholar](https://scholar.google.com/scholar_lookup?journal=Entropy&title=Goal-Directed%20Planning%20for%20Habituated%20Agents%20by%20Active%20Inference%20Using%20a%20Variational%20Recurrent%20Neural%20Network&author=T.%20Matsumoto&author=J.%20Tani&volume=22&publication_year=2020&pages=564&pmid=33286336&doi=10.3390/e22050564&)\]

[^25]: 25.Friston K., Schwartenbeck P., FitzGerald T., Moutoussis M., Behrens T., Dolan R.J. The anatomy of choice: Dopamine and decision-making. Philos. Trans. R. Soc. B Biol. Sci. 2014;369:20130481. doi: 10.1098/rstb.2013.0481. \[[DOI](https://doi.org/10.1098/rstb.2013.0481)\] \[[PMC free article](https://pmc.ncbi.nlm.nih.gov/articles/PMC4186234/)\] \[[PubMed](https://pubmed.ncbi.nlm.nih.gov/25267823/)\] \[[Google Scholar](https://scholar.google.com/scholar_lookup?journal=Philos.%20Trans.%20R.%20Soc.%20B%20Biol.%20Sci.&title=The%20anatomy%20of%20choice:%20Dopamine%20and%20decision-making&author=K.%20Friston&author=P.%20Schwartenbeck&author=T.%20FitzGerald&author=M.%20Moutoussis&author=T.%20Behrens&volume=369&publication_year=2014&pages=20130481&pmid=25267823&doi=10.1098/rstb.2013.0481&)\]

[^26]: 26.Oliver G., Lanillos P., Cheng G. Active inference body perception and action for humanoid robots. arXiv. 20191906.03022 \[[Google Scholar](https://scholar.google.com/scholar_lookup?journal=arXiv&title=Active%20inference%20body%20perception%20and%20action%20for%20humanoid%20robots&author=G.%20Oliver&author=P.%20Lanillos&author=G.%20Cheng&publication_year=2019&)\]

[^27]: 27.Oliver G., Lanillos P., Cheng G. An Empirical Study of Active Inference on a Humanoid Robot. IEEE Trans. Cogn. Dev. Syst. 2021;14:462–471. doi: 10.1109/TCDS.2021.3049907. \[[DOI](https://doi.org/10.1109/TCDS.2021.3049907)\] \[[Google Scholar](https://scholar.google.com/scholar_lookup?journal=IEEE%20Trans.%20Cogn.%20Dev.%20Syst.&title=An%20Empirical%20Study%20of%20Active%20Inference%20on%20a%20Humanoid%20Robot&author=G.%20Oliver&author=P.%20Lanillos&author=G.%20Cheng&volume=14&publication_year=2021&pages=462-471&doi=10.1109/TCDS.2021.3049907&)\]

[^28]: 28.Meo C., Lanillos P. Multimodal VAE Active Inference Controller; Proceedings of the 2021 IEEE/RSJ International Conference on Intelligent Robots and Systems (IROS); Prague, Czech Republic. 27 September–1 October 2021; pp. 2693–2699. \[[DOI](https://doi.org/10.1109/IROS51168.2021.9636394)\] \[[Google Scholar](https://scholar.google.com/scholar_lookup?journal=Proceedings%20of%20the%202021%20IEEE/RSJ%20International%20Conference%20on%20Intelligent%20Robots%20and%20Systems%20\(IROS\)&title=Multimodal%20VAE%20Active%20Inference%20Controller&author=C.%20Meo&author=P.%20Lanillos&pages=2693-2699&doi=10.1109/IROS51168.2021.9636394&)\]

[^29]: 29.Bellec G., Scherr F., Hajek E., Salaj D., Legenstein R., Maass W. Biologically inspired alternatives to backpropagation through time for learning in recurrent neural nets. arXiv. 20191901.09049 \[[Google Scholar](https://scholar.google.com/scholar_lookup?journal=arXiv&title=Biologically%20inspired%20alternatives%20to%20backpropagation%20through%20time%20for%20learning%20in%20recurrent%20neural%20nets&author=G.%20Bellec&author=F.%20Scherr&author=E.%20Hajek&author=D.%20Salaj&author=R.%20Legenstein&publication_year=2019&)\]

[^30]: 30.Traub M., Butz M.V., Baayen R.H., Otte S. Learning Precise Spike Timings with Eligibility Traces. In: Farkaš I., Masulli P., Wermter S., editors. Artificial Neural Networks and Machine Learning—ICANN 2020. Volume 12397. Springer; Cham, Switzerland: 2020. pp. 659–669. Lecture Notes in Computer Science. \[[Google Scholar](https://scholar.google.com/scholar_lookup?title=Artificial%20Neural%20Networks%20and%20Machine%20Learning%E2%80%94ICANN%202020&author=M.%20Traub&author=M.V.%20Butz&author=R.H.%20Baayen&author=S.%20Otte&publication_year=2020&)\]

[^31]: 31.Millidge B., Tschantz A., Buckley C.L. Predictive Coding Approximates Backprop Along Arbitrary Computation Graphs. Neural Comput. 2022;34:1329–1368. doi: 10.1162/neco\_a\_01497. \[[DOI](https://doi.org/10.1162/neco_a_01497)\] \[[PubMed](https://pubmed.ncbi.nlm.nih.gov/35534010/)\] \[[Google Scholar](https://scholar.google.com/scholar_lookup?journal=Neural%20Comput.&title=Predictive%20Coding%20Approximates%20Backprop%20Along%20Arbitrary%20Computation%20Graphs&author=B.%20Millidge&author=A.%20Tschantz&author=C.L.%20Buckley&volume=34&publication_year=2022&pages=1329-1368&pmid=35534010&doi=10.1162/neco_a_01497&)\]

[^32]: 32.Baranes A., Oudeyer P.Y. Active learning of inverse models with intrinsically motivated goal exploration in robots. Robot. Auton. Syst. 2013;61:49–73. doi: 10.1016/j.robot.2012.05.008. \[[DOI](https://doi.org/10.1016/j.robot.2012.05.008)\] \[[Google Scholar](https://scholar.google.com/scholar_lookup?journal=Robot.%20Auton.%20Syst.&title=Active%20learning%20of%20inverse%20models%20with%20intrinsically%20motivated%20goal%20exploration%20in%20robots&author=A.%20Baranes&author=P.Y.%20Oudeyer&volume=61&publication_year=2013&pages=49-73&doi=10.1016/j.robot.2012.05.008&)\]

[^33]: 33.Parr T., Friston K.J. Uncertainty, epistemics and active inference. J. R. Soc. Interface. 2017;14 doi: 10.1098/rsif.2017.0376. \[[DOI](https://doi.org/10.1098/rsif.2017.0376)\] \[[PMC free article](https://pmc.ncbi.nlm.nih.gov/articles/PMC5721148/)\] \[[PubMed](https://pubmed.ncbi.nlm.nih.gov/29167370/)\] \[[Google Scholar](https://scholar.google.com/scholar_lookup?journal=J.%20R.%20Soc.%20Interface&title=Uncertainty,%20epistemics%20and%20active%20inference&author=T.%20Parr&author=K.J.%20Friston&volume=14&publication_year=2017&pmid=29167370&doi=10.1098/rsif.2017.0376&)\]