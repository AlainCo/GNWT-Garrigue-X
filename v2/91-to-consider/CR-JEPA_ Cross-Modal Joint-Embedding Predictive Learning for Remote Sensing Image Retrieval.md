---
title: "CR-JEPA: Cross-Modal Joint-Embedding Predictive Learning for Remote Sensing Image Retrieval"
source: "https://arxiv.org/html/2606.00706v1"
author:
published:
created: 2026-08-05
description:
tags:
  - "clippings"
---
Md Aminur Hossainmd.aminurhossain@gmail.com1 Ayush V. Patelayu020503@gmail.com2 Nitant Dubenitant@sac.isro.gov.in1 Biplab Banerjeegetbiplab@gmail.com2 Space Applications Centre,  
Indian Space Research Organisation,  
Ahmedabad, India Centre of Studies in Resources Engineering,  
Indian Institute of Technology Bombay,  
Mumbai, India CR-JEPA: Cross-Modal Remote Sensing Image Retrieval

###### Abstract

Cross-modal remote sensing image retrieval aims to retrieve semantically related scenes across heterogeneous sensing modalities. This remains challenging because paired observations may differ substantially in imaging physics, spatial resolution, spectral configuration, and visual appearance. Moreover, a single retrieval projection trained with one objective may be insufficient to jointly support cross-modal semantic alignment and same-modal neighbourhood preservation. We propose CR-JEPA, a Cross-modal Retrieval Joint-Embedding Predictive Architecture for dual-modality remote sensing retrieval. The model uses modality-specific stems, a shared transformer trunk, and JEPA-style predictive objectives to estimate masked latent target features within and across modalities. Inspired by LeJEPA, we apply Sketched Isotropic Gaussian Regularization to raw retrieval projections to stabilize embeddings and mitigate collapse. CR-JEPA further employs a decoupled-head design with a unified retrieval head for same-modal retrieval and a cross-modal retrieval head for cross-modal search. We evaluate CR-JEPA on BEN-14K, CBRSIR\_VS, and DSRSID. On BEN-14K, CR-JEPA improves S1 $\rightarrow$ S2 retrieval from 61.23% to 75.82% and S2 $\rightarrow$ S1 retrieval from 63.73% to 75.40% over X-JEPA, while also achieving competitive same-modal retrieval with fewer parameters.

## 1 Introduction

The scale of Earth observation (EO) archives has grown rapidly, leading to a greater need for efficient retrieval systems that can find semantically related scenes within large collections \[zhou2023rsir, tong2022survey\]. Remote sensing image retrieval (RSIR) allows for exploring archives, performing case-based analysis, transferring weak annotations, monitoring, and searching when a fixed classifier is not available or is too limiting \[li2021rsbigsurvey, zhou2023rsir\]. Relying on metadata-based indexing alone often does not work well. Remote sensing archives include various sensor types, complex scene semantics, large variations within classes, and multi-label land-cover content \[tong2022survey, chaudhuri2018multilabelgraph\].

Cross-modal remote sensing retrieval is more challenging than conventional unimodal retrieval, since the query and gallery images may come from different sensing modalities \[sumbul2022sscmir, choudhury2026xjepa\]. Often these modalities describe the same scene by different physical processes. Optical imagery captures spectral reflectance, colour and visual texture, while synthetic aperture radar (SAR) imagery captures surface structure, roughness and backscatter properties \[fuller2023croma, sumbul2022sscmir\]. The panchromatic and multispectral images also have different spatial and spectral resolution, which causes another modality gap in cross-source retrieval \[li2018sidhcnn\]. Thus, paired observations may be geographically or semantically related but visually very different. This modality gap means direct feature comparison is unreliable and needs representations that can align cross-modal semantics while keeping useful same-modal neighbourhood structure \[choudhury2026xjepa, hackstein2025csmae\].

Existing self-supervised approaches have yet to fully resolve this problem. Contrastive cross-modal methods successfully align paired views, but their performance can be sensitive to false negatives, batch composition, and the construction of reliable positive pairs \[sumbul2022sscmir\]. As a scalable alternative, masked modeling bypasses some of these issues, but often at the cost of wasting model capacity on reconstructing low-level, modality-specific signals. Since retrieval relies heavily on semantic similarity rather than pixel-level fidelity, this reconstruction bottleneck is far from ideal \[hackstein2025csmae, fuller2023croma\]. Joint-Embedding Predictive Architectures (JEPAs) elegantly sidestep this issue by predicting latent target representations instead of raw pixels \[assran2023ijepa\]. Recent remote sensing variants, such as REJEPA and X-JEPA, highlight the effectiveness of feature-space prediction for retrieval \[choudhury2025rejepa, choudhury2026xjepa\]. However, there is still significant room to improve how these frameworks learn across heterogeneous modality pairs. Specifically, existing models struggle when required to support both cross-modal semantic alignment and same-modal neighbourhood preservation at the same time.

To address this limitation, we propose CR-JEPA, a Cross-modal Retrieval Joint-Embedding Predictive Architecture for heterogeneous dual-modality remote sensing retrieval. CR-JEPA combines modality-specific stems, a shared transformer trunk, same-modal and cross-modal latent predictive learning, and SIGReg-based Gaussian embedding regularization inspired by LeJEPA \[balestriero2025lejepa\]. The model further uses a compact decoupled-head design with a unified retrieval head for same-modal retrieval and a cross-modal retrieval head for cross-modal search. The main contributions of this work are as follows:

- We propose CR-JEPA, a cross-modal joint-embedding predictive learning framework for heterogeneous dual-modality remote sensing image retrieval.
- We design a modality-adaptive architecture that combines modality-specific stems, a shared transformer trunk, and a compact decoupled-head design to separate low-level sensor adaptation, high-level semantic reasoning, and retrieval-space learning.
- We formulate same-modal and cross-modal latent predictive objectives together with SIGReg-based Gaussian embedding regularization to improve representation stability, mitigate collapse, and learn semantically aligned retrieval embeddings.
- We evaluate CR-JEPA on three dual-modality benchmarks: BEN-14K, CBRSIR\_VS, and DSRSID, covering Sentinel-1/Sentinel-2, optical/SAR, and panchromatic/multispectral retrieval settings under both same-modal and cross-modal retrieval protocols.

## 2 Related Work

### 2.1 Remote Sensing Image Retrieval

Remote sensing image retrieval (RSIR) has progressed from handcrafted descriptors and graph-based matching to deep representation learning systems. Recent surveys show that deep models have substantially improved retrieval from large-scale remote sensing archives \[sudha2019review, li2021rsbigsurvey, tong2022survey\]. However, RSIR remains challenging because remote sensing images contain diverse sensor characteristics, complex scene semantics, large intra-class variation, and multi-label land-cover content \[zhou2023rsir\]. Multi-label retrieval is especially important in Earth observation, since a single image patch often contains multiple land-cover categories. Prior studies have explored semi-supervised graph-based retrieval, dense labels, and fully convolutional representations for multi-label RSIR \[chaudhuri2018multilabelgraph, shao2018dlrsd, shao2020fcnrsir\]. Protocol-oriented studies further show that single-label benchmarks can become saturated and that multi-label retrieval requires suitable ranking metrics and evaluation protocols \[imbriaco2022multilabel\].

### 2.2 Cross-Modal Remote Sensing Retrieval

Cross-modal remote sensing retrieval aims to retrieve semantically related scenes across heterogeneous sensing modalities. This setting includes modality pairs such as optical/SAR and panchromatic/multispectral, where low-level appearance may differ substantially even when the scene semantics are similar. Early supervised approaches, such as CMIR-Net, demonstrated the feasibility of cross-modal remote sensing retrieval, but relied on labeled paired data to learn semantic alignment \[chaudhuri2020cmirnet\]. Source-invariant hashing methods, such as SIDHCNN, further addressed cross-source retrieval involving high-resolution optical, panchromatic, and multispectral imagery \[li2018sidhcnn\]. Semantic-preserving hashing methods, such as MsEspH, extended this direction to multisensor optical/SAR retrieval with explicit semantic preservation \[sun2022msesph\]. Knowledge-distillation-based cross-source retrieval has also been explored to improve modality-invariant representation learning, including discriminative distillation networks and ensemble distillation frameworks \[xiong2020discriminative, ma2021crosssource\].

