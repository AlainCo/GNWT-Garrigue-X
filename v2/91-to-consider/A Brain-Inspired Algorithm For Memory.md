---
title: "A Brain-Inspired Algorithm For Memory"
source: "https://www.youtube.com/watch?v=1WPJdAW-sFo&list=WL&index=38"
author:
  - "[[Artem Kirsanov]]"
published: 2024-07-03
created: 2026-08-05
description: "Get 20% off at https://shortform.com/artem=====My name is Artem, I'm a neuroscience PhD student at Harvard University. 🌎 Website and Social links: https://kirsanov.ai/📥 \"Receptive Field\" neuro-"
tags:
  - "clippings"
---
![](https://www.youtube.com/watch?v=1WPJdAW-sFo)

Get 20% off at https://shortform.com/artem  
  
\=====  
My name is Artem, I'm a neuroscience PhD student at Harvard University.  
🌎 Website and Social links: https://kirsanov.ai/  
📥 "Receptive Field" neuro-newsletter: https://artemkirsanov.substack.com/  
✨ Support me on Patreon to get access to Discord community: https://patreon.com/artemkirsanov  
\=====  
  
In this video we will explore the concept of Hopfield networks – a foundational model of associative memory that underlies many important ideas in neuroscience and machine learning, such as Boltzmann machines and Dense associative memory.  
  
🕒 OUTLINE:  
00:00 Introduction  
02:17 Protein folding paradox  
04:23 Energy definition  
08:25 Hopfield network architecture  
14:03 Inference  
18:40 Learning  
22:48 Limitations & Perspective  
24:43 Shortform  
25:54 Outro  
  
📚 FURTHER READING & REFERENCES:  
1) Downing, K.L., 2023. Gradient expectations: structure, origins, and synthesis of predictive neural networks. The MIT Press, Cambridge, Massachusetts.  
2) https://towardsdatascience.com/hopfield-networks-neural-memory-machines-4c94be821073  
3) https://ml-jku.github.io/hopfield-layers/  
  
\=====  
Special thanks to Crimson Ghoul for providing English subtitles!  
  
Credits:  
Protein folding: https://www.youtube.com/shorts/fvBO3TqJ6FE  
  
🎵 Music licensed from Lickd. The biggest mainstream and stock music platform for content creators  
  
Viva La Vida by Coldplay, https://lickd.lnk.to/4aEPvoID License ID: RXj082JWjbA  
  
Try Lickd FREE for 14 days for unlimited stock music and get 50% off your first mainstream track: https://app.lickd.co/r/47462149f85b4b6e9660bbe6d9b0f944  
\=====  
  
\*Disclaimer:\* This channel is my personal project. The views and content expressed here are my own and are separate from my research role at Harvard University.  
  
#HopfieldNetwork #Neuroscience #MachineLearning  
  
  
\_Description remastered: February 2026. Links & Bio updated; original context preserved.\_

## Transcript

### Introduction

**0:00** · Consider the following scenario.

**0:02** · You are at a party, when you hear a short snippet of your favorite song.

**0:06** · (song plays) Almost instantly, your brain recalls the lyrics of that song and many related memories, such as attending a recent concert featuring that artist.

**0:22** · It seems very natural and unimpressive.

**0:25** · After all, people can recall information all the time.

**0:29** · However, if you think about it, this problem is computationally non-trivial.

**0:35** · Let's put ourselves in the shoes of evolution, and try to come up with an algorithm for the brain to solve it.

**0:43** · The first approach that comes to mind is to actually store some kind of a database of all the songs you have heard a sufficient number of times, along with related information, like the title and lyrics.

**0:56** · When an audio fragment of an unknown song is received, we can scan through all the songs in our database, find the one that has a close enough match and retrieve it's lyrics.

**1:09** · However, the search space of every sound I've ever heard is astronomically large.

**1:15** · And it's even larger when considering every single memory you have formed since childhood.

**1:21** · Performing an exhaustive search would be simply impossible.

**1:26** · Yet, you seem to have no problem instantly recognizing familiar stimuli and finding associations between them.

**1:35** · So how does the brain accomplish this so quickly?

**1:38** · In this video, we will lay the foundation for a new paradigm of information storage and retrieval, which is more in line with biology, and actually build one of the simpler models of this process known as \<u>Hopfield networks\</u>, developed by John Hopfield in 1982 who laid an important groundwork for many ideas in both neuroscience and machine learning.

**2:04** · If you are interested, stay tuned.

### Paradoxe du repliement des protéines

