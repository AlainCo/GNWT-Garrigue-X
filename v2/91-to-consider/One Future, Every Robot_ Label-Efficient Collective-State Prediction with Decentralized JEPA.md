---
title: "One Future, Every Robot: Label-Efficient Collective-State Prediction with Decentralized JEPA"
source: "https://arxiv.org/html/2607.28443v2"
author:
published:
created: 2026-08-06
description:
tags:
  - "clippings"
---
Alan-Barsag Gazzaev, Alexey Gavrilov, and Sergey Muravyov The authors are with ITMO University, Saint Petersburg, Russia.

###### Abstract

Can every robot in a swarm predict the same future collective state from only local observations and bandwidth-limited messages? We formulate this as decentralized shared-state prediction and introduce Collective-State JEPA (CS-JEPA), a recurrent joint-embedding predictive architecture whose output at every robot represents one common future token field. At deployment, each robot uses a 16-frame local history and one 64-float recurrent message per directed edge; there is no global pooling, target encoder, episode clock, or recorded future action. After pretraining without downstream collective labels, frozen representations are evaluated with ridge probes fitted on 6, 12, or 24 globally labeled episodes. Against raw-future reconstruction with the same receiver anchor and deployment capacity but 9,607 additional training-only parameters, a prospectively registered five-seed follow-up improves prediction-error and inter-robot-agreement label-budget AUC on in-distribution, ring, mutual- $k$ NN, and unseen-size families up to 108 robots. Every effect favors CS-JEPA in 5/5 outer seeds. A sealed eight-seed action-conditioned follow-up reduces branch-value MSE by 45.5% and improves within-context candidate-score correlation by 0.1291. In a separate 16-seed fully decentralized closed-loop study, receiver-local CS-JEPA planning improves utility over nominal control ($\Delta=+0.01053$, $p=0.00070$) and first plan-coefficient agreement over matched reconstruction ($\Delta=+0.14472$, $p=0.000061$). These results support common-future JEPA targets as a label-efficient primitive for decentralized swarm prediction under topology and size shift, with additional evidence of planning-relevant value estimation and closed-loop decision consistency.

<sup>†</sup>

## I Introduction

A robot swarm can exhibit a coherent global regime—flocking, fragmenting, rotating, or losing connectivity—even though no member directly observes that regime. A useful decentralized predictor should therefore solve an unusual inference problem: from different local views, all robots should produce accurate estimates of the *same future collective state*. This is not the usual per-agent trajectory forecast, a centralized critic state, or a consensus estimate of the present. It is a common future quantity predicted independently at every receiver.

Prior work supplies several pieces of this problem. Permutation-invariant encoders and graph policies scale across interchangeable agents [^17] [^8] [^14]; global-state prediction gives decentralized policies access to otherwise hidden context [^4] [^5]; and multi-agent representation or world models improve communication and policy learning [^7] [^6] [^18] [^12]. Joint-embedding predictive architectures (JEPAs), meanwhile, replace raw reconstruction with prediction in a learned target space [^10] [^1]. What remains unresolved is whether a JEPA target can represent the future *swarm as a set*, be predicted at every robot through a fixed local message interface, transfer to new topologies and swarm sizes, and reduce the number of globally labeled episodes required downstream.

We study precisely that conjunction. Figure 1 summarizes Collective-State JEPA (CS-JEPA). Each robot recurrently transports local evidence, predicts a fixed-size global-plus-spatial token field at horizons $t{+}2$ and $t{+}4$, and exposes its own 1105-dimensional future prediction. The CS-JEPA pretraining objective contains no explicit inter-robot agreement term. A small probe trained on episode-level labels decodes collective variables such as polarization, connectivity, and task score. In practice, requiring fewer globally labeled episodes reduces the centralized sensing and labeling burden needed to fit a collective-state readout, while inference at each robot remains fully decentralized.

Our contributions are:

- a precise endpoint and deployment contract for *per-robot prediction of one shared future state*, with one message round, 256 bytes per directed edge and step, 16 local history frames, and no runtime future or global tensors;
- a size-invariant JEPA target and recurrent receiver-local predictor, augmented during pretraining by a receiver-future anchor that is removed at deployment;
- prospectively registered, episode-respecting target-isolation evidence on a new five-seed cohort: with the frozen stage-0 encoder, receiver anchor, shared initialization, and deployment model fixed, CS-JEPA is more label-efficient than raw-future reconstruction on ID, two topology shifts, and swarms 2–6 $\times$ larger than training;
- a separate sealed eight-seed confirmation with matched action-conditioned variants, in which each candidate plan conditions the receiver-local prediction and CS-JEPA supports more accurate four-step counterfactual value estimation than reconstruction, including transfer from $N\in\{8,16\}$ to unseen $N=32$;
- a 16-new-training-seed fully decentralized closed-loop study in which receiver-local CS-JEPA planning improves utility over nominal control and produces more consistent first plan-coefficient choices than matched reconstruction.