Beyond hashing-based methods, several approaches have explored stronger cross-modal alignment mechanisms. Unified attention networks have been used to enhance modality interaction for remote sensing retrieval \[choudhury2024uan\], while hypergraph neural networks model higher-order relationships among multimodal samples \[yu2023hgnlsf\]. Robust correlation learning and contrastive prototype alignment have also been studied to reduce modality discrepancy between query and gallery representations \[wang2024hac, h2026xclpa\]. Recent correlation-aware contrastive methods further exploit spatiotemporal context for cross-modal remote sensing retrieval \[zhu2024ccls2t\]. Recent work has also investigated frequency-guided distillation and generative pre-alignment for lightweight or cross-domain remote sensing retrieval \[xu2026frequency, huang2025otpfcnet\]. SS-CMIR uses contrastive learning to align cross-modal representations without dense manual annotations \[sumbul2022sscmir\]. Recent multimodal pretraining frameworks further broaden Earth observation representation learning, including CROMA \[fuller2023croma\], DeCUR \[wang2024decur\], and large-scale foundation models such as SkySense, AnySat, and CSMoE \[guo2024skysense, astruc2025anysat, hackel2025csmoe\]. Large-scale multimodal datasets and semantically grounded pretraining resources, including SSL4EO-S12 and GeoMeld, also support scalable multimodal learning for Earth observation \[wang2023ssl4eo, hasan2026geomeld\].

### 2.3 Self-Supervised Retrieval and Predictive Representation Learning

Masked image modeling has become a strong paradigm for remote sensing representation learning. SatMAE, ScaleMAE, and SatMAE++ adapt masked autoencoding to temporal, multispectral, and multi-scale satellite imagery \[cong2022satmae, reed2023scalemae, noman2024satmaepp\]. CSMAE is particularly relevant to retrieval because it studies masked autoencoding for sensor-agnostic image retrieval under both unimodal and cross-modal settings \[hackstein2025csmae\]. However, reconstruction-based objectives primarily optimize pixel or signal recovery, which can emphasize modality-specific low-level details rather than modality-common semantics needed for retrieval.

Joint-Embedding Predictive Architectures (JEPAs) provide an alternative by predicting target representations directly in latent space instead of reconstructing pixels \[assran2023ijepa\]. Recent studies also highlight the shift from pure alignment objectives toward prediction-based self-supervised learning \[dutta2026alignmentprediction\]. In remote sensing, REJEPA applies JEPA principles to unimodal image retrieval \[choudhury2025rejepa\], while X-JEPA extends predictive learning to cross-modal retrieval using target-modality embedding prediction and prediction-space alignment \[choudhury2026xjepa\]. Building on these works, CR-JEPA combines same-modal and cross-modal latent prediction with SIGReg regularization and decoupled retrieval heads for same-modal and cross-modal retrieval.

### 2.4 Latent-Euclidean JEPA and SIGReg

A central challenge in joint-embedding predictive learning is avoiding collapse while maintaining useful embedding geometry. Existing self-supervised methods use negative samples, stop-gradient learning, teacher-student networks, whitening, or variance-covariance regularization to prevent degenerate solutions \[bardes2021vicreg, assran2023ijepa\]. LeJEPA provides a Latent-Euclidean perspective by encouraging embeddings to follow an isotropic Gaussian distribution and introduces Sketched Isotropic Gaussian Regularization (SIGReg) as an efficient projection-based distribution matching objective \[balestriero2025lejepa\]. Inspired by this idea, CR-JEPA applies SIGReg to raw retrieval projections before $\ell_{2}$ normalization, encouraging stable retrieval embeddings for heterogeneous dual-modality remote sensing retrieval.

## 3 Proposed Methodology

### 3.1 Problem Formulation

We consider a paired dual-modality remote sensing retrieval setting. Let

$$
\mathcal{D}=\{(x_{i}^{(a)},x_{i}^{(b)},y_{i})\}_{i=1}^{N}
$$

denote a dataset of $N$ paired observations, where $x_{i}^{(a)}$ and $x_{i}^{(b)}$ are two modality views of the same scene or a semantically corresponding sample, and $y_{i}$ denotes the semantic label annotation. The two modalities depend on the dataset: BEN-14K uses Sentinel-1 and Sentinel-2 imagery, CBRSIR\_VS uses optical and SAR imagery, and DSRSID uses panchromatic and multispectral imagery. Thus, the proposed formulation is not restricted to a single sensor pair, but applies to heterogeneous dual-modality remote sensing retrieval.

The retrieval task is evaluated in four directions:

$$
a\rightarrow a,\qquad b\rightarrow b,\qquad a\rightarrow b,\qquad b\rightarrow a.
$$

The first two relate to same-modal retrieval, while the last two relate to cross-modal retrieval. For BEN-14K, relevance is based on the overlap of multiple labels between the query and gallery samples. For CBRSIR\_VS and DSRSID, where each image pair fits into one semantic class, relevance is based on single-label class equality. The goal is to learn embeddings that support both cross-modal semantic alignment and same-modal neighbourhood preservation.

### 3.2 Architecture Overview

CR-JEPA is a cross-modal retrieval joint-embedding predictive learning framework. As illustrated in Figure 1, it is built around three design principles: modality-specific adaptation, shared semantic reasoning, and retrieval-space specialization. Given an input pair $(x^{(a)},x^{(b)})$, each modality is first processed by its own stem to handle differences in channel configuration, spatial resolution, and low-level sensor statistics. The resulting token sequences are then passed through a shared transformer trunk, which learns modality-common semantic representations. Predictive heads learn latent feature forecasting within and across modalities, while retrieval heads learn compact embedding spaces for alignment and retrieval.

![Refer to caption](https://arxiv.org/html/2606.00706v1/images/RSIR.png)

Figure 1: Overview of CR-JEPA. Each modality is first processed by a modality-specific stem and then passed through a shared transformer trunk. Same-modal and cross-modal predictive branches learn masked latent target prediction in feature space. A unified retrieval head supports same-modal retrieval, while a cross-modal retrieval head supports cross-modal search. SIGReg regularizes the raw retrieval projections.

Let $f_{a}$ and $f_{b}$ denote the modality-specific stems, and let $g$ denote the shared transformer trunk. For a modality $m\in\{a,b\}$, the stem converts the input into a sequence of patch tokens:

$$
h^{(m)}=f_{m}(x^{(m)}),
$$

where $h^{(m)}\in\mathbb{R}^{T\times D}$, $T$ is the number of tokens, and $D$ is the embedding dimension. The shared trunk maps the modality-specific tokens into a common semantic processing space:

$$
z^{(m)}=g(h^{(m)}).
$$

Unlike a fully shared encoder, the modality-specific stems allow the model to adapt to sensor-dependent low-level characteristics. Unlike fully separate encoders, the shared trunk encourages semantic coupling across modalities.

### 3.4 Same-Modal and Cross-Modal Predictive Learning

The predictive objective follows a JEPA-style masked-token protocol in latent space, as illustrated in Figure 2(a). For each modality $m\in\{a,b\}$, token indices are split into visible indices $V^{(m)}$ and masked indices $M^{(m)}$ using a random masking strategy with a fixed mask ratio. The visible tokens are used as context, while the masked tokens provide latent prediction targets:

$$
z_{V}^{(m)}=g\!\left(f_{m}(x^{(m)};V^{(m)})\right),\qquad z_{M}^{(m)}=g\!\left(f_{m}(x^{(m)};M^{(m)})\right),
$$

where $f_{m}(x^{(m)};I)$ denotes stem tokenization followed by selection of the token subset indexed by $I$. The model predicts masked target tokens directly in feature space; no pixel reconstruction branch is used.

![Refer to caption](https://arxiv.org/html/2606.00706v1/images/predictor_retrieval.png)

Figure 2: Predictive and retrieval components of CR-JEPA. (a) Query-based predictor for masked latent target prediction; (b) retrieval head producing raw projections for SIGReg and normalized embeddings for retrieval.

The model includes two same-modal predictors and one shared cross-modal predictor. The same-modal predictors estimate masked target tokens within the same modality:

$$
\hat{z}^{(a\rightarrow a)}_{M}=P_{aa}(z_{V}^{(a)},p_{M}^{(a)}),\qquad\hat{z}^{(b\rightarrow b)}_{M}=P_{bb}(z_{V}^{(b)},p_{M}^{(b)}),
$$

where $p_{M}^{(m)}$ denotes the positional embeddings of the masked target locations for modality $m$. The shared cross-modal predictor estimates masked target tokens of one modality from the visible context tokens of the other modality:

$$
\hat{z}^{(a\rightarrow b)}_{M}=P_{\mathrm{cross}}(z_{V}^{(a)},p_{M}^{(b)}),\qquad\hat{z}^{(b\rightarrow a)}_{M}=P_{\mathrm{cross}}(z_{V}^{(b)},p_{M}^{(a)}).
$$

Each predictor is implemented using learnable mask queries, target-position embeddings, self-attention, cross-attention to the visible context tokens, and an MLP block. The same-modal predictors encourage within-modality feature forecasting, while the cross-modal predictor encourages semantic prediction across modalities.

The predictive loss is defined as

$$
\displaystyle\mathcal{L}_{\mathrm{pred}}=
$$
 
$$
\displaystyle\lambda_{aa}\left\|\hat{z}^{(a\rightarrow a)}_{M}-z^{(a)}_{M}\right\|_{2}^{2}+\lambda_{bb}\left\|\hat{z}^{(b\rightarrow b)}_{M}-z^{(b)}_{M}\right\|_{2}^{2}
$$
 
$$
\displaystyle+\lambda_{ab}\left\|\hat{z}^{(a\rightarrow b)}_{M}-z^{(b)}_{M}\right\|_{2}^{2}+\lambda_{ba}\left\|\hat{z}^{(b\rightarrow a)}_{M}-z^{(a)}_{M}\right\|_{2}^{2}.
$$

This objective encourages the model to learn both within-modality predictive structure and cross-modal semantic correspondence without reconstructing raw sensor measurements.

### 3.5 Decoupled Retrieval Heads

A central design choice in CR-JEPA is to avoid relying on a single retrieval projection for all retrieval behaviours. Same-modal retrieval requires preserving class-consistent neighbourhoods within each modality, whereas cross-modal retrieval requires aligning semantically corresponding samples across heterogeneous modalities. As illustrated in Figure 2(b), we therefore use a compact decoupled-head design with two complementary retrieval heads: i) a unified retrieval head $\phi_{\mathrm{uni}}$ for same-modal retrieval, and ii) a cross-modal retrieval head $\phi_{\mathrm{cross}}$ for cross-modal retrieval.

