---
title: "Read the keynote · IWAI 2026"
source: "https://iwai2026-tanichu-keynote.pages.dev/read"
author:
published:
created: 2026-10-17
description: "Explore Tadahiro Taniguchi's IWAI 2026 keynote through slides, an English transcript and Gemini-generated narration."
tags:
  - "clippings"
---
## Read at yourown pace.

All 50 slides, alongside the English script from the speaker’s notes. Prefer to listen? [Open the narrated view ↗](https://iwai2026-tanichu-keynote.pages.dev/watch.html)

[![Slide 1: Collective Predictive Coding Hypothesis: Emergence of Language and Cooperative Behaviors](https://iwai2026-tanichu-keynote.pages.dev/slides/01.webp)](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-1) [Listen from this slide ↗](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-1)

## Collective Predictive Coding Hypothesis: Emergence of Language and Cooperative Behaviors

Thank you very much for inviting me. It is a great pleasure to be here at IWAI and to give this keynote in front of an audience so familiar with the free energy principle and active inference.

Today I will talk about the collective predictive coding hypothesis, CPC hypothesis in short, which I proposed about two years ago. CPC offers a way to explain how language and cooperative behaviors emerge.

I will frame symbol emergence through the lens of free energy principle.

OK, let’s start.

[![Slide 2: Biography](https://iwai2026-tanichu-keynote.pages.dev/slides/02.webp)](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-2) [Listen from this slide ↗](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-2)

## Biography

This is my biography.  
I have been working on symbol emergence in robotics, cognitive robotics, AI in general, Cognitive systems, multi-agent systems and so on.

[![Slide 4: Symbol Systems and Human/AI Intelligence](https://iwai2026-tanichu-keynote.pages.dev/slides/04.webp)](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-4) [Listen from this slide ↗](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-4)

## Symbol Systems and Human/AI Intelligence

Let me start with the wider motivation. In this talk, I take symbol systems as a central topic.

Why symbol systems? The cognitive revolution enabled humans to create and sustain shared symbolic systems: language, law, money, writing, religion.  
Creating symbol systems is a defining feature of human beings. No other animals can use symbol systems at the same level as human beings.  
Understanding the mechanism of symbol emergence is very important to understand ourselves.

In addition, now AI is becoming the first non-human user of symbols. It joins our conversations, generates explanations, and shapes the information behind our decisions.

So understanding how symbol systems emerge is becoming more important problem.

[![Slide 5: Symbol emergence systems [Taniguchi+ 2016]](https://iwai2026-tanichu-keynote.pages.dev/slides/05.webp)](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-5) [Listen from this slide ↗](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-5)

## Symbol emergence systems \[Taniguchi+ 2016\]

This connects to my long-standing research on symbol emergence systems.

This diagram expresses the basic idea of a symbol emergence system.

At the individual level, each person learns internal representations from their own experience.

At the collective level, we develop a shared symbol system through communication.

Individual experience contributes to the organization of language from the bottom up.  
In the other direction, established language and conventions constrain how we communicate and interpret experience.

We therefore need to study the coupled dynamics of the body, individual cognition, and society-level interactions.  
The dynamics forms micro-micro loop and give symbols systems actual functions.

[![Slide 6: Symbol emergence in cognitive robotics](https://iwai2026-tanichu-keynote.pages.dev/slides/06.webp)](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-6) [Listen from this slide ↗](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-6)

## Symbol emergence in cognitive robotics

Let me briefly look back my line of research.  
Since around 2010, our community has been studying symbol emergence in robotics. It takes a constructive approach to understanding "symbol emergence systems.“

The constructive approach using robots is deeply inspired by cognitive and developmental robotics.

The core idea is to understand how symbol systems, including language, emerge in human society. We do this by building robots that acquire, invent, and share language grounded in their own real-world physical and social experiences.

We have developed numerous machine learning models for multimodal object categorization, spatial concept formation, language acquisition from speech signals, world models, and so on.

Multimodal learning is common today. But when we started, before the deep learning era, building multimodal unsupervised learning systems on embodied robots was very challenging, and few researchers in AI and robotics worked on it.

[![Slide 7: Symbol Emergence Systems: books and surveys](https://iwai2026-tanichu-keynote.pages.dev/slides/07.webp)](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-7) [Listen from this slide ↗](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-7)

## Symbol Emergence Systems: books and surveys

I first introduced the idea of "symbol emergence systems" in a Japanese book in 2010. Since then, we have developed it through robotic experiments and discussions across cognitive science, language, and society.

This year, we published an English volume of "symbol emergence systems", which I edited. It brings together interdisciplinary perspectives, including active inference, and is available as an open-access book.

However, in more than 15 years of investigating symbol emergence systems, I struggled to obtain a principled formulation of the dynamics of symbol emergence systems as a whole.

Finally, I arrived at the idea of collective predictive coding (CPC), a theoretical formulation of symbol emergence systems as integrative social-cognitive systems.  
We also found a convergence with the free energy principle.

[![Slide 8: The Collective Predictive Coding Hypothesis](https://iwai2026-tanichu-keynote.pages.dev/slides/08.webp)](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-8) [Listen from this slide ↗](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-8)

## The Collective Predictive Coding Hypothesis

CPC formulates symbol emergence as predictive coding performed by a group, through language games. The language game works as decentralised Bayesian inference.

Individual world-model learning and the emergence of a symbol system can then be described within a joint probabilistic model.

For this community, the key point is that  
the free-energy principle or active inference, which is often applied to a single agent or single brain, can be extended to a collective: symbol emergence becomes free-energy minimization by a group.

I will first make the mechanism concrete through an example of naming game, an instance of generative modeling of emergent communication. Then I will return to the formal model.  
Then, I will talk about what it means for cooperation and Human-AI symbiosis.

Note that the claim that human language is formed through CPC remains a hypothesis.  
We are now gathering constructive evidence and extending interdisciplinary collaboration to make this idea concrete and verify it.

[![Slide 10: From reward-driven games to joint attention](https://iwai2026-tanichu-keynote.pages.dev/slides/10.webp)](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-10) [Listen from this slide ↗](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-10)

## From reward-driven games to joint attention

First, let me explain a concrete study on emergent communication or language evolution.

Constructive research on language evolution and emergent communication has a long history, including a pioneering work, Luc Steels’ naming-game studies. More recently, deep reinforcement learning has made referential games a prominent approach to emergent communication.

Typically, in a referential game, one agent sends a message and another guesses a target. And if it’s correct, sender and receiver obtain reward.  
Here, reward maximization is mostly taken as the first principle.

But is reward maximization really what drives human language acquisition and language evolution? I don’t think so.

In human development, joint attention is an important precursor to early word learning. Joint is not goal, but a premise.

So, respecting the findings in developmental psychology, I assume that two agents are already attending to the same object, and ask how they can co-construct a shared way of referring to it.

This allows us to model symbol sharing as inference, through the lens of generative models.

[![Slide 11: Metropolis-Hastings naming game [Taniguchi+ 2023]](https://iwai2026-tanichu-keynote.pages.dev/slides/11.webp)](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-11) [Listen from this slide ↗](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-11)

## Metropolis-Hastings naming game \[Taniguchi+ 2023\]

Let me introduce one algorithm, which is called the Metropolis–Hastings naming game, or MHNG for short. We proposed MHNG in 2023. It is a simple type of language game.

Two agents observe the same object under joint attention, but each gets a different observation.  
Each forms an internal representation from its own observations.

The speaker samples a name from its own posterior over name space, and proposes it to the listener.  
The listener then decides whether to accept it, using its own beliefs.  
The acceptance probability compares how well the proposed name explains the listener's representation with how well its current name explains it.

The listener can reject a proposal if it is not unreliable.  
After these exchanges, the agents update their internal models perceptual and language encoder-decoder, switch roles, and repeat the process.

Everything each agent computes is local. The speaker does not read the listener's internal representation, and the listener does not read the speaker’s.

This game looks like a very simple heuristic realization of a certain type of language game. But, it has solid mathematical foundation.

[![Slide 12: MH Naming Game is a Decentralized MCMC Bayesian Inference](https://iwai2026-tanichu-keynote.pages.dev/slides/12.webp)](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-12) [Listen from this slide ↗](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-12)

## MH Naming Game is a Decentralized MCMC Bayesian Inference

The key result is that, under the assumption of a generative model and acceptance rule used here, this naming game implements the Metropolis–Hastings algorithm,  
an MCMC method for approximate Bayesian inference,  
over the joint generative model of the group of agents.

The speaker's proposal incorporates partial information from one agent. The listener's acceptance decision incorporates information from the other.  
Together, these steps sample shared symbols from a posterior that integrates both agents' observations.

Imagine that we could collect both sets of observations from the group of agents and perform inference of the shared latent variable.  
The MH naming game reaches the same kind of inference without giving either agent direct access to the other agent's internal state.

So communication has a role in representation learning itself. Through the creation of a shared symbol system, agents integrate their partial perspectives on the world.  
This becomes the computational basis for the broader CPC hypothesis.

[![Slide 13: Inter-GMM+VAE: three findings [Taniguchi+ 2023]](https://iwai2026-tanichu-keynote.pages.dev/slides/13.webp)](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-13) [Listen from this slide ↗](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-13)

## Inter-GMM+VAE: three findings \[Taniguchi+ 2023\]

Let me briefly describe the results of the original paper.  
The naming game is grounded in visual observations through a variational autoencoder, and each agent uses a Gaussian mixture model simply to calculate the posterior over names.  
The joint generative model over two agents is called Inter-GMM+VAE.

In the experiment, signs and categories are successfully shared. A received sign could evoke an image through the listener's own generative model. The interaction also improved internal representation learning.

Co-constructing an external representation system changed and even improved the representations learned inside each agent.This is also important point.

After introducing the MHNG and the idea of generative model-based emergent communication, with the language game as decentralized Bayesian inference, we extended the idea and published a series of papers.

The list below shows how this research has expanded:  
more agents, compositional language, continuous signals, variational and self-supervised learning, heterogeneous agents, temporal world models, and human–AI co-creation. I will not go through every paper.

This shows the generality of the fundamental idea and the potential of the generative approach to symbol emergence.

[![Slide 14: Symbol emergence with continuous signals](https://iwai2026-tanichu-keynote.pages.dev/slides/14.webp)](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-14) [Listen from this slide ↗](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-14)

## Symbol emergence with continuous signals

Here, let me show an example.

One extension moves beyond a fixed set of discrete names.  
Here, the agents communicate using continuous signals, while the model assumes a compositional structure at the phoneme level.

[![Slide 15: Emergent communication: a language-game demonstration](https://iwai2026-tanichu-keynote.pages.dev/slides/15.webp)](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-15) [Listen from this slide ↗](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-15)<video src="https://iwai2026-tanichu-keynote.pages.dev/videos/slide-15.mp4" controls="" aria-label="Original demonstration from slide 15"></video>

## Emergent communication: a language-game demonstration

So, let me play a funny video, one example of an extension of generative emergent communication.

The agents develop shared word-like signals and learn relationships between these signals and their referents.

In this demonstration, two agents observe an object and exchange a continuous signal.  
Note that even when the target object is the same, the observations differ.  
Please watch how the signal changes through interaction, and how it becomes associated with the object.

The sign system is more complex, but the fundamental mechanism of the MHNG remains the same.

Here, the structure of the communicative signal develops together with the agents' categories, rather than the entire symbol inventory being supplied in advance.

[![Slide 16: Naming multiple objects](https://iwai2026-tanichu-keynote.pages.dev/slides/16.webp)](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-16) [Listen from this slide ↗](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-16)<video src="https://iwai2026-tanichu-keynote.pages.dev/videos/slide-16.mp4" controls="" aria-label="Original demonstration from slide 16"></video>

## Naming multiple objects

Of course, there is more than one target object.  
The agents play the naming game over many objects, gradually form speech patterns for them, and through that form object categories.

With that concrete example in mind, let us return to the theory behind this process.

[![Slide 18: Symbol emergence systems [Taniguchi+ 2016]](https://iwai2026-tanichu-keynote.pages.dev/slides/18.webp)](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-18) [Listen from this slide ↗](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-18)

## Symbol emergence systems \[Taniguchi+ 2016\]

Let us return to this diagram. We now have a concrete mechanism connecting individual representation learning with a shared symbol system.

Let me unfold this diagram step by step, beginning with a single agent, through the lens of free energy principle or generative view of cognitive systems.

[![Slide 19: A single agent: perception, action and world modeling](https://iwai2026-tanichu-keynote.pages.dev/slides/19.webp)](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-19) [Listen from this slide ↗](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-19)

## A single agent: perception, action and world modeling

Start with a single agent.  
It interacts with the environment through a perception–action loop and update its internal representations and world model.

I think most research takes this picture of an individual agent as its basic starting point for studying cognitive systems.

[![Slide 20: World Models, Predictive Coding and Free Energy Principle in Cognitive Robotics](https://iwai2026-tanichu-keynote.pages.dev/slides/20.webp)](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-20) [Listen from this slide ↗](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-20)

## World Models, Predictive Coding and Free Energy Principle in Cognitive Robotics

In cognitive robotics, world models, predictive coding, and the free energy principle are sometimes used as neighboring concepts.

I studied this topic as well and have also written a number of research papers on world models in robotics myself. But, today, I skip the details of level.

In the relation with IWAI, I put two images of our survey papers.  
Number four is a paper titled “World model learning and inference,” which I wrote about five years ago together with Karl.

Number five is “World models and predictive coding for cognitive and developmental robotics,” which I wrote with Pablo and Giovanni.

However, these are just the natural foundation of today's talk.  
We take them for granted, and we want to go beyond them.

[![Slide 21: From individual world models to a collective](https://iwai2026-tanichu-keynote.pages.dev/slides/21.webp)](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-21) [Listen from this slide ↗](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-21)

## From individual world models to a collective

In reality, we humans are many.

As shown in this diagram, let’s consider a situation where multiple agents exist.

At this stage, we view this simply as a set of independent predictive coding agents.

Each agent learns its own world model individually, based on its own actions and observations.

So the question is: what happens when these independent agents begin to interact using symbol systems, through an appropriate style of language game?

[![Slide 22: Shared symbols connect individual world models](https://iwai2026-tanichu-keynote.pages.dev/slides/22.webp)](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-22) [Listen from this slide ↗](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-22)

## Shared symbols connect individual world models

Now, let’s complete the picture.  
If we extend the idea of the previous naming game naturally, and assume that people play similar language games, then these semiotic interactions allow us to form shared external representations, language, denoted here as w.

This establishes a crucial loop: bottom-up organization, where individual experiences shape the language, and top-down constraint, where language guides individual learning as a top-down prior.

Mathematically, we move from individual inference to estimating the joint posterior over w and the agents’ internal representations.

Through this mechanism, I hypothesize that we humans do not just learn individually, but collectively model and adapt to the world. In our terminology, this is collective predictive coding.

[![Slide 23: A dual perspective: language as a world model](https://iwai2026-tanichu-keynote.pages.dev/slides/23.webp)](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-23) [Listen from this slide ↗](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-23)

## A dual perspective: language as a world model

By the way, this is not the end of the story of CPC.  
Let me share another viewpoint.  
The duality of perspectives in CPC is another interesting point of this framework.

Now let me change the viewpoint.  
Until now, we treated each person as the autonomous agent.  
But let’s flip it.  
Language itself may be an autonomous system in its own right.

[![Slide 24: We are the sensors of language](https://iwai2026-tanichu-keynote.pages.dev/slides/24.webp)](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-24) [Listen from this slide ↗](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-24)

## We are the sensors of language

It has sensors: those are us. Language uses us to model the world through interaction.

From this viewpoint, we humans are subordinate to the language system.  
This kind of view is often discussed in some part of sociology and the humanities.

[![Slide 25: Beyond the individual cognitive system](https://iwai2026-tanichu-keynote.pages.dev/slides/25.webp)](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-25) [Listen from this slide ↗](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-25)

## Beyond the individual cognitive system

I find this dual viewpoint very interesting and inspiring.  
It extends our view of cognition all the way to the social level.

Also, by taking this centralized view, we can naturally define the free energy for the collective symbol emergence system.

[![Slide 26: CPC as Collective Free-Energy Minimization](https://iwai2026-tanichu-keynote.pages.dev/slides/26.webp)](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-26) [Listen from this slide ↗](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-26)

## CPC as Collective Free-Energy Minimization

We formalized CPC from the viewpoint of the Free Energy Principle.

Given a generative model of CPC, we can naturally derive variational free energy. Interestingly, it decomposes into two parts: an ordinary variational free energy summed over agents, plus a new term.  
We call it the collective regularization term.

This term aligns each agent's external representation w with internal representations z across agents.

The collective objective is not an unconnected list of individual objectives.  
The shared variable w couples them.  
The FEP extends from the individual to the collective level, with a clear connection to symbol emergence.

Note that MH naming game is sampling-based, so it does not decrease this objective directly at each step. But the distribution of its samples converges to the posterior, which is where the free energy is minimized.

[![Slide 27: Peirce's semiotics and arbitrariness](https://iwai2026-tanichu-keynote.pages.dev/slides/27.webp)](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-27) [Listen from this slide ↗](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-27)

## Peirce's semiotics and arbitrariness

This also suggests a connection to semiotics, and in particular to the idea of arbitrariness.

C. S. Peirce, the founder of semiotics, described a sign through a three-way relation among the sign, its object, and its interpretant. He took the adoptive relations among these three as the premise of his theory.

The relation between a sign and its referent is not fixed by the physical form of the sign alone. Its use can change across languages, communities, and contexts.

From the CPC perspective, this freedom gives a collective “additional degrees of freedom” for organizing its representations.  
We can revise how symbols relate to experience, while those revised symbols also influence individual learning.

I call attention here to semiotic plasticity, alongside the plasticity of individual cognitive systems.  
Collective intelligence with symbol systems can depend on our ability to change the shared symbol system, as well as on changes within individual brains.

[![Slide 28: The world and the individual estimator](https://iwai2026-tanichu-keynote.pages.dev/slides/28.webp)](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-28) [Listen from this slide ↗](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-28)

## The world and the individual estimator

By the way, let me show this picture. In Professor Rao’s great keynote yesterday, he showed this figure in the context of predictive coding.

It is a beautiful illustration of the predictive coding view of the mind.  
The world has hidden states, and an individual brain acts as an estimator that infers those states from its observations.

[![Slide 29: Perspective of Collective Predictive Coding](https://iwai2026-tanichu-keynote.pages.dev/slides/29.webp)](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-29) [Listen from this slide ↗](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-29)

## Perspective of Collective Predictive Coding

But from the viewpoint of CPC, we can now draw this kind of picture.

The world is the same, but now there are many estimators.

Language then appears as an emergent estimator of the world.

Drawn this way, it starts to look as if language itself has a model of the world.  
Is that really the case?

[![Slide 30: Does an LLM Have a “World Model”?](https://iwai2026-tanichu-keynote.pages.dev/slides/30.webp)](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-30) [Listen from this slide ↗](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-30)

## Does an LLM Have a “World Model”?

In fact, over the past three years or so, many studies have reported that large language models have a model of the world, at least in a rough sense. They encode information about space, time, action, and physical properties.

These findings do not all establish the same kind of world model, but they make the question difficult to dismiss.

Why might a model, trained only on language, learn anything about the physical world?

Through the CPC picture, this becomes easier to accept.  
Language is produced by people whose lives are grounded in physical and social experience, and through collective predictive coding, the structure of that experience can be reflected in the shared symbol system.

[![Slide 31: Collective World Model Hypothesis](https://iwai2026-tanichu-keynote.pages.dev/slides/31.webp)](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-31) [Listen from this slide ↗](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-31)

## Collective World Model Hypothesis

Going one step further than the CPC hypothesis, we have proposed the collective world model hypothesis. This diagram shows the idea.

On the left, embodied agents interact with the world through observations and actions, and learn world models of it.

Through symbol and language emergence, the agents' experience is expressed in language data. An LLM then learns from that data by next-token prediction, and may reconstruct some of the structure behind it.

So it is risky to assert that “an LLM has no knowledge of the physical world because it has no body.”

This is still a hypothesis or speculation.  
But, we are studying this through constructive approach and empirical studies.

[![Slide 32: Co-constructed emotion](https://iwai2026-tanichu-keynote.pages.dev/slides/32.webp)](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-32) [Listen from this slide ↗](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-32)

## Co-constructed emotion

But we should be careful here.  
Language does not only represent the external world. Emotion is an important example.

What matters about CPC-based approach to language emergence is its theoretical connection to the free energy principle.  
This lets us link a model of emotion as interoceptive active inference to the co-construction of emotion expressions.

We wrote a perspective paper with colleagues including Dr. Horii.I think this is a promising direction of emotion study.

[![Slide 34: Communication and cooperation:](https://iwai2026-tanichu-keynote.pages.dev/slides/34.webp)](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-34) [Listen from this slide ↗](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-34)

## Communication and cooperation:

So far, the focus has been the emergence of shared representations. Let us now ask how this connects to cooperation, when agents use those representations to choose actions.

Through the study of emergent communication in multi-agent systems, it is recognized that in non-cooperative objectives language emergence is not stabilized in MARL settings.  
But, very few people doubt the first principle, i.e., utility or reward maximization, itself.

Think of the shared map as a metaphor for the world model that people build together through communication.

On the left, agents put their own gain first. Then it pays to say “a passage is open” when “it is actually blocked.” Deceptive behavior appears easily, and the shared map gets distorted.

If that happens frequently, nobody can trust what others say.

In CPC, language learning is separated from policy learning and moved into world model learning. So it is reward independent, and symbol emergence can happen even in non-cooperative tasks.

From the viewpoint of model-based reinforcement learning, the question is whether language learning is predictive learning of a world model or optimization of a policy.

Conventional emergent communication places language on the policy side.  
CPC places it on the predictive learning side.

[![Slide 35: MARL-CPC: Reward-Independent Messaging](https://iwai2026-tanichu-keynote.pages.dev/slides/35.webp)](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-35) [Listen from this slide ↗](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-35)

## MARL-CPC: Reward-Independent Messaging

MARL-CPC, developed by Naoto Yoshida and myself, combines CPC-based message learning with multi-agent reinforcement learning. Messages support state inference.

With MARL-CPC, each agent learns useful messages, even though communicating brings no reward to the sender. Episode length and group welfare improve over the baselines.

This shows that predictive message learning is useful in multi-agent reinforcement task.

Note that this is a CPC+RL formulation. It is not based on Active Inference.

[![Slide 36: Dreamer-CPC: Message Learning](https://iwai2026-tanichu-keynote.pages.dev/slides/36.webp)](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-36) [Listen from this slide ↗](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-36)

## Dreamer-CPC: Message Learning

Takayama extended this to a POMDP setting and proposed Dreamer-CPC. It is cooperation between world model agents.

This work extended the well-know world model agent Dreamer V3 to CPC-base multi-agent reinforcement learning setting.

Each agent learns a world model whose latent state summarizes its history.  
Messages grounded in world-model states support coordination and improve returns over the baselines.

[![Slide 37: Beyond utility maximizers: collective predictive coders](https://iwai2026-tanichu-keynote.pages.dev/slides/37.webp)](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-37) [Listen from this slide ↗](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-37)

## Beyond utility maximizers: collective predictive coders

These examples are CPC+MARL formulations. They are not a full instantiation of Collective Active Inference.  
But theoretically, we can define a “collective expected free energy” based on CPC.

Below is such an expected collective free energy, and here too we can draw some interesting insights.

Besides the individual pragmatic value and epistemic value, a collective epistemic value appears.

If symbol emergence, which made humans human, is based on CPC, I think it naturally brings this collective epistemic value.

From the nature of epistemic value, it may work as collective curiosity, and as the motivation that drives communication.

Importantly, if we read pragmatic value as utility, individual utility maximization alone is not enough for us to build a society as a symbol emergence system.  
We need to take part in activities that improve collective epistemic value.

So I recently think, the utility maximizer is an insufficient picture of humans.  
The right picture may be a collective predictive coder, or a collective active inference agent.

[![Slide 39: Language games and scientific publication](https://iwai2026-tanichu-keynote.pages.dev/slides/39.webp)](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-39) [Listen from this slide ↗](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-39)

## Language games and scientific publication

I introduced MHNG as a typical example of language game between agent to realize CPC.

But, we can notice that this propose-and-evaluate dynamic is very general.  
Look at science, for example.

A researcher proposes a theory and submits a paper.  
A reviewer evaluates it based on their own knowledge, and accepts or rejects it.  
Structurally, peer review works like the naming game.

Actual peer review does not literally follow a Metropolis–Hastings acceptance rule.  
The analogy instead helps us formulate a model of how proposing and evaluating representations could support collective inference.

If this system works well, our shared scientific knowledge gradually integrates everyone's partial observations into a better model of the world.

[![Slide 40: Collective Predictive Coding as Model of Science (CPC-MS): Formalizing Scientific Activities Towards Generative Science](https://iwai2026-tanichu-keynote.pages.dev/slides/40.webp)](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-40) [Listen from this slide ↗](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-40)

## Collective Predictive Coding as Model of Science (CPC-MS): Formalizing Scientific Activities Towards Generative Science

Together with philosophers of science and other colleagues, we developed collective predictive coding as a model of science (CPC-MS).

In this minimal view, scientific activity improves predictability through the development and revision of shared representations.  
Improved predictability can support decision-making and consensus-building through discussion.

This view does not capture every social or institutional aspect of science. It makes one computational loop explicit:  
individual inquiry and collective knowledge continually shape one another.

We use the term “generative science” for this perspective, which views science through the lens of the society-level free energy principle.

[![Slide 41: Human–AI collective scientific representations](https://iwai2026-tanichu-keynote.pages.dev/slides/41.webp)](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-41) [Listen from this slide ↗](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-41)

## Human–AI collective scientific representations

CPC-MS is basically a model of scientific activity in human communities.

But in the era of generative AI and AI for Science, AI agents are joining this activity.

[![Slide 42: Will the misuse of generative AI destroy the existing scientific community?](https://iwai2026-tanichu-keynote.pages.dev/slides/42.webp)](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-42) [Listen from this slide ↗](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-42)

## Will the misuse of generative AI destroy the existing scientific community?

Let me state the concern about the science system in the age of generative AI first.

Will the misuse of generative AI destroy the existing scientific community?  
Maybe. A flood of AI-generated papers could break the review system.

Will the use of generative AI lead science as a whole in a good direction?  
Maybe, but nobody knows. And what is good science in the first place?

So, I think it is important to model the science system  
in a world where AI agents have joined, and to design appropriate mechanisms that maintain scientific activity in human society.

I think CPC-MS based on FEP can contribute to such study.

[![Slide 43: Co-creative learning via decentralized Bayesian inference](https://iwai2026-tanichu-keynote.pages.dev/slides/43.webp)](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-43) [Listen from this slide ↗](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-43)

## Co-creative learning via decentralized Bayesian inference

By the way, I mentioned the Human–AI hybrid system in the previous slide.  
But, is it possible to extend CPC to a human-AI hybrid system?  
The answer is YES.

CPC itself is fully decentralized learning, and it models humans with a computational model in the first place. So AI and humans can be treated in the same way.

Suppose humans take part in the system as black-box collective predictive coders, and AI also works as a collective predictive coder. Then, in theory, CPC can be realized as a human–AI hybrid syste

We call this co-creative learning process.

[![Slide 44: Human–AI co-creative learning](https://iwai2026-tanichu-keynote.pages.dev/slides/44.webp)](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-44) [Listen from this slide ↗](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-44)

## Human–AI co-creative learning

To show that co-creative learning can be realized to some extent, we ran an experiment recruiting participants.

A human and a simple AI played a naming game, similar to the MH naming game, under partial observation.

We found that the agent based on the MH naming game algorithm showed higher performance in collaborative clustering task.

[![Slide 45: Symbiotic Human–AI Alignment via CPC](https://iwai2026-tanichu-keynote.pages.dev/slides/45.webp)](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-45) [Listen from this slide ↗](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-45)

## Symbiotic Human–AI Alignment via CPC

The theory of co-creative learning supported by CPC leads to our proposal of symbiotic alignment.

Conventional AI alignment work focuses on specifying human objectives and guiding AI to follow them.

But in practice, the relationship is already two-way. AI influences the information and options through which we decide, while humans steer and evaluate AI.

We therefore ask how alignment can include the ongoing formation of shared representations, meanings, and knowledge. Humans and AI can participate in that process together, while retaining different knowledge, experiences and perspectives.

This matters not only in science but also in democracy.

Together with members of the ALIFE Institute Japan and Audrey Tang, a leading figure in digital democracy and plurality, we propose the idea of "symbiotic alignment," where every human and AI participant tries to reduce collective free energy while embracing plurality.

[![Slide 46: Hierarchical alignment and symbiotic alignment](https://iwai2026-tanichu-keynote.pages.dev/slides/46.webp)](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-46) [Listen from this slide ↗](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-46)

## Hierarchical alignment and symbiotic alignment

This table contrasts two idealized approaches.

A hierarchical view emphasizes one-way guidance from human objectives to AI behaviour.

Symbiotic alignment emphasizes mutual influence and the development of shared representations through interaction.

Because of time limitation, I don’t get into the detail.If you are interested, please check our paper later

[![Slide 48: Summary](https://iwai2026-tanichu-keynote.pages.dev/slides/48.webp)](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-48) [Listen from this slide ↗](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-48)

## Summary

This is the summary of this talk.

Basically, I talked about language games, CPC, cooperation, and human-AI society.

It would make me more than happy if I could give you any inspiration or new perspectives through my talk.

[![Slide 49: Closing Remarks](https://iwai2026-tanichu-keynote.pages.dev/slides/49.webp)](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-49) [Listen from this slide ↗](https://iwai2026-tanichu-keynote.pages.dev/watch.html#slide-49)

## Closing Remarks

As a closing remarks, let me leave one message.  
When we start with a cognitive system, the free energy principle and active inference have mostly been theories of individual brains and agents.

Through collective predictive coding, their potential extends to collectives in a new way: language and symbols as a shared world model formed by many agents.

I have already received so many invitations, conversations and collaborations from many communities, shown here.

I see this as a new direction for the FEP community, beyond the individual brain, and I would welcome collaboration from any of you.