<svg id="S1.F1.pic1" height="184.27" overflow="visible" version="1.1" viewBox="0 0 618.12 184.27" width="618.12"><g style="--ltx-stroke-color:#000000;--ltx-fill-color:#000000;" transform="translate(0,184.27) matrix(1 0 0 -1 0 0) translate(331.62,0) translate(0,124.29)" fill="#000000" stroke="#000000"><g stroke-width="0.4pt"><g style="--ltx-stroke-color:#1769AA;--ltx-fill-color:#1769AA;" transform="matrix(1.0 0.0 0.0 1.0 -317.95 45.75)" fill="#1769AA" stroke="#1769AA"><foreignObject style="--ltx-fg-color:#1769AA;--ltx-fo-width:30.36em;--ltx-fo-height:0.6em;--ltx-fo-depth:0.17em;" width="483.05" height="12.3" transform="matrix(1 0 0 -1 0 9.61)" overflow="visible" color="#1769AA"><span id="S1.F1.pic1.13.13.13.13.1.1">DEPLOYMENT: the same receiver-local computation at every robot</span></foreignObject></g> <g style="--ltx-stroke-color:#1769AA;--ltx-fill-color:#E8F2FA;" stroke="#1769AA" fill="#E8F2FA"><path d="M -219.52 29.53 L -311.98 29.53 C -313.5 29.53 -314.74 28.29 -314.74 26.76 L -314.74 0.8 C -314.74 -0.73 -313.5 -1.97 -311.98 -1.97 L -219.52 -1.97 C -217.99 -1.97 -216.75 -0.73 -216.75 0.8 L -216.75 26.76 C -216.75 28.29 -217.99 29.53 -219.52 29.53 Z M -314.74 -1.97"></path></g><g style="--ltx-stroke-color:#000000;--ltx-fill-color:#000000;" transform="matrix(1.0 0.0 0.0 1.0 -310.59 7.17)" fill="#000000" stroke="#000000"><g transform="matrix(1 0 0 -1 0 15.37)"><g transform="matrix(1 0 0 1 0 7.69)"><g transform="matrix(1 0 0 -1 8.57 0)"><text transform="matrix(1 0 0 -1 0 0)">16-frame local</text></g></g> <g transform="matrix(1 0 0 1 0 15.38)"><g transform="matrix(1 0 0 -1 0 0)"><foreignObject style="--ltx-fo-width:7.6em;--ltx-fo-height:0.65em;--ltx-fo-depth:0.18em;" width="89.36" height="9.84" transform="matrix(1 0 0 -1 0 7.69)" overflow="visible"><span id="S1.F1.pic1.14.14.14.14.2.2.2.2.1" style="font-size:80%;">history at robot</span> <math xmlns="http://www.w3.org/1998/Math/MathML" display="inline" data-latex="i"><semantics><mi mathsize="0.800em">i</mi> <annotation encoding="application/x-tex">i</annotation></semantics></math></foreignObject></g></g></g></g> <g style="--ltx-stroke-color:#1769AA;--ltx-fill-color:#E8F2FA;" stroke="#1769AA" fill="#E8F2FA"><path d="M -101.65 29.53 L -197.57 29.53 C -199.09 29.53 -200.33 28.29 -200.33 26.76 L -200.33 0.8 C -200.33 -0.73 -199.09 -1.97 -197.57 -1.97 L -101.65 -1.97 C -100.12 -1.97 -98.88 -0.73 -98.88 0.8 L -98.88 26.76 C -98.88 28.29 -100.12 29.53 -101.65 29.53 Z M -200.33 -1.97"></path></g><g style="--ltx-stroke-color:#000000;--ltx-fill-color:#000000;" transform="matrix(1.0 0.0 0.0 1.0 -196.18 5.02)" fill="#000000" stroke="#000000"><g transform="matrix(1 0 0 -1 0 18.91)"><g transform="matrix(1 0 0 1 0 7.69)"><g transform="matrix(1 0 0 -1 0 0)"><text transform="matrix(1 0 0 -1 0 0)">synchronous GRU</text></g></g> <g transform="matrix(1 0 0 1 0 18.91)"><g transform="matrix(1 0 0 -1 26.79 0)"><foreignObject style="--ltx-fo-width:3.36em;--ltx-fo-height:0.77em;--ltx-fo-depth:0.12em;" width="39.57" height="10.45" transform="matrix(1 0 0 -1 0 9.07)" overflow="visible"><math xmlns="http://www.w3.org/1998/Math/MathML" display="inline" data-latex="h_{t}^{i}\in\mathbb{R}^{64}"><semantics><mrow><msubsup><mi mathsize="0.800em">h</mi> <mi mathsize="0.800em">t</mi> <mi mathsize="0.800em">i</mi></msubsup> <mo mathsize="0.800em">∈</mo> <msup><mi mathsize="0.800em">ℝ</mi> <mn mathsize="0.800em">64</mn></msup></mrow> <annotation encoding="application/x-tex">h_{t}^{i}\in\mathbb{R}^{64}</annotation></semantics></math></foreignObject></g></g></g></g> <g style="--ltx-stroke-color:#1769AA;--ltx-fill-color:#E8F2FA;" stroke="#1769AA" fill="#E8F2FA"><path d="M 2.15 29.53 L -76.96 29.53 C -78.49 29.53 -79.72 28.29 -79.72 26.76 L -79.72 0.8 C -79.72 -0.73 -78.49 -1.97 -76.96 -1.97 L 2.15 -1.97 C 3.68 -1.97 4.92 -0.73 4.92 0.8 L 4.92 26.76 C 4.92 28.29 3.68 29.53 2.15 29.53 Z M -79.72 -1.97"></path></g><g style="--ltx-stroke-color:#000000;--ltx-fill-color:#000000;" transform="matrix(1.0 0.0 0.0 1.0 -71.42 6.09)" fill="#000000" stroke="#000000"><g transform="matrix(1 0 0 -1 0 17.53)"><g transform="matrix(1 0 0 1 0 7.69)"><g transform="matrix(1 0 0 -1 0 0)"><text transform="matrix(1 0 0 -1 0 0)">shared-target</text></g></g> <g transform="matrix(1 0 0 1 0 17.53)"><g transform="matrix(1 0 0 -1 10.81 0)"><text transform="matrix(1 0 0 -1 0 0)">predictor</text></g></g></g></g> <g style="--ltx-stroke-color:#E8872D;--ltx-fill-color:#FCEEDF;" stroke="#E8872D" fill="#FCEEDF"><path d="M 135.03 29.53 L 26.39 29.53 C 24.86 29.53 23.62 28.29 23.62 26.76 L 23.62 0.8 C 23.62 -0.73 24.86 -1.97 26.39 -1.97 L 135.03 -1.97 C 136.56 -1.97 137.8 -0.73 137.8 0.8 L 137.8 26.76 C 137.8 28.29 136.56 29.53 135.03 29.53 Z M 23.62 -1.97"></path></g><g style="--ltx-stroke-color:#000000;--ltx-fill-color:#000000;" transform="matrix(1.0 0.0 0.0 1.0 28.4 4.95)" fill="#000000" stroke="#000000"><g transform="matrix(1 0 0 -1 0 19.8)"><g transform="matrix(1 0 0 1 0 9.99)"><g transform="matrix(1 0 0 -1 18.2 0)"><foreignObject style="--ltx-fo-width:5.83em;--ltx-fo-height:0.85em;--ltx-fo-depth:0.23em;" width="68.55" height="12.67" transform="matrix(1 0 0 -1 0 9.99)" overflow="visible"><span id="S1.F1.pic1.15.15.15.15.4.4.3.3.1" style="font-size:80%;">every</span> <math xmlns="http://www.w3.org/1998/Math/MathML" display="inline" data-latex="i"><semantics><mi mathsize="0.800em">i</mi> <annotation encoding="application/x-tex">i</annotation></semantics></math><span id="S1.F1.pic1.16.16.16.16.5.5.4.4.2" style="font-size:80%;">:</span> <math xmlns="http://www.w3.org/1998/Math/MathML" display="inline" data-latex="\widehat{Z}_{t+4}^{,i}"><semantics><msubsup><mover accent="true"><mi mathsize="0.800em">Z</mi> <mo mathsize="0.800em">^</mo></mover> <mrow><mi mathsize="0.800em">t</mi> <mo mathsize="0.800em">+</mo> <mn mathsize="0.800em">4</mn></mrow><mrow><mo mathsize="0.800em">,</mo><mi mathsize="0.800em">i</mi></mrow></msubsup> <annotation encoding="application/x-tex">\widehat{Z}_{t+4}^{,i}</annotation></semantics></math></foreignObject></g></g> <g transform="matrix(1 0 0 1 0 19.8)"><g transform="matrix(1 0 0 -1 0 0)"><foreignObject style="--ltx-fo-width:8.9em;--ltx-fo-height:0.61em;--ltx-fo-depth:0.18em;" width="104.62" height="9.29" transform="matrix(1 0 0 -1 0 7.13)" overflow="visible"><span id="S1.F1.pic1.17.17.17.17.6.6.2.2.1" style="font-size:80%;">same 17</span> <math xmlns="http://www.w3.org/1998/Math/MathML" display="inline" data-latex="\times"><semantics><mo mathsize="0.800em">×</mo> <annotation encoding="application/x-tex">\times</annotation></semantics></math> <span id="S1.F1.pic1.18.18.18.18.7.7.3.3.2" style="font-size:80%;">65 target</span></foreignObject></g></g></g></g> <g style="--ltx-stroke-color:#E8872D;--ltx-fill-color:#FCEEDF;" stroke="#E8872D" fill="#FCEEDF"><path d="M 257.08 29.53 L 179.93 29.53 C 178.4 29.53 177.17 28.29 177.17 26.76 L 177.17 0.8 C 177.17 -0.73 178.4 -1.97 179.93 -1.97 L 257.08 -1.97 C 258.6 -1.97 259.84 -0.73 259.84 0.8 L 259.84 26.76 C 259.84 28.29 258.6 29.53 257.08 29.53 Z M 177.17 -1.97"></path></g><g style="--ltx-stroke-color:#000000;--ltx-fill-color:#000000;" transform="matrix(1.0 0.0 0.0 1.0 184.98 7.17)" fill="#000000" stroke="#000000"><g transform="matrix(1 0 0 -1 0 15.37)"><g transform="matrix(1 0 0 1 0 7.69)"><g transform="matrix(1 0 0 -1 0 0)"><text transform="matrix(1 0 0 -1 0 0)">small labeled</text></g></g> <g transform="matrix(1 0 0 1 0 15.38)"><g transform="matrix(1 0 0 -1 18.98 0)"><text transform="matrix(1 0 0 -1 0 0)">probe</text></g></g></g></g> <g style="--ltx-stroke-color:#797F85;" stroke-width="0.65pt" stroke="#797F85"><path style="fill:none" d="M -216.48 13.78 L -208.36 13.78"></path><g style="--ltx-fill-color:#797F85;" fill="#797F85" stroke-dasharray="none" stroke-dashoffset="0.0pt" stroke-linejoin="miter" transform="matrix(1.0 0.0 0.0 1.0 -208.36 13.78)"><path d="M 5.95 0 C 5.22 0.18 2.01 1.19 0 2.29 L 0 -2.29 C 2.01 -1.19 5.22 -0.18 5.95 0 Z"></path></g></g><g stroke-width="0.65pt"><g style="--ltx-stroke-color:#797F85;" stroke="#797F85"><path style="fill:none" d="M -98.6 13.78 L -87.75 13.78"></path><g style="--ltx-fill-color:#797F85;" fill="#797F85" stroke-dasharray="none" stroke-dashoffset="0.0pt" stroke-linejoin="miter" transform="matrix(1.0 0.0 0.0 1.0 -87.75 13.78)"><path d="M 5.95 0 C 5.22 0.18 2.01 1.19 0 2.29 L 0 -2.29 C 2.01 -1.19 5.22 -0.18 5.95 0 Z"></path></g></g><g style="--ltx-stroke-color:#000000;--ltx-fill-color:#000000;" transform="matrix(1.0 0.0 0.0 1.0 -95.22 22.99)" fill="#000000" stroke="#000000"><foreignObject style="--ltx-fo-width:1.01em;--ltx-fo-height:0.77em;--ltx-fo-depth:0.12em;" width="11.84" height="10.45" transform="matrix(1 0 0 -1 0 9.07)" overflow="visible"><math xmlns="http://www.w3.org/1998/Math/MathML" display="inline" data-latex="h_{t}^{i}"><semantics><msubsup><mi mathsize="0.800em">h</mi> <mi mathsize="0.800em">t</mi> <mi mathsize="0.800em">i</mi></msubsup> <annotation encoding="application/x-tex">h_{t}^{i}</annotation></semantics></math></foreignObject></g></g> <g style="--ltx-stroke-color:#797F85;" stroke-width="0.65pt" stroke="#797F85"><path style="fill:none" d="M 5.2 13.78 L 15.6 13.78"></path><g style="--ltx-fill-color:#797F85;" fill="#797F85" stroke-dasharray="none" stroke-dashoffset="0.0pt" stroke-linejoin="miter" transform="matrix(1.0 0.0 0.0 1.0 15.6 13.78)"><path d="M 5.95 0 C 5.22 0.18 2.01 1.19 0 2.29 L 0 -2.29 C 2.01 -1.19 5.22 -0.18 5.95 0 Z"></path></g></g><g stroke-width="0.65pt"><g style="--ltx-stroke-color:#797F85;" stroke="#797F85"><path style="fill:none" d="M 138.07 13.78 L 169.14 13.78"></path><g style="--ltx-fill-color:#797F85;" fill="#797F85" stroke-dasharray="none" stroke-dashoffset="0.0pt" stroke-linejoin="miter" transform="matrix(1.0 0.0 0.0 1.0 169.14 13.78)"><path d="M 5.95 0 C 5.22 0.18 2.01 1.19 0 2.29 L 0 -2.29 C 2.01 -1.19 5.22 -0.18 5.95 0 Z"></path></g></g><g style="--ltx-stroke-color:#000000;--ltx-fill-color:#000000;" transform="matrix(1.0 0.0 0.0 1.0 138.18 -10.46)" fill="#000000" stroke="#000000"><g transform="matrix(1 0 0 -1 0 16.41)"><g transform="matrix(1 0 0 1 0 7.26)"><g transform="matrix(1 0 0 -1 0 0)"><text transform="matrix(1 0 0 -1 0 0)">6/12/24</text></g></g> <g transform="matrix(1 0 0 1 0 16.42)"><g transform="matrix(1 0 0 -1 5.56 0)"><text transform="matrix(1 0 0 -1 0 0)">labels</text></g></g></g></g></g> <g style="--ltx-stroke-color:#1769AA;--ltx-fill-color:#E8F2FA;" stroke="#1769AA" fill="#E8F2FA"><path d="M -87.61 -13.78 L -211.6 -13.78 C -213.13 -13.78 -214.37 -15.02 -214.37 -16.55 L -214.37 -42.51 C -214.37 -44.04 -213.13 -45.28 -211.6 -45.28 L -87.61 -45.28 C -86.08 -45.28 -84.84 -44.04 -84.84 -42.51 L -84.84 -16.55 C -84.84 -15.02 -86.08 -13.78 -87.61 -13.78 Z M -214.37 -45.28"></path></g><g style="--ltx-stroke-color:#000000;--ltx-fill-color:#000000;" transform="matrix(1.0 0.0 0.0 1.0 -210.22 -38.29)" fill="#000000" stroke="#000000"><g transform="matrix(1 0 0 -1 0 18.91)"><g transform="matrix(1 0 0 1 0 7.69)"><g transform="matrix(1 0 0 -1 0 0)"><text transform="matrix(1 0 0 -1 0 0)">mean neighbor memory</text></g></g> <g transform="matrix(1 0 0 1 0 18.91)"><g transform="matrix(1 0 0 -1 50.16 0)"><foreignObject style="--ltx-fo-width:1.78em;--ltx-fo-height:0.77em;--ltx-fo-depth:0.12em;" width="20.91" height="10.45" transform="matrix(1 0 0 -1 0 9.07)" overflow="visible"><math xmlns="http://www.w3.org/1998/Math/MathML" display="inline" data-latex="\bar{h}_{t-1}^{,i}"><semantics><msubsup><mover accent="true"><mi mathsize="0.800em">h</mi> <mo mathsize="0.800em">¯</mo></mover> <mrow><mi mathsize="0.800em">t</mi> <mo mathsize="0.800em">−</mo> <mn mathsize="0.800em">1</mn></mrow><mrow><mo mathsize="0.800em">,</mo><mi mathsize="0.800em">i</mi></mrow></msubsup> <annotation encoding="application/x-tex">\bar{h}_{t-1}^{,i}</annotation></semantics></math></foreignObject></g></g></g></g> <g style="--ltx-stroke-color:#1769AA;" stroke-width="0.8pt" stroke="#1769AA"><path style="fill:none" d="M -149.61 -13.5 L -149.61 -10.82"></path><g transform="matrix(0.0 1.0 -1.0 0.0 -149.61 -10.82)" stroke-dasharray="none" stroke-dashoffset="0.0pt" stroke-linejoin="miter"><path d="M 6.37 0 C 5.58 0.19 2.15 1.28 0 2.46 L 0 -2.46 C 2.15 -1.28 5.58 -0.19 6.37 0 Z"></path></g></g><g style="--ltx-stroke-color:#6A7178;--ltx-fill-color:#6A7178;" transform="matrix(1.0 0.0 0.0 1.0 -327.01 -37.08)" fill="#6A7178" stroke="#6A7178"><g style="--ltx-fg-color:#6A7178;" transform="matrix(1 0 0 -1 0 17.26)" color="#6A7178"><g transform="matrix(1 0 0 1 0 7.69)"><g transform="matrix(1 0 0 -1 0 0)"><text style="--ltx-fg-color:#000000;" transform="matrix(1 0 0 -1 0 0)" color="#000000">no global pool; no clock</text></g></g> <g transform="matrix(1 0 0 1 0 17.26)"><g transform="matrix(1 0 0 -1 15.15 0)"><text style="--ltx-fg-color:#000000;" transform="matrix(1 0 0 -1 0 0)" color="#000000">zero action inputs</text></g></g></g></g> <g style="--ltx-stroke-color:#1769AA;--ltx-fill-color:#1769AA;" transform="matrix(1.0 0.0 0.0 1.0 -89.76 -37.21)" fill="#1769AA" stroke="#1769AA"><g style="--ltx-fg-color:#1769AA;" transform="matrix(1 0 0 -1 0 18.14)" color="#1769AA"><g transform="matrix(1 0 0 1 0 7.69)"><g transform="matrix(1 0 0 -1 0 0)"><text style="--ltx-fg-color:#000000;" transform="matrix(1 0 0 -1 0 0)" color="#000000">one message round</text></g></g> <g transform="matrix(1 0 0 1 0 18.14)"><g transform="matrix(1 0 0 -1 5.68 0)"><text style="--ltx-fg-color:#000000;" transform="matrix(1 0 0 -1 0 0)" color="#000000">256 B/edge/step</text></g></g></g></g> <g style="--ltx-stroke-color:#E8872D;--ltx-fill-color:#FCEEDF;" stroke="#E8872D" fill="#FCEEDF"><path d="M 126.17 -32.8 L 35.25 -32.8 C 33.72 -32.8 32.48 -34.04 32.48 -35.57 L 32.48 -54.98 C 32.48 -56.51 33.72 -57.75 35.25 -57.75 L 126.17 -57.75 C 127.7 -57.75 128.94 -56.51 128.94 -54.98 L 128.94 -35.57 C 128.94 -34.04 127.7 -32.8 126.17 -32.8 Z M 32.48 -57.75"></path></g><g style="--ltx-stroke-color:#000000;--ltx-fill-color:#000000;" transform="matrix(1.0 0.0 0.0 1.0 37.28 -52.83)" fill="#000000" stroke="#000000"><g transform="matrix(1 0 0 -1 0 17.26)"><g transform="matrix(1 0 0 1 0 7.69)"><g transform="matrix(1 0 0 -1 0 0)"><text transform="matrix(1 0 0 -1 0 0)">JEPA target loss</text></g></g> <g transform="matrix(1 0 0 1 0 17.26)"><g transform="matrix(1 0 0 -1 1.1 0)"><text transform="matrix(1 0 0 -1 0 0)">to every receiver</text></g></g></g></g> <g style="--ltx-stroke-color:#E8872D;--ltx-fill-color:#E8872D;" transform="matrix(1.0 0.0 0.0 1.0 -317.95 -77.58)" fill="#E8872D" stroke="#E8872D"><foreignObject style="--ltx-fg-color:#E8872D;--ltx-fo-width:10.63em;--ltx-fo-height:0.6em;--ltx-fo-depth:0em;" width="169.1" height="9.49" transform="matrix(1 0 0 -1 0 9.49)" overflow="visible" color="#E8872D"><span id="S1.F1.pic1.19.19.19.19.1.1">PRETRAINING ONLY</span></foreignObject></g> <g style="--ltx-stroke-color:#8F9499;--ltx-fill-color:#F3F4F4;" stroke="#8F9499" fill="#F3F4F4"><path d="M -206.46 -92.52 L -325.03 -92.52 C -326.56 -92.52 -327.8 -93.76 -327.8 -95.29 L -327.8 -121.25 C -327.8 -122.78 -326.56 -124.02 -325.03 -124.02 L -206.46 -124.02 C -204.93 -124.02 -203.69 -122.78 -203.69 -121.25 L -203.69 -95.29 C -203.69 -93.76 -204.93 -92.52 -206.46 -92.52 Z M -327.8 -124.02"></path></g><g style="--ltx-stroke-color:#000000;--ltx-fill-color:#000000;" transform="matrix(1.0 0.0 0.0 1.0 -323.65 -115.68)" fill="#000000" stroke="#000000"><g transform="matrix(1 0 0 -1 0 16.97)"><g transform="matrix(1 0 0 1 0 7.69)"><g transform="matrix(1 0 0 -1 0 0)"><text transform="matrix(1 0 0 -1 0 0)">privileged swarm state</text></g></g> <g transform="matrix(1 0 0 1 0 16.97)"><g transform="matrix(1 0 0 -1 28.65 0)"><foreignObject style="--ltx-fo-width:4.97em;--ltx-fo-height:0.61em;--ltx-fo-depth:0.18em;" width="58.5" height="9.29" transform="matrix(1 0 0 -1 0 7.13)" overflow="visible"><span id="S1.F1.pic1.20.20.20.20.2.2.2.2.1" style="font-size:80%;">at</span> <math xmlns="http://www.w3.org/1998/Math/MathML" display="inline" data-latex="t{+}2,t{+}4"><semantics><mrow><mrow><mi mathsize="0.800em">t</mi> <mo mathsize="0.800em">+</mo> <mn mathsize="0.800em">2</mn></mrow><mo mathsize="0.800em">,</mo><mrow><mi mathsize="0.800em">t</mi> <mo mathsize="0.800em">+</mo> <mn mathsize="0.800em">4</mn></mrow></mrow> <annotation encoding="application/x-tex">t{+}2,t{+}4</annotation></semantics></math></foreignObject></g></g></g></g> <g style="--ltx-stroke-color:#8F9499;--ltx-fill-color:#F3F4F4;" stroke="#8F9499" fill="#F3F4F4"><path d="M -93.65 -92.52 L -205.57 -92.52 C -207.09 -92.52 -208.33 -93.76 -208.33 -95.29 L -208.33 -121.25 C -208.33 -122.78 -207.09 -124.02 -205.57 -124.02 L -93.65 -124.02 C -92.12 -124.02 -90.88 -122.78 -90.88 -121.25 L -90.88 -95.29 C -90.88 -93.76 -92.12 -92.52 -93.65 -92.52 Z M -208.33 -124.02"></path></g><g style="--ltx-stroke-color:#000000;--ltx-fill-color:#000000;" transform="matrix(1.0 0.0 0.0 1.0 -204.18 -116.45)" fill="#000000" stroke="#000000"><g transform="matrix(1 0 0 -1 0 17.53)"><g transform="matrix(1 0 0 1 0 7.69)"><g transform="matrix(1 0 0 -1 0 0)"><text transform="matrix(1 0 0 -1 0 0)">frozen target encoder</text></g></g> <g transform="matrix(1 0 0 1 0 17.53)"><g transform="matrix(1 0 0 -1 15.66 0)"><text transform="matrix(1 0 0 -1 0 0)">+ set tokenizer</text></g></g></g></g> <g style="--ltx-stroke-color:#E8872D;--ltx-fill-color:#FCEEDF;" stroke="#E8872D" fill="#FCEEDF"><path d="M 18.89 -92.52 L -77.94 -92.52 C -79.47 -92.52 -80.71 -93.76 -80.71 -95.29 L -80.71 -121.25 C -80.71 -122.78 -79.47 -124.02 -77.94 -124.02 L 18.89 -124.02 C 20.41 -124.02 21.65 -122.78 21.65 -121.25 L 21.65 -95.29 C 21.65 -93.76 20.41 -92.52 18.89 -92.52 Z M -80.71 -124.02"></path></g><g style="--ltx-stroke-color:#000000;--ltx-fill-color:#000000;" transform="matrix(1.0 0.0 0.0 1.0 -75.97 -116.25)" fill="#000000" stroke="#000000"><g transform="matrix(1 0 0 -1 0 18.11)"><g transform="matrix(1 0 0 1 0 7.56)"><g transform="matrix(1 0 0 -1 21.57 0)"><foreignObject style="--ltx-fo-width:4.23em;--ltx-fo-height:0.64em;--ltx-fo-depth:0.24em;" width="49.75" height="10.42" transform="matrix(1 0 0 -1 0 7.56)" overflow="visible"><span id="S1.F1.pic1.21.21.21.21.4.4.2.2.1" style="font-size:80%;">one</span> <math xmlns="http://www.w3.org/1998/Math/MathML" display="inline" data-latex="Z_{t+h}"><semantics><msub><mi mathsize="0.800em">Z</mi> <mrow><mi mathsize="0.800em">t</mi> <mo mathsize="0.800em">+</mo> <mi mathsize="0.800em">h</mi></mrow></msub> <annotation encoding="application/x-tex">Z_{t+h}</annotation></semantics></math></foreignObject></g></g> <g transform="matrix(1 0 0 1 0 18.11)"><g transform="matrix(1 0 0 -1 0 0)"><foreignObject style="--ltx-fo-width:7.9em;--ltx-fo-height:0.65em;--ltx-fo-depth:0.18em;" width="92.88" height="9.84" transform="matrix(1 0 0 -1 0 7.69)" overflow="visible"><span id="S1.F1.pic1.22.22.22.22.5.5.3.3.1" style="font-size:80%;">global</span> <math xmlns="http://www.w3.org/1998/Math/MathML" display="inline" data-latex="+"><semantics><mo mathsize="0.800em">+</mo> <annotation encoding="application/x-tex">+</annotation></semantics></math> <math xmlns="http://www.w3.org/1998/Math/MathML" display="inline" data-latex="4\!\times\!4"><semantics><mrow><mn mathsize="0.800em">4</mn> <mo lspace="0.052em" mathsize="0.800em" rspace="0.052em">×</mo> <mn mathsize="0.800em">4</mn></mrow> <annotation encoding="application/x-tex">4\!\times\!4</annotation></semantics></math> <span id="S1.F1.pic1.24.24.24.24.7.7.5.5.3" style="font-size:80%;">field</span></foreignObject></g></g></g></g> <g style="--ltx-stroke-color:#8F9499;--ltx-fill-color:#F3F4F4;" stroke="#8F9499" fill="#F3F4F4"><path d="M 156.9 -92.52 L 28.14 -92.52 C 26.62 -92.52 25.38 -93.76 25.38 -95.29 L 25.38 -121.25 C 25.38 -122.78 26.62 -124.02 28.14 -124.02 L 156.9 -124.02 C 158.42 -124.02 159.66 -122.78 159.66 -121.25 L 159.66 -95.29 C 159.66 -93.76 158.42 -92.52 156.9 -92.52 Z M 25.38 -124.02"></path></g><g style="--ltx-stroke-color:#000000;--ltx-fill-color:#000000;" transform="matrix(1.0 0.0 0.0 1.0 29.53 -115.46)" fill="#000000" stroke="#000000"><g transform="matrix(1 0 0 -1 0 16.53)"><g transform="matrix(1 0 0 1 0 7.69)"><g transform="matrix(1 0 0 -1 0 0)"><foreignObject style="--ltx-fo-width:10.77em;--ltx-fo-height:0.65em;--ltx-fo-depth:0.1em;" width="126.64" height="8.84" transform="matrix(1 0 0 -1 0 7.69)" overflow="visible"><math xmlns="http://www.w3.org/1998/Math/MathML" display="inline" data-latex="+\ \lambda=2"><semantics><mrow><mrow><mo mathsize="0.800em">+</mo> <mi mathsize="0.800em">λ</mi></mrow> <mo mathsize="0.800em">=</mo> <mn mathsize="0.800em">2</mn></mrow> <annotation encoding="application/x-tex">+\ \lambda=2</annotation></semantics></math> <span id="S1.F1.pic1.25.25.25.25.2.2.2.2.1" style="font-size:80%;">receiver anchor</span></foreignObject></g></g> <g transform="matrix(1 0 0 1 0 16.53)"><g transform="matrix(1 0 0 -1 15.78 0)"><text transform="matrix(1 0 0 -1 0 0)">training-only head</text></g></g></g></g> <g style="--ltx-stroke-color:#B8433F;" stroke="#B8433F"><path style="fill:none" d="M 283.46 -95.35 L 161.42 -95.35 C 159.89 -95.35 158.66 -96.59 158.66 -98.12 L 158.66 -118.41 C 158.66 -119.94 159.89 -121.18 161.42 -121.18 L 283.46 -121.18 C 284.99 -121.18 286.23 -119.94 286.23 -118.41 L 286.23 -98.12 C 286.23 -96.59 284.99 -95.35 283.46 -95.35 Z M 158.66 -121.18"></path></g><g style="--ltx-stroke-color:#B8433F;--ltx-fill-color:#B8433F;" transform="matrix(1.0 0.0 0.0 1.0 162.81 -114.88)" fill="#B8433F" stroke="#B8433F"><g style="--ltx-fg-color:#B8433F;" transform="matrix(1 0 0 -1 0 15.37)" color="#B8433F"><g transform="matrix(1 0 0 1 0 7.69)"><g transform="matrix(1 0 0 -1 7.35 0)"><text style="--ltx-fg-color:#000000;" transform="matrix(1 0 0 -1 0 0)" color="#000000">removed at runtime:</text></g></g><g transform="matrix(1 0 0 1 0 15.38)"><g transform="matrix(1 0 0 -1 0 0)"><text style="--ltx-fg-color:#000000;" transform="matrix(1 0 0 -1 0 0)" color="#000000">target path and anchor</text></g></g></g></g></g><g style="--ltx-stroke-color:#E8872D;" stroke-width="0.7pt" stroke="#E8872D" stroke-dasharray="3.0pt,3.0pt" stroke-dashoffset="0.0pt"><path style="fill:none" d="M -203.42 -108.27 L -200.58 -108.27"></path><g style="--ltx-fill-color:#E8872D;" fill="#E8872D" stroke-dasharray="none" stroke-dashoffset="0.0pt" stroke-linejoin="miter" transform="matrix(-1.0 0.0 0.0 -1.0 -200.58 -108.27)"><path d="M 6.09 0 C 5.34 0.18 2.05 1.22 0 2.35 L 0 -2.35 C 2.05 -1.22 5.34 -0.18 6.09 0 Z"></path></g></g><g style="--ltx-stroke-color:#E8872D;" stroke-width="0.7pt" stroke="#E8872D" stroke-dasharray="3.0pt,3.0pt" stroke-dashoffset="0.0pt"><path style="fill:none" d="M -90.6 -108.27 L -89.01 -108.27"></path><g style="--ltx-fill-color:#E8872D;" fill="#E8872D" stroke-dasharray="none" stroke-dashoffset="0.0pt" stroke-linejoin="miter" transform="matrix(1.0 0.0 0.0 1.0 -89.01 -108.27)"><path d="M 6.09 0 C 5.34 0.18 2.05 1.22 0 2.35 L 0 -2.35 C 2.05 -1.22 5.34 -0.18 6.09 0 Z"></path></g></g><g style="--ltx-stroke-color:#E8872D;" stroke-width="0.7pt" stroke="#E8872D" stroke-dasharray="3.0pt,3.0pt" stroke-dashoffset="0.0pt"><path style="fill:none" d="M 21.93 -108.27 L 17.07 -108.27"></path><g style="--ltx-fill-color:#E8872D;" fill="#E8872D" stroke-dasharray="none" stroke-dashoffset="0.0pt" stroke-linejoin="miter" transform="matrix(1.0 0.0 0.0 1.0 17.07 -108.27)"><path d="M 6.09 0 C 5.34 0.18 2.05 1.22 0 2.35 L 0 -2.35 C 2.05 -1.22 5.34 -0.18 6.09 0 Z"></path></g></g><g style="--ltx-stroke-color:#E8872D;" stroke-width="0.7pt" stroke="#E8872D" stroke-dasharray="3.0pt,3.0pt" stroke-dashoffset="0.0pt"><path style="fill:none" d="M 159.94 -108.27 L 166.4 -108.27"></path><g style="--ltx-fill-color:#E8872D;" fill="#E8872D" stroke-dasharray="none" stroke-dashoffset="0.0pt" stroke-linejoin="miter" transform="matrix(-1.0 0.0 0.0 -1.0 166.4 -108.27)"><path d="M 6.09 0 C 5.34 0.18 2.05 1.22 0 2.35 L 0 -2.35 C 2.05 -1.22 5.34 -0.18 6.09 0 Z"></path></g></g><g style="--ltx-stroke-color:#E8872D;" stroke-width="0.7pt" stroke="#E8872D" stroke-dasharray="3.0pt,3.0pt" stroke-dashoffset="0.0pt"><path style="fill:none" d="M -29.53 -92.24 L 25.18 -61.92"></path><g style="--ltx-fill-color:#E8872D;" fill="#E8872D" stroke-dasharray="none" stroke-dashoffset="0.0pt" stroke-linejoin="miter" transform="matrix(0.87463 0.48479 -0.48479 0.87463 25.18 -61.92)"><path d="M 6.09 0 C 5.34 0.18 2.05 1.22 0 2.35 L 0 -2.35 C 2.05 -1.22 5.34 -0.18 6.09 0 Z"></path></g></g><g style="--ltx-stroke-color:#E8872D;" stroke-width="0.7pt" stroke="#E8872D" stroke-dasharray="3.0pt,3.0pt" stroke-dashoffset="0.0pt"><path style="fill:none" d="M 80.71 -32.52 L 80.71 -10.27"></path><g style="--ltx-fill-color:#E8872D;" fill="#E8872D" stroke-dasharray="none" stroke-dashoffset="0.0pt" stroke-linejoin="miter" transform="matrix(0.0 1.0 -1.0 0.0 80.71 -10.27)"><path d="M 6.09 0 C 5.34 0.18 2.05 1.22 0 2.35 L 0 -2.35 C 2.05 -1.22 5.34 -0.18 6.09 0 Z"></path></g></g></g></svg>