The visible token sequence is mean-pooled before projection:

$$
\bar{z}^{(m)}=\frac{1}{|V^{(m)}|}\sum_{t\in V^{(m)}}z^{(m)}_{V,t},
$$

where $m\in\{a,b\}$ denotes the modality. Each retrieval head produces a raw projection $r$ and an $\ell_{2}$ -normalized embedding $e$:

$$
r_{\mathrm{uni}}^{(m)},e_{\mathrm{uni}}^{(m)}=\phi_{\mathrm{uni}}(\bar{z}^{(m)}),
$$
 
$$
r_{\mathrm{cross}}^{(m)},e_{\mathrm{cross}}^{(m)}=\phi_{\mathrm{cross}}(\bar{z}^{(m)}).
$$

The unified head is used for same-modal retrieval, where query and gallery samples belong to the same modality. The cross-modal retrieval head is used for cross-modal search, where query and gallery samples come from different modalities. This separation allows CR-JEPA to preserve within-modality neighbourhood structure while learning a dedicated cross-modal embedding space for heterogeneous retrieval.

### 3.6 SIGReg-Based Embedding Regularization

To stabilize the learned retrieval embeddings, CR-JEPA incorporates Sketched Isotropic Gaussian Regularization (SIGReg), inspired by LeJEPA \[balestriero2025lejepa\]. SIGReg encourages the distribution of learned embeddings to approach an isotropic Gaussian distribution, helping mitigate representation collapse and improve latent-space conditioning. We apply SIGReg to the raw pre-normalized retrieval projections from the cross-modal retrieval head and the unified retrieval head:

$$
r_{\mathrm{cross}}^{(a)},\quad r_{\mathrm{cross}}^{(b)},\quad r_{\mathrm{uni}}^{(a)},\quad r_{\mathrm{uni}}^{(b)}.
$$

Given a mini-batch of raw projections $R\in\mathbb{R}^{B\times D}$, SIGReg samples $J$ random unit projection directions $\{u_{j}\}_{j=1}^{J}$ and computes one-dimensional projections

$$
s_{ij}=R_{i}^{\top}u_{j}.
$$

It then matches the empirical characteristic function of these projected samples to the characteristic function of a standard Gaussian,

$$
\phi(t_{k})=\exp(-t_{k}^{2}/2),
$$

over frequency points $\{t_{k}\}_{k=1}^{K}$. The loss is

$$
\mathcal{L}_{\mathrm{sigreg}}(R)=\frac{B}{J}\sum_{j=1}^{J}\sum_{k=1}^{K}\omega_{k}\left[\left(\frac{1}{B}\sum_{i=1}^{B}\cos(t_{k}s_{ij})-\phi(t_{k})\right)^{2}+\left(\frac{1}{B}\sum_{i=1}^{B}\sin(t_{k}s_{ij})\right)^{2}\right],
$$

where $\omega_{k}$ denotes the numerical integration weight. In our implementation, $t_{k}$ is uniformly sampled in $[0,3]$, and $\omega_{k}$ follows a trapezoidal quadrature weight multiplied by $\phi(t_{k})$. The final SIGReg term is applied to the raw retrieval projections as

$$
\mathcal{L}_{\mathrm{sigreg}}=\frac{1}{4}\Big[\mathcal{L}_{\mathrm{sigreg}}(r_{\mathrm{cross}}^{(a)})+\mathcal{L}_{\mathrm{sigreg}}(r_{\mathrm{cross}}^{(b)})+\mathcal{L}_{\mathrm{sigreg}}(r_{\mathrm{uni}}^{(a)})+\mathcal{L}_{\mathrm{sigreg}}(r_{\mathrm{uni}}^{(b)})\Big].
$$

This regularization complements the predictive and retrieval losses by encouraging a stable, non-degenerate distribution of retrieval embeddings.

### 3.7 Training Objective

The training objective combines latent predictive learning, cross-modal retrieval learning, unified-space alignment, and SIGReg-based embedding regularization. Let $\mathrm{NCE}(Q,K)$ denote a symmetric batchwise InfoNCE loss between two sets of normalized embeddings.

The cross-modal retrieval loss is applied to the cross-modal retrieval head:

$$
\mathcal{L}_{\mathrm{cross}}=\mathrm{NCE}(e_{\mathrm{cross}}^{(a)},e_{\mathrm{cross}}^{(b)}).
$$

This loss encourages paired observations from the two modalities to become semantically aligned in the cross-modal retrieval space used for $a\rightarrow b$ and $b\rightarrow a$ search.

The unified-space alignment loss is applied to the unified head, which is used for same-modal retrieval at inference time. It combines cross-modal InfoNCE with direct cosine alignment:

$$
\mathcal{L}_{\mathrm{uni}}=\mathrm{NCE}(e_{\mathrm{uni}}^{(a)},e_{\mathrm{uni}}^{(b)})+\frac{1}{B}\sum_{i=1}^{B}\left(1-\cos(e_{\mathrm{uni},i}^{(a)},e_{\mathrm{uni},i}^{(b)})\right),
$$

where $B$ is the mini-batch size. Although this loss is computed using paired cross-modal samples, the resulting unified embeddings are used for same-modal retrieval, where they help preserve semantically consistent neighbourhoods within each modality.

The weighted retrieval objective is therefore

$$
\mathcal{L}_{\mathrm{retr}}=\lambda_{\mathrm{cross}}\mathcal{L}_{\mathrm{cross}}+\lambda_{\mathrm{uni}}\mathcal{L}_{\mathrm{uni}}.
$$

The final training objective is

$$
\mathcal{L}=\mathcal{L}_{\mathrm{pred}}+\mathcal{L}_{\mathrm{retr}}+\lambda_{\mathrm{sigreg}}\mathcal{L}_{\mathrm{sigreg}}.
$$

This objective jointly optimizes feature-space prediction, cross-modal retrieval alignment, unified embedding learning, and embedding distribution regularity.

### 3.8 Inference Protocol

At inference time, each image is encoded by its corresponding modality-specific stem and the shared transformer trunk. The pooled representation is then projected using the retrieval head associated with the retrieval direction.

For same-modal retrieval, CR-JEPA uses the unified retrieval embedding:

$$
a\rightarrow a,\qquad b\rightarrow b\quad\text{use}\quad e_{\mathrm{uni}}.
$$

For cross-modal retrieval, CR-JEPA uses the cross-modal retrieval embedding:

$$
a\rightarrow b,\qquad b\rightarrow a\quad\text{use}\quad e_{\mathrm{cross}}.
$$