**2:17** · Just to reiterate, we need a way to somehow query what we know and find associations between existing memories and new inputs without explicitly checking individual entries for a match, which seems like an impossible problem.

**2:33** · However, we can draw insights from a seemingly unrelated field of molecular biology and in particular, a concept known as \<u>Levinthal's paradox\</u> of protein folding.

**2:45** · As you might know, proteins are long chains of amino acids that fold into specific 3-dimensional structures which determine their function.

**2:54** · The number of possible structural configurations a protein can take considering all the different ways you can arrange the atoms of an amino-acid chain in 3-dimensional space, is absolutely enormous.

**3:08** · Given the number of possibilities, it seems like it would take an astronomical amount of time for a protein to surge through all the possible structures to find it's correct folded state.

**3:20** · In fact, there are computations showing that even if the protein samples is different conformations at a nanoseconds scale, it would still require more time than the age of the universe to arrive at the correct configuration.

**3:35** · Yet, in reality, proteins fold into their native structures in a matter of milliseconds.

**3:41** · \<i>So how do they accomplish this?\</i> When I first heard this paradox in high school, it seems to me like an ill posed question.

**3:49** · After all, the protein molecule is not a computer.

**3:52** · So it doesn't do any sort of search.

**3:55** · It just folds into the most stable and favorable configuration according to physical laws.

**4:01** · This is similar how when you throw a ball, the ball doesn't search through all the possible trajectories to select the optimal parabolic one.

**4:10** · It simply follows that path, because...well, physics works this way.

**4:15** · But how can we think about this folding into a favorable configuration?

**4:20** · Favorable for what, exactly?

### Définition de l'énergie

**4:23** · Let's introduce the concept of energy, as it will come in handy in future videos as well.

**4:29** · If you think back to your high school's physics days you may recall something along the lines of "\<i>energy is a quantitative property that describes the state of a system,\</i>".

**4:39** · "\<i>namely the capacity to do work or cause change\</i>".

**4:43** · Energy can be stored in a variety of different forms and for the case of proteins, we will be interested in potential energy stored in the interactions between the atoms in the protein chain.

**4:56** · Each possible configuration of the protein chain has a specific potential energy level determined by the sum of all of these atomic interactions.

**5:07** · In other words, we can assign a positive number to each state equal to it's energy, which is a function in some very high dimensional space where different dimensions correspond to degrees of freedom you need to uniquely describe a configuration.

**5:24** · For example, all possible dihedral angles of peptide bonds.

**5:30** · Let's abstractly visualize it as having just 2-dimensions.

**5:34** · Then the energy function can be thought of as a surface where each point on it represents a possible \<u>protein configuration\</u> and the height of the point represents the \<u>potential energy\</u> of that configuration.

**5:47** · This is what we are going to refer to as "\<u>Energy landscape\</u>".

**5:52** · For a protein, it could be a complex rugged surface with many peaks and valleys.

**5:59** · Now, here's the key point.

**6:01** · A protein molecule, like any physical system, \<i>tends to minimize it's potential energy guided by the second law of thermodynamics.\</i> It will naturally seek out the configuration that has the lowest possible energy level as this represents the optimal arrangement of it's atoms, and this in fact corresponds to the native correctly folded state.

**6:28** · When a protein is folding, it is essentially rolling downhill on the energy landscape following the steepest path towards the valley.

**6:37** · This is why proteins can fold so quickly.

**6:41** · They don't need to search through all possible configurations.

**6:45** · They simply follow the natural tendency of physical systems to minimize their potential energy.

**6:52** · The protein's folding process is guided by the shape of the energy landscape, which in turn, is determined by the interaction between it's atoms and the descent along the surface is essentially driven by the underlying physical process of energy minimization.

**7:12** · Now, the core idea is to achieve something similar for the case of associative memory.

**7:18** · Suppose we have a system that can encode information in its states and each configuration has a specific potential energy determined by the interaction between the states.

**7:30** · Then we need to, first somehow sculpt the underlying energy landscape so that memories or state patterns we want to store correspond to local minima \<i>these wells in the energy surface\</i>.

**7:46** · Second, we need something that would play the role of the second law of thermodynamics and would drive the changes in the states directing the system towards the nearest local minimum.

**7:59** · Once these two things are achieved, retrieving a memory that is most similar to the input pattern is done by configuring the system to encode the input pattern initially and let then it run to the equilibrium descending into the energy well from which we can redoubt the source memory.

**8:20** · Sounds neat, right?

**8:22** · So let's get into building it.