Figure 1: One future, every robot. At deployment, robot $i$ uses only its local history and received recurrent memories to output $\widehat{Z}_{t+4}^{,i}$; robot $j$ independently predicts the same shared target. The privileged future path and receiver anchor exist only during pretraining. The reconstruction reference keeps the blue path, output width, and identical receiver anchor, but replaces latent-target prediction with a training-only raw-state decoder.

## II Related Work

### II-A Global information from local interactions

Swarm models exploit exchangeability through mean embeddings, invariant set functions, or graph neural networks [^17] [^8] [^14]. Otte’s artificial group mind distributes one wireless neural network across a physical swarm to classify present environmental patterns from collective sensing [^13]. Global State Prediction (GSP) instead trains decentralized agents to predict a future global-state change for policy learning [^4]; GSP-N adds local, bandwidth-limited communication for collective transport [^5]. Distributed spatial awareness constructs a shared present-day coordinate frame via local factor graphs and message passing, including physical-robot validation [^9]. These works motivate locally constructed global information, but do not test a JEPA objective for label-efficient prediction of one future collective target at every robot. Our deployment-matched, GSP-style direct-supervised diagnostic tests that task abstraction under the same receiver-local interface; it is not a reimplementation of either policy system.

### II-B Predictive representations for multiple agents