Nearest-neighbour retrieval is performed using cosine similarity between normalized embeddings. For same-modal retrieval, trivial self-matches are excluded when the query and gallery contain the same indexed sample.

## 4 Experimental Setup

### 4.1 Datasets

We evaluate CR-JEPA on three dual-modality remote sensing retrieval benchmarks covering Sentinel-1/Sentinel-2, optical/SAR, and panchromatic/multispectral retrieval. Detailed dataset descriptions are provided in the supplementary material.

BEN-14K. BEN-14K is derived from BigEarthNet-MM and contains paired Sentinel-1 SAR and Sentinel-2 multispectral observations with multi-label land-cover annotations \[sumbul2021bigearthnetmm, bigearthnet\]. Following prior sensor-agnostic retrieval protocols, we use BEN-14K to evaluate same-modal and cross-modal retrieval under multi-label relevance \[hackstein2025csmae, choudhury2026xjepa\].

CBRSIR\_VS. CBRSIR\_VS is an optical/SAR dual-modality dataset for cross-modal remote sensing retrieval \[sun2022msesph\]. It contains 26,901 paired RGB optical and SAR images from 10 semantic classes. In our protocol, the two modalities are RGB optical and SAR.

DSRSID. DSRSID is a dual-source panchromatic/multispectral dataset for cross-source remote sensing retrieval \[li2018sidhcnn\]. It contains 80,000 paired samples from eight scene classes. In our protocol, the two modalities are panchromatic and multispectral images.

### 4.2 Evaluation Metrics

We evaluate retrieval in four directions: $a\rightarrow a$, $b\rightarrow b$, $a\rightarrow b$, and $b\rightarrow a$, covering both same-modal and cross-modal retrieval. Trivial self-matches are excluded in same-modal retrieval. For BEN-14K, relevance is based on multi-label overlap, and we report F1@5 following prior protocols \[hackstein2025csmae, choudhury2026xjepa\]. For CBRSIR\_VS and DSRSID, relevance is based on single-label class equality, and we report global mAP and P@5. Detailed metric definitions are provided in the supplementary material.

### 4.3 Implementation Details

All images are resized to $224\times 224$ before tokenization. We use a patch size of $16$, embedding dimension $512$, $8$ attention heads, predictor depth $6$, retrieval dimension $256$, mask ratio $0.5$, and shared transformer trunk depth $12$. Each modality is processed by its own modality-specific stem, allowing the model to handle different channel configurations across datasets. For BEN-14K, Sentinel-1 uses two channels and Sentinel-2 uses 12 channels. For CBRSIR\_VS, the optical branch uses RGB images and the SAR branch uses the SAR intensity image. For DSRSID, the panchromatic branch uses one channel and the multispectral branch uses four channels.

Training uses AdamW \[loshchilov2017adamw\] with learning rates scheduled from $10^{-4}$ to $10^{-3}$ and then to $10^{-6}$, weight decay $0.04$, gradient clipping at $1.0$, cosine scheduling with $15$ warmup epochs, and automatic mixed precision. Unless otherwise stated, models are trained for $400$ epochs with batch size $512$ and evaluated with batch size $256$ on NVIDIA A100 80 GB GPUs. The full objective combines same-modal and cross-modal predictive losses, cross-modal retrieval loss, unified retrieval loss, and SIGReg regularization.

### 4.4 Baselines

We compare CR-JEPA with representative self-supervised, multimodal, and JEPA-based remote sensing retrieval baselines. For BEN-14K, we use published benchmark results when the evaluation protocol is consistent with our setting. For CBRSIR\_VS and DSRSID, we evaluate adapted REJEPA and X-JEPA implementations under the same preprocessing, training, and evaluation protocol as CR-JEPA.

For BEN-14K, we compare with MAE \[he2022mae\], MAE-RVSA, SatMAE \[cong2022satmae\], SatMAE++ \[noman2024satmaepp\], ScaleMAE \[reed2023scalemae\], CrossMAE \[tang2023crossscale\], CSMAE-SESD \[hackstein2025csmae\], SkySense \[guo2024skysense\], CROMA \[fuller2023croma\], DeCUR \[wang2024decur\], SS-CMIR \[sumbul2022sscmir\], REJEPA \[choudhury2025rejepa\], and X-JEPA \[choudhury2026xjepa\]. This benchmark enables direct comparison with recent JEPA-style retrieval methods because REJEPA and X-JEPA report results on BEN-14K.

For CBRSIR\_VS and DSRSID, publicly reported results from recent self-supervised retrieval methods are not available under a consistent evaluation protocol. Therefore, we evaluate REJEPA \[choudhury2025rejepa\] and X-JEPA \[choudhury2026xjepa\] using adapted implementations under the same preprocessing, training, and evaluation protocol as CR-JEPA. Since the original REJEPA and X-JEPA papers do not report results on these datasets, we use the same splits, input resolution, retrieval directions, and evaluation metrics for a controlled comparison.

## 5 Results and Analysis

### 5.1 Main Results on BEN-14K

Table 1 reports the main F1@5 comparison on BEN-14K. The published baseline values follow the benchmark layout used in X-JEPA, allowing CR-JEPA to be compared under the same four-direction retrieval protocol. The results show that CR-JEPA is particularly effective in cross-modal retrieval. Compared with X-JEPA, CR-JEPA improves S1 $\rightarrow$ S2 from 61.23 to 75.82 and S2 $\rightarrow$ S1 from 63.73 to 75.40. This corresponds to absolute gains of 14.59 and 11.67 F1@5 points, respectively, establishing the best performance among the compared methods in cross-modal retrieval on BEN-14K.

In same-modal retrieval, CR-JEPA also achieves strong performance. For S1 $\rightarrow$ S1 retrieval, it improves over X-JEPA from 72.98 to 75.11, yielding a gain of 2.13 F1@5 points. In S2 $\rightarrow$ S2 retrieval, CR-JEPA attains 82.87, slightly surpassing X-JEPA (82.65) and achieving the best overall performance among all compared methods. Overall, these results indicate that CR-JEPA not only significantly enhances cross-modal semantic alignment but also maintains, and in some cases improves, same-modal neighbourhood preservation within a more parameter-efficient architecture.

<table><thead><tr><th rowspan="2">Method</th><th rowspan="2">Params (M)</th><th colspan="2">Same-modal F1@5 (%)</th><th colspan="2">Cross-modal F1@5 (%)</th></tr><tr><th>S1 <math><semantics><mo>→</mo> <annotation>\rightarrow</annotation></semantics></math> S1</th><th>S2 <math><semantics><mo>→</mo> <annotation>\rightarrow</annotation></semantics></math> S2</th><th>S1 <math><semantics><mo>→</mo> <annotation>\rightarrow</annotation></semantics></math> S2</th><th>S2 <math><semantics><mo>→</mo> <annotation>\rightarrow</annotation></semantics></math> S1</th></tr></thead><tbody><tr><th>MAE</th><td>224.87</td><td>60.81</td><td>72.04</td><td>41.78</td><td>46.12</td></tr><tr><th>MAE-RVSA</th><td>227.75</td><td>55.40</td><td>71.47</td><td>36.66</td><td>38.05</td></tr><tr><th>SatMAE</th><td>329.40</td><td>70.86</td><td>78.71</td><td>49.57</td><td>52.48</td></tr><tr><th>SatMAE++</th><td>329.14</td><td>67.29</td><td>76.48</td><td>50.21</td><td>54.98</td></tr><tr><th>ScaleMAE</th><td>284.35</td><td>62.73</td><td>–</td><td>–</td><td>–</td></tr><tr><th>CrossMAE</th><td>250.57</td><td>66.45</td><td>71.28</td><td>49.46</td><td>48.71</td></tr><tr><th>CSMAE-SESD (Disjoint)</th><td>210.64</td><td>70.62</td><td>39.01</td><td>38.74</td><td>38.42</td></tr><tr><th>SkySense</th><td>398.04</td><td>69.87</td><td>73.42</td><td>50.26</td><td>52.11</td></tr><tr><th>CROMA</th><td>310.54</td><td>68.48</td><td>72.71</td><td>46.53</td><td>48.61</td></tr><tr><th>DeCUR</th><td>250.54</td><td>71.26</td><td>75.36</td><td>40.78</td><td>41.83</td></tr><tr><th>REJEPA</th><td>197.09</td><td>76.38</td><td>75.42</td><td>55.46</td><td>56.32</td></tr><tr><th>X-JEPA</th><td>172.86</td><td>72.98</td><td>82.65</td><td>61.23</td><td>63.73</td></tr><tr><th>CR-JEPA</th><td>117.93</td><td>75.11</td><td>82.87</td><td>75.82</td><td>75.40</td></tr></tbody></table>