### Architecture du réseau de Hopfield

**8:25** · Let's consider a set of neurons which we can think of as abstract units that can be in one of two possible states, \<i>plus one or minus one.\</i> This is a simplified analogy of how nerve cells in the brain encode information through patterns of firing.

**8:41** · They either generate an electrical impulse at a given point in time or remain silent.

**8:48** · We'll focus on the fully connected network where each neuron has connections to every other neuron.

**8:55** · These connections have weights associated with them.

**8:59** · Real numbers that signify the strength of coupling between the corresponding pair of neurons.

**9:06** · For a pair of units i and j, we denote the connection weight between them as w-ij and the states of neurons themselves as x-i and x-j.

**9:17** · In the brains, connections between neurons or synapses have a well-defined direction.

**9:24** · A pair of neurons is connected asymmetrically, meaning that the synapse from neuron A to neuron B is physiologically separate from the synapse that connects B to A if that one exists at all and so they can have different weights.

**9:40** · While we could generalize a Hopfield network to account for asymmetric connections, it would introduce complications and potentially unstable behavior.

**9:50** · For simplicity, here we will stick to the original formulation of the Hopfield network, which assumes symmetric weights.

**9:57** · In other words, neurons i and j are connected by the same weight in both directions.

**10:05** · Now that we have a set of neurons symmetrically linked with each other through weighted connections, let's explore what these weighted connections represent.

**10:15** · If w-ij is greater than zero, the connection is said to be excitatory and favors the alignment between the two neurons.

**10:25** · We can think of each connection as being happy or unhappy depending on the states of it's neurons.

**10:32** · For example, if w-ij is a large positive number, it means that neurons i and j are closely coupled and one excites the other.

**10:42** · In this case, when one neuron is active, the other tends to be active as well and when one is silent, the other one is more likely to be silent.

**10:52** · These configurations, where both x-i and x-j are either one or minus one, agree with the connection weight.

**11:00** · However, if we observe, for example, that x-i is equal to one and x-j is equal to minus one, it conflicts with the excitatory nature of the connection making such a configuration less likely.

**11:14** · Conversely, when w-ij is negative, the connection promotes misalignment between the weights.

**11:23** · This alignment between the signs can be expressed more concisely using the product x-i times x-j.

**11:31** · This product will be positive when both neurons have the same sign and negative when they have different signs.

**11:39** · By multiplying this product further by the connection weight, we obtain an expression for the happiness of that connection.

**11:48** · For a positive w-ij, happiness will be positive when the product of the two states is positive.

**11:55** · But this is just one edge.

**11:57** · We can extend this idea and compute the happiness of the entire network as a whole by summing this quantity across all edges.

**12:07** · The larger that number is, the more overall agreement there is between connection weights and pairwise states of neurons.

**12:15** · Ultimately, we will search for a set of weights that maximize this quantity and maximizing happiness is equivalent to minimizing it with a minus sign, which you can think of as the measure of overall conflict between the actual configuration of states and what's favored by the connection weights.

**12:36** · This total \<u>conflict\</u> between the weights and the pairwise states is exactly what we are going to define to be the \<u>energy\</u> of the system.

**12:46** · As we discussed previously, we want the Hopfield network to be able to gradually evolve towards energy minima.

**12:54** · But looking closely at the formula, we can see that the energy value depends both on the states and the weights.

**13:02** · So, there is a lot of things the system can tweak to change it.

**13:05** · What exactly is getting adjusted?

**13:09** · As we will see further, there are essentially two modes of network updates that nicely map to the two aspects of associative memory, namely adjusting the weights \<u>corresponds\</u> to shaping the energy landscape defining which configurations are stable by digging energy wells around them.

**13:31** · This is the act of "learning" when we are writing new memories into the new network.

**13:36** · Once the weights are fixed, tweaking the states of neurons to bring them into greater agreement with the weights corresponds to descending along the energy surface.

**13:49** · This is the act of "inference" when we are recalling the memory that is at the bottom of the energy well which is nearest to the configuration of the input pattern.

**14:00** · Let's take a look at inference first.

### Inférence

**14:04** · Suppose for a second, someone has already set the weights w and hands us the backbone of the network (the neurons themselves with all the connection weights).

**14:15** · However, the exact configuration of states (which neurons are active and which are silent) is unknown.

**14:22** · The question then becomes, "\<i>How do we find the state pattern that would minimize the total energy?\</i>".

**14:30** · As we discussed, simply checking all possible states is not an option.