MASIA self-supervises a compact message aggregate by reconstructing and predicting future information [^7]; TIMAR uses a joint transition model to inform local representations [^6]. Recent multi-agent world models combine decentralized dynamics with centralized aggregation [^18], disentangle local and joint latent states [^15], or learn decentralized communication and coordination [^12]. Their principal endpoints are policy return, imagined dynamics, or emergent communication. We make the shared future state itself the measurable endpoint: $N$ receiver-local estimates of one swarm-level quantity, evaluated for label efficiency and cross-robot agreement before control.

### II-C JEPA beyond single observations

JEPA predicts latent targets rather than reconstructing all observation detail, from images to video [^10] [^1] [^3]. Population-level JEPA demonstrates that a set can itself be the learning object, albeit for biological populations and a centralized context [^2]. V2X-JEPA applies multi-agent joint-embedding prediction to V2V/V2I cooperative perception, reports competitive detection with 85% fewer annotations, and evaluates communication disruption [^11]. Its endpoint is fused object detection from cooperative sensor streams, rather than $N$ receiver-local predictions of one size-invariant future swarm state. TrajJEPA targets multi-agent trajectory forecasting [^16]. These closest contemporaries reinforce the value and label efficiency of latent multi-agent prediction, but neither studies our decentralized common-target endpoint. CS-JEPA addresses this open task with a fixed decentralized interface and independent label-efficiency evidence.