Table 1: Main BEN-14K retrieval results following the X-JEPA benchmark protocol. The reported metric is F1@5. Best and second-best results are shown in bold and underlined, respectively.

#### Computational Cost.

On BEN-14K, CR-JEPA requires approximately 9.6 GFLOPs per image with an average inference time of 17 ms, compared with X-JEPA at 10.8 GFLOPs and 20 ms. Inference time is reported as average per-image latency measured on an NVIDIA A100 80 GB GPU using $224\times 224$ inputs, batch size $256$, and automatic mixed precision. The shared transformer trunk and lightweight predictive heads enable improved cross-modal alignment without adding substantial computational overhead, showing that CR-JEPA improves retrieval accuracy while remaining computationally efficient.

### 5.2 Main Results on CBRSIR\_VS and DSRSID

Table 2 reports retrieval performance under single-label relevance on two cross-modal remote sensing benchmarks. For CBRSIR\_VS, we evaluate RGB $\rightarrow$ RGB, SAR $\rightarrow$ SAR, RGB $\rightarrow$ SAR, and SAR $\rightarrow$ RGB retrieval. For DSRSID, we evaluate PAN $\rightarrow$ PAN, MS $\rightarrow$ MS, PAN $\rightarrow$ MS, and MS $\rightarrow$ PAN retrieval. We report global mAP and P@5.

<table><thead><tr><th>Dataset</th><th>Method</th><th colspan="2">RGB <math><semantics><mo>→</mo> <annotation>\rightarrow</annotation></semantics></math> RGB</th><th colspan="2">SAR <math><semantics><mo>→</mo> <annotation>\rightarrow</annotation></semantics></math> SAR</th><th colspan="2">RGB <math><semantics><mo>→</mo> <annotation>\rightarrow</annotation></semantics></math> SAR</th><th colspan="2">SAR <math><semantics><mo>→</mo> <annotation>\rightarrow</annotation></semantics></math> RGB</th></tr><tr><th></th><th></th><th>mAP</th><th>P@5</th><th>mAP</th><th>P@5</th><th>mAP</th><th>P@5</th><th>mAP</th><th>P@5</th></tr></thead><tbody><tr><th rowspan="3">CBRSIR_VS</th><th>REJEPA</th><td>75.74</td><td>81.45</td><td>63.21</td><td>67.92</td><td>66.88</td><td>70.88</td><td>64.95</td><td>70.73</td></tr><tr><th>X-JEPA</th><td>79.12</td><td>85.19</td><td>67.34</td><td>70.78</td><td>70.11</td><td>74.41</td><td>67.87</td><td>73.41</td></tr><tr><th>CR-JEPA</th><td>86.94</td><td>90.94</td><td>71.88</td><td>76.21</td><td>72.62</td><td>78.11</td><td>73.55</td><td>78.41</td></tr><tr><th>Dataset</th><th>Method</th><th colspan="2">PAN <math><semantics><mo>→</mo> <annotation>\rightarrow</annotation></semantics></math> PAN</th><th colspan="2">MS <math><semantics><mo>→</mo> <annotation>\rightarrow</annotation></semantics></math> MS</th><th colspan="2">PAN <math><semantics><mo>→</mo> <annotation>\rightarrow</annotation></semantics></math> MS</th><th colspan="2">MS <math><semantics><mo>→</mo> <annotation>\rightarrow</annotation></semantics></math> PAN</th></tr><tr><th></th><th></th><th>mAP</th><th>P@5</th><th>mAP</th><th>P@5</th><th>mAP</th><th>P@5</th><th>mAP</th><th>P@5</th></tr><tr><th rowspan="3">DSRSID</th><th>REJEPA</th><td>62.42</td><td>66.18</td><td>65.76</td><td>69.35</td><td>62.21</td><td>67.62</td><td>65.84</td><td>69.37</td></tr><tr><th>X-JEPA</th><td>64.65</td><td>68.42</td><td>72.13</td><td>76.08</td><td>66.36</td><td>70.74</td><td>68.82</td><td>72.91</td></tr><tr><th>CR-JEPA</th><td>69.82</td><td>77.81</td><td>73.10</td><td>79.13</td><td>72.15</td><td>77.27</td><td>71.24</td><td>78.43</td></tr></tbody></table>

Table 2: Retrieval results on CBRSIR\_VS and DSRSID under single-label relevance. CBRSIR\_VS uses RGB optical and SAR modalities, while DSRSID uses panchromatic (PAN) and multispectral (MS) modalities. We report global mAP and P@5. Best and second-best results are shown in bold and underlined, respectively.

On CBRSIR\_VS, X-JEPA consistently improves over REJEPA across both same-modal and cross-modal retrieval directions. However, CR-JEPA achieves the best performance in all four directions. For same-modal retrieval, CR-JEPA improves RGB $\rightarrow$ RGB to $86.94$ mAP and SAR $\rightarrow$ SAR to $71.88$ mAP. For cross-modal retrieval, CR-JEPA reaches $72.62$ mAP for RGB $\rightarrow$ SAR and $73.55$ mAP for SAR $\rightarrow$ RGB, outperforming X-JEPA by $2.51$ and $5.68$ mAP points, respectively. The P@5 scores show the same trend, with CR-JEPA achieving $78.11$ and $78.41$ in the two cross-modal directions.

On DSRSID, CR-JEPA also achieves the best performance across all retrieval directions. Compared with X-JEPA, CR-JEPA improves PAN $\rightarrow$ PAN from $64.65$ to $69.82$ mAP and from $68.42$ to $77.81$ P@5. For MS $\rightarrow$ MS retrieval, the improvement is more moderate, increasing from $72.13$ to $73.10$ mAP and from $76.08$ to $79.13$ P@5. In cross-modal retrieval, CR-JEPA improves PAN $\rightarrow$ MS from $66.36$ to $72.15$ mAP and MS $\rightarrow$ PAN from $68.82$ to $71.24$ mAP. The corresponding P@5 scores also increase from $70.74$ to $77.27$ and from $72.91$ to $78.43$, respectively.

Overall, these results show that CR-JEPA consistently improves over REJEPA and X-JEPA on both CBRSIR\_VS and DSRSID. The gains are especially clear in cross-modal retrieval and remain positive in same-modal retrieval, indicating that the proposed predictive learning, decoupled retrieval heads, and SIGReg regularization improve retrieval across different heterogeneous modality pairs.

### 5.3 Ablation Study

We conduct ablation studies on BEN-14K to analyze the contribution of the main architectural and training components of CR-JEPA. Unless otherwise stated, all variants are trained and evaluated under the same protocol as the full model, and F1@5 is reported for the four retrieval directions. In the main paper, we report sensitivity to the mask ratio and predictor depth; additional component-level ablations covering loss design, predictor routing, predictor sharing strategies, retrieval-loss combinations, and shared-versus-separate trunk configurations are provided in the supplementary material.

<table><thead><tr><th rowspan="2">Direction</th><th colspan="3">Mask ratio</th><th colspan="6">Predictor depth</th></tr><tr><th>0.25</th><th>0.50</th><th>0.75</th><th>2</th><th>4</th><th>6</th><th>8</th><th>10</th><th>12</th></tr></thead><tbody><tr><td>S1 <math><semantics><mo>→</mo> <annotation>\rightarrow</annotation></semantics></math> S1</td><td>70.12</td><td>75.11</td><td>70.48</td><td>70.11</td><td>70.72</td><td>75.11</td><td>71.93</td><td>70.56</td><td>70.44</td></tr><tr><td>S2 <math><semantics><mo>→</mo> <annotation>\rightarrow</annotation></semantics></math> S2</td><td>76.69</td><td>82.87</td><td>77.87</td><td>74.81</td><td>77.77</td><td>82.87</td><td>79.04</td><td>80.03</td><td>75.74</td></tr><tr><td>S1 <math><semantics><mo>→</mo> <annotation>\rightarrow</annotation></semantics></math> S2</td><td>70.87</td><td>75.82</td><td>72.03</td><td>71.54</td><td>71.52</td><td>75.82</td><td>74.49</td><td>71.01</td><td>71.74</td></tr><tr><td>S2 <math><semantics><mo>→</mo> <annotation>\rightarrow</annotation></semantics></math> S1</td><td>70.89</td><td>75.40</td><td>72.10</td><td>71.64</td><td>71.91</td><td>75.40</td><td>71.16</td><td>71.63</td><td>71.79</td></tr></tbody></table>

