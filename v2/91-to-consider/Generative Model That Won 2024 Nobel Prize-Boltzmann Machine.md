---
title: "Generative Model That Won 2024 Nobel Prize"
source: "https://www.youtube.com/watch?v=_bqa_I5hNAo&list=WL&index=39"
author:
  - "[[Alain Co]]"
published: 2024-08-13
created: 2026-08-08
description: "Get 20% off at https://shortform.com/artem=====My name is Artem, I'm a neuroscience PhD student at Harvard University. 🌎 Website and Social links: https://kirsanov.ai/📥 \"Receptive Field\" neuro-"
tags:
  - "clippings"
---
![](https://www.youtube.com/watch?v=_bqa_I5hNAo)

Get 20% off at https://shortform.com/artem  
  
\=====  
My name is Artem, I'm a neuroscience PhD student at Harvard University.  
🌎 Website and Social links: https://kirsanov.ai/  
📥 "Receptive Field" neuro-newsletter: https://artemkirsanov.substack.com/  
✨ Support me on Patreon to get access to Discord community: https://patreon.com/artemkirsanov  
\=====  
  
In this video we explore Boltzmann Machines – one of the first generative models that learns probability distribution of data, leveraging stochastic rules and latent representations.  
  
🕒 OUTLINE:  
00:00 Introduction  
01:56 Goal of Boltzmann Machines  
05:26 Boltzmann Distribution  
13:29 Stochastic Update Rule  
17:39 Contrastive Hebbian Rule  
25:41 Hidden Units  
28:25 Restricted Boltzmann Machines  
29:38 Conclusion & Outro  
  
📚 FURTHER READING & REFERENCES:  
1\. Ackley, D., Hinton, G. & Sejnowski, T. A learning algorithm for boltzmann machines. Cognitive Science 9, 147–169 (1985).  
2\. Downing, K. L. Gradient Expectations: Structure, Origins, and Synthesis of Predictive Neural Networks. (The MIT Press, Cambridge, Massachusetts, 2023).  
3\. Hinton, G. E. & Salakhutdinov, R. R. Reducing the Dimensionality of Data with Neural Networks. Science 313, 504–507 (2006).  
4\. Hinton, G. E. A Practical Guide to Training Restricted Boltzmann Machines. in Neural Networks: Tricks of the Trade (eds. Montavon, G., Orr, G. B. & Müller, K.-R.) vol. 7700 599–619 (Springer Berlin Heidelberg, Berlin, Heidelberg, 2012).  
  
\=====  
Special thanks to Crimson Ghoul for providing English subtitles!  
\=====  
  
\*Disclaimer:\* This channel is my personal project. The views and content expressed here are my own and are separate from my research role at Harvard University.  
  
#MachineLearning #NobelPrize #ArtificialIntelligence  
  
  
\_Description remastered: February 2026. Links & Bio updated; original context preserved.\_

## Transcript

### Introduction

**0:00** · For most of the history, computers were seen as purely logical machines, mechanically crunching numbers to produce rigid, unambiguous solutions.

**0:10** · There was no place for creativity or ambiguity.

**0:14** · After all, when calculating a trajectory to launch a rocket into space, the last thing you want is your calculator dreaming up some funky, non-existing formula or improvising on the spot.

**0:29** · 50 years ago, if you asked anyone whether a computer program would sooner master driving a car versus composing a song, the answer would have been unanimous.

**0:40** · Fast forward to 2024, however, we still haven't quite achieved autonomous driving, but the generative AI of all flavors is taken for granted at this point.

**0:51** · So what sparked this shift?

**0:53** · At what point do neural networks transcend mere deterministic computation and begin to create, synthesizing things that never existed before?

**1:04** · Meet the Boltzmann machine, a type of a neural network that dared to embrace chaos and change the course of AI forever.

**1:14** · Developed in 1980's, Boltzmann machines introduced a radical notion.

**1:19** · What if we built uncertainty and randomness into the very fabric of machine learning?

**1:26** · What if, instead of storing rigid facts and performing deterministic computations, our AI could grasp the underlying probabilistic rules that govern the world around us?

**1:39** · In this video, we will build a Boltzmann machine from first principles and explore how concepts of probability and inherent uncertainty can be reconciled with the seemingly rigid nature of computer operations.

**1:53** · If you're interested, stay tuned.

### Goal of Boltzmann Machines

**2:03** · To understand Boltzmann machines, we must first understand their simpler predecessors, associative memory networks, also known as Hopfield networks.

**2:13** · We explored these in depth in the previous video.

**2:16** · So if you haven't seen it, I highly recommend watching it before continuing with this one, as we'll be directly building on those ideas.

**2:24** · But here's a quick refresher.

**2:25** · A Hopfield network is a model of associative memory inspired by the brain's ability to recall complete patterns from partial or noisy inputs.

**2:35** · It operates by assigning a specific energy value to each possible state, and then iteratively minimizing this energy by descending along the energy surface into the nearest well, thus recalling the best matching stored memory.

**2:52** · This energy landscape is shaped by network weights, which are learned by observing data points, patterns we want to memorize, and adjusting the weights to lower the energy associated with those patterns.

**3:07** · Given enough neurons, a Hopfield network has essentially perfect memory and excels at mechanical tasks like pattern completion.

**3:16** · Think of it as a virtuoso classical musician who can recognize and flawlessly reproduce a well known masterpiece from just a few initial notes.

**3:26** · However, while impressive, a Hopfield network's ability to recall and complete patterns is limited to reproducing what it has explicitly learned.

**3:36** · It cannot create new patterns or understand the underlying structure of the data it has seen.

**3:43** · This is where Boltzmann machines come in, offering a more flexible and creative approach to information processing.

**3:51** · To illustrate the difference, let's extend our musical analogy.

**3:55** · Imagine a jazz musician who has internalized not just specific songs, but also the fundamental rules and structures inherent to the music itself.

**4:08** · When given a few opening notes, this musician doesn't simply recall and play an existing piece.

**4:14** · Instead, they leverage a deep understanding of musical theory combined with creativity to improvise and produce something entirely new.

**4:24** · This jazz musician represents a Boltzmann machine.

**4:29** · Unlike an associative network, it doesn't just memorize data points.

**4:34** · Instead, it learns the underlying probability distribution of the data, capturing the essence of what makes a pattern belong to a particular category or style, while incorporating inherent uncertainty into its computations.

**4:51** · At first glance, these two systems might seem fundamentally different, with little in common algorithmically.

**4:59** · However, in fact, they are very closely related.

**5:03** · Just two key technical modifications can transform any Hopfield network into a Boltzmann machine, namely stochasticity and hidden units.

**5:15** · Let's explore each of them in detail.

**5:18** · We will first sprinkle in a dash of randomness and talk about how Boltzmann machines earned their name.

### Boltzmann Distribution

**5:27** · We begin in Austria, 19th century.

**5:29** · where a young physicist, \<i>Ludwig Boltzmann\</i>, is grappling with a fundamental problem.

**5:35** · Imagine a system of particles, like a gas.

**5:39** · Each particle has its own energy, determined by factors such as its velocity.

**5:45** · We can measure the average energy of particles on a macroscopic scale by measuring the temperature.

**5:52** · But what happens at the individual particle level?

**5:56** · We might imagine that particles probably differ in terms of exact energy values.

**6:02** · Indeed, collisions can cause some particles to move faster than others, resulting in a range of energies.

**6:10** · Boltzmann's quest was to understand this energy distribution.

**6:14** · In other words, if we randomly select a particle, what is the probability that it will have a specific energy value?

**6:23** · Boltzmann's insight was to link a state's probability to its energy through an exponential relationship.

**6:31** · Specifically, the probability of a state \<b>S\</b> with energy \<b>E\</b> is proportional to the exponent of the negative energy divided by temperature.

**6:43** · Intuitively, lower energy states are more probable than higher energy states and this fundamental relationship quantifies exactly how much more probable.

**6:55** · To understand why the exponent arises here, imagine energy levels as steps on a staircase with particles jumping between them.

**7:05** · Each step represents a small energy increment, \<b>Є\</b> (epsilon) For a particle to move up one step, it must gain epsilon units of energy, perhaps through a collision with another particle.

**7:18** · Let's call the probability of such a collision \<b>p\</b>.

**7:23** · Given a large number of particles, this probability is essentially constant and depends only on the average particle velocity or temperature.

**7:33** · If a particle jumps up one level with a probability \<b>p\</b>, it might immediately jump again with the same probability.

**7:41** · Since probabilities multiply for independent events, the chance of jumping two levels is \<b>p\</b>-square, three levels is \<b>p\</b>-cubed, and so on.

**7:53** · We see a pattern.

**7:54** · The probability of jumping n levels is \<b>p\</b> to the power of n.

**8:00** · Now, consider a particle increasing its energy by Δ\<b>E\</b> (delta E).

**8:04** · How many steps must it climb?

**8:07** · Well, since the gap between the steps is constant, the number of steps is Δ\<b>E\</b> (delta E) divided by \<b>Є\</b> (epsilon).

**8:15** · Thus, the probability of making this transition to a higher energy state \<b>p\</b> to the power of Δ\<b>E\</b> (delta E) over \<b>Є\</b> (epsilon).

**8:24** · To bring it into a more familiar form, let's repackage different constants.

**8:30** · We can move the temperature dependency of \<b>p\</b> into the exponent and change the base to \<b>e\</b> or Euler's number, conventionally used in exponential.

**8:42** · Note that since \<b>p\</b> is less than one by definition of probability, while \<b>e\</b> is greater than one, this necessitates a minus sign before the energy in the exponent, since the temperature is always positive.

**8:57** · Consequently, the probability of an energy increase Δ\<b>E\</b> is equal to the exponent of minus Δ\<b>E\</b> over temperature.

**9:06** · Oh, and by the way, in textbooks you will usually find a version of it with a Boltzmann constant \<b>k\</b> in front of the temperature.

**9:15** · But this constant is used to convert the units of temperature measured in degrees Kelvin to energy measured in joules.

**9:24** · But in this video we will absorb the Boltzmann constant into temperature directly for brevity, since we don't really care about the exact physical units.

**9:33** · This equation gives us the relative probability of transitioning from one state to another as a function of the energy difference between them.

**9:43** · But how can we find the absolute probability of a particular energy state?

**9:48** · Here's what I mean.

**9:49** · Consider the following toy example.

**9:52** · Suppose there are only three states our system can exist in, with energy values of one, two and three respectively, measured in arbitrary units.

**10:03** · Let's say the temperature is equal to one.

**10:07** · This equation tells us that finding the system in the state two is one over \<b>e\</b> times as likely as finding it in the state one, which has lower energy, and finding it in the state three is one over \<b>e\</b> squared times as likely compared to the state one.

**10:27** · But what about the absolute values of probabilities rather than their ratios?

**10:32** · We don't really know the baseline probability of state one in the first place.

**10:38** · So how can we find it?

**10:40** · The missing link here is that all absolute probabilities must add up to one.

**10:47** · Indeed, the system is guaranteed to exist in one of the possible states.

**10:52** · So if we denote the absolute probability of state one as \<b>x\</b>, we can express probabilities of other states using \<b>x\</b> because we know their ratios, and write down the law of total probability.

**11:07** · From this, we can solve for \<b>x\</b> and then find the absolute probabilities for all other states as well.

**11:16** · This shows how we can go from relative probabilities of energy increases, given by the Boltzmann formula we derived, to absolute values by solving the equation containing the summation over all possible states.

**11:32** · Let's plug the absolute energy values into the exponential formula.

**11:37** · Substituting delta E for just \<b>e\</b> for now and plot those relative probabilities as a function of energy, we can plot the absolute probabilities that we found through the previous procedure as well.

**11:53** · Notice that one shape looks like a vertically rescaled version of the other.

**11:59** · This is a crucial insight.

**12:01** · Since absolute probabilities must be proportional to relative transition probabilities, we can express the absolute probability of a state with an energy \<b>e\</b> as the exponent of its negative energy that we found before divided by some constant factor \<b>Z\</b>.

**12:21** · This constant corresponds to the appropriate rescaling.

**12:26** · The value of \<b>Z\</b> can be found by ensuring that the probabilities of all possible states add up to one.

**12:34** · This normalization factor is known as the partition function.

**12:38** · It takes into account all possible states and how energy is distributed across them.

**12:46** · This is the complete and final version of the Boltzmann distribution, which links energy to probability.

**12:54** · To use it, first, look at all the possible states and sum together the exponent of their negative energies, obtaining the value of \<b>Z\</b>.

**13:05** · Then, to find the probability of a system being in a particular state with a certain energy, compute the exponent of the negative of that specific energy and divide it by \<b>Z\</b>.

**13:18** · Now that we have established the Boltzmann distribution, let's apply it to Hopfield networks to make them more stochastic.

**13:28** · Recall that in Hopfield networks, each neuron updates its state deterministically based on its inputs.

### Stochastic Update Rule

**13:35** · If the total input is positive, it turns on.

**13:38** · If negative, it turns off.

**13:40** · This corresponds to always moving to the lowest energy state available.

**13:45** · Boltzmann machines, however, embrace Instead of always choosing the lowest energy state, they make probabilistic decisions based on the Boltzmann distribution we derived.

**13:58** · Here's how.

**13:59** · Consider a single neuron \<b>I\</b> in our network.

**14:02** · At a given updates tap, we essentially have two candidate states, the neuron being on or off, with the rest of the network remaining fixed.

**14:13** · Using our definition of energy as the degree of conflict between weights and pairwise states, let's write down the energy for these two alternative states.

**14:24** · Here, the first term is the contribution of the edges of neuron \<b>I\</b> to the total energy, while the second term represents the energy contributed by the rest of the network, which is not affected by the state of the neuron \<b>I\</b>.

**14:39** · Given these two alternative choices, we can express the probability of neuron \<b>I\</b> being on using the Boltzmann distribution for the case when there are only two possible states which differ only by the value of neuron \<b>I\</b>.

**14:55** · Note that because we are taking the ratio energy term from the network not affected by neuron \<b>I\</b> cancels out, so the probability of this neuron's update is fully determined by its local connections.

**15:10** · After dividing by the numerator, we can express the probability of switching on is a function of the energy difference gained by that update.

**15:21** · Now let's examine the energy difference between those two states.

**15:25** · From the definition, it is simply two times the weighted input to the neuron \<b>I\</b>.

**15:31** · Substituting this into our probability equation gives us the following formula.

**15:36** · This is called the sigmoid function of the weighted sum of inputs.

**15:41** · It tells us that when the input to a neuron is positive, the neuron is more likely to switch to the 'on' state with a higher probability for larger inputs.

**15:54** · When the input is negative, the probability of switching on goes down, approaching zero for very negative values of the weighted input.

**16:04** · Our stochastic update rule thus becomes the following.

**16:08** · First, calculate the weighted input for neuron \<b>I\</b>.

**16:12** · Next, compute the probability P using the sigmoid function above.

**16:17** · Generate a random number between zero and one.

**16:21** · If that random number is less than the probability, set the neuron state to one, otherwise set it to -1.

**16:29** · This rule allows neurons to sometimes switch to higher energy states with a probability that depends on the energy difference and temperature.

**16:40** · At high temperatures, the decisions become more random, while at low temperatures, they approach the deterministic behavior of Hopfield networks.

**16:50** · Temperature is usually a hyper-parameter that we can tweak depending on how creative we want the model to be.

**16:58** · This stochastic rule is crucial for Boltzmann machines.

**17:02** · It allows the network to escape local minima in the energy landscape and explore a wider range of states, enabling it to learn more complex probability distributions and generate more diverse outputs.

**17:16** · The random update rule is the key modification for inference in Boltzmann machines.

**17:22** · But you might wonder, does this stochasticity also change how we learn, how we sculpt the energy landscape in the first place?

**17:30** · Indeed, it does, and as we'll see shortly, it leads to a fascinating concept known as the contrastive learning rule.

**17:38** · In Hopfield networks, learning was straightforward.

### Contrastive Hebbian Rule

**17:42** · We adjusted the weights to lower the energy of patterns we wanted to store.

**17:48** · But with Boltzmann machines, our goal shifts.

**17:51** · Instead of memorizing specific patterns, we want to learn the underlying probability distribution of our data.

**18:00** · Let's think about what this means.

**18:02** · Ideally, as the network stochastically explores the landscape of possible states, we want it to spend more time in states that correspond to patterns in our training data, because they are examples of what is realistic.

**18:19** · In other words, we want these states to have higher probability.

**18:25** · Recall the Boltzmann distribution, which links the probability to energy.

**18:29** · According to this formula, to increase the probability of a state, we need to lower its energy relative to other states.

**18:38** · But here's the catch.

**18:40** · Changing the energy of one state directly also affects the partition function \<b>Z\</b>, which depends on the energies of all other possible states.

**18:51** · This interplay leads us to a new learning objective.

**18:55** · We want to maximize the probability of the states corresponding while accounting for the overall distribution of states the network can reach.

**19:05** · We're going to need a new learning rule based on the probability rather than energy per se.

**19:12** · So let's derive it from scratch.

**19:15** · Remember, the ultimate goal is to maximize the probability of our training data under the model.

**19:21** · Let's say we have a set of training patterns x1 through xn.

**19:26** · We want to maximize their joint probability, which is the product of probabilities assigned to each individual example.

**19:34** · It is often easier to work with sums rather than products, so let's take the logarithm of both sides.

**19:41** · Since log is a monotonic function, maximizing the probability is equivalent to maximizing its logarithm.

**19:49** · Now, let's express the probability of each pattern with its energy.

**19:54** · Using the Boltzmann distribution, expanding this according to the properties of the logarithm gives us a crucial insight.

**20:03** · To maximize the log probability of our data, we need to simultaneously minimize the energy of our training patterns minimize the partition function.

**20:15** · The first part makes intuitive sense.

**20:18** · We want our training patterns to sit in deep energy wells.

**20:23** · But why minimize \<b>Z\</b>?

**20:26** · Remember, the partition function sums over all possible states.

**20:31** · By minimizing it, we are effectively increasing the energy of states that are not in our training data.

**20:39** · This prevents the network from assigning low energy to too many states, which would dilute the probability of our desired patterns.

**20:48** · It essentially creates two opposing forces.

**20:52** · One is digging energy wells around desired data, while another is pulling the energy surface up for undesired data.

**21:02** · To derive the learning rule out of this, we can take the derivative of the log probability with respect to a given weight and then make iterative adjustments to the weights to maximize it.

**21:16** · I don't want to overwhelm this video by taking derivatives and shuffling symbols around.

**21:21** · If you're interested in this step-by-step derivation, I will make the extended version of the script with all the math details available to my Patreon supporters.

**21:31** · But after you go through the math, you will get what is known as the contrastive Hebbian learning rule.

**21:38** · The interpretation of it is really elegant.

**21:41** · The first term is the average product of states \<b>x\</b>i and \<b>x\</b>j when the network is exposed to the training data.

**21:50** · This is what is known as the Hebbian term.

**21:53** · It is directly analogous to what we saw in Hopfield networks.

**21:58** · It strengthens connections between neurons that are often active together in the training data.

**22:05** · The second term is the average product when the network of those two neurons is running freely.

**22:13** · This is what we will call an anti-Hebbian term.

**22:17** · Notice that it is taken with a minus sign.

**22:21** · Effectively, what this is saying is we want to make sure the weights do not reinforce fictitious, dreamed up states that are far away from the training example.

**22:34** · This rule is called contrastive because it kind of contrasts the behavior of the network when it is constrained by the data versus when it is daydreaming on its own.

**22:46** · It lowers the energy of data patterns while also capturing the underlying probability distribution, allowing for both accurate recall and creative generation.

**22:58** · In practice, to get the first term, we simply go over each training example, look at pairwise products between a pair of neurons, and tweak the weight between this pair in proportion to the average.

**23:13** · But what about the anti-Hebbian term?

**23:16** · How can we let the model hallucinate?

**23:19** · Essentially, running freely here means allowing the network to evolve according to its update rule without any external input.

**23:29** · Here is how we do it.

**23:31** · First, start with a random configuration of the network, then repeatedly update the steps of all units according to the stochastic update rule.

**23:43** · Continue this process for many steps, allowing the network to reach its equilibrium distribution.

**23:49** · Once at equilibrium, look at the pairwise states for each pair of connected neurons.

**23:56** · Repeat this process many times and take the average.

**24:01** · Back in the case of Hopfield networks, we had an explicit formula for the weights as a function of training patterns and hence could set them instantaneously.

**24:12** · One major difference for Boltzmann machines is that learning is no longer instantaneous.

**24:19** · Instead, it involves an iterative procedure, and the stochastic oblate rule is applied many times in order to iteratively find better and better weights as well, not just for inference.

**24:34** · This learning process alternates between 2 phases, the positive phase where we set the neurons to encode the training patterns and compute pairwise state products \<b>x\</b>i times \<b>x\</b>j and the negative phase where we let the network run freely to compute \<b>x\</b>i times \<b>x\</b>j.

**24:53** · We then update the weights according to this formula.

**24:57** · This process is repeated many times over the entire training data set.

**25:03** · Gradually, the network learns to shape its energy landscape so that the valleys correspond to patterns in the training data and peaks correspond to unrealistic examples, capturing the uncertainty in the underlying distribution that generated that data.

**25:23** · Great!

**25:24** · But so far, we have explored networks with only visible units, neurons directly encoding the data.

**25:31** · But to truly harness the stochastic power of Boltzmann machines, we need one final architectural modification, the addition of hidden units.

### Hidden Units

**25:42** · Essentially, hidden units are neurons that don't directly correspond to any part of the input or the output.

**25:49** · Instead, they serve as the model's internal representation, capturing abstract features and higher order correlations in the data that are not immediately apparent in the visible units alone.

**26:03** · Implementing hidden units is straightforward.

**26:06** · We simply increase the number of neurons in the network.

**26:10** · designating some as visible and others as hidden.

**26:13** · The number of visible units usually corresponds to the data's dimensionality.

**26:18** · For instance, a 32 by 32 pixel image would require 1024 visible neurons, one for each pixel.

**26:27** · The number of hidden units, however, is a design choice and can be arbitrarily high.

**26:32** · Importantly, while there is a conceptual distinction between visible and hidden units, the network treats them identically in terms of the update rule.

**26:42** · It computes weighted inputs and performs stochastic updates on one neuron at a time, regardless of the type.

**26:50** · You might wonder if setting weights required known states from the training data.

**26:56** · How do we handle the weights involving hidden units whose correct states are never directly observed?

**27:04** · This is where the elegance of the contrastive learning rule shines.

**27:07** · The weight adjustment, which is an iterative procedure, looks like this.

**27:13** · In the positive phase, we clamp the visible units to a training pattern, and we allow hidden units to update freely using our stochastic update rule.

**27:24** · After reaching the equilibrium, we measure the product of \<b>x\</b>i and \<b>x\</b>j for all unit pairs, including those involving hidden units.

**27:34** · In the negative phase, we'll let all units, both visible and hidden, update freely, starting from a random configuration.

**27:42** · We then update all weights, including those connected to hidden units, using our contrastive update rule.

**27:50** · This process enables the network to learn appropriate states for hidden units that capture the data structure without explicitly specifying what these states should be.

**28:01** · Overtime, hidden units develop representations that capture important data features.

**28:08** · The network learns through optimization to leverage these hidden representations to better model the training data's probability distribution.

**28:18** · Before we conclude, let's briefly touch on what is called \<u>restricted Boltzmann machines\</u>, or RBM.

### Restricted Boltzmann Machines

**28:26** · Essentially, it is a modification of what we talked about today, but where connections between visible units or between hidden units are prohibited, only connections between visible and hidden units are allowed.

**28:42** · This restriction might seem limiting, but it actually offers a significant advantage.

**28:48** · It allows for parallel updates of all units in a layer.

**28:53** · In a standard Boltzmann machine, we update units one at a time, because each neuron's update depends on every other neuron.

**29:03** · In an RBM, all visible units can be updated simultaneously given the states of all hidden units, and vice versa.

**29:13** · This parallelization dramatically speeds up both learning and inference.

**29:18** · Despite the connectivity restriction, RBM's retain much of the expressive power of full Boltzmann machines, while being much more computationally efficient.

**29:28** · This efficiency made restricted Boltzmann machines practical for many real-world applications.

**29:37** · All right, let's try to tie everything together.

### Conclusion & Outro

**29:40** · In this video, we have seen how Hopfield networks that could store and recall specific patterns could be modified for more creative problems of generating new data.

**29:53** · In particular, we looked at how incorporating randomness into the update rule governed by the Boltzmann distribution and rephrasing the learning objective in terms of maximizing probability of training data gives rise to a powerful generative model named the Boltzmann machine.

**30:13** · This stochastic approach, combined with hidden units, allows Boltzmann machines to learn and capture the underlying probability distribution of the training data rather than simply memorizing specific patterns by detecting abstract hidden features.

**30:32** · Such ability not only to recognize, but to understand and generate made Boltzmann machines a crucial stepping stone in the development of modern machine learning.

**30:43** · And while in practice, they have been largely replaced by more advanced models such as multi-layered networks trained through back-propagation, the underlying principles of modeling uncertainty and learning abstract features form the foundation of even the most recent generative AI systems.

**31:06** · Speaking of abstract understanding as opposed to mere memorization, I'd like to thank the sponsor of today's video.

**31:13** · Shortform is an innovative platform that transforms how we engage with books and other information dense content.

**31:20** · Shortform goes beyond traditional summaries by offering in-depth book guides that provide a comprehensive understanding of the material.

**31:30** · along with summary of main points, which is usually more detailed than what you might find on other platforms.

**31:37** · Shortform guides contain multiple references and explain ideas from relevant sources like other books or research articles.

**31:46** · It's like having a knowledgeable reading companion who highlights the most crucial insights and shows you how they fit into a broader context.

**31:55** · Shortform's rapidly growing library of books covers a wide range of topics such as science, technology, and education.

**32:03** · They also have a quite impressive browser extension that can generate similar guides for virtually any online content you encounter.

**32:11** · Don't hesitate to supercharge your reading by clicking the link down in the description to get five days of unlimited access and 20% off on annual membership.

**32:23** · If you liked the video, share it with your friends, press like button and subscribe to the channel if you haven't already.

**32:29** · Stay tuned for more computational neuroscience and machine learning topics coming up.

**32:43** · (Subtitles by Crimson Ghoul)