## III Problem Formulation

At time $t$, the active swarm is a dynamic graph $\mathcal{G}_{t}=(\mathcal{V}_{t},\mathcal{E}_{t})$. Robot $i$ observes a receiver-indexed local view $o_{t}^{i}$ and receives messages only from $\mathcal{N}_{t}(i)$. Its allowed information is

$$
\mathcal{I}_{t}^{i}=\left\{o_{t-15:t}^{i},\;\mathcal{N}_{t-15:t}(i),\;\left(m_{\tau}^{j\rightarrow i}\right)_{\begin{subarray}{c}\tau=t-15:t\\
j\in\mathcal{N}_{\tau}(i)\end{subarray}}\right\}.
$$

Here $o_{t}^{i}$ contains only robot $i$ ’s normalized world position, velocity, two-dimensional task vector, and active bit, all in a shared normalized world frame. The task vector is the desired heading $(1,0)$ for flocking and the world-size-normalized displacement from robot $i$ to its assigned target for formation and coverage. Raw neighbor features are unavailable: neighbors contribute only their previous 64-float recurrent memories. The normalized episode clock is zeroed and recorded future actions are not provided. We seek a single permutation-invariant future target $Z_{t+h}=T_{\xi}(S_{t+h})$ for the whole active set, but a distinct prediction is produced at every robot:

$$
\widehat{Z}_{t+h}^{,i}=P_{\theta}(\mathcal{I}_{t}^{i}),\qquad i\in\mathcal{V}_{t},\quad h\in\{2,4\}.
$$

The target is common; the information and prediction errors are receiver-specific. We call the final $h=4$ output collective\_prediction. No average over robot predictions is used as the primary representation.

For downstream evaluation, a probe $g_{\phi}$ maps each frozen $\widehat{Z}_{t+4}^{,i}$ to ten future collective quantities: polarization, target alignment, cohesion, dispersion, angular momentum, connectivity, normalized cluster count, collision fraction, mean speed, and task score. Thus, “collective state” denotes a learned global-plus-spatial latent target with an explicitly audited physical decoding task; it is not the concatenated state vector of all robots.

### III-A Decentralization and scaling semantics

Equation (2) defines $|\mathcal{V}_{t}|$ outputs, not one estimate copied back from a central node. Robots share parameters and target semantics, but robot $i$ retains its own hidden state and never reads robot $j$ ’s prediction. Information can travel beyond one hop only through successive recurrent updates, so a 16-frame context is not equivalent to instantaneous global access. This distinction matters when interpreting agreement: compatible predictions must emerge from differently filtered evidence.

For a directed communication graph, the prescribed traffic at one step is $256|\mathcal{E}_{t}|$ bytes in total and $256|\mathcal{N}_{t}(i)|$ bytes received by robot $i$. Mean aggregation fixes the tensor width presented to the GRU as degree changes; the tokenizer similarly fixes the output width as $N$ changes. These choices make model parameters independent of swarm size and keep per-robot traffic bounded on the degree-four training graphs. They do not make total network traffic independent of $N$, nor do they provide a centralized shortcut.

## IV Collective-State JEPA

### IV-A Receiver-local recurrent transport

A frozen local encoder maps robot $i$ ’s self observation to $e_{t}^{i}\in\mathbb{R}^{64}$. At every history step, each active robot broadcasts only its previous recurrent state. Receiver $i$ computes

$$
\displaystyle\bar{h}_{t-1}^{,i}
$$
 
$$
\displaystyle=\frac{1}{|\mathcal{N}_{t}(i)|}\sum_{j\in\mathcal{N}_{t}(i)}h_{t-1}^{j},
$$
$$
\displaystyle h_{t}^{i}
$$
 
$$
\displaystyle=\operatorname{GRU}([e_{t}^{i},\bar{h}_{t-1}^{,i}],h_{t-1}^{i}).
$$

We set $\bar{h}_{t-1}^{,i}=0$ when $\mathcal{N}_{t}(i)=\varnothing$, matching the masked-mean implementation. Updates are synchronous, use one message round per environment step, and send 64 float32 values (256 bytes) per directed edge. With 16 frames, the measured warm-up is 15 message steps. There is no memory-consensus mixing and no global readout at inference.

### IV-B One variable-size future target

The frozen target encoder embeds every active future robot. A permutation-invariant tokenizer then forms one global token and a $4\times 4$ spatial field. At anchor $a_{k}$,

$$
\displaystyle z_{k}
$$
 
$$
\displaystyle=\left[\frac{\sum_{j}w_{jk}e_{t+h}^{j}}{\sum_{j}w_{jk}},\;\frac{\sum_{j}w_{jk}}{|\mathcal{V}_{t+h}|}\right],
$$
$$
\displaystyle w_{jk}
$$
 
$$
\displaystyle=\exp\!\left[-\frac{\|p_{j}-a_{k}\|^{2}}{2\sigma^{2}}\right].
$$

with $\sigma=0.22$. The global token uses the active-set mean embedding and a presence mass. Seventeen 65-D tokens produce a fixed 1105-D $Z_{t+h}$ regardless of swarm size. Token roles are fixed; future graph adjacency is not encoded into this registered target.

A role-conditioned predictor recursively forecasts $t{+}2$ then $t{+}4$, stopping the gradient through its first prediction. Let $\mathcal{B}$ be a minibatch, $\mathcal{H}=\{2,4\}$, $D_{Z}=1105$, and $M_{Z}=\max\{1,|\mathcal{H}|\sum_{b\in\mathcal{B}}|\mathcal{V}_{t}^{b}|\}$. The implemented common-target reduction is

$$
\mathcal{L}_{\mathrm{CS}}=\frac{1}{M_{Z}}\sum_{\begin{subarray}{c}b\in\mathcal{B},\;i\in\mathcal{V}_{t}^{b}\\
h\in\mathcal{H}\end{subarray}}\frac{\|\widehat{Z}_{t+h}^{b,i}-\operatorname{sg}(Z_{t+h}^{b})\|_{2}^{2}}{D_{Z}}.
$$

Agreement is intentionally not optimized: its loss weight is zero.

### IV-C Receiver anchor and matched reconstruction

Predicting only a set target can discard the receiver’s own dynamics. A training-only MLP therefore predicts that receiver’s frozen future embedding $e_{t+h}^{b,i}$ from $h_{t}^{b,i}$. With $\mathcal{Q}=\{(b,i,h):b\in\mathcal{B},\;h\in\mathcal{H},\;i\in\mathcal{V}_{t}^{b}\cap\mathcal{V}_{t+h}^{b}\}$, $D_{e}=64$, and $M_{e}=\max\{1,|\mathcal{Q}|\}$, the implemented objective is

$$
\displaystyle\mathcal{L}_{\mathrm{anchor}}
$$
 
$$
\displaystyle=\frac{1}{M_{e}}\sum_{(b,i,h)\in\mathcal{Q}}\frac{\|\widehat{e}_{t+h}^{b,i}-\operatorname{sg}(e_{t+h}^{b,i})\|_{2}^{2}}{D_{e}},
$$
$$
\displaystyle\mathcal{L}_{\mathrm{CS\text{-}JEPA}}
$$
 