Table 3: Sensitivity analysis on BEN-14K. The default configuration uses mask ratio $0.50$ and predictor depth $6$. Each entry reports F1@5. Best results are in bold and second-best results are underlined.

#### Sensitivity to masking and predictor depth.

Table 3 reports the sensitivity of CR-JEPA to the mask ratio and predictor depth. The mask ratio controls the difficulty of the JEPA-style latent prediction task. A moderate mask ratio of $0.50$ gives the best performance across all retrieval directions, while both lower and higher masking reduce retrieval quality. Predictor depth also affects performance: a depth of $6$ provides the best overall results, suggesting that sufficient predictor capacity is important for masked latent target estimation, but deeper predictors do not further improve retrieval.

### 5.4 Qualitative Retrieval Analysis

The quantitative results are complemented with qualitative retrieval examples. Figure 3 presents representative query and top-K retrieval grids from BEN-14K, illustrating cross-modal retrieval performance under the same evaluation protocol as Table 1. Each row corresponds to one retrieval direction, and retrieved samples are marked to indicate correct and incorrect matches. The examples demonstrate that CR-JEPA retrieves semantically consistent scenes across modalities, even when substantial appearance differences exist between S1 and S2 imagery. Failure cases are also included to highlight typical error patterns, such as semantic overlap between visually similar land-cover categories or ambiguity caused by structural similarity across classes. For completeness, additional qualitative retrieval results on CBRSIR\_VS and DSRSID are provided in the supplementary material.

