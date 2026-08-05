---
title: "The SIGReg Objective as Variational Free Energy: A Theoretical Active-Inference Account of JEPA World Models"
source: "https://www.alphaxiv.org/overview/2607.13612"
author:
  - "[[Fabio Arnez]]"
  - "[[Alexandra Gomez-Villa]]"
published: 2026-07-15
created: 2026-08-05
description: "Research establishes a theoretical correspondence between Joint-Embedding Predictive Architectures (JEPAs) and Active Inference (AIF), demonstrating that u"
tags:
  - "clippings"
---
## Bridging Active Inference and JEPA World Models

Recent developments in self-supervised learning have led to the rise of Joint-Embedding Predictive Architectures (JEPAs). These models learn by predicting latent representations of observations rather than reconstructing raw data, such as pixels or audio waveforms. Simultaneously, the framework of Active Inference (AIF), rooted in the Free Energy Principle, provides a normative theory for how biological and artificial agents perceive and act by minimizing a quantity known as variational free energy (VFE).

![Architectural diagram showing how a JEPA world model maps to Active Inference components](https://paper-assets.alphaxiv.org/figures-normalized/figures/2607.13612v1/img-0.jpeg "Architectural diagram showing how a JEPA world model maps to Active Inference components") *Figure 1: The correspondence between a JEPA world model and the Active Inference framework. The deterministic encoder $f_{\phi}$ and predictor $P_{\xi}$ are mapped to the components of the variational free energy (VFE), where the SIGReg regularizer ensures a safe estimation of informativeness.*

While both JEPAs and AIF agents structure their learning around a trade-off between model complexity and informativeness, they have largely developed in isolation. This paper establishes a formal theoretical correspondence between these two worlds. It demonstrates that the training objective of a JEPA—specifically when using a particular type of "anti-collapse" regularizer called SIGReg—is mathematically equivalent to minimizing the variational free energy in AIF. This unification provides a normative foundation for JEPA design and identifies specific components of AIF that are currently missing from standard world model architectures.

## The Core Principles of AIF and JEPA

Active Inference posits that agents maintain a generative model of their environment. Learning and perception involve minimizing the VFE, which can be decomposed into a complexity term (the divergence between the agent's beliefs and its prior) and an accuracy term (how well the beliefs explain the observations):

$$
F = D_{KL}[q(Z) \parallel p(Z)] - \mathbb{E}_{q(Z)}[\ln p(X|Z)]
$$

In contrast, a JEPA consists of an encoder $f_{\phi}$ that maps an observation $x_t$ to a latent embedding $z_t$, and a predictor $P_{\xi}$ that models the dynamics in this latent space. Because JEPAs do not reconstruct the input, they face the "collapse" problem: the encoder might learn to map all inputs to a single constant vector, which minimizes prediction error but carries no information. To prevent this, researchers use anti-collapse regularizers like VICReg or SIGReg to ensure the latent space remains informative.

The paper identifies that under a "constant-noise" model—where the encoder is treated as a deterministic function plus a small amount of fixed isotropic noise $Z = f_{\phi}(X) + \epsilon$ —the informativeness of the latent space is determined by its marginal differential entropy $h(Z)$. Specifically, the mutual information between the observation $X$ and the latent $Z$ is:

$$
I(Z; X) = h(Z) - h(Z|X) = h(Z) - C_{\epsilon}
$$

where $C_{\epsilon}$ is a constant. Thus, maximizing informativeness in a JEPA is equivalent to maximizing the entropy of its latent representations.

## The Entropy-Estimator Hierarchy and the Prior-Miscalibration Gap

A major challenge in high-dimensional latent spaces is that the true entropy $h(Z)$ is intractable to compute directly. This forces JEPAs to use proxies or estimators. The paper introduces the concept of the "prior-miscalibration gap," denoted as $\Delta_{\hat{H}}(Z) = h(Z) - \hat{H}(Z)$, which measures the error between the true entropy and the proxy $\hat{H}(Z)$.

The authors decompose this gap for covariance-based estimators into three sources:

1. **Gap I (Non-Gaussianity):** The error introduced by assuming the distribution is Gaussian when it is not.
2. **Gap II (Off-diagonal):** The error introduced by assuming the dimensions are independent (diagonal covariance) when they are correlated.
3. **Gap III (Estimation error):** The error from using a finite sample to estimate the statistics.

This decomposition allows for a classification of popular non-contrastive regularizers. VICReg, for instance, maximizes an upper bound on entropy. The paper argues that this is "unsafe" because an optimizer can minimize the training objective by increasing the "slack" in the upper bound rather than increasing the actual entropy of the latents. This failure to guarantee true informativeness can violate the fundamental AIF surprise bound, which ensures that the free energy remains an upper bound on the agent's "surprise" ($F \geq -\ln p(x)$).

![A comparison of entropy estimators on a linear scale, showing how SIGReg collapses the gaps](https://paper-assets.alphaxiv.org/figures-normalized/figures/2607.13612v1/img-1.jpeg "A comparison of entropy estimators on a linear scale, showing how SIGReg collapses the gaps") *Figure 2: The hierarchy of entropy estimators. While VICReg and LogDet provide unsafe upper bounds, SIGReg enforces a specific distribution to eliminate the miscalibration gaps.*

## The SIGReg Correspondence

The paper focuses on SIGReg (Sketched Isotropic Gaussian Regularisation) as the key to a perfect correspondence. Unlike other regularizers that simply estimate entropy, SIGReg *enforces* the latent distribution to be an isotropic Gaussian. By leveraging the Cramér–Wold theorem and random projections, SIGReg ensures that the embeddings match a target distribution in every direction.

When SIGReg successfully enforces this distribution, the prior-miscalibration gap vanishes. The paper proves that under these conditions, the JEPA objective becomes an exact instance of AIF variational free energy:

$$
\mathcal{L}_{JEPA} = \mathcal{L}_{pred} + \lambda \mathcal{R}_{anti-collapse} \approx F_+
$$

where $F_+$ is the Information Bottleneck form of free energy. This result is significant because it means that JEPAs using SIGReg are not just biologically inspired; they are performing the exact normative computation prescribed by the Free Energy Principle.

Furthermore, the paper highlights a "dual tightening" effect. SIGReg's enforcement of isotropy not only makes the entropy estimation exact but also makes the common approximation of using Mean Squared Error (MSE) as a proxy for KL-divergence (the "Gaussian bridge") exact. In models like VICReg, anisotropy in the latent space introduces an irreducible error of $O(\delta^2)$ in the prediction objective, which SIGReg eliminates.

![Table classifying regularizers by their covariance structure and shape enforcement](https://paper-assets.alphaxiv.org/figures-normalized/figures/2607.13612v1/img-3.jpeg "Table classifying regularizers by their covariance structure and shape enforcement") *Figure 3: Categorization of non-contrastive regularizers. SIGReg is distinguished as the only method that achieves an exact correspondence by enforcing a specific distributional shape.*

## Multi-Step Planning and the Missing Epistemic Drive

The theoretical correspondence is extended from single-step learning to multi-step planning. In AIF, agents select actions by minimizing the Expected Free Energy (EFE), denoted as $G_{\pi}$, for a future policy $\pi$. The EFE can be broken down into terms like pragmatic value (reaching goals), epistemic value (reducing uncertainty), and ambiguity.

The authors map these AIF terms to the costs used in JEPA planning (e.g., in Model Predictive Control). They find that:

- **Pragmatic Value:** Corresponds exactly to the squared Euclidean distance to a latent goal in the SIGReg-regularized space.
- **Parameter Information Gain:** Corresponds to the variance in an ensemble of predictors, a common signal for "curiosity" or "uncertainty-weighted" planning in JEPAs.
- **Ambiguity:** Maps to the constant noise level $C_{\epsilon}$ of the observation model.

However, the decomposition reveals a critical gap: the **state-epistemic value**. In AIF, this term drives agents to visit states that they haven't visited often, effectively encouraging "coverage" or exploration of the state space. The paper notes that this specific signal—maximizing the entropy of future latent states—is currently absent from standard JEPA world models. This finding points toward a specific architectural improvement for future JEPAs: adding a term to reward future-state entropy to achieve more robust exploration.

![Mapping of Expected Free Energy terms to JEPA planning components](https://paper-assets.alphaxiv.org/figures-normalized/figures/2607.13612v1/img-2.jpeg "Mapping of Expected Free Energy terms to JEPA planning components") *Figure 4: The correspondence between AIF planning terms and JEPA costs. The analysis identifies the state-epistemic value as a missing component in current JEPA implementations.*

## Verification and Empirical Predictions

To ensure the mathematical soundness of these claims, the authors performed machine verification of the core algebraic proofs using the Lean 4 theorem prover. This provides a high level of confidence in the identities and inequalities that form the basis of the SIGReg–AIF correspondence.

Beyond theory, the paper translates these findings into five testable empirical predictions that differentiate SIGReg from VICReg:

1. **Isotropy:** SIGReg will maintain a latent covariance matrix with a condition number closer to 1.
2. **Surprise Bound:** SIGReg will provide a more reliable bound on the true surprise (negative log-likelihood) of observations.
3. **Planning Calibration:** The latent distances in a SIGReg model will correlate more linearly with the actual success probability of a plan.
4. **Goal Discrimination:** SIGReg models will be less likely to confuse distinct goal states due to the elimination of anisotropic "collapsing" directions.
5. **Multi-step Stability:** Planning costs will remain more stable over longer horizons in SIGReg models due to the removal of the $O(\delta^2)$ anisotropy error.

## Conclusion

This research provides a rigorous theoretical bridge between the empirical success of JEPAs and the normative principles of Active Inference. By showing that the SIGReg objective is a valid variational free energy, the authors provide a justification for why certain architectural choices work and how they can be improved. The identification of the missing state-epistemic drive offers a clear roadmap for developing JEPAs that can explore their environments as effectively as the agents described by the Free Energy Principle. By unifying these fields, the work encourages a cross-pollination where AIF provides the "why" (the normative goal) and JEPA provides the "how" (the scalable, high-dimensional implementation).

[LeJEPA: Provable and scalable self-supervised learning without the heuristics](https://www.alphaxiv.org/abs/2511.08544)

This paper introduces Sketched Isotropic Gaussian Regularisation (SIGReg), which is the central technique analyzed in the main paper. The core thesis is that the SIGReg objective, unlike other regularisers, provides an exact correspondence to the Active Inference variational free energy, making this citation foundational to the entire argument.

Randall Balestriero and Yann LeCun. LeJEPA: Provable and scalable self-supervised learning without the heuristics. arXiv preprint arXiv:2511.08544, 2025.

[VICReg: Variance-invariance-covariance regularization for self-supervised learning](https://www.alphaxiv.org/abs/2105.04906)

This work introduces VICReg, the primary anti-collapse regulariser that the main paper uses as a point of comparison against SIGReg. The paper's analysis frames VICReg as an 'unsafe' upper bound on latent entropy, making it the key counterpoint that highlights the theoretical advantages of SIGReg.

Adrien Bardes, Jean Ponce, and Yann LeCun. VICReg: Variance-invariance-covariance regularization for self-supervised learning. In International Conference on Learning Representations (ICLR), 2022.

The free-energy principle: A unified brain theory?

This is the seminal paper on the Free Energy Principle, the basis for the Active Inference (AIF) framework. The main paper's entire contribution is to provide a theoretical AIF account of JEPA world models, so this citation establishes the normative principle being used for the analysis and interpretation.

Karl Friston. The free-energy principle: A unified brain theory? Nature Reviews Neuroscience, 11 (2):127–138, 2010.

[Caveats for information bottleneck in deterministic scenarios](https://www.alphaxiv.org/abs/1808.07593)

This paper introduces the 'constant-noise encoder' model, which is a critical theoretical assumption (Fact 2) for the main paper's entire analysis. This model resolves the issue of degenerate mutual information in deterministic encoders like those used in JEPAs, thereby making the information-theoretic arguments of the paper tractable.

Artemy Kolchinsky, Brendan D. Tracey, and Steven Van Kuyk. Caveats for information bottleneck in deterministic scenarios. In International Conference on Learning Representations (ICLR), 2019.

[An information-theoretic perspective on variance-invariance-covariance regularization](https://www.alphaxiv.org/abs/2303.00633)

This paper provides the crucial analytical lens used in the main paper by recasting VICReg's regularisation terms as a Gaussian entropy estimator. This information-theoretic interpretation is the direct precursor to the main paper's 'entropy-estimator hierarchy' and its analysis of the prior-miscalibration gap.

Ravid Shwartz-Ziv, Randall Balestriero, Kenji Kawaguchi, Tim G. J. Rudner, and Yann LeCun. An information-theoretic perspective on variance-invariance-covariance regularization. In Advances in Neural Information Processing Systems (NeurIPS), volume 36, pages 33965–33998, 2023.