**14:35** · So, we will start with some initial state which could be either a partial or a noisy version of one of the memories or a random configuration altogether.

**14:47** · Once the initial condition is set, we will iteratively try to lower the energy value by focusing on updating one neuron at a time.

**14:57** · Let's denote the neuron we're currently considering as neuron i.

**15:01** · We will calculate the total weighted input to it from all other neurons in the network.

**15:07** · This input, which we'll denote as h-i, is the sum of the states of all other neurons multiplied by their respective connection weights.

**15:17** · If h-i is positive, it means that the weighted sum of the other neurons states is in favor of neuron i being in the plus one state.

**15:27** · Conversely, if h-i is negative, it suggests that neuron i should be in the minus one state to minimize the conflict with the other neurons.

**15:38** · So, we will update the state of neuron i based on the sign of h-i.

**15:43** · Notice that this update is guaranteed to decrease the energy of the network because from the 2 candidate states we are selecting the more energetically favorable one.

**15:55** · You can think of this as a kind of a voting process.

**15:58** · Each neuron looks at the states of all other neurons weighted by the strength of their connections and decides whether to be active or silent based on the majority vote.

**16:09** · We'll go through this process for each neuron in the network one by one chosen in random order, updating their states based on the input from all other neurons.

**16:22** · Once we've updated all neurons, we will have completed one iteration of the network inference and decreased the system's energy by a little bit.

**16:32** · We'll keep repeating this process, doing these sweeps through all neurons updating them one at a time based on the current configuration.

**16:42** · As we do this, the network will gradually evolve towards a configuration that minimizes the overall energy.

**16:51** · At some point, however, we will reach a configuration where flipping any neuron would lead to an increase in energy.

**16:59** · So no further adjustments would be necessary.

**17:02** · At that point, the network has converged to a stable configuration where each neuron state agrees with the majority vote.

**17:11** · This stable configuration represents a local minimum in the energy landscape.

**17:16** · Now you might be wondering, \<i>is the network guaranteed to reach such a stable configuration?\</i> Could we possibly stumble into a particularly unlucky set of states and get stuck in a never ending loop of flipping neurons back and forth?

**17:32** · In other words, is such iterative flipping of one neuron at a time equivalent of doing a descent along the energy surface?

**17:42** · This is where we come back to the point about symmetric weights.

**17:46** · It turns out that there is a mathematical proof that I am not going to cover here, stating that as long as your weights are symmetric, this simple majority vote single neuron update rule is guaranteed to eventually converge to a stable configuration if you do it enough times.

**18:06** · To restate it, the Hopfield network can settle into different local minima based on it's initial conditions.

**18:13** · These local minima in the energy landscape correspond to distinct memories stored in the network.

**18:21** · When we initialize the network with the pattern that is similar to one of these memories in some way and let it evolve, it will fall into the nearest local minimum, effectively recalling the complete stored memory thus performing pattern completion or noise correction.

**18:39** · But so far, we haven't talked about how we come up with this set of connection weights that encode specific memories in the first place.

### Apprentissage

**18:48** · So, let's explore the learning process.

**18:52** · Before we move to storing several memories, let's consider memorizing a single pattern of states.

**18:59** · That means the network would have a single global minimum \<i>one energy well\</i> and would converge to the same pattern every time no matter where you initialize it.

**19:10** · While it has little practical use, it provides a nice starting point to describe the learning procedure.

**19:16** · Let's denote the template pattern that we'd like to store as "csi", which is a vector packing the states of all neurons, and "csi-i" will denote the 'i'th component, the "csi" state of 'i'th neuron encoding the memory, while x-i refers to the state of 'i'th neuron in the network in general which could be tweaked.

**19:40** · Revisiting our definition of energy, we want to set w-ij so that this quantity would be at its minimal value for the memory pattern.

**19:51** · If we plug x-i equal to "csi-i", we get the equation for the energy of the reference pattern as a function of weights which we want to turn into a global minimum.

**20:04** · Notice that we don't really care about the absolute value of that energy as long as the energy of the desired memory pattern is less than the energy of any other configuration.

**20:15** · Now, intuitively, the lowest possible energy is obtained when all the connection weights fully align with the state pairs.

**20:25** · But when we have just a single pattern, this is very easy to do.

**20:30** · All we need is to set the weight, w-ij, to be the product of the corresponding pair of states in the memory pattern.

**20:39** · This way, every connection is satisfied and the energy of the network when it's in the state "csi" becomes the negative of the total number of edges.

