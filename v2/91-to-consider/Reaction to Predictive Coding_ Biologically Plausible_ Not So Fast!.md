---
title: "Reaction to Predictive Coding: Biologically Plausible? Not So Fast!"
source: "https://www.youtube.com/watch?v=YLy2QclpNKg"
author:
  - "[[Alain Co]]"
published: 2025-06-04
created: 2026-08-08
description: "Is predictive coding the key to brain-like Artificial Intelligence, or just another overhyped theory? In this reaction video, AI expert and neural simulation researcher Charles Simon breaks down Artem"
tags:
  - "clippings"
---
![](https://www.youtube.com/watch?v=YLy2QclpNKg)

Is predictive coding the key to brain-like Artificial Intelligence, or just another overhyped theory? In this reaction video, AI expert and neural simulation researcher Charles Simon breaks down Artem Kirsanov’s popular video on learning in biological networks. We’ll explore why backpropagation doesn’t work in the brain, and why predictive coding might not be the answer either. Using insights from neuroscience, computational modeling, and real biological constraints, we’ll separate scientific fact from AI fiction. If you’re curious about artificial intelligence, neural networks, or how your brain really works, you don’t want to miss this. Hit like, subscribe, and join the conversation about the future of AGI.  
  
0:00 Intro  
0:50 Backpropagation and Predictive Coding  
2:38 My Reaction+  
3:31 My Reaction-  
4:40 Issues when using Firing Rate  
5:27 Issues when using Spike Intervals  
6:13 Spike Timing and Phase: Ignored at your Peril  
7:25 Issues with Synapse Weights  
8:36 Summary  
  
Link to Artem's Video: https://youtu.be/l-OLgbdZ3kk?si=RU2HdUo8QuTPKLDr  
  
\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_  
Useful links:  
The Future AI Society: https://futureaisociety.org  
The Brain Simulator III (UKS) project: https://github.com/FutureAIGuru/BrainSimIII  
The Brain Simulator II (Neural Simulator) project: https://github.com/FutureAIGuru/BrainSimII  
Overview Video: https://youtu.be/W2uauk2bFjs  
More Details Video: https://youtu.be/6po1rMFZkik  
How the UKS Learns Video: https://youtu.be/Rv0lrem3lVs  
\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_  
  
The Future AI Society is a member community dedicated to adding Alternative AI approaches including Spiking Neural Networks and Enhanced Graph-based.  
  
The Society’s open source software includes the Brain Simulator II neural simulator and the Brain Simulator III graph-based system featuring the “Universal Knowledge Store” (UKS) which can create connections on its own between different types of real-world information (sight, sound, and touch). This represents the next generation of software beyond today’s machine learning, generative AI, and knowledge systems.  
  
Founder Charles J. Simon, BSEE, MSCS, is a nationally recognized entrepreneur, software developer and manager. With a broad management and technical expertise and degrees in both Electrical Engineering and Computer Science, Mr. Simon has many years of computer experience in industry including pioneering work on numerous neurological test system.

## Transcript

### Intro

**0:00** · Today, I'm reacting to Artem Kirsanov's video learning algorithm of biological networks.

**0:07** · There's a lot to appreciate in his presentation, but also a few things I think need a hard reality check.

**0:14** · I'm Charles Simon, long-time AI researcher, software developer, and manager. In addition to AI work, I've developed software for several neurological test instruments and neural simulators, and along the way learned a lot about the capabilities and limitations of biological neurons and how your brain must work to do the things it does.

**0:37** · I created the Future AI Society to pursue these ideas, including our open-source Brain Simulator 2, which is used for the simulations in this video, and I invite you to participate in the project.

### Backpropagation and Predictive Coding

**0:52** · Artem Kirsanov is a computational neuroscientist.

**0:57** · In this video, I will share with you my experience and talk about some common misconceptions about this absolutely exciting field.

**1:04** · And his YouTube channel has many excellent videos, usually with animations which bring his points to life.

**1:12** · Here's a quick summary of this video, "Learning Algorithm of Biological Networks."

**1:19** · In his video, Artem explores the limitations of backpropagation as a biologically plausible learning mechanism and introduces predictive coding as a more viable alternative. He explains that biological neural networks can't propagate error signals backward through layers the way backpropagation does, due to the lack of reverse pathways to support such feedback.

**1:46** · Predictive coding, by contrast, relies specifically on forward and lateral interactions between neurons to minimize prediction error, making it theoretically more compatible with known brain structures.

**2:02** · Kirschner off outlines how predictive coding could allow neurons to update their internal models of the world by constantly comparing expected inputs to actual sensory data.

**2:15** · He emphasizes that this framework can be used to understand perception and learning as a process of minimizing surprise.

**2:24** · The video draws from existing neuroscience literature to support predictive coding as a foundational learning principle in the brain, positioning it as both functionally effective and biologically grounded.

### My Reaction

**2:41** · Let's start with what I agree with.

**2:43** · Kirschner off rightly points out that standard backpropagation doesn't work in biological brains.

**2:50** · Why? Because biological neurons don't have a way to send error signals back to their source. The structure just isn't there. That's a valid and crucial insight, too often overlooked in AI circles.

**3:06** · So, what's his proposed alternative?

**3:10** · Predictive coding.

**3:12** · Now, to be fair, predictive coding isn't his personal invention. It's a well-known idea with a number of papers exploring it as a biological learning mechanism.

**3:25** · The appeal is that it supposedly solves the backpropagation problem I just outlined.

### My Reaction

**3:32** · But here's where I push back. Predictive coding, despite the hype, is not biologically plausible, either.

**3:41** · Why? Because it relies on concepts and assumptions that just don't line up with how real neurons work.

**3:49** · Let's start with the ambiguous concept of an activation level.

**3:53** · We see it in many equations in AI where it might refer to an idealized firing rate, some clean continuous value. But in neuroscience, activation level usually means something completely different. It refers to the membrane potential, the voltage built up by incoming synapses.

**4:15** · This would be a convenient continuous value, but it's a hidden internal state, not something other neurons can sense.

**4:26** · So when AI models assume you can sum up weighted inputs to compute a new activation value, they must be referring to the firing rate. And that's a mathematical abstraction, not biology.

### Issues when using Firing Rate

**4:40** · When you try to reframe activation as a firing rate, you hit practical limits.

**4:47** · If you define the firing rate as the number of neural spikes in a given time period, then you're locked into a trade-off. The more precision you need, the slower your system must be. If you want your activation to represent a conservative 256 distinct values, you can only register a value after a full second, the minimum amount of time required for 256 neural spikes.

**5:13** · This is obviously too slow to be of any use. So in this concept, the firing rate is discrete rather than continuous and is restricted to a very limited number of distinct values, 10 or less, for example.

### Issues when using Spike Intervals

**5:29** · If you try to go with spike intervals instead, then yes, a biological neuron can detect delays between two adjacent spikes, but only from one input and a single detected value. If multiple inputs are firing, their signals can't easily be combined.

**5:46** · Further, although neurons can detect which of two incoming signals is firing faster with a high degree of precision, to learn the absolute instantaneous firing rate, once again, limits us to discrete values. So, while this is mathematically possible, it is not useful for a system which wants to take the weighted sum of continuous valued inputs.

### Spike Timing and Phase: Ignored at your Peril

**6:15** · And both these cases ignore timing and phase.

**6:20** · Two neurons firing at 100 hertz could be summed to yield different results depending on whether or not they're in phase.

**6:29** · In this example, we might consider that this firing rate represents the value one.

**6:35** · If we add a second similar signal, here we represent that 1 + 1 = 2. Well enough.

**6:44** · But if we shift our second signal so that the two signals are in phase, we'll get a different result. 1 + 1 = 1.

**6:55** · This is because neurons can't accumulate additional incoming signals once a threshold is reached, and the summation does not account for refractory periods where recently fired neurons won't respond again right away.

**7:11** · So, we can get radically different answers based on a real-world value that our mathematical models completely ignore.

**7:21** · That breaks the clean summable input model that predictive coding assumes.

### Issues with Synapse Weights

**7:29** · A similar discontinuity concerns synapse weights. Although the biological synapse itself could have a large number of distinct values, there is no mechanism to set them with any degree of precision.

**7:44** · Once again, you can trade off speed of learning against precision.

**7:49** · The more values you want to represent, the slower the system must learn.

**7:54** · Published simulations indicate that individual synapses can take on one of at most 26 different values.

**8:02** · In my modeling, however, I found that the number of discernable states to be much lower because you need a synapse weight to change rapidly when you want it to change, but remain stable when it's not changing.

**8:16** · The easiest way to do this is with fewer distinct values.

**8:23** · The combination of discrete valued weights with discrete valued activation levels leads to a learning algorithm failure because they rely on continuous differentiable activation functions.

### Summary

**8:41** · Bottom line, any model relying on weighted sums of input values, be it back propagation or predictive coding, is not biologically realistic.

**8:53** · Don't get me wrong, I'm all for mathematical models that help AI do useful things, but let's not confuse convenient engineering with an explanation of how the brain actually works.

**9:07** · Saying predictive coding is how your brain learns, that's not science, that's wishful thinking.

**9:15** · If you found this breakdown helpful, don't forget to like and subscribe and drop your thoughts in the comments below. And take a moment to join the Future AI Society, where we have online conversations about creating the future of artificial intelligence.

**9:32** · Let's keep digging into what AI models can do and how they can be refined to represent true understanding and human-like intelligence.

**9:41** · And as always, thanks for watching.