![Refer to caption](https://arxiv.org/html/2606.00706v1/images/benv14k_qr.png)

Figure 3: Qualitative cross-modal retrieval examples on BEN-14K. Each block shows a query image and its top-5 retrieved results under different methods. Correct retrievals are marked in green and incorrect ones in red.

### 5.5 Discussion

The results show that CR-JEPA is particularly effective for cross-modal retrieval while maintaining strong same-modal performance. On BEN-14K, the large gains in S1 $\rightarrow$ S2 and S2 $\rightarrow$ S1 retrieval indicate that latent predictive learning, SIGReg-based embedding regularization, and retrieval-space specialization improve semantic alignment across heterogeneous sensing modalities. The same-modal improvements further suggest that the proposed architecture preserves within-modality neighbourhood structure while learning cross-modal correspondence.

Across the three benchmarks, CR-JEPA remains effective under different modality gaps: Sentinel-1/Sentinel-2 in BEN-14K, RGB optical/SAR in CBRSIR\_VS, and panchromatic /multispectral imagery in DSRSID. This consistency suggests that CR-JEPA is not limited to a specific sensor pair, but provides a general framework for heterogeneous dual-modality remote sensing retrieval.

## 6 Conclusion and Future Work

We presented CR-JEPA, a JEPA-based framework for heterogeneous dual-modality remote sensing image retrieval. The proposed architecture combines modality-specific stems, a shared semantic transformer trunk, same-modal and cross-modal latent predictive learning, SIGReg-based embedding regularization, and decoupled retrieval heads. This design separates low-level sensor adaptation, shared semantic reasoning, and retrieval-space specialization for same-modal and cross-modal retrieval.

Experiments on BEN-14K, CBRSIR\_VS, and DSRSID show consistent improvements over recent self-supervised and JEPA-based retrieval baselines, with especially strong gains in cross-modal directions. On BEN-14K, CR-JEPA improves S1 $\rightarrow$ S2 and S2 $\rightarrow$ S1 retrieval over X-JEPA by 14.59 and 11.67 F1@5 points, respectively, while using 117.93M parameters compared with 172.86M for X-JEPA. On CBRSIR\_VS and DSRSID, CR-JEPA also achieves the best performance across all same-modal and cross-modal retrieval directions, confirming its effectiveness beyond Sentinel-1/Sentinel-2 retrieval. Overall, the results support CR-JEPA as a general retrieval framework for heterogeneous dual-modality remote sensing data.

Future work will explore scaling CR-JEPA toward remote sensing foundation-model pretraining across more sensor combinations, stronger retrieval heads for multi-sensor and multi-resolution Earth observation data, and extension to partially paired or unpaired archives.

## References

Supplementary Material for CR-JEPA: Cross-Modal Joint-Embedding Predictive Learning for Remote Sensing Image Retrieval

## S1 Supplementary Overview

This supplementary material provides additional details supporting the main paper. Section S2 describes the datasets and modality setups. Section S3 includes the full metric definitions. Section S4 offers more qualitative retrieval examples. Section S5 presents extended ablation studies on BEN-14K. Section S6 outlines a dual-encoder variant that analyzes the benefit of the shared semantic trunk.

## S2 Dataset Details

We evaluate CR-JEPA on three dual-modality remote sensing retrieval benchmarks: BEN-14K, CBRSIR\_VS, and DSRSID. These datasets involve Sentinel-1/Sentinel-2, RGB optical/SAR, and panchromatic/multispectral retrieval settings. Table S1 summarizes the dataset properties used in our experiments.

BEN-14K. BEN-14K is derived from BigEarthNet-MM and contains 14,832 paired Sentinel-1 SAR and Sentinel-2 multispectral image pairs acquired over Serbia during summer \[sumbul2021bigearthnetmm, bigearthnet\]. Each sample includes one Sentinel-1 image, one Sentinel-2 image, and a multi-label land-cover annotation vector. We use BEN-14K to assess same-modal and cross-modal retrieval under multi-label relevance, following recent sensor-agnostic retrieval protocols \[hackstein2025csmae, choudhury2026xjepa\].

CBRSIR\_VS. CBRSIR\_VS is an optical/SAR dual-modality retrieval dataset introduced for cross-modal remote sensing retrieval and hashing \[sun2022msesph\]. It contains 26,901 paired RGB optical and SAR images from 10 semantic classes. The optical images are $256\times 256$ very-high-resolution RGB images with 1 m spatial resolution, while the SAR images are Sentinel-1 images of size $64\times 64$ with 10 m spatial resolution.

DSRSID. DSRSID is a dual-source dataset for cross-source remote sensing image retrieval \[li2018sidhcnn\]. It contains 80,000 paired panchromatic/multispectral samples acquired by the Gaofen-1 optical satellite. The panchromatic images are one-channel $256\times 256$ images with 2 m spatial resolution, while the multispectral images have 4 channels and size $64\times 64$ with 8 m spatial resolution. DSRSID contains eight classes: aquafarm, cloud, forest, high building, low building, farm land, river, and water.

| Dataset | Modality pair | Classes | Pairs | Relevance type |
| --- | --- | --- | --- | --- |
| BEN-14K \[sumbul2021bigearthnetmm\] | Sentinel-1 / Sentinel-2 | 19 | 14,832 | Multi-label overlap |
| CBRSIR\_VS \[sun2022msesph\] | RGB optical / SAR | 10 | 26,901 | Single-label equality |
| DSRSID \[li2018sidhcnn\] | PAN / Multispectral | 8 | 80,000 | Single-label equality |

Table S1: Summary of the datasets used for evaluating CR-JEPA.

## S3 Evaluation Metric Definitions

We evaluate retrieval in four directions:

$$
a\rightarrow a,\qquad b\rightarrow b,\qquad a\rightarrow b,\qquad b\rightarrow a.
$$

The first two denote same-modal retrieval, while the last two denote cross-modal retrieval. Trivial self-matches are excluded in same-modal retrieval when the query and gallery contain the same indexed sample.

Multi-label relevance on BEN-14K. For BEN-14K, relevance is defined by multi-label overlap. Let $\mathcal{Y}_{q}$ and $\mathcal{Y}_{r}$ denote the label sets of a query image and a retrieved image, respectively. For each retrieved item, we compute label-overlap precision, recall, and F1 as

$$
P(q,r)=\frac{|\mathcal{Y}_{q}\cap\mathcal{Y}_{r}|}{|\mathcal{Y}_{r}|},\qquad R(q,r)=\frac{|\mathcal{Y}_{q}\cap\mathcal{Y}_{r}|}{|\mathcal{Y}_{q}|},
$$
 
$$
F_{1}(q,r)=\frac{2P(q,r)R(q,r)}{P(q,r)+R(q,r)+\epsilon}.
$$

The final F1@K is obtained by averaging the item-level F1 scores over the top- $K$ retrieved images and then over all queries. We report F1@5 for BEN-14K, following recent remote sensing retrieval protocols \[hackstein2025csmae, choudhury2026xjepa\].

Single-label relevance on CBRSIR\_VS and DSRSID. For CBRSIR\_VS and DSRSID, relevance is defined by single-label class equality. A retrieved image is considered relevant if it belongs to the same semantic class as the query. For a query $q$, let $\mathrm{rel}_{q}(k)=1$ if the gallery image retrieved at rank $k$ is relevant, and $0$ otherwise. Precision at rank $K$ is

$$
P@K(q)=\frac{1}{K}\sum_{k=1}^{K}\mathrm{rel}_{q}(k).
$$

We use $K=5$ and report P@5. We also report mean average precision (mAP) over the full gallery. For query $q$, precision at rank $k$ is

$$
P_{q}(k)=\frac{1}{k}\sum_{i=1}^{k}\mathrm{rel}_{q}(i).
$$

The average precision for query $q$ is

$$
AP(q)=\frac{1}{R_{q}}\sum_{k=1}^{|G|}P_{q}(k)\,\mathrm{rel}_{q}(k),
$$

where $R_{q}$ is the number of relevant gallery samples for query $q$, and $|G|$ is the gallery size. The final mAP is

$$
mAP=\frac{1}{|Q|}\sum_{q\in Q}AP(q).
$$

## S4 Additional Qualitative Retrieval Results

Figure S1 offers more qualitative retrieval examples on CBRSIR\_VS and DSRSID. These examples support the BEN-14K qualitative findings in the main paper and demonstrate that CR-JEPA retrieves semantically relevant samples across RGB optical/SAR and panchromatic/multispectral modality pairs.

![Refer to caption](https://arxiv.org/html/2606.00706v1/images/cbrsir_dsrsid_qr.png)

Figure S1: Additional qualitative retrieval examples on CBRSIR\_VS and DSRSID. These examples illustrate cross-modal retrieval across RGB optical/SAR and PAN/multispectral modality pairs.

## S5 Additional Ablation Studies

We provide detailed ablation studies on BEN-14K to support the main paper. All entries show F1@5 using the same four-direction retrieval protocol as in the main experiments. Unless mentioned otherwise, the final configuration includes all predictive routes, the shared semantic trunk, the cross-modal retrieval head, the unified retrieval head, and SIGReg regularization.

### S5.1 Loss Components and Predictor Routing

Table S2(a) evaluates the contribution of predictive learning, cross-modal retrieval loss, unified retrieval loss, and SIGReg. $\mathcal{L}_{\mathrm{pred}}$ denotes the JEPA-style predictive objective, $\mathcal{L}_{\mathrm{cross}}$ denotes the cross-modal retrieval loss, $\mathcal{L}_{\mathrm{uni}}$ denotes the unified retrieval loss, and $\mathcal{L}_{\mathrm{sigreg}}$ denotes the SIGReg embedding regularizer. The full objective achieves the best average performance across the four retrieval directions, indicating that the losses provide complementary supervision. Some partial combinations are competitive in individual directions, but they are less stable across all retrieval modes.

<table><thead><tr><th colspan="9">(a) Loss Component Ablation</th></tr></thead><tbody><tr><th><math><semantics><msub><mi>ℒ</mi> <mi>pred</mi></msub> <annotation>\mathcal{L}_{\mathrm{pred}}</annotation></semantics></math></th><th><math><semantics><msub><mi>ℒ</mi> <mi>cross</mi></msub> <annotation>\mathcal{L}_{\mathrm{cross}}</annotation></semantics></math></th><th><math><semantics><msub><mi>ℒ</mi> <mi>uni</mi></msub> <annotation>\mathcal{L}_{\mathrm{uni}}</annotation></semantics></math></th><th><math><semantics><msub><mi>ℒ</mi> <mi>sigreg</mi></msub> <annotation>\mathcal{L}_{\mathrm{sigreg}}</annotation></semantics></math></th><td>S1 <math><semantics><mo>→</mo> <annotation>\rightarrow</annotation></semantics></math> S1</td><td>S2 <math><semantics><mo>→</mo> <annotation>\rightarrow</annotation></semantics></math> S2</td><td>S1 <math><semantics><mo>→</mo> <annotation>\rightarrow</annotation></semantics></math> S2</td><td>S2 <math><semantics><mo>→</mo> <annotation>\rightarrow</annotation></semantics></math> S1</td><td>Avg.</td></tr><tr><th>✓</th><th>✓</th><th></th><th></th><td>73.48</td><td>78.54</td><td>47.14</td><td>45.99</td><td>61.29</td></tr><tr><th>✓</th><th></th><th>✓</th><th></th><td>74.44</td><td>77.68</td><td>75.38</td><td>74.79</td><td>75.57</td></tr><tr><th>✓</th><th></th><th></th><th>✓</th><td>49.04</td><td>65.56</td><td>36.89</td><td>36.51</td><td>47.00</td></tr><tr><th>✓</th><th>✓</th><th>✓</th><th></th><td>74.53</td><td>77.89</td><td>74.32</td><td>75.01</td><td>75.44</td></tr><tr><th>✓</th><th>✓</th><th></th><th>✓</th><td>73.79</td><td>78.42</td><td>49.59</td><td>48.13</td><td>62.48</td></tr><tr><th>✓</th><th></th><th>✓</th><th>✓</th><td>74.01</td><td>78.60</td><td>75.24</td><td>75.55</td><td>75.85</td></tr><tr><th>✓</th><th>✓</th><th>✓</th><th>✓</th><td>75.11</td><td>82.87</td><td>75.82</td><td>75.40</td><td>77.30</td></tr><tr><th colspan="9">(b) Predictor Routing Ablation</th></tr><tr><th><math><semantics><msub><mi>ℒ</mi> <mrow><mi>S</mi> <mo></mo><mn>11</mn></mrow></msub> <annotation>\mathcal{L}_{S11}</annotation></semantics></math></th><th><math><semantics><msub><mi>ℒ</mi> <mrow><mi>S</mi> <mo></mo><mn>22</mn></mrow></msub> <annotation>\mathcal{L}_{S22}</annotation></semantics></math></th><th><math><semantics><msub><mi>ℒ</mi> <mrow><mi>S</mi> <mo></mo><mn>12</mn></mrow></msub> <annotation>\mathcal{L}_{S12}</annotation></semantics></math></th><th><math><semantics><msub><mi>ℒ</mi> <mrow><mi>S</mi> <mo></mo><mn>21</mn></mrow></msub> <annotation>\mathcal{L}_{S21}</annotation></semantics></math></th><td>S1 <math><semantics><mo>→</mo> <annotation>\rightarrow</annotation></semantics></math> S1</td><td>S2 <math><semantics><mo>→</mo> <annotation>\rightarrow</annotation></semantics></math> S2</td><td>S1 <math><semantics><mo>→</mo> <annotation>\rightarrow</annotation></semantics></math> S2</td><td>S2 <math><semantics><mo>→</mo> <annotation>\rightarrow</annotation></semantics></math> S1</td><td>Avg.</td></tr><tr><th>✓</th><th>✓</th><th></th><th></th><td>75.04</td><td>79.62</td><td>75.44</td><td>74.77</td><td>76.23</td></tr><tr><th></th><th></th><th>✓</th><th>✓</th><td>75.10</td><td>81.03</td><td>75.97</td><td>75.35</td><td>76.86</td></tr><tr><th>✓</th><th></th><th>✓</th><th></th><td>75.67</td><td>80.92</td><td>76.13</td><td>75.18</td><td>76.98</td></tr><tr><th></th><th>✓</th><th></th><th>✓</th><td>75.34</td><td>79.82</td><td>75.94</td><td>75.36</td><td>76.62</td></tr><tr><th>✓</th><th>✓</th><th>✓</th><th>✓</th><td>75.11</td><td>82.87</td><td>75.82</td><td>75.40</td><td>77.30</td></tr></tbody></table>

Table S2: Joint ablation study on BEN-14K. (a) evaluates objective components, while (b) evaluates predictor routing across same-modal and cross-modal prediction tasks. The final configuration achieves the best average F1@5.

Table S2(b) studies the effect of predictor routing. $\mathcal{L}_{S11}$ and $\mathcal{L}_{S22}$ denote same-modal predictive losses, while $\mathcal{L}_{S12}$ and $\mathcal{L}_{S21}$ denote cross-modal predictive losses. The results show that jointly using all same-modal and cross-modal routes achieves the best average performance, supporting the bidirectional predictive design used in the final model.

| Predictor sharing strategy | S1 $\rightarrow$ S1 | S2 $\rightarrow$ S2 | S1 $\rightarrow$ S2 | S2 $\rightarrow$ S1 |
| --- | --- | --- | --- | --- |
| Fully independent predictors | 74.97 | 78.42 | 75.72 | 74.63 |
| Shared same-modal + shared cross-modal | 75.04 | 78.80 | 75.67 | 75.40 |
| Single shared predictor for all tasks | 74.70 | 78.38 | 75.56 | 75.42 |
| Shared same-modal + independent cross-modal | 74.70 | 78.80 | 75.67 | 75.40 |
| Modality-specific same + shared cross (final) | 75.11 | 82.87 | 75.82 | 75.40 |

Table S3: Ablation study of predictor sharing strategies on BEN-14K. Each entry reports F1@5.

### S5.2 Predictor Sharing Strategy

Table S3 evaluates how predictor sharing affects retrieval. The final design uses modality-specific predictors for same-modal prediction and a shared predictor for cross-modal prediction. This configuration preserves modality-specific forecasting capacity while enforcing a common cross-modal predictive structure.

### S5.3 Retrieval-Loss Ablation

Table S4 reports retrieval-loss and head-design ablations using an early three-head variant of CR-JEPA. This variant used modality-specific same-modal retrieval heads with a same-modal retrieval regularization loss $\mathcal{L}_{\mathrm{same}}$, a shared cross-modal retrieval head with cross-modal retrieval loss $\mathcal{L}_{\mathrm{cross}}$, and a unified retrieval head with unified retrieval loss $\mathcal{L}_{\mathrm{uni}}$. In the final model, we remove the explicit same-modal retrieval heads and the associated loss $\mathcal{L}_{\mathrm{same}}$, retaining only $\mathcal{L}_{\mathrm{cross}}$ and $\mathcal{L}_{\mathrm{uni}}$.

For modality $m\in\{a,b\}$, the same-modal retrieval embeddings in the early three-head variant are

$$
r_{\mathrm{same}}^{(m)},e_{\mathrm{same}}^{(m)}=\phi_{\mathrm{same}}^{(m)}(\bar{z}^{(m)}).
$$

The same-modal retrieval regularization is

$$
\mathcal{L}_{\mathrm{same}}=\mathrm{NCE}(e_{\mathrm{same}}^{(a)},\mathrm{sg}(e_{\mathrm{same}}^{(a)}))+\mathrm{NCE}(e_{\mathrm{same}}^{(b)},\mathrm{sg}(e_{\mathrm{same}}^{(b)})),
$$

where $\mathrm{sg}(\cdot)$ denotes stop-gradient. The final model removes this term and uses

$$
\mathcal{L}_{\mathrm{retr}}=\lambda_{\mathrm{cross}}\mathcal{L}_{\mathrm{cross}}+\lambda_{\mathrm{uni}}\mathcal{L}_{\mathrm{uni}}.
$$

| Variant | $\mathcal{L}_{\mathrm{same}}$ | $\mathcal{L}_{\mathrm{cross}}$ | $\mathcal{L}_{\mathrm{uni}}$ | S1 $\rightarrow$ S1 | S2 $\rightarrow$ S2 | S1 $\rightarrow$ S2 | S2 $\rightarrow$ S1 | Avg. |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Same + Cross | ✓ | ✓ | – | 67.72 | 71.43 | 24.13 | 35.46 | 49.68 |
| Same + Unified | ✓ | – | ✓ | 68.06 | 73.54 | 71.63 | 71.18 | 71.10 |
| Same + Cross + Unified | ✓ | ✓ | ✓ | 74.02 | 76.11 | 75.03 | 74.92 | 75.02 |
| Final CR-JEPA | – | ✓ | ✓ | 75.11 | 82.87 | 75.82 | 75.40 | 77.30 |

Table S4: Retrieval-loss and head-design ablation on BEN-14K. Each entry reports F1@5. The final model removes the explicit same-modal retrieval heads and the associated same-modal retrieval loss, using the cross-modal retrieval loss together with the unified retrieval loss.

These ablations verify whether explicit same-modal retrieval regularization is necessary. The results show that adding $\mathcal{L}_{\mathrm{same}}$ does not improve the final configuration. Therefore, the final model simplifies the retrieval objective by removing $\mathcal{L}_{\mathrm{same}}$, while preserving strong same-modal performance and improving cross-modal retrieval.

### S5.4 Shared versus Separate Trunks

Table S5 compares the final shared-trunk design with the dual-encoder CR-JEPA variant, where the two modalities are processed by separate transformer trunks. The shared-trunk model uses modality-specific stems for low-level sensor adaptation, followed by a common semantic trunk for both modalities. In contrast, the dual-encoder variant maintains independent modality-specific encoders throughout the network.

| Setting | Params | S1 $\rightarrow$ S1 | S2 $\rightarrow$ S2 | S1 $\rightarrow$ S2 | S2 $\rightarrow$ S1 |
| --- | --- | --- | --- | --- | --- |
| Shared trunk | 117.93M | 75.11 | 82.87 | 75.82 | 75.40 |
| Separate trunks | 154.77M | 70.34 | 75.80 | 67.34 | 71.68 |

Table S5: Comparison between shared-trunk and separate-trunk architectures on BEN-14K. The separate-trunk setting corresponds to the dual-encoder CR-JEPA variant. Each entry reports F1@5.

The shared-trunk design reduces trainable parameters and improves retrieval performance in all four directions. This suggests that sharing the higher-level transformer trunk encourages modality-common semantic reasoning, while avoiding over-specialization of two independent encoders. These results support the final design choice of using modality-specific stems followed by a shared semantic trunk.

## S6 Dual-Encoder CR-JEPA Variant

The separate-trunk configuration in Table S5 is implemented as a dual-encoder CR-JEPA variant. Unlike the final architecture, which uses modality-specific stems followed by a shared transformer trunk, this variant uses two independent ViT encoders, $E_{a}$ and $E_{b}$, for the two modalities. Each encoder has its own patch embedding, positional embeddings, transformer blocks, and normalization layer. Thus, the two modalities are processed in separate feature spaces until retrieval and alignment losses are applied. This design provides a direct comparison for evaluating whether independent modality-specific encoders are sufficient or whether a shared semantic trunk better supports heterogeneous remote sensing retrieval.

For an input pair $(x^{(a)},x^{(b)})$, the encoders produce visible-context and masked-target latent tokens for each modality. The same-modal predictors estimate masked tokens within each modality, while a shared cross-modal predictor estimates masked target tokens of one modality from the visible context of the other modality. The predictive loss follows the same four-path objective used in the main model:

$$
\mathcal{L}_{\mathrm{pred}}=\lambda_{aa}\mathcal{L}_{aa}+\lambda_{bb}\mathcal{L}_{bb}+\lambda_{ab}\mathcal{L}_{ab}+\lambda_{ba}\mathcal{L}_{ba}.
$$

For retrieval, the dual-encoder variant uses a single shared global retrieval head $\phi_{\mathrm{retr}}$ applied to the pooled tokens from both encoders:

$$
r^{(m)},e^{(m)}=\phi_{\mathrm{retr}}(z^{(m)}),\qquad m\in\{a,b\}.
$$

The retrieval objective combines cross-modal InfoNCE and direct cosine alignment:

$$
\mathcal{L}_{\mathrm{retr}}=\mathrm{NCE}(e^{(a)},e^{(b)})+\frac{1}{B}\sum_{i=1}^{B}\left(1-\cos(e_{i}^{(a)},e_{i}^{(b)})\right).
$$

In addition, this variant includes two SIGReg-based regularization terms. First, SIGReg is applied to the raw retrieval projections from both modalities to improve the conditioning of the embeddings. Second, a paired cross-modal SIGReg term is applied after fusing the raw projections from the two modalities. In our implementation, the paired SIGReg term is computed by applying SIGReg to the fused paired raw projections, obtained by averaging the raw projections from the two modalities. The total objective is

$$
\mathcal{L}=\mathcal{L}_{\mathrm{pred}}+\lambda_{\mathrm{retr}}\mathcal{L}_{\mathrm{retr}}+\lambda_{\mathrm{sigreg}}\mathcal{L}_{\mathrm{sigreg}}+\lambda_{\mathrm{pair}}\mathcal{L}_{\mathrm{pair\text{-}sigreg}}.
$$

This dual-encoder design provides a useful comparison against the final CR-JEPA. It tests whether independent modality encoders with retrieval alignment and SIGReg-based regularization are sufficient, or whether modality-specific stems followed by a shared semantic trunk provide better semantic coupling for heterogeneous remote sensing retrieval.