**20:48** · When the network is in the state "csi", any single flip of a neuron would increase the energy thus making it a stable state.

**20:58** · I want to reiterate a crucial point here.

**21:01** · If we want to come up with a set of weights that would dig an energy well around some pattern, then all we need to know are the \<u>pairwise relationships between states\</u> in that pattern.

**21:15** · If the two neurons are active together in the source memory, strengthening the connection between them \<i>lowers the Hopfield energy\</i> of that memory effectively storing it in the weights for associative recall.

**21:28** · You might have heard the famous statement from neuroscience attributed to Donald Hebb.

**21:33** · "\<i>Neurons that fire together, wire together\</i>."

**21:37** · And, in fact, what we just did is known as the Hebbian Learning Rule.

**21:42** · Great! So we found a way to make a single pattern a stable state of the network.

**21:49** · But we want to store multiple patterns.

**21:52** · How do we do that?

**21:53** · Here's the key idea.

**21:55** · We can simply sum the weights we would get for each pattern separately.

**22:00** · So if we have 3 patterns, "csi-1", "csi-2", "csi-3" we can set the weights according to the following equation.

**22:08** · What this will do is turn each of the patterns into a local minimum.

**22:14** · It's pretty forward to show mathematically, and if you're interested, I encourage you to check out the references in the video description.

**22:22** · However, intuitively, if the patterns you want to store are very different, so they are far away in the state space from each other then if you first independently dig energy wells around each of the them and then simply add the energy landscapes together, the resultant surface will have local minima in the same 3 valleys.

**22:47** · And this nicely brings us to the limitation of the Hopfield networks.

### Limites et perspectives

**22:53** · There is a limited number of valleys we can sculpt in the energy landscape before they start to interfere with each other.

**23:01** · At some point, if we try to store too many patterns, the network will fail to converge to a stored pattern reliably and recall weird in-between kind of memories.

**23:13** · The total maximum number of patterns you can store is thus limited and depends only on the size of the network.

**23:21** · It is approximately zero point fourteen times the number of neurons.

**23:26** · So if you have a Hopfield network of one hundred neurons, you can reliably store less than fourteen patterns in the best case scenario.

**23:34** · If you are unlucky, however, and some patterns are similar to each other or correlated, their energy will begin to interfere even before you reach the full capacity.

**23:47** · All of this makes vanilla Hopfield networks not useful for practical purposes.

**23:52** · However, to this day, they provide a powerful and intuitive model of associative memory.

**23:58** · A simple network of neuron-like units that can store and retrieve patterns through purely local learning and inference rules.

**24:06** · Despite their limitations, Hopfield networks have laid the groundwork for more advanced energy based models.

**24:14** · In one of the next videos, we will look at the extension of the Hopfield networks known as \<u>Bolzmann machines\</u>.

**24:21** · These generative architectures introduce additional hidden units and \<i>stochastic dynamics,\</i> allowing them to learn mode complex probability distributions.

**24:31** · There is also an extension to modern Hopfield networks, published in 2016 with John Hopfield himself as one of the authors, but that's a topic for another time.

**24:42** · In the meanwhile, I'd like to take a moment and thank Shortform, who are kindly sponsoring today's video.

### Version courte

**24:48** · Shortform is a platform that lets you supercharge your reading and gain valuable insights from books.

**24:54** · Their unique approach of book guides goes way beyond simple summaries by providing a \<u>comprehensive overview\</u> of the material.

**25:04** · Not only do you get a concise version of the main points, but you also benefit from related ideas sourced from other books and research papers on the topic.

**25:15** · They have an actively growing library of books from all sorts of genres such as Science, Health and Technology.

**25:23** · Not only that, but there is a useful AI powered browser extension that allows you to generate similar guides for arbitrary content on the internet.

**25:33** · Personally, I found Shortform to be really helpful, both when I am choosing books to read and writing notes and flashcards on the topic.

**25:42** · Don't hesitate to bring your reading to the next level by clicking the link down in the description to get \<u>5 days of unlimited access \</u> and \<u>twenty percent off \</u>on annual subscription.

### Conclusion

**25:54** · If you like the video, share it with your friends.

**25:56** · Press the like button and subscribe to the channel if you haven't already.

**26:01** · Stay tuned for more computational neuroscience &amp; machine learning topics coming up.

**26:05** · Goodbye and thank you for the (your) interest in the brain.

**26:07** · (Subtitles by Crimson Ghoul Goodbye and thank you for the (your) interest in the brain.

**26:08** · (Subtitles by Crimson Ghoul