$$
\displaystyle=\mathcal{L}_{\mathrm{CS}}+\lambda\mathcal{L}_{\mathrm{anchor}},\qquad\lambda=2.
$$

The weight was nominated after development experiments, then frozen before the independent cohort; no weight or architecture search used follow-up data. The anchor head is absent from predict\_collective and deployment counts.

The primary reference, Future-Recon, preserves the frozen encoder, recurrent messages, role-conditioned predictor, 1105-D bottleneck, optimization schedule, probe, and deployment parameter count. It also uses the same $\lambda=2$ receiver anchor: the MLP shape, recurrent-memory input, same-agent frozen future-embedding target, masking, and reduction are identical. Only the primary self-supervised target changes: a training-only decoder reconstructs a global-plus-spatial field of normalized future position $(x,y)$, velocity $(v_{x},v_{y})$, and task-vector $(q_{x},q_{y})$ features, with the same relative-density mass coordinate, instead of predicting the frozen latent field. Paired methods begin from bitwise-identical shared-state initialization. CS-JEPA has 139,137 online trainable pretraining parameters, while Future-Recon has 148,744 because its training-only raw decoder adds 9,607 parameters. Both deploy 123,713 representation parameters (134,773 including the probe), making a CS-JEPA win conservative with respect to train-time capacity. Writing the decoded raw field as $\widehat{R}_{t+h}^{b,i}$ and its target as $R_{t+h}^{b}\in\mathbb{R}^{D_{R}}$, $D_{R}=17(6+1)=119$, its matched objective is

$$
\mathcal{L}_{\mathrm{FR}}=\frac{1}{M_{Z}}\sum_{\begin{subarray}{c}b\in\mathcal{B},\;i\in\mathcal{V}_{t}^{b}\\
h\in\mathcal{H}\end{subarray}}\frac{\|\widehat{R}_{t+h}^{b,i}-R_{t+h}^{b}\|_{2}^{2}}{D_{R}}+\lambda\mathcal{L}_{\mathrm{anchor}}.
$$

### IV-D Training-to-deployment separation

The two branches have deliberately different information privileges. During pretraining, the online branch is unrolled independently for every receiver using only (1). The target branch computes $Z_{t+h}$ once from the future active set and supplies that same stopped-gradient target to every active receiver in (6). It does not inject future state into the GRU, messages, or predictor. The receiver-anchor head likewise contributes only a training loss; its output is never concatenated to collective\_prediction. Consequently, privileged future state defines what the representation should predict without becoming an inference input.

After checkpoint selection, we discard the target encoder, tokenizer, reconstruction decoder, and anchor head. The local encoder and recurrent predictor are frozen, and the ridge probe is fit from the receiver-local $h=4$ predictions. Each robot therefore runs the same parameterized function but carries a different recurrent state and generally incurs a different prediction error. The shared object is the target semantics, not a synchronized latent variable or a server-produced estimate. Table I collects the resulting fixed contract.

TABLE I: Fixed representation and deployment contract.

| Component | Registered setting |
| --- | --- |
| Local temporal context | 16 frames, clock zeroed, actions zero |
| Prediction horizons | $t{+}2$ and $t{+}4$ |
| Shared target | 1 global $+$ $4\!\times\!4$ spatial tokens |
| Target width | 65 per token; 1105 total |
| Recurrent message | 64 float32 values from previous step |
| Communication | 1 synchronous round; 256 B/edge/step |
| Message warm-up | 15 steps before a full 16-frame context |
| Deployment size | 123,713 representation parameters |
| With ten-output probe | 134,773 parameters |
| Privileged target path | pretraining only; absent at inference |

## V Experimental Protocol

### V-A Independent cohort and training

For the target-isolation follow-up, we froze the protocol and generated a new data family only afterward. It contains three tasks (flocking, formation, coverage), 200-step episodes, process noise 0.02, and no observation noise. Training and ID use bounded-small-world graphs with $N\in\{10,18\}$ and maximum degree four. Table II shows the splits. Ring and mutual- $k$ NN are topology shifts; the size split uses $N\in\{36,72,108\}$, unseen and up to $6\times$ the largest training swarm.

TABLE II: Prospectively registered follow-up data family.

| Split | Graph | Robots | Episodes |
| --- | --- | --- | --- |
| Train / label pool | small world | 10, 18 | 120 |
| Model selection only | small world | 10, 18 | 30 |
| ID test | small world | 10, 18 | 30 |
| Topology OOD | ring | 10, 18 | 30 |
| Topology OOD | mutual- $k$ NN | 10, 18 | 30 |
| Size OOD | small world | 36, 72, 108 | 27 |

Both methods train for 50 epochs with batch size 256, Adam learning rate $5\!\times\!10^{-4}$, cosine weight decay $10^{-7}\!\rightarrow\!10^{-6}$, and gradient clipping at 1.0. Hidden and latent widths are 128 and 64. The same frozen stage-0 encoder is used by both methods and all five outer seeds; it was selected without follow-up data. Stage 0 is our separately trained mean-target CS-JEPA encoder on unlabeled swarm episodes, not an external pretrained model; both its context and target copies are loaded from the same sealed checkpoint and remain frozen. Checkpoints minimize the registered model-selection objective, one per method and seed.

### V-B Matched comparison and leakage controls

The comparison is paired at every level. CS-JEPA and Future-Recon use the same unlabeled pretraining episodes, 16-frame receiver histories, recurrent backbone, message payload, optimizer schedule, checkpoint-selection split, label subsets, ridge probe, and test episodes. The representation width, receiver anchor, and deployed parameter count are also equal. They differ in the primary self-supervised prediction problem and the raw reconstruction decoder: frozen latent-field prediction for CS-JEPA versus raw future-field reconstruction for Future-Recon. Thus, the prospective follow-up isolates the target family while giving the reference 9,607 additional training-only parameters. The comparison therefore isolates the collective prediction objective above a shared frozen JEPA-pretrained local encoder; it is not an end-to-end comparison of JEPA and reconstruction representation learning from scratch.

Downstream collective labels are hidden during representation learning. Label-subset selection is episode-level, stratified by task and training swarm size, nested within each draw, and performed without reading label values. Model-selection episodes choose one representation checkpoint per method and seed but never fit the downstream probe. ID, topology-OOD, and size-OOD evaluation episodes are excluded from both checkpoint and probe fitting. Finally, deployment audits call the online prediction path without target-global, target-adjacency, target-active, or collective-label tensors. Together with zeroed clock and action channels, these checks prevent three shortcuts: access to the answer through future inputs, episode-progress identification, and centralized aggregation at test time.

### V-C Label efficiency and endpoints

For each outer seed, we train a ridge probe ($\alpha=10^{-3}$) on 6, 12, or 24 globally labeled episodes. Five fixed, task-and-size-stratified draws are nested within each budget; subset selection does not inspect labels. Accuracy is fixed-physical-scale normalized MSE over the ten decoded quantities. Agreement is the MSE between decoded robot predictions within an episode. Lower is better for both.

More explicitly, for a time window with $N$ active robots, decoded predictions $\widehat{y}^{i}\in\mathbb{R}^{10}$, common target $y$, and preregistered physical scales $s_{d}$, the window contributions are

$$
\displaystyle E_{\mathrm{acc}}
$$
 
$$
\displaystyle=\frac{1}{10N}\sum_{i=1}^{N}\sum_{d=1}^{10}\left(\frac{\widehat{y}_{d}^{i}-y_{d}}{s_{d}}\right)^{2},
$$
$$
\displaystyle E_{\mathrm{agr}}
$$
 
$$
\displaystyle=\frac{1}{10N}\sum_{i=1}^{N}\sum_{d=1}^{10}\left(\widehat{y}_{d}^{i}-\overline{\widehat{y}}_{d}\right)^{2},\quad\overline{\widehat{y}}=\frac{1}{N}\sum_{i}\widehat{y}^{i}.
$$

The centroid in $E_{\mathrm{agr}}$ is used only to score dispersion after inference; it is not fed to any robot and is not the primary prediction. Window values are reduced to episode values and then task-balanced, so large swarms and long episodes do not silently receive more inferential weight.

The primary endpoint is the log-budget-span-normalized trapezoidal AUC, $\mathrm{AUC}=0.25E_{6}+0.50E_{12}+0.25E_{24}$, where $E_{k}$ is the error at label budget $k$. We report the paired effect $\Delta=\mathrm{AUC}_{Future-Recon}-\mathrm{AUC}_{CS-JEPA}$, so positive values favor CS-JEPA. Episode is the resampling unit within seed; training seed is the outer unit ($n=5$). We use 10,000 outer-seed bootstrap resamples. A split passes only if the accuracy lower 95% bound is positive, all five accuracy effects are positive, the agreement lower bound is nonnegative, and all five agreement effects are nonnegative. All four splits were required.

This aggregation avoids treating the many robot–time predictions from one learned model as independent evidence. Within each outer seed, evaluation episodes are task-stratified and the five fixed label-subset draws are retained as repeated measurements; method differences are paired on the same draw and evaluation data. Only the five independently trained seeds enter the outer uncertainty calculation. Using $\log_{2}$ budget gives equal horizontal width to the 6–12 and 12–24 label intervals, while AUC commits the comparison to the complete curve instead of selecting the most favorable budget after inspection.

### V-D Action-conditioned counterfactual value follow-up

Table I describes the primary zero-action target-isolation contract. Unlike that setting, the separate value follow-up trains matched action-conditioned CS-JEPA and Future-Recon variants with eight outer seeds. Each candidate four-step controller plan is provided to the predictor before collective\_prediction is produced. The predictors are then frozen, and only the scalar ridge readout is fitted. Both variants use the same frozen stage-0 encoder, receiver-local recurrent architecture, communication interface, receiver anchor, 25 candidate plans, and counterfactual data. For each receiver, the readout maps its corresponding plan-conditioned predictive representation concatenated with its own plan to $u(a)=\text{task}-0.5(1-\text{connectivity})-2\,\text{collision}$. Value MSE is computed on $u$. Pearson correlation and regret use $s(a)=u(a)-0.01\,\frac{1}{4}\sum_{\tau=1}^{4}\alpha_{\tau}^{2}-0.02|\alpha_{1}|$; the predicted score replaces $u(a)$ by $\widehat{u}(a)$ while retaining the same known costs. The readout is fit on 1,800 branches from 12 base episodes and evaluated on a disjoint sealed set of 1,800 branches from 12 new base episodes, 72 shared contexts, and $N\in\{8,16,32\}$. No robot averaging is used.

This exhaustive branch supervision is a planning-relevance test, not a label-efficiency test. The primary endpoint is paired value MSE; within-context candidate-score Pearson correlation is secondary. Pearson correlation is computed separately within each context–receiver group over its 25 candidate plans and then averaged arithmetically across groups within each seed, without a Fisher $z$ transform. Training seed is the outer unit ($n=8$), with an exact two-sided paired sign-flip test and a 100,000-resample outer-seed bootstrap interval.

### V-E Fully decentralized receiver-local closed loop

We next test whether the predictive representation can affect actions without adding a centralized planner. For each of 16 new outer seeds, we train fresh matched action-conditioned CS-JEPA and Future-Recon predictors and fit same-capacity receiver-local MLP plan heads using only the opened counterfactual branch-training set; no closed-loop outcomes enter head fitting. Both heads use the same listwise objective, $0.25$ -weighted score regression, $2.0$ -weighted class-balanced first-action classification, and $0.1$ -weighted within-context cross-receiver score-consistency loss. The comparison therefore tests which predictive representation better supports receiver decisions under identical control supervision. At every decision, each active robot independently queries the same library of 25 four-step swarm-wide recovery-mixture ($\alpha$) plans, scores the resulting receiver-specific collective\_prediction, selects its own argmax, and commits that plan for four steps. Predictions, scores, and selected plans are never pooled or averaged, there is no centralized selector, and no messages beyond the recurrent 256-byte-per-edge interface are introduced.

All methods receive paired episode seeds under a communication-radius failure ramp at $N=16$ and unseen $N=32$: four ramp start times with four episodes each give 32 fresh episodes per outer seed. Comparators are matched Future-Recon, a plan-only head, and nominal flocking control. We compare CS-JEPA with Future-Recon on equal-family-mean composite utility $u=\text{task}-0.5(1-\text{connectivity})-2\,\text{collision}$ and receiver decision consistency, and with nominal control on utility, task score, and connectivity. Training seed is the outer unit, with exact two-sided paired sign-flip tests and 100,000-resample outer-seed bootstrap intervals. We repeat utility versus nominal and the two consistency outcomes on 16 additional new training seeds and disjoint episode cohorts as a robustness check.

### V-F Follow-up integrity and provenance

The target-isolation protocol was frozen before generating the new cohort. Its aggregate was opened exactly once after all five seed artifacts and target-free deployment audits passed. Full hashes, manifests, and runtime records accompany the submission artifacts. These records audit implementation separation rather than onboard latency.

To place the primary result in a broader objective landscape, we also report a deployment-matched direct supervised diagnostic. Inspected development variants are kept separate from the two independent claim-confirming cohorts.

## VI Results

### VI-A Anchor-matched target isolation succeeds

All four registered comparisons satisfy the prespecified joint criterion (Table III). Every accuracy and agreement effect is positive in 5/5 outer seeds, and every lower confidence bound is above zero. The smallest effect is ID agreement (0.001342); the largest effects are 0.057156 accuracy and 0.098817 agreement, both on ring. The reported 5/5 signs expose the outer-seed consistency rather than treating episodes as independent replications. This prospective follow-up therefore supports the paper’s central target-specific claim: with receiver anchor, initialization, and deployment held fixed, predicting a common future latent target is more label-efficient than reconstructing the raw future field across all registered evaluation families.

TABLE III: Prospective anchor-matched follow-up. Values are reconstruction-minus-JEPA error AUC with 95% outer-seed CIs; positive favors CS-JEPA.

| Split | Accuracy $\Delta$ \[95% CI\] | Agreement $\Delta$ \[95% CI\] |
| --- | --- | --- |
| ID | .004636 \[.003741,.005530\] | .001342 \[.001142,.001554\] |
| Ring OOD | .057156 \[.048238,.066073\] | .098817 \[.067873,.133743\] |
| Mutual- $k$ NN | .053417 \[.048484,.061925\] | .072980 \[.059852,.087086\] |
| Size OOD | .042538 \[.036495,.048002\] | .079100 \[.058993,.095967\] |

The earlier independent GSP-style direct-supervised diagnostic in Table IV complements the primary comparison. CS-JEPA has lower accuracy AUC on all four splits, while direct supervision has lower decoded disagreement. This separates the demonstrated label-efficient accuracy benefit from the distinct behavior of explicitly supervised agreement. The diagnostic is a deployment-matched task abstraction, not a reimplementation of the full GSP/GSP-N policy systems; Table III remains the prospective anchor-matched target-isolation comparison.

TABLE IV: Earlier independent GSP-style direct-supervised diagnostic. Values are supervised-minus- CS-JEPA error AUC with 95% outer-seed CIs; positive favors CS-JEPA.

| Split | Accuracy $\Delta$ \[95% CI\] | Agreement $\Delta$ \[95% CI\] |
| --- | --- | --- |
| ID | .092186 \[.072828,.108237\] | $-$.000279 \[$-$.000364, $-$.000171\] |
| Ring OOD | .077291 \[.056962,.093891\] | $-$.020292 \[$-$.022331, $-$.018453\] |
| Mutual- $k$ NN | .077098 \[.056002,.094109\] | $-$.018909 \[$-$.023848, $-$.013970\] |
| Size OOD | .074240 \[.056935,.085822\] | $-$.013579 \[$-$.015135, $-$.012034\] |

Figure 2 gives the absolute view underlying the registered AUC effects. Every CS-JEPA curve lies below its matched reconstruction curve at every label budget and split, for both accuracy and agreement. Numerical integration of the plotted seed-level values exactly reproduces Table III. The advantage is therefore distributed across the full 6–24-label range rather than driven by one selected budget.

The joint movement of the two metrics is important. Low cross-robot disagreement alone could be obtained by collapsing every receiver to the same uninformative output. Here, however, agreement improves while physical-state prediction error also decreases at every registered split and label budget. Since agreement has zero direct loss weight, the result is consistent with a common future target organizing distinct local evidence into mutually compatible predictions. The simultaneous accuracy gain rules out trivial shared-output collapse, and the agreement gain emerges without an explicit consensus penalty.

![Refer to caption](https://arxiv.org/html/2607.28443v2/figures/absolute-label-curves.png)

Figure 2: Absolute label-efficiency curves on the anchor-matched follow-up. Points average five outer-seed estimates after averaging the five fixed label-subset draws and task-balanced evaluation episodes within each seed; bars are 95% outer-seed bootstrap intervals. Lower is better. The same frozen checkpoints, probes, budgets, and episodes produce the registered paired AUC effects in Table III. Each panel uses its own vertical scale; comparisons are within panel.

With five outer seeds, unanimous signs yield exact one-sided sign and sign-flip $p=0.03125$; the corresponding minimum two-sided value is 0.0625. We report these sensitivities alongside the prespecified outer-seed bootstrap analysis.

### VI-B Action-conditioned CS-JEPA improves counterfactual value estimation

Table V reports the sealed action-conditioned follow-up. Overall value MSE falls from 0.02847 to 0.01553, a 45.5% reduction. The paired difference is $-0.01294$ \[95% CI $-0.01936$, $-0.00877$\], favorable in 8/8 outer seeds with exact two-sided $p=0.0078125$. Within-context candidate-score Pearson correlation rises from 0.35042 to 0.47949, a paired increase of 0.12907 \[0.10449, 0.15447\], again favorable in 8/8 seeds with $p=0.0078125$. Both effects remain unanimous at $N=8$, $N=16$, and unseen $N=32$. Thus the action-conditioned CS-JEPA prediction carries planning-relevant information beyond the ten-variable decoding task.

TABLE V: Sealed eight-seed four-step value confirmation. Lower MSE is better; positive within-context Pearson $\Delta$ favors CS-JEPA. Every MSE and correlation effect favors CS-JEPA in 8/8 seeds ($p=0.0078125$ for every row and metric).

| Scope | CS-JEPA MSE | Future-Recon MSE | Reduction | Within-context Pearson $\Delta$ |
| --- | --- | --- | --- | --- |
| Overall | .01553 | .02847 | 45.46% | +.12907 |
| $N=8$ | .02011 | .04286 | 53.07% | +.13967 |
| $N=16$ | .01418 | .01768 | 19.77% | +.12105 |
| Unseen $N=32$ | .01228 | .02487 | 50.62% | +.13044 |

These estimation gains did not reduce selected-plan regret ($\Delta_{\mathrm{CS-FR}}=+0.00066$, 95% CI \[$-0.00310,+0.00398$\], $p=0.734$), for which lower is better. The fully decentralized study below therefore evaluates action consequences directly rather than treating branch-value estimation as closed-loop evidence.

### VI-C Common futures improve decentralized action consistency

Table VI reports the 16-new-training-seed closed-loop study. Relative to nominal flocking, receiver-local CS-JEPA planning improves composite utility, task score, and connectivity. Relative to deployment-matched Future-Recon, it raises the fraction of decisions at which all active receivers choose the same first plan coefficient and reduces pairwise first-coefficient disagreement. These are paired closed-loop outcomes from independently trained predictors, not post-hoc scores on fixed trajectories.

TABLE VI: Fully decentralized closed-loop study ($n=16$). $\Delta$ is CS-JEPA minus comparator; higher is better except for disagreement. CIs and tests use training seed as the outer unit.

| Outcome | Comparator | $\Delta$ \[95% CI\] | Fav. | $p$ |
| --- | --- | --- | --- | --- |
| Composite utility | Nominal | +.01053 \[.00623,.01456\] | 13/16 | .000702 |
| Task score | Nominal | +.00831 \[.00496,.01150\] | 13/16 | .000641 |
| Connectivity | Nominal | +.00444 \[.00205,.00680\] | 14/16 | .00381 |
| All-first- $\alpha$ agreement | Future-Recon | +.14472 \[.10282,.18618\] | 15/16 | .000061 |
| Pairwise first- $\alpha$ disagreement | Future-Recon | $-$.05888 \[$-$.07701, $-$.04048\] | 15/16 | .000122 |

Composite utility does not differ from Future-Recon ($\Delta=-0.00018$, 95% CI \[$-0.00574,+0.00524$\], $p=0.953$). The evidence instead supports two scoped claims: the predictive controller improves utility over nominal control, and the common-future target makes independently selected first coefficients more consistent than reconstruction under the same regularized head. The plan-only head selects nominal control in every evaluated episode and consequently matches its task, connectivity, and utility outcomes. A disjoint 16-seed robustness cohort reproduces the three principal positive effects: utility versus nominal is $+0.00716$ \[.00207,.01239\] ($p=0.0196$), agreement versus Future-Recon is $+0.13508$ \[.09028,.17836\] ($p=0.000153$), and disagreement is $-0.04995$ \[$-0.06852,-0.03102$\] ($p=0.000366$).

## VII Discussion and Limitations

The anchor-matched follow-up supports a coherent empirical pattern: a common future target gives each robot a representation that a small labeled probe can reuse across graph families and agent counts, with the largest gains under distribution shift. The receiver anchor improves the accuracy endpoint relative to unanchored development variants, and the simultaneous accuracy and agreement gains show that a shared target can align local evidence without an inter-robot agreement term in representation pretraining. The sealed action-conditioned follow-up further shows that a receiver-local scalar readout can recover counterfactual outcome value more accurately from CS-JEPA’s plan-conditioned predictive representation. In closed loop, the same receiver-local interface improves utility over nominal control and yields substantially more consistent first-coefficient choices than matched reconstruction across new predictor seeds.

The architecture supports size transfer in two complementary ways. Mean aggregation keeps the incoming message dimension fixed as neighborhood cardinality changes, and the set tokenizer maps any active swarm to the same 17-token layout. The parameter count and bytes per edge therefore do not grow with $N$, although total network traffic still scales with the number of directed edges. Empirically, the frozen representation and same probe procedure transfer from training at $N\in\{10,18\}$ to the evaluated $N\in\{36,72,108\}$ tests.

Limitations remain. The study is simulator-only and assumes shared normalized coordinates and noiseless observations; hardware transfer, onboard latency, and safety remain open. Pretraining uses privileged future swarm state, and the five-seed target-isolation study covers only the evaluated graph families and swarm sizes. Action-conditioned training uses exhaustive counterfactual supervision in which each branch applies one shared plan across the swarm, whereas decentralized execution can combine different receiver-selected plans. Closed-loop evidence therefore supports utility over nominal control and greater first-coefficient consistency under matched regularized heads, not utility superiority over Future-Recon or specialized controllers.

## VIII Conclusion

This paper asks a concrete question: can every locally informed robot predict one shared future state of its swarm? Under a fixed 256-byte-per-edge recurrent interface, the answer is yes in the studied label-efficiency setting. A frozen Collective-State JEPA outperforms anchor-matched future raw-state reconstruction on both prediction accuracy and inter-robot agreement across a prospectively registered five-seed ID/topology/size follow-up. A sealed eight-seed follow-up further shows lower four-step counterfactual value error and stronger within-context candidate-score correlation, including at unseen $N=32$. Finally, a 16-new-training-seed fully decentralized closed-loop study shows higher utility than nominal control and more consistent first-coefficient choices than matched reconstruction. These results support common-future JEPA targets as a label-efficient and coordination-relevant representation primitive for decentralized swarm prediction.

## Acknowledgment

OpenAI Codex was used under author supervision for language editing throughout all sections of the manuscript. The authors verified all claims, citations, analyses, code, and numerical results.

[^1]: M. Assran, Q. Duval, I. Misra, P. Bojanowski, P. Vincent, M. Rabbat, Y. LeCun, and N. Ballas (2023) Self-supervised learning from images with a joint-embedding predictive architecture. In Proceedings of the IEEE/CVF Conference on Computer Vision and Pattern Recognition (CVPR), pp. 15619–15629. External Links: [Document](https://dx.doi.org/10.1109/CVPR52729.2023.01499) Cited by: §I, §II-C.

[^2]: A. Bakulin and N. Yosef (2025) Learning population-level representations with joint embedding predictive architectures. Note: OpenReview submission to ICLR 2026Revised 11 February 2026 External Links: [Link](https://openreview.net/forum?id=MZDkttBUEd) Cited by: §II-C.

[^3]: A. Bardes, Q. Garrido, J. Ponce, X. Chen, M. Rabbat, Y. LeCun, M. Assran, and N. Ballas (2024) Revisiting feature prediction for learning visual representations from video. Transactions on Machine Learning Research. External Links: ISSN 2835-8856, [Link](https://openreview.net/forum?id=QaCCuDfBk2) Cited by: §II-C.

[^4]: J. Bloom, P. Paliwal, A. Mukherjee, and C. Pinciroli (2023) Decentralized multi-agent reinforcement learning with global state prediction. In Proc. IEEE/RSJ Int. Conf. Intelligent Robots and Systems (IROS), pp. 8854–8861. External Links: [Document](https://dx.doi.org/10.1109/IROS55552.2023.10341563) Cited by: §I, §II-A.

[^5]: J. Bloom, J. Poindexter, and C. Pinciroli (2025) Enhancing learning of collective transport with global state prediction under local, bandwidth-limited communication constraints. Note: Research Square preprintVersion 1 External Links: [Document](https://dx.doi.org/10.21203/rs.3.rs-6597379/v1) Cited by: §I, §II-A.

[^6]: M. Feng, Y. Yang, W. Zhou, and H. Li (2025) TIMAR: transition-informed representation for sample-efficient multi-agent reinforcement learning. Neural Networks 184, pp. 107081. External Links: [Document](https://dx.doi.org/10.1016/j.neunet.2024.107081) Cited by: §I, §II-B.

[^7]: C. Guan, F. Chen, L. Yuan, C. Wang, H. Yin, Z. Zhang, and Y. Yu (2022) Efficient multi-agent communication via self-supervised information aggregation. In Advances in Neural Information Processing Systems, Vol. 35, pp. 1020–1033. External Links: [Document](https://dx.doi.org/10.52202/068431-0075) Cited by: §I, §II-B.

[^8]: M. Hüttenrauch, A. Šošić, and G. Neumann (2019) Deep reinforcement learning for swarm systems. Journal of Machine Learning Research 20 (54), pp. 1–31. Cited by: §I, §II-A.

[^9]: S. Jones and S. Hauert (2025) Distributed spatial awareness for robot swarms. Autonomous Robots 49 (4), pp. 41. External Links: [Document](https://dx.doi.org/10.1007/s10514-025-10228-1) Cited by: §II-A.

[^10]: Y. LeCun (2022) A path towards autonomous machine intelligence. Note: OpenReview position paperVersion 0.9.2, 27 June 2022 External Links: [Link](https://openreview.net/forum?id=BZ5a1r-kVsf) Cited by: §I, §II-C.

[^11]: N. Mayumu, X. Deng, A. Bagula, S. u. R. Khan, and P. Mukala (2026) V2X-JEPA: self-supervised multiagent joint embedding predictive architecture for robust vehicle-to-everything perception. IEEE Internet of Things Journal 13 (8), pp. 16609–16620. External Links: [Document](https://dx.doi.org/10.1109/JIOT.2026.3660030) Cited by: §II-C.

[^12]: K. Nomura, T. Aoki, T. Taniguchi, and T. Horii (2025) Decentralized collective world model for emergent communication and coordination. In Proc. IEEE Int. Conf. Development and Learning (ICDL), pp. 1–8. External Links: [Document](https://dx.doi.org/10.1109/ICDL63968.2025.11204457) Cited by: §I, §II-B.

[^13]: M. Otte (2018) An emergent group mind across a swarm of robots: collective cognition and distributed sensing via a shared wireless neural network. The International Journal of Robotics Research 37 (9), pp. 1017–1061. External Links: [Document](https://dx.doi.org/10.1177/0278364918779704) Cited by: §II-A.

[^14]: E. Tolstaya, F. Gama, J. Paulos, G. Pappas, V. Kumar, and A. Ribeiro (2020) Learning decentralized controllers for robot swarms with graph neural networks. In Proc. Conf. Robot Learning, Proc. Machine Learning Research, Vol. 100, pp. 671–682. Cited by: §I, §II-A.

[^15]: D. Xue, J. Jiang, S. Zhang, W. Guo, L. Yuan, Z. Zhang, and Y. Yu (2026) Learning disentangled multi-agent world model for decentralized control. In Proceedings of the 43rd International Conference on Machine Learning, Proceedings of Machine Learning Research, Vol. 306. External Links: [Link](https://openreview.net/forum?id=nYyfpPubnW) Cited by: §II-B.

[^16]: J. Yang, J. Wang, Q. Yuan, and Z. Zuo (2026) TrajJEPA: a joint-embedding predictive model for multi-agent trajectory prediction. In 2026 9th International Conference on Advanced Electronic Technology, Computers and Software Engineering (AETCSE), pp. 1120–1127. External Links: [Document](https://dx.doi.org/10.1109/AETCSE69203.2026.11504088) Cited by: §II-C.

[^17]: M. Zaheer, S. Kottur, S. Ravanbakhsh, B. Póczos, R. Salakhutdinov, and A. J. Smola (2017) Deep sets. In Advances in Neural Information Processing Systems, Vol. 30, pp. 3391–3401. Cited by: §I, §II-A.

[^18]: Y. Zhang, C. Bai, B. Zhao, J. Yan, X. Li, and X. Li (2025) Decentralized transformers with centralized aggregation are sample-efficient multi-agent world models. Transactions on Machine Learning Research. External Links: ISSN 2835-8856, [Link](https://openreview.net/forum?id=xT8BEgXmVc) Cited by: §I, §II-B.