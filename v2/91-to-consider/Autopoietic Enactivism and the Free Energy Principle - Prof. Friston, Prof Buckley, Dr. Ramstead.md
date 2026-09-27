---
title: "Autopoietic Enactivism and the Free Energy Principle - Prof. Friston, Prof Buckley, Dr. Ramstead"
source: "https://www.youtube.com/watch?v=bL00-jtRrMA&t=3s"
author:
  - "[[Machine Learning Street Talk]]"
published: 2023-09-05
created: 2026-09-27
description: "This fascinating exchange between leading scholars explored connections and tensions between the Free Energy Principle (FEP) and enactivism. Moderator Tim Scarfe teed up the dialogue by noting critiqu"
tags:
  - "clippings"
---
![](https://www.youtube.com/watch?v=bL00-jtRrMA)

This fascinating exchange between leading scholars explored connections and tensions between the Free Energy Principle (FEP) and enactivism. Moderator Tim Scarfe teed up the dialogue by noting critique of FEP from an enactivist paper. Karl Friston, as founder of FEP, was interested to discover whether he is an enactivist. Chris Buckley brought expertise from robotics and physics, while Maxwell Ramstead offered in-depth knowledge of both FEP and enactivism.  
Ramstead outlined core enactivist views - embodied cognition, rejecting computationalism, dynamical systems focus. He distinguished "high road" anti-representational versus "low road" more moderate variants. Enactivism emerged from autopoiesis, which emphasizes structural recursion and self-generation of constraints. Buckley shared coming to FEP as a skeptic from robotics and behavior-based AI. He welcomed reconciling operational closure concerns within FEP.  
A tenet of enactivism is rejecting information-theoretic explanations. Friston and Ramstead argued information theory inheres in dynamical systems physics. Ramstead contends the split is baseless, stemming from misreading early proposals as mutually exclusive. He laments enactivists’ philosophical insularity and dogmatism against information approaches.  
Discussing boundaries, Ramstead asserts FEP’s Markov blanket formalism captures organizational dependencies akin to enactivism’s operational closure. Blankets are flexible, not fixed veils. Generative models likewise represent systems’ relational organization. Friston emphasizes blankets separating and coupling systems. Both internal and external states are integral.  
On goals, Buckley advocates an intentional stance - using goal language pragmatically if beneficial. Goals emerge from beliefs about dynamics rather than reward functions. Friston elegantly deduced goal-directed behavior mathematically falling out of FEP in a particular regime. The group explored how systems act “as if” they have goals or models without explicit representations. This helps reconcile enactivist and computational views.  
Ramstead repeatedly critiqued enactivists’ commitment to firm divides, like between mind and world. He argues FEP integrates perspectives, dissolving false dichotomies. Friston emphasized FEP’s consistency with other principles like maximum entropy, foreseeing links with relational quantum physics.  
Overall, the conversation was constructive and conciliatory in intent. All parties agreed on seeking compatibility and community between research programs. However, Ramstead levied significant critique of enactivists’ philosophical assumptions and resistance to information theory. While appreciating the spirit of engagement, he contends some differences originate from enactivist misunderstandings. The discussion revealed a complex intermixing of resonance and tension between these leading approaches to cognition.  
  
Prof. Karl Friston - Inventor of the free energy principle https://scholar.google.com/citations?user=q\_4u0aoAAAAJ  
Prof. Chris Buckley - Professor of Neural Computation at Sussex University https://scholar.google.co.uk/citations?user=nWuZ0XcAAAAJ&hl=en  
Dr. Maxwell Ramstead - Director of Research at VERSES https://scholar.google.ca/citations?user=ILpGOMkAAAAJ&hl=fr  
  
We address critique in this paper:  
Laying down a forking path: Tensions between enaction and the free energy principle (Ezequiel A. Di Paolo, Evan Thompson, Randall D. Beere)  
https://philosophymindscience.org/index.php/phimisci/article/download/9187/8975  
  
Other refs:  
Multiscale integration: beyond internalism and externalism (Maxwell J D Ramstead)  
https://pubmed.ncbi.nlm.nih.gov/33627890/  
  
MLST panel: Dr. Tim Scarfe and Dr. Keith Duggar  
Pod: https://podcasters.spotify.com/pod/show/machinelearningstreettalk/episodes/Autopoitic-Enactivism-and-the-Free-Energy-Principle---Prof--Friston--Prof-Buckley--Dr--Ramstead-e28v7rp  
  
TOC:  
00:00:00 - Introduction & Participants' Backgrounds  
00:04:01 - Core Views of Enactivism  
00:15:02 - Dynamics vs Information Theory  
00:22:20 - Concept of Operational Closure  
00:30:00 - Good Regulator Theorem  
00:40:00 - Role of Intentionality  
00:51:31 - FEP & Ecological Psychology  
01:00:00 - Goals in FEP  
01:10:00 - Emergence of Goals  
01:20:00 - Importance of Intentional Stance  
01:31:15 - Future of FEP  
01:40:00 - Observer Dependence in FEP  
01:50:00 - Metrological Aspects of FEP

## Transcript

### Introduction & Participants' Backgrounds

**0:00** · We have backups. We love Netflix Quality Productions.

**0:05** · Okay, Well, in which case let's kick off.

**0:07** · So we've had a couple of technical problems with the stream, so now we're going to go prerecorded instead, which is absolutely fine.

**0:14** · So we're going to talk about quite a few things today.

**0:17** · Now, one big theme I think is talking about Enactivism and the kind of compatibility between the free energy principle and enactivism.

**0:27** · We're going to talk about. Now we have to be very careful how we pronounce this word Autopoietic. Is that right? Maxwell?

**0:35** · That's right, yes. Amazing. So we're going to talk about give me when I get it wrong, I'm going to get it wrong. I'm sorry.

**0:42** · So we're talking about Autopoietic enactivism, which which, of course, was the brainchild of Varela. And there's an interesting paper that came out which was actually quite critical of FEP.

**0:52** · But we're going to talk about some of the points in that paper.

**0:54** · And that was called Laying Down a Forking Path.

**0:56** · Tensions between Enaction and the Free Energy Principle and in that paper there were a few areas, so there was the definition of autopoiesis historicity. So we'll talk about temporal sequence invariance and non steady state equilibrium and what it means to be ergodic.

**1:12** · And there was this critique about the non-stationarity of distributions and also a really interesting discussion about internalism versus externalism because of course the, the enactive view is, is a form of externalized cognition, which is this very interesting view that you have cognizing elements outside of the mind in the environment around you.

**1:35** · So we'll talk about that as well. We'll touch on goal Directedness and also structure learning, which is a really, really exciting thing in any any Bayesian cognitive framework.

**1:44** · Now on the call today, we have obviously, first of all, Professor Karl Friston, the inventor of the Free Energy Principle and active inference, a man who requires no introduction whatsoever.

**1:55** · Professor Friston, welcome to the show.

**1:57** · It's great to be back. Fabulous. We also have Dr. Maxwell Ramstead, one of the top scholars in the Free Energy Principle and the active inference literature. Of course, we've had Maxwell on very recently, But welcome back, Maxwell. Always a pleasure, gentlemen.

**2:15** · Amazing. And we also have a new face. Professor Buckley, would you like to introduce yourself? Yeah. Yeah. So, yeah, I'm a faculty member at the University of Sussex, but I also work with verses with Maxwell and Kyle.

**2:29** · So I have a background originally in physics and a postgraduate in physics and then moved into cognitive robotics.

**2:36** · So it was kind of working in the behavior based robotics and then activism. Somewhat early on, my my PhD moved into kind of theoretical neuroscience and kind of really got interested in the free energy principle about 8 or 9 or so years ago and wrote a review on it originally, you know, wanted to challenge it and then eventually fell in love with it and now think it's the right way to go for it, for, for what we want to do. So yeah, I came as a skeptic and, and I've been bashed into into into place.

**3:08** · I do think now this is is the correct way to think about things. Amazing.

**3:12** · Well, let's let the bashing commence. Well, we'll move straight on on the subject of Enactivism. So there was this paper laying down a forking path, tensions between an action and the free energy principle.

**3:22** · And the name is very hard to pronounce. It is Ezequiel de Paula.

**3:28** · Ezequiel. Ezequiel di Paolo. Yeah. Okay. Thank you so much for that.

**3:33** · Now, now, just just to be fair to them, because Maxwell, you did actually couch as an activism 2.0 despite the inactivists rejection of information methods. And maybe we should start by defining an activism. And also there's some similarities with this other idea called ecological psychology.

**3:56** · So why don't why don't we just start by framing some of these ideas up?

### Core Views of Enactivism

**4:01** · That sounds good. Yeah, I think that's a great idea.

**4:05** · Do you have, like, a pre-prepared definition you wanted to share, or do you want us to riff on this? Well, why don't why don't we start with varellas and activism? So there are some so so it's in terms of philosophy, there are hints of existentialism and phenomenology and Eastern influences and focus on lived experience and stuff like that.

**4:26** · One of the the core things is that they reject information processing and computationalism. They focus on actions and interactions there. It's a very embodied tradition.

**4:38** · So why don't we just kind of start with that? Okay.

**4:41** · Yeah, that's a great way to set it up.

**4:43** · Well, I mean, we, we should probably just add a little bit of context and a few caveats before launching into this.

**4:50** · So I think Chris and I are of the generation that was trained in the enactive embodied tradition. I would describe myself as a reformed Inactivist I don't know if, Chris, you resonate. I'm still an activist.

**5:06** · I still believe in activism. Yeah. So these the Enactive approach is one of the so called four E approaches that have become very popular since the 90s and I would argue is at least in in the more philosophically informed corners of cognitive science and neuroscience, basically the dominant theoretical paradigm right now.

**5:31** · So we have to say there's a this is a broad church of approaches that go from a more kind of minimalist recognition that cognition involves bodily processes to the more radical approaches that you were describing earlier that just wholesale reject information theory, the computation, the computational metaphor for mine, the mind is basically a kind of computing device. And yeah, the, the enactive approach grew out of autopoietic theory.

**6:04** · They're distinct, it's important to say. So Autopoietic theory was developed by Maturana and Varela sometime in the 1980s and 90s, and it was a very mechanistic approach to mind. I mean, you know, some of the early kind of flagship papers in this tradition are what the frog's eye tells the frog's brain and this kind of stuff.

**6:35** · So, you know, hard nosed kind of systems, biology type thinking.

**6:40** · And I mean, there was basically a break in the literature where due to Varela, in a lot of ways, the emphasis moving from kind of mechanistic models to phenomenology to a kind of more dynamic coupling, interactive kind of mode of explanation.

**7:04** · So yeah, the Enactive approach is basically committed to this idea fundamentally that cognition is basically bringing about a world, a structured world of meaning and significance through adaptive appropriate actions left in the world.

**7:21** · So the, the slogan is, you know, yeah, exactly.

**7:28** · Constructing this meaning, you know, laying down a path and walking, I think is the slogan, the poetic slogan form that's so popular. Um, yeah. And in in its more radical inclinations, this enactive approach says dynamical systems is really the way to study systems that have mind.

**7:48** · And so the kind of the background assumption there is that there is a fork in the in the road somewhere, you know, where you have to choose between information theory and dynamics. And yeah, they obviously go down the dynamics path. Um, so I think that's a setup.

**8:11** · And before launching into criticism, I should say that we as a community genuinely appreciate and benefit from friendly critical engagement.

**8:20** · So I just want to caveat all this by saying that the criticism comes from a place of wanting to build community from a place from our hearts, basically. And yeah, although I'm going to be saying a lot of critical stuff about the Enactive approach in my heart, I'm an inactivist. I think just that the a lot of the a lot of the methodology and explanatory constructs that are leveraged in the approach are problematic.

**8:49** · And in particular, you see this come out when the free energy principle comes into play. So So, Chris, do you do you want to add anything to that, that definition? Yeah.

**8:59** · I mean, I guess it's like, I see I'm going to use this kind of phraseology. It was in in one of Kyle's books, which is a low road and a high road and activism.

**9:10** · And I basically was brought up a low road and activist. Right?

**9:13** · So this is kind of rejection of representationalism in cognitive architectures. It was a move away from good old fashioned artificial intelligence to embedded and embodied agent.

**9:22** · So this is kind of the origin in Rodney Brooks behavior based approaches to to robotics. And those are the kinds of ideas I still embrace. And then there's the kind of high road and activism which kind of embraces autopoiesis and operational closure at its heart. And I mean, to me, I mean, if you're if you're a high road, an activist, they are the same thing.

**9:43** · They come from the same place. But I think there's a kind of there is a there are messages to take from an activism and the low road, which are super important for cognition, right?

**9:52** · Without kind of going into the depths of the autopoiesis just in terms of like the language, I think I think there is a split between dynamical systems theory, which is kind of the origins of descriptions of autopoietic systems and information theory.

**10:06** · But that community has begun to embrace, you know, a little bit of information theory, but it tends to have been done through kind of phenomenological models, simple models, rather than kind of have this kind of theoretical angle or deep theoretical basis in something like Bayes that like we do, right?

**10:24** · I mean, so that paper, I read it before we come to me it doesn't seem, you know, some of the language is quite dismissive, but to me it seems an opportunity to see whether we can reconcile these frameworks and I think they've done a nice job in pointing where there are maybe things that we can express better within the free energy principle that kind of address things like operational closure.

**10:44** · I feel like the community sometimes feels like it has to be divided, but I'm very much an inclusive person. So, you know, I think some really nice dialog between people in Enactivism and what we do in the in active inference and the free energy principle. Interesting.

**11:02** · I mean, I'll bring Professor Friston in in just a second.

**11:05** · But I was reading this very interesting paper by by Maxwell written in, I think it was 2019 Multi-scale integration.

**11:12** · Internalism And I was 21. Okay. So it's the, the Multiscale integration paper. And you know, of course this, this enactive philosophy is all about externalism.

**11:22** · So, you know, you actually have these cognizing elements outside of, of where the brain is. And in a way, it's there's this helm Hobbesian sharp separation between the organism and the environment, which is perhaps embraced by neuroscientists.

**11:37** · But the interesting thing about the free energy principle is I think it maintains some vagueness about this notion of whether it's an internalist system where you have strong representations and predictive power about what's going on in the world around you versus being this kind of dynamical Externalist enactive type system.

**12:00** · And in that paper, Maxwell, you are saying that, well, actually we can integrate the two views because you can have these nested boundaries. And as Professor Friston has said, human minds. The reason we have this temporal depth of planning and sophistication and representation building and so on is because we're at the top of the stack, but there's many, many layers below us where perhaps it is more of an inactive, externalized form of cognition. So we can kind of speak to both worlds. But Professor Friston, perhaps you could come in on that. Yeah. I was frightened.

**12:37** · You were going to ask me if I had anything to add about Enactivism.

**12:41** · Because I haven't. I'm here to find out whether I'm an activist or not. So at the end, if someone can tell me whether I'm an inactivist, I'm really grateful.

**12:50** · There's probably some nuanced version of it, like a moderate, epistemological inactivist, which I am. So I think.

**13:02** · With that last point, Tim, I think is a really interesting one.

**13:06** · And in fact, I just reviewed a paper for synthesis yesterday.

**13:08** · I think touching upon this issue from a philosophical perspective.

**13:14** · Put very simply, the free energy principle basically will accommodate both perspectives. It rests upon an externalist view of the universe as a random dynamical system that just by equipping that system with a partition that separates something from everything else then induces an internalist explanation for the way that thing makes sense of its universe. So there is a necessary enmeshing of both the Externalist and the Internalist perspectives.

**13:47** · You know, put it another way the Internalist perspective is entirely licensed in terms of the interpretation of self-organization as a process of inference. And you know, with that an explicit commitment to a certain kind of representationalism.

**14:08** · But that only inherits from, you know, where you start from, which is an externalist view of the thing in an external world with, with a with a particular metaphysics here described in terms of random dynamical systems. And it's interesting also you pick up on this fork in the road, which I confess I completely I do not understand, you know, all interesting information theory read as probability theory, and that is used in physics inherits from dynamical systems.

**14:40** · You know, we're talking thing ranging things ranging from the master equation through to schrdingers wave equation, the fokker-planck equation, forward equations.

**14:54** · All of these are information theoretic treatments of dynamical systems. So I don't really understand the nature of this fork, so I probably should now pass it back to the what.

### Dynamics vs Information Theory

**15:06** · Well, can I, can I follow up on that, Chris and then maybe you can answer that. I don't get it either. And so what what confuses me about it is one of the the brilliant things about the free energy principle to me is this exact connection between random dynamical systems of a certain degree of complexity, let's say approaching autopoietic. Right.

**15:26** · And and this behavior that they must manifest in order to, to be what they are. Right. Which is which is this balancing between between, you know, uncertainty and prediction and that sort of thing. So to me, they're they're hand in glove. And so I guess my question to you, Chris, since you were going to jump in there, is what is the source of this conflict like? Is it a fear that if it's linked, if you link the information and dynamics in this certain way, that they have to conform to this principle that we're all going to be put out of work or we're not going to be able to study the things we want to study or just. Do you mind if I just quickly interject with a little bit of context? Okay.

**16:01** · Just to I wanted to elaborate a little bit on what Karl said, because I think there were some things in here that might in what Karl said that might not be clear to the audience.

**16:12** · So that bears repeating. The first is that there's this idea that Markov blankets kind of seclude the organism from the environment.

**16:22** · This is sort of like the Helmholtz style story where our relationship to the environment is in some sense only indirect, and we are separated from the environment by our Markov blanket.

**16:33** · The important thing to point out is that just definitionally the Markov blanket comprises the set of degrees of freedom that separate and couple systems together. So it's it's, it's not the the veil, it's the interface. So that's the first thing to point out. So a radically internalist interpretation of the free energy principle doesn't work because you actually need external states to be in play for the math to work.

**16:59** · If there are no external states, then there's nothing to track and there's nothing beyond the Markov blanket. So you don't get the story started like it doesn't get off the ground if you don't assume that there are these things that the particle in question that the thing that you're interested in is a tuning too. And the so there needs to be something to couple and to be separated from for the story to get off the ground. So yeah, it's a if you write down your dynamical systems equations, it's always the generative model that we keep talking about is defined over your internal blanket and external state. So that's the first point.

**17:32** · What Carla is the other, the other way around too, which is if you're empty of all internal states and every single state you have can be influenced from the outside.

**17:42** · Well, there's less to talk about. Well, then you're not a thing, strictly speaking. Right? That so, you know, it's it's definitional to what it is to be a thing to have this kind of interface between that thing and other things. So that's a first point.

**17:59** · So the internal states, as you're, as you're pointing out, do play an asymmetric role. So the FEP says if you have this boundary, then the internal states are going to parametrize a belief about external states. So you do get this kind of internalist looking thing going. As well.

**18:14** · So there is, I think, a kind of reconciliation of internalism and externalism under the free energy principle.

**18:21** · This is what the 2019 paper that you are referring to is about.

**18:25** · It's called Multiscale integration. And that's precisely the idea that things that look separated at one scale can be integrated within the auspices of an overarching structure at the scale above and so on and so on and so on. We're separate as individuals, but we're coupled in this active inference community.

**18:42** · And you know, arguably there's an intentionality also at play there.

**18:46** · Same thing for ourselves, right? Our cells are separate because they have their individual boundaries, but then they're integrated on the time scale of me as an organism and so on. So that was about Internalism and Externalism. I wanted to speak quickly to the split between dynamics and information theory.

**19:03** · Whenever I talk to my friends in high end mathematics about this, they are always as perplexed as, you know, Keith and Carl, you are because it's a nonsensical starting point to do dynamical systems theory.

**19:14** · Seriously, You at some point are going to need to appeal to information theoretic measures. So for example, distances in state space. So, you know, the inactivists are all, you know, they like to appeal to dynamical systems theory and stuff, but the systems that they're considering are usually extremely simple with a few degrees of freedom that are coupled together.

**19:33** · But if you want to do like, you know, grown up dynamical systems theory, then you're going to need to appeal to things like information length to describe the really the metrics on your state space.

**19:44** · You can't avoid that. Similarly, when we're talking about information, we're talking about dynamical, you know, the dynamic time course of these couplings. So we're interested in the dynamics of information. These things are not actually separable. The idea that they are comes from philosophy. Actually, it's a set of papers from the basically late 80s, early 90s by Van Gelder and Port.

**20:09** · And at the time, you know, Dynamical Systems theory was a new thing in cognitive science. And what they were saying was, Hey, there's this approach that we can take.

**20:17** · It's dynamical systems, it's not computational.

**20:19** · And basically it moved from there to there's a, there's this alternative approach that's mutually incompatible.

**20:27** · And that shift kind of happened slowly by a self-referential literature. So, you know, this is where I'm going to be a bit critical. You can really do the historiography and trace these claims back to, I mean basically Van Gelder and Port and to some extent Gibson. But these folks, they don't offer a formal argument, right? Like they're not saying, here's a proof that dynamical systems and computational approaches are like incompatible. They're just starting with this gut feeling that, hey, maybe there's something different here.

**20:55** · And then that turns into, I would argue, sclerotic sizes or hardens into like an a priori dogmatism crystallizes that isn't necessarily Yeah, exactly. That is just based, like I was saying on this kind of circular, you know, we're just citing other philosophers who cite other philosophers who are making this stuff up at the, at the bottom. So yeah, I mean, I kind of feel like this is a problem with the philosophy.

**21:22** · Literature is like, you know, taking just conceptual arguments from other philosophers maybe a bit more seriously than they should without really taking the time to do the proper historiography, looking where these claims are originating and then asking the question, is there any real warrant for this kind of separation?

**21:40** · So yeah, I've been going around recently saying that yeah, this split between dynamics and information theory is mostly in people's imaginations. There's no mathematical basis for it.

**21:50** · And Chris, sorry, if you want to. Do you want to jump in?

**21:53** · No, no, thank you. You wanted to jump in earlier and maybe talk about your personal journey might come into play here.

**21:58** · Yeah, I mean, Max also, you know, said some really interesting stuff there. I mean, I guess I take a slightly less hard line on that, right? I mean, I think it's a historical thing. So Tim van Gelder was looking at deterministic dynamical systems theory like this in the absence of noise, and unless you do ensembles of systems, it's not, there's no clear pathway then to, to information theory.

**22:19** · And initially in models, when in the 80s and 90s were typically deterministic, dynamical systems theory is looking at bifurcations and so on. And then but obviously the richer, the richer set of descriptions is stochastic dynamical systems theory.

### Concept of Operational Closure

**22:33** · And that's when information theory becomes irreplaceable, right?

**22:36** · This becomes and then we become fully enmeshed these these descriptions, as Kyle writes about so nicely in lots of his work. Right.

**22:43** · But I think, you know, I didn't see the forking path as kind of this.

**22:47** · I know that in the community there there's a history of using dynamical systems theory and there's a sense in which the free energy is really embraced information theory. I didn't see that that as a as a key the, the key in the fork of the path. Right.

**23:02** · I mean, I got to say, it's it's way out of my area this this kind of depth of philosophy. But it seemed to me the kind of the problem of the definition of operational closure that seem to.

**23:13** · Be upsetting to Randall Beer and his equal to Powell and the fact that they don't think that can be embraced by the tenants of the free energy principle. I mean, I think they made a nice case. I don't think it a priority that's the case. I can't see there was a hands down argument that there is this forking path.

**23:36** · I still think it's an interesting angle to take to think deeply about operational closure within the free energy principle is I know Maxwell has and he's going to tell you the answers to this.

**23:47** · But, you know, so I'm just aware of the the trickiness in defining operational closure that's happened in the literature in the last 20 years and really in an inability to kind of really get a concrete quantitative description of what we mean by operational closure.

**24:01** · And so, you know, I guess it's to say that we've simply solved it within the free energy principle that might that might have put some backs up somewhere. But, you know, Maxwell maybe can give you a bit more insight into this because he's thought deeply about how to define operational closure within the fringes.

**24:20** · Can I can I can I frame it up for you?

**24:21** · Maxwell So the paper quoted you actually, I think you you said on on one of your papers that there is an analogy, almost a direct mapping between this concept of organizational closure and a Markov blanket. And of course, the Markov blanket.

**24:37** · Is this conditional independence that you're talking about.

**24:39** · And and you also called it an interface earlier on.

**24:42** · And when they speak about the definition of autopoiesis, they say that I think the way that you folks in the literature couch it is mostly as a form of autonomy, which is this ability to maintain your own identity under precarious, you know, situations.

**25:00** · And they say, well, the virella kind of definition of autopoiesis is very much about structure and organization.

**25:10** · So it's not it's not just maintaining your own identity, but it's about this self-organization and this kind of generating structure as well.

**25:17** · So I wonder just just with those things on the table, could could you could you. Absolutely. So in in that paper, I confess that I probably should have spoken. We probably should have spoken a bit more precisely. We say the Markov blanket formalism.

**25:32** · What we mean by that is and I don't think that this was fully appreciated by the authors at the time, what we mean is Markov blankets and the generative models, right? Because so, you know, the claim is right. Let's remind the audience, just put the terms on the table. A generative model, right, is our model of the dependencies that link the states and parameters that make up a given system. Right?

**25:58** · So it is our way of talking about basically the causal connective tissue or structure that underwrites a given system. And what the free energy principle says is if the underlying system is disconnected in a certain appropriate way, then you get this tracking behavior.

**26:19** · And formally speaking, it says if there's a Markov blanket in this dependency structure, right, if conditioned on certain blanket states, then it looks as if subsets of the system are independent from each other, but also tracking each other.

**26:33** · Then, you know, you get this interesting behavior like the if there is this Markov blanket is if there is this independence structure, then you will get this tracking behavior.

**26:42** · That's what the free energy principle is talking about.

**26:45** · So, of course, it's not sufficient to say that things are carved out in a specific way. And therefore, you know, you can say interesting things about them. But I think what's missed in the argument and this has to do with like, I think the the the the I'll say provocatively, the dogmatic commitment to anti representationalism is like when the inactivists regenerative model, they mean a model in my head that I carry around.

**27:14** · They hear like a representation. Right that but what's really at stake is the generative model is the dependency structure, right?

**27:23** · So if you have the right kind of dependency structure that generates a Markov blanket, I would say that you have what the Inactivists call operational closure. In fact, you can show this mathematically. I don't think it's appreciated, but there is a duality that has been rigorously established.

**27:41** · Dalton Shakti Vaudeville is probably the main proponent of this work, but, you know, Carl has done a lot of work over the last two decades in this direction. Yeah, I think the the kind of core idea to remember is that minimizing your variational entropy, your variational free energy with respect to a generative model, right?

**28:04** · So the usual free energy story, right, is dual to or equivalent to maximizing your entropy with respect to a set of. Strings.

**28:14** · So when the Inactivists talk about constraint closure and all of this stuff, you know, Alicia Guerrero's new book, Context changes Everything. The inactivists in the Autopoietic tradition really want to go hard on this and say, Well, what you really need to do is map a set of constraints such that the system kind of self generates. Well, that is rigorously and absolutely equivalent to minimizing your free energy with respect to a generative model. There's no difference there.

**28:41** · So we're talking about the same thing.

**28:43** · We're talking about the way that like a set of structured dependencies generates a thing that's able to sustain itself over time.

**28:51** · And as I was saying, this this sustained over time is a way of describing the interface or coupling between the system and its environment. So that just mathematically we're talking about the same thing. And let me but let me ask a question here, because there's and this is hopefully because I like Carl, I want to find out if I'm in an activist. So maybe maybe you can help set us up for considering this. A big bone of contention for them in that paper is this distinction that they have in their mind between structure and organization. And they seem to get upset when any attempt is made to link organization to structure. For example.

**29:28** · You know, to me, the mark of boundary that say analogous to a a animal cell membrane. I understand as a former person who studied biology, that the molecules of that membrane are in flux, Things come and go, proteins are added, carbohydrates are removed, etcetera.

**29:47** · I don't have, in my mind, a set of molecules that's like they're forever and some type of like, you know, stationary structure.

**29:54** · Like it's a very dynamic kind of system.

**29:56** · But they seem to say, oh, no, if you if you equate, you know, a Markov boundary to an organizational structure, then you're making this, you know, fallacy of kind where you're associating like an organization with like the substrate that manifests that in reality. Like, can you explain to me like, what they were actually up in arms about with this organization versus structure? You know, maybe, Carl, if you could comment on it when Maxwell tells us so we can figure out if we're an activist. So I'll just let me bracket the stuff about Stationarity and Historicity for one second because I have some stuff to say about that. But so it comes back to that.

### Good Regulator Theorem

**30:34** · We'll come back to that because I have a question about that.

**30:36** · It comes back to what I was saying about, you know, it's not just about Markov blankets, it's about generative models.

**30:41** · If you don't appreciate the distinction and what you think we're saying is Markov blankets tell the whole story, then obviously you're going to, you know, think that we're conflating structure and organization. When you realize that what we're talking about is, you know, a Markov blanket within this dependency structure. Right. Then I think you you move to something else. I would say, like what the inactivists call structure corresponds to these Markov blankets that we're drawing and the organization we talk about and we harness in the generative model, right?

**31:13** · Remember the generative model is not my internal representation in my head. It's the overall dependency structure of the system. It's what they would call the organization of the system. So, I mean, I would agree that we shouldn't conflate them and I would, you know, add that we don't that there are distinct constructs that map onto these things.

**31:33** · And, you know, I would also point out that Markov blankets are flexible.

**31:38** · We will be putting out work over the next few months on Wandering Markov blankets like we've got that figured out algorithmically.

**31:46** · Now we can draw a blanket around a flame and stuff like that now.

**31:50** · So we've got all of that working and it's not.

**31:53** · I've been looking forward to that since Karl mentioned it in the first the first interview with him. Let's let's we'll set an anchor to come back to that because that's very interesting, actually.

**32:01** · And actually, one comment you made in your Multiscale paper was that these are ontological boundaries by which I think you are implying that they are not a lens. They are fixed to to some extent.

**32:12** · But I want to just stick on on this organization point for a second though. So in the paper they said that essentially the way the FEP couches this as is as a form of homeostasis, which is just about, you know, maintaining structural properties.

**32:27** · And when they spoke about organization, they said the conservation of organization is what's spoken about in the classic autopoietic literature. And I think you were just making the argument, Maxwell, that that generative model is in some sense the conservation of organization. So is that the missing link?

**32:44** · I mean, maybe a professor Friston you can come in.

**32:48** · You want to take that, Carl? I mean, I think that's right.

**32:50** · But Carl will probably comment more eloquently than I on that.

**32:54** · I don't think so. I think you're being very eloquent.

**32:57** · Thank you. Do you? Worse. And then I'll. I'll.

**33:00** · I'll chip in if necessary. Um. Yeah. I mean, I think that's that's exactly right. Like the Markov Blankets don't have to be permanent. They can be shifting and basically minimizing your free energy with respect to some generative model corresponds to keeping some structure in play. Yeah.

**33:27** · Actually, this segways nicely into the stuff about stationarity and historicity. I think this is the biggest problem in their paper. They claim that the free energy principle can't account for historicity in the sense that it can't account for path dependency. Right.

**33:44** · So for our audience path dependency is this idea that it's not just your position in state space that matters, it's also your velocity.

**33:52** · Roughly speaking, right? That like the the kind of direction that you're going in where you came from is just as important to where you're going as where you are currently.

**34:02** · Um, and they claim that, you know, the free energy, so they make a bunch of false claims about the free energy principle which leads them astray.

**34:08** · So for example, they claim that the free energy principle assumes stationarity. It doesn't. As we've discussed before, there are different applications of the free energy principle in the literature.

**34:18** · The two main families of applications are density dynamics and path integrals. So I drink a lot of coffee and if you were to sample me at random during the day, I would say there's a 1 in 25 chance. Yeah, exactly. I would say there's a 1 in 25 chance that I'm drinking coffee if you just sample me randomly during the day.

**34:39** · If you were to sample me over a week, once per day, there's a 100% chance that I would drink coffee per day. Right.

**34:48** · So there's a difference between looking at the probability of states of me, You know, Maxwell is drinking coffee and the probabilities of paths of me or entire trajectories of me. And that is a really critical distinction. The free energy principle started off as a path based formulation, and I think this is absolutely underappreciated in the literature.

**35:08** · If you look back at Carl's early papers, including the ones that everyone is read, right, the 2010 Unified Brain Theory paper in nature, yet these are all written in terms of paths Carl is taking like a sensory path and then writing down, you know, blanket paths and internal paths. And it's all it's all about the way the trajectories of the system are maintained.

**35:33** · So this is a cool idea that was there before and that we're doubling back down on now, which is that it's really it's about blanket paths that make internal paths independent of external paths.

**35:45** · So there's a sense in which it's always been about counterfactual futures. It's, it's difficult to argue that, like you don't account for historicity when literally the core construct that you're deploying is like probabilities of different histories, like counterfactual futures.

**36:02** · But that entire argument about historicity makes no sense formally, just, you know, and again, we appreciate the critical engagement.

**36:11** · This isn't to, you know, bash anyone specifically, but like this is a complete nonstarter mathematically. Also when you're doing density dynamics, right, when you're not considering probability densities over paths, but rather you're considering probabilities of states and you're doing this non-equilibrium steady state stuff.

**36:30** · So when you are assuming stationarity, you're saying like, yeah, there are these kind of regular cyclical behaviors that I want to model. Even in that context, the free energy principle can handle path dependance. Like literally, I think on page 12 of like Carl's monograph from 2019 on the density dynamics formulations, there are already terms that contain, you know, expressions that are able to handle path dependency, that are basically dependent on changes in surprise in your system. So so before we before we move too far, maybe, Chris you can you might be able to.

**37:02** · Steelman what the the paper was trying to say there or am I not being generous enough where? Well, I'm just I'm just I'm trying to I'm trying to decide if I'm in an activist because Tim's a big fan.

**37:14** · So I want to, you know, give it fair. Anyone Does anybody want to steal, man? You know, where are the paper might have been coming from in terms of this argument against Historicity?

**37:28** · I can straw man it if you want. No steel man.

**37:32** · I'm happy to have a go with it. But I mean, so we're a very broad church at within this community and we debate within ourselves about, you know, the true origins and how we get these things out.

**37:45** · So I actually was worried about this historicity thing in an early version we did in we published in Physics of Life Reviews with a student, a very talented student of mine, and we found real problems with it when we were in a state based formulation of the system.

**38:01** · And I know Maxwell feels that that even in the state based description of probability densities that we can recover historicity, I guess we're still not complete agreement on that. But what's majorly happened in the in the free energy is this movement to pass.

**38:17** · And I agree with Maxwell, if you go back into Carl's original work talking like Carl is not here, but if you go back to Carl's original work, he was framing it in terms of paths. But the presentations in the monograph were to do to do with states.

**38:32** · And when we work through that, we found that the historicity was hard to to to, to get back into these systems.

**38:39** · But the path formalization then makes it clear how historicity because it's built into the system, because you're preserving sets of paths, you go, you know, home your thesis rather than homeostasis in the descriptions of these systems. And then there's this kind of nice, elegant way to deal with historicity, you know?

**38:55** · And I think so I don't think that's a real issue with the free energy principle. So but I can imagine I don't know what technical literature they've read, but perhaps if they've read the state based formal formulation, they had the same worries about us, about historicity. And if they read these new stuff that Maxwell and Dalton are developing, I think those kind of dissolve.

**39:17** · I think it's a much richer framework now. So maybe.

**39:21** · Carl, what were you thinking back then when you did it as paths?

**39:25** · You know, maybe just give us some some thought behind your intuition for why you originally formulated it as a path path, integrals for path systems and you know what your perspective is on what we've been discussing so far, right? Um, I can't really remember.

**39:42** · Um, I suppose, you know, the obvious answer is that much of this inherits from Richard Feynman's work on the path integral formulation.

**39:49** · Indeed, the variational free energy can be traced right back to, I think, probably his PhD thesis. I haven't actually read the PhD thesis, but I've been told all the maths you need is there, so it would be difficult for me to conceive of a calculus that wasn't framed in terms of in terms of paths until you start to try

### Role of Intentionality

**40:12** · and draw graphics and explain to people who are not familiar with, you know, with the notion, with the path integral formulation and its equivalence with density dynamics as articulated, say, with the fokker-planck equation or repeats or Kolmogorov forward and backward equations.

**40:28** · And so I think that is, um, you know, that's one really important aspect of historicity and becomes, I think, even more prescient when you think about deploying a path integral formulation of self-organization in the context of 21st century physics, because what we're talking about now is a move away from 20th century equilibrium physics with point attractors to open systems that are far from equilibrium.

**41:01** · So mathematically, or one mathematical bright line between the physics of equilibrium and the physics of non-equilibrium, which is what the free energy principle is about. Or specifically when non-equilibrium steady state solutions admit a Markov blanket.

**41:23** · But returning to the sort of what is definitive of non-equilibrium, it is effectively the not the historicity but the the itinerancy you get from solenoidal dynamics, sort of conservative dynamics that now supplement the dissipative flows that characterize completely classical physics and equilibrium equilibria, steady states.

**41:53** · So if you wanted to define the difference between an open system or an out-of-equilibrium or a non-equilibrium system from an equilibrium system, the simple kind of systems that Chris was referring to in his, you know, toy models of desert free energy principle work, you know, in this kind of system.

**42:12** · And then all you would do is write down the dynamics in terms of dissipative and conservative or non-dissipative divergence free components and that. If you like. Decomposition of the flow into conservative and dissipative parts is just the Helmholtz decomposition.

**42:36** · It's just the fundamental lemma of variational calculus, I think, or fundamental theorem, which just says that, you know, any flow, any dynamics can always be decomposed into this sort of gradient descent that underwrites classical physics or equilibrium physics and the a solenoidal divergence free flow that underwrites classical mechanics.

**43:03** · But you put the two together and you have by definition now a mathematical image of non-equilibrium systems. And notice that in introducing this kind of itinerancy that is, for example, you know, heuristically, you know, water going down a plughole.

**43:26** · So the Dissipative part, the gradient flow would be the, the the water tumbling down into the depths of your house.

**43:33** · But as it circulates around, you know, technically in terms of the information theory around on ISO contours, the probability distribution. But you know, you can just visualize the water circulation. That's the solenoidal part.

**43:46** · And of course, when you talk about biotic self-organization or self-organization in Non-equilibrium that has that sort of life like biotic form, the the the the key characteristic of this kind of biotic circulation is basically rhythms and life cycles.

**44:07** · So the very fact you're dealing with this kind of historicity that is inherent in the itinerancy of any system that is not at equilibrium means that you are you have to write down or have an understanding or a mathematics that deals with these with these flows and these life cycles. Just one little interesting twist here is if you take the randomness out of it, if you go back to deterministic dynamical systems of the kind I now understand underwrote the the split or the fork in the road in philosophy.

**44:44** · And what you do is you're basically removing from the perspective of the Helmholtz decomposition, the dissipative part, and you're just left with the conservative part. What is that?

**44:53** · That's just Newtonian mechanics. It's as classical mechanics, which is why the sun we rotate around the sun or the moon takes these orbits.

**45:02** · This is just this solenoidal flow in the limit that you've ignored.

**45:07** · The randomness that you that calls for the information theoretic or probabilistic descriptions you know, of any world.

**45:15** · So the free energy principle doesn't deal with all kinds of systems.

**45:19** · It deals with systems that have an admixture of both the Dissipative and the solenoidal or divergence free parts.

**45:27** · If you wanted to just do the disputed parts, you do quantum mechanics.

**45:31** · If you just wanted to do the solenoidal part, you do classical mechanics and deterministic systems. But in the middle you're in the Goldilocks regime in which you and I operate.

**45:42** · We're talking about stochastic chaos, basically another description of this itinerancy. So I think that that's, that's, you know, one aspect of historicity which, you know, is celebrated in the physics of self-organization. And I keep using the word self-organization because I read autopoiesis as self-creation or at least self-maintenance I now appreciate it's not quite self, it's slightly beyond self-maintenance and in the sense that, you know, to create, you know, imply something slightly greater.

**46:19** · And that may be I'm going to have to ask Chris It may be related to operational closure. So I'd like to if somebody can describe for me and the audience what operational closure is, that would be quite nice. But before you do, there is another important aspect of historicity, which we haven't mentioned, which inherits from the deployment of the free energy principle or perhaps just the Helmholtz decomposition in using the apparatus of the Renormalization group. And what that brings to the table is a separation of temporal scales.

**46:52** · And as soon as you have that in play, there's a different kind of historicity which you have to accommodate in any given calculus, certainly for open systems, which means that the kind of steady state solutions that are non-equilibrium steady state solutions we are talking about in the context of the mathematical formulation only exist over a certain time scale.

**47:17** · There's always a time scale above that contextualizes it, and there's always a time scale below that is much, much faster where things live for very, very short period. Its of time.

**47:27** · I think that's another important aspect of historicity that we're not talking about a unique or privileged timescale here.

**47:34** · So when people talk about Stationarity or Ergodicity or steady states, they one cannot say that this is the configuration of a system at T equals infinity, you know, because you have to acknowledge that there is no privileged timescale. Say at this time scale, we will assume there is a steady state solution.

**47:58** · But we have to be very explicit. It's at this time scale and this does not apply at the time scale above or the time scale below.

**48:05** · And interestingly, just mathematically, well, perhaps a naive mathematical or certainly a physicists mathematical perspective, the very fact you have this separation of time scale basically means that there are this fast stuff or fast dynamics and slow dynamics.

**48:23** · And and at the end of the day, if you now consider what is the difference between the flow of states that you would find in a deterministic, random, deterministic dynamical system and the random fluctuations that convert it into a random dynamical system?

**48:40** · The only difference between these things is whether they're fast or slow. So you can treat the random fluctuations, the noise that induces a probabilistic description and all the information theoretic treatments as simply the fast things and everything else is the slow stuff.

**48:56** · So again, speaking to, if you like, an almost necessary connection between any dynamical systems formulation that is sufficiently liberal to include fast and slow stuff and probabilistic treatments of that of the kind that Richard Feynman pursued in terms of trying to work out the probability of the path of the small particle or electron for his PhD thesis.

**49:25** · Anyway, what is operational closure? As she just got up a definition from Varela. If you want me to read it out, can I just frame you up there, Chris? Because in that forking paper there was I actually thought it was a little bit hand-wavy.

**49:42** · It's not like in graph theory where you have very kind of precise definitions. So they had a they had a kind of a node diagram and they said it was operationally closed.

**49:52** · If all of the black colored nodes had one arrow going out and connecting to another one and they had a kind of diagram just showing an organism.

**49:59** · But what's the official definition? Chris Yeah, so this is a definition from Varela. It says an autonomous system is that is the organization is characterized by processes such that the processes are related as a network so that the recursively depend on each other in the generation and realization of the processes themselves.

**50:17** · And to they constitute a system as a unity recognizable in space in which those processes exist. So it's kind of this deep recursive recursivity between the processes maintaining the networks as necessary for the processes, this kind of generation of the system's own constraints. And I guess this has been it's always been a kind of slightly ineffable within the autopoietic literature, what this means formally, right? There's a deep intuition.

**50:42** · This is correct. You know, you think about, as Keith said before, where the matter is changing as flux is changing these processes, but the identity is somehow staying the same.

**50:53** · And that's the organizational structure that's maintained over time rather than the material components of that that structure.

**51:00** · And I do think that there is a sense there was when we did focus on these state based descriptions of the free energy principle, I think that kind of undersold the solenoidal flow that Karl was talking about, whereas that I think is much more important to the people in Autopoiesis, because this notion of of this kind of flow of information and the organization is dynamic within the equilibrium is important for for that field.

**51:24** · So I think, you know, the new directions they've got in the free energy principle think things like Maxwell and Dalton are pursuing is to me an exciting opportunity to kind of reconcile some of the ineffability of these operational closure ideas in autopoiesis and this framework essentially.

### FEP & Ecological Psychology

**51:45** · Cool, cool. So just move. Want to do you want to comment maybe briefly on on that before we move on? Like because Chris Chris called out some of your work there with Dalton. Yeah, I mean, in a good way, though.

**51:57** · I think what Chris is saying is that he agrees with the direction.

**52:00** · I would just say that this isn't really new work in the sense that what Dalton and I are just doing is extending work that Karl did to 20 years ago. So I see this as more continuous.

**52:11** · You know, someone might say that I'm being overly generous, which I might be, you know, by looking at this as like one kind of continuous development. But yeah, I don't really I think, you know, you can think of the state based description as sort of the asymptotic limit of the path based description.

**52:29** · The two are kind of like deeply connected in, in some sense.

**52:34** · Um, so no, I mean, I think this is, this is the direction that we want to go. There's still some interesting stuff that you can say using the density dynamics formulation.

**52:45** · We just have to be, you know, it's like we were discussing Keith during our MLS interview last time, This is mine physics, right?

**52:54** · So, you know, a hallmark of physics is idealization.

**52:58** · And so, you know, necessarily some of these constructs are going to be, you know, the map has to be simpler than the territory.

**53:05** · It's like we were saying, right? You know, otherwise you get you wind up in a Borges novel with like, you know, a map the size of Los Angeles that you can't use. So, you know, for certain kinds of oscillatory cyclical bio behaviors, the non-equilibrium steady state is a perfectly fine, you know, model of it.

**53:26** · You know, I drink coffee so regularly that it might as well be like, you know, deterministic and like, you know, orbiting the sun kind of thing. So, you know, this speaks to the fact that the free energy principle is what it says on the tin. It's a principle. It's a it's a that leads to a modeling method. And, you know, we make some assumptions and we're able to say some things.

**53:50** · But the principle itself doesn't rest on any of these assumptions, like stationarity, for example, like you don't really need that to get it, to get it working. All you need is a Markov blanket and your random dynamical system and you're sort of ready to go in terms of like the formalization of the enactive approach. I always saw this.

**54:10** · So like Chris, by the way, I think this is under I don't talk about it very much, but much like Chris, I started off recalcitrant to the free energy principle. I found out about this stuff around 2014 and it, you know, like I said, I was trained as an activist and this really conflicted with my intuitions. And I went into this thinking I need to and this is also what I think the spirit that motivates a lot of criticism. You go into this thinking, I need to understand this just enough to be able to to know for sure that I don't need to understand this actually.

**54:43** · And, you know, you go into this and, you know, I remember having like a conversion experience reading the Carl's 2012 entropy paper called a Free energy Principle for Biological Systems, which was a path based kind of formulation and everything, and really seeing, oh, wow. Like there's no there's no resisting this, like this is inevitable and really getting like, yeah, this is an inevitable consequence of physics, isn't it?

**55:12** · Like there's no, there's no getting around this and then kind of, you know, doubling down in my conversion and then becoming a part of the community. So what's funny is I had the opposite experience of you too. So when I first saw it, I'm like, This is amazing. Like, this is exactly how it works.

**55:29** · And now I've been trying to escape ever since.

**55:31** · You know, I don't like being shackled, like to the free energy principle. And funny enough, we've talked before about how, you know, Carl, that the free energy principle is one of the few principles that applies to itself.

**55:42** · It's like as simple as it as it can be and still and still work.

**55:46** · The other aspect in which that's true is, as we've been talking about, it maintains this flexibility or maybe vagueness.

**55:53** · You know, critics might say, but it maintains this flexibility which leads to it inevitably generating all kinds of controversy and debates, you know, and people arguing about like the limits of that flexibility. Right. One thing I would quickly point out is like the there's this sense, I think, in the literature that there are like 17 different possible interpretations of the free energy principle and that you can make it say one thing and its opposite, right? What I've been going around saying is, no, that's not correct. There's only the free energy principle and it has the implications that it does and there are misinterpretations of the free energy principle.

**56:28** · So, for example, you know, I think this idea that some people in the literature have been pushing that like the free energy principle is even compatible with this kind of radical anti-realism, this kind of, you know, like descartes's demon kind of.

**56:43** · Thing that's not that just doesn't follow.

**56:46** · It's incompatible with the math. Like you need you need there to be an actual world out there to couple to you for the math to get off the ground. So there there actually isn't a bunch of different interpretations. There's just the free energy principle. It's just that it's a lens that makes you makes you see that a lot of the dichotomies that used to structure the way we think about things are false.

**57:06** · And this comes back to the thing that we were discussing at the end of our interview. Keith This is sort of like a you know, you're sort of abolishing the distinction between the supra lunar re and the sublunary spheres, right? So classical mechanics abolishes the the distinction that was popular in scholastic philosophy, which was, you know, like a thousand, 1000, 500 years of like, you know, natural philosophy saying, well, I mean, if you look at the way things behave, things out there beyond the moon in the supra lunar sphere, right?

**57:40** · They move in perfect orbits, perfect circles, seems to have nothing to do with, you know, things here that fall to the ground or rise and have a beginning, a middle and an end.

**57:50** · These seem like radically distinct spheres of reality.

**57:54** · But then Newton comes along and classical mechanics equips you with a set of equations that apply equally to things here and things over there, thereby just abolishing that distinction.

**58:05** · And I think like the free energy principle comes around and does undoes a lot of these false dichotomies in the same way like we were talking about Internalism versus Externalism, it allows you to say, Yeah, there's something to the Internalist story.

**58:17** · The internal states are doing something special, but you actually need the external world to be there to get the story to kind of pick up.

**58:23** · So I think you get a lot of this and I guess my hot take is that the Inactivists need there to be a bright line in the universe, like a bright red line on the one. And then what's on each side of the line depends on the Inactivists right?

**58:40** · So like, but the story is always something like there's physics, there's mere physics on one side, and then there's the interesting stuff.

**58:47** · On the other side there's biology or maybe there's mind or there's something like that, and there is this bright red line like, Yeah, Uh, so Karl Maxwell is saying the free energy principle is the ultimate shade of gray. I hope you I hope you appreciate that. Well, no, I know. Tim. Tim, we wanted to move to a new topic. Yeah. Yeah. Well, yeah, I mean, there's a few things to to touch on there.

**59:07** · I mean, certainly the philosophy of, you know, enactivism versus ecological psychology is an interesting one because with Enactivism we get quite a few philosophical things bagged on that possibly we may or may not want, for example, the phenomenology, the existentialism, which is this idea that you can shape your own experience, this kind of Eastern philosophy, which is that in some sense there's no distinction between you and your environment, and it has been criticized as being quite ill defined and vague. But I think.

**59:42** · Maxwell, you have said that there's much more of a tighter compatibility with ecological psychology, and that's essentially that we see the world through affordances. And what that means is that we see the world as trajectories of actions in our physical environment that we live in. And philosophically, that's a realist ontology. So that means there are no representations. We're taking actions in the real world and we know that the real world exists.

### Goals in FEP

**1:00:09** · Now, many cognitive science people, of course, resist to this notion because they say we need to have representations and then we get to this interesting discussion that we're having about this kind of continuum between this idea that on the one hand, there are no representations if we are gibsonian and we are ecological psychologists, but on the other hand, we might need to have increasing levels of representation if we actually have this temporal depth, if we have these nested Markov boundaries and we are sophisticated minds that are making predictions into the future.

**1:00:42** · Now with that laid out, I wanted to talk about this notion of goals Now in a Externalist Inactivist framework. I think that goals are not something we should explicitly define. Now, when you speak with Gofai people and they talk about building cognitive architectures, they say that goals should be explicitly crafted into the architecture.

**1:01:05** · At least that's what they would have said 20 years ago.

**1:01:07** · Now they're slightly more refined and they say, well, we should have a goal module in the architecture, but the goals should be acquired empirically and there should be sub goals and so on.

**1:01:17** · Now if I understand correctly, we were just talking about the free energy principle. It has this notion of paths and we have beliefs over trajectories of actions into the future and to what extent is a belief a goal? Because if if you have an almost infinite number of beliefs. So there's a trajectory to this future state where I'm rich, but there's also.

**1:01:42** · An infinitude of other potential trajectories and they are of course constrained by the physical affordances and trajectories that AI can take in my physical environment. That seems different to having an intention of wanting to be rich or wanting to play tennis because I'm constrained in all of these different ways.

**1:02:01** · So yeah, why don't we just talk about the dichotomy between beliefs and goals? I think Carl or Chris would be better equipped to answer the latter question.

**1:02:12** · Carl in particular has been thinking about intentional behavior quite deeply recently. I did want to quickly comment upon ecological psychology. I have been saying to the eco psych community that Bayesian mechanics and eco psych are the same discipline.

**1:02:28** · They're really it's the same thing. Vicente Raja is one of the cooler, more technically proficient people in the eco psych community.

**1:02:38** · And after, you know, a few years of back and forth, we've realized that, yeah, we're using exactly the same set of mathematical tools.

**1:02:45** · The only framing is the only difference is a philosophical framing is, are you an indirect test or a direct test?

**1:02:52** · So and I happen to think that these are just kind of semantic quibbles.

**1:02:57** · If you look at the more contemporary eco psych literature.

**1:03:00** · So the eco psych people are tend to be much more sophisticated technically than the enactive people. And one thing that they have in common is that they don't reject information theory out of hand.

**1:03:11** · They want a richer notion of information like ecological information or semantic information, some kind of information that has some relevance to the environment. You know, the organisms like milieu, its umwelt, its world of life, but they're not rejecting information theory. In fact, Gibson's original ambition was to apply physics to the study of perception just straight up, you know, so it's all about like, you know, energy, the the energy on the perceptual arrays and all of this stuff.

**1:03:44** · It's essentially, I think, the same project from a methodological and mathematical perspective. The main difference is just an inactive an ecological psychologist would say that we perceive things directly, but then they appeal to this, these notions of like resonance and whatever, which, you know, to us is just a synonym for inference. I guess it's like the difference rests in like, are you centering on the internal perspective of an organism or are you looking at things as a multi-scale stack with the organism kind of carving out one level?

**1:04:21** · So we had a great session actually with Michael Anderson's Emerge Lab group based out of Ontario. And my my gut tells me that there will be a kind of strategic alliance and maybe even just a merging of these two fields moving forward. Yeah.

**1:04:41** · And you know, for the more cynical part of me thinks that the merger of free energy principle and eco psych gives you everything that you might want out of enactivism, but without any of the, you know, heavy kind of metaphysical or philosophical baggage that seems to be, you know, hindering progress in that field.

**1:05:00** · So that's my thing about Ecocyc. Okay.

**1:05:06** · Maybe we can bring you Chris in on on the goals thing.

**1:05:09** · So is is a goal an end state? Is it a trajectory? Is it a bearing?

**1:05:14** · And is it is it does it exist explicitly in the externalist view of cognition? Well, so I'm a bit more of a practical computational person, so I'll leave the philosophy to to Maxwell. But I mean, I tend to take the intentional intentional stance on systems where if we can, if it makes sense for us to describe a system as goal directed, then we should do so. And if that helps engineers to build those systems, then they should do so, right?

**1:05:42** · But there's a nice kind of there's a nice parallel between those kind of ideas and the original work in cybernetics.

**1:05:49** · So there's the good regulator theorem, which this kind of early work by Colin and Ashby suggests that any, any control system of a given environment is a good model of the environment that it controls just by by necessity from first principles, right?

**1:06:03** · Which to me suggest that we should in principle be able to describe an intentional structure in terms of the kind of generative model within within a system, we should be able to find it.

**1:06:14** · If it is a good control system and it should exist.

**1:06:16** · I think there's also a more practical thing about shifting from the notion of reward as this kind of potential function that's kind of dominated the machine learning area, right? So we have this kind of monolithic thing called reward and everything is in in service of that reward to a richer notion of beliefs about dynamics which which which affords that kind of, you know, moves away that potential function to a more kind of dynamical system so we can get more kind of rich beliefs about future trajectories and so on. And we know that in control systems, that's really it's a really important right If we want to control the system, we're doing model based control.

**1:06:49** · We have to have desires on the futures of those systems.

**1:06:51** · We need to understand the trajectory and the divergence of the trajectories through time, Right? So I think it's a much richer picture practically to think about, you know, beliefs about dynamics rather than reward. And I think there's this nice parallel between the intentional structure and the good regulator theory. And I think the good regulator theorem entails that we should find those kind of intentional dynamics within our systems, right, Just by a priori first reasoning. Yeah.

**1:07:17** · I just want to know if he could explain the good regulator theorem, because I think that yes, a good regulator is, is like a really strong resonances with this. And I think, you know, there was a long, there was a long time not Carl the Carl's excluded from this a long time. The people who were reading the free energy literature to think that the kind of the roots of the free energy principle was in Helmholtz. Helmholtz in perception, right?

**1:07:36** · This notion of Bayesian inference and perception.

**1:07:39** · But there's kind of a much richer reading to see its roots in cybernetics movement, and particularly by the works of people like Ross Ashby and so on. So he's basically said he provided this theorem that showed that if you want to build a regulator for a given environmental system that optimally regulates that system, then it necessitates that regulator is a good model of that system, right?

**1:08:01** · And there's a kind of you can take that kind of a strong way and a weak way. And we worried about this for a long time. But just to diffuse that from its representational kind of implications, which we were worried about for a long time, you can see this in something like even like the Watt governor, which is used as his classic Inactivist system that doesn't is non representationalist.

**1:08:20** · But there are kind of there's a sense in which the the dynamics of the Watt governor needs to mirror the fluctuations of the steam engine it's regulating. And it's that kind of coupling and that kind of reflection of those dynamics, which is important for the regulation of that system, right? So that kind of you can back out that, you know, I think it's a very nicely aligned with the intentional stance and it demands an intentional stance.

**1:08:42** · If you if you if you if you if you're committed to this notion of the good regulator theorem to riff on your point of the intentional son.

**1:08:49** · I think that's a fascinating way of looking at it.

**1:08:51** · And Chris and to bring you in, Professor Friston So Professor Daniel Dennett had this notion of the intentional stance that when we you know, we essentially have a mental model of the intentions of other agents and we use that to understand their behavior.

**1:09:07** · And an intention is a goal. If you think about it, it's something I want to do. But in this dynamical Systems framework, it's not explicitly coded anywhere. It kind of emerges.

**1:09:19** · And of course it's a subjective state.

**1:09:21** · So we've spoken about mental phenomenal states being encoded in our generative model in our in our free energy framework.

**1:09:29** · And those states will of course have intentional, you know, representations of the other agents that we're dealing with.

**1:09:39** · So I guess just the question back to you, Professor Friston.

**1:09:43** · How do goals kind of get encoded in this dynamics?

**1:09:49** · Yeah, it's a great question. I know the answer you want because you don't like goals, do you? So or you.

**1:09:58** · Well, I don't mind if they're I guess the answer is they're emergent, which is? Which is Exactly. I was groping for that.

### Emergence of Goals

**1:10:05** · Yes, they have to. You know, you have to find a physics where it looks as if there are goals and they emerge from a particular kind of self-organization. And I think that's that's been beautifully illustrated just in the previous conversations you've had.

**1:10:20** · And, you know, ranging from the work of Russ Ashby on his homeostat, which I think would be better nowadays called an allostatic.

**1:10:31** · But if we just stick with the homeostat because, you know, does homeostasis have a goal? Does my physiology have the goal of maintaining my temperature at 37°C? It certainly looks like that.

**1:10:43** · Do I intend to do that? Well, I think on one reading of intention, yes. You know, and certainly on an allostatic reading of behaviors that have this temporal depth and are the consequence of plans into the future, you know, putting turning on the thermostat or putting on clothes, I think then you're you're getting much closer to this sort of more anthropomorphic notion of intentionality, where I think there are girls, there are there are end points.

**1:11:14** · And so I guess the question then is, you know, at what point would these different kinds of intentionality or goal directed behavior emerge from self-organization?

**1:11:30** · And in what particular kinds of systems would you expect to see this these these these behaviors? I think there's some fairly straightforward answers from the point of view of the physicist, not not the philosopher. So if you just look at the different kinds of systems that you could apply the free energy principle to, we've talked about one of them right at the beginning when considering Markov blankets that did not have any have any internal states, for example, a stone.

**1:12:02** · So every state of this thing is just a Markov blanket and it is in reciprocal exchange with the external states. So that would be when the internal states are empty. Are there other kinds of systems that you could have? Well, you could imagine systems that didn't have any active states. But, you know, most interesting systems do have active states. And then you ask about the relative contribution of these random fluctuations to the dynamics of the self-organization.

**1:12:31** · And if you just follow the maths through the path integral in particular maths of the dynamics that any system at a particular temporal scale must have, if it's internal or autonomous dynamics or the dynamics, the flows of the internal states and the the blanket states that constitute a particle or a person when they become sufficiently precise.

**1:13:02** · So when we become big enough and cool enough.

**1:13:06** · So let's assume that we're we're we're bigger than a quantum scale, but not too big to become classical. So we're not the size of the moon, but we are roughly your size or my size or perhaps the size of a mouse or an insect through to to an elephant or a giraffe.

**1:13:22** · And then you have this interesting situation of these very precise dynamics, and they're precise just because we are big.

**1:13:29** · So all the random fluctuations are averaged away in this particular case, then you can you can show that these particular kinds of things or Markov blankets have a very well defined probability distribution over paths into the future, specifically the paths of the active states.

**1:13:48** · So let's assume that there are certain kinds of particles or creatures that have active states and they have, you know, they and the blanket states enshroud a sufficient number of internal states.

**1:14:02** · What would they look like if they had very precise dynamics?

**1:14:06** · Well, you can actually work out the probability distribution over the active states, over their actions, over their movements.

**1:14:12** · And these could be physiological movements, autonomic reflexes.

**1:14:15** · They could be physical movements, eye movements or perambulatory movements or indeed even talking. And it transpires that the the probability distribution over these particular paths of active states has an interesting functional form when written in terms of the potential or the log probability.

**1:14:35** · We call that an expected free energy and that expected free energy, when you just write it down, passes into or can be decomposed into things that people have been dealing with for centuries, and specifically the expected information gain and the expected reward or utility where reward or utility is.

**1:15:04** · Gored by the the log probability of occupying an attractive state or rewarding state. And I use the word attractive state deliberately because it is just part of the pullback attractor that affords the application of the mathematical formulation.

**1:15:27** · It's just the characteristic states this kind of thing occupies.

**1:15:30** · So the goal ness, if you like, is is inherent in the characteristics of the particle or person that you're trying to describe.

**1:15:42** · So for certain kinds of particles or persons, then it will certainly look as if they are acting with long term vision, namely planning in a way to return themselves to their attracting set, which you could look you could now regard as a goal or a rewarded or at least an attracting, an attracting outcome or or state of being.

**1:16:09** · So I think that kind of particle starts to now show the, the deep intention. You know, it looks as if they are they are doing this because they intend some outcome.

**1:16:20** · I think the next step, though, which is the one that you were speaking to and possibly Dan Dennett was implying, is another, I think, step, which is. But does the does the internal state know that? You know, am I aware that I am planning? And of course, that calls upon very, very sophisticated.

**1:16:37** · So if they exist internal or generative models that entail a model of me and the hypothesis that all of this these sensations and all the consequences of my actions, which I am not aware of, you know, I cannot feel all the sensory or

**1:17:01** · not sensory, all the neuronal impulses that cause my muscles to contract all I can register as a consequences of that through my muscle, my stretch receptors, my proprioceptive receptors, or if it's in my gut or my autonomic interoceptive receptors.

**1:17:18** · So I don't know what I can't I can't have I do have have no access to my actual action, but I can see the consequences of it and it looks as if I'm planning. So I now have a hypothesis, a model of fantasy, that I am a thing and I seem to have goals.

**1:17:37** · And if I can learn the kinds of goals that I have, then I can now start to mentalize and have notions in my generative model about my goals.

**1:17:47** · And then notice, Oh, you have goals. Or perhaps it's the other way around.

**1:17:51** · Perhaps the first of all, it looks as if the explanation for this random dynamical system over here called Mom is actually she looks as if she plans it, looks as if she has goals.

**1:18:02** · And then a few years later, if I develop a sense of self, well, perhaps I'm a thing like mum and that perhaps I have goals.

**1:18:09** · So I think that your your from the point of view of Dan Dennett's intentional stance, I think we're talking about a very, very particular kind of system that actually has this capacity to recognize, first of all, intentional like behaviors, long term planning dynamics in other conspecifics or things like itself, and then actually transcribe that and test the hypothesis.

**1:18:33** · Or perhaps I'm a thing like that as well. Perhaps I'm me.

**1:18:36** · Perhaps I have suffered. And and what's beautiful about what you just said there, and all three of you have said this in different, different ways. So I want to dwell on this just a bit because I think it's a source of the misunderstanding and or controversy about the free energy principle. So earlier, Maxwell, you had said, you know, it's really a model about the couplings and the isolations together, the couplings and the de couplings and the dynamics between them. You know, Carl, you just said systems will behave as if they had intentions.

**1:19:08** · Whether or not they really have intentions or not is kind of a different philosophical question, but they'll behave as if they had intentions. And Chris, you brought up, you know, the what governor, which is it's obviously a very simple, dynamic system, you know, spinning centrifuge, some, you know, arm bar, like whatever else. And yet it's it's not as though it's a literal model in the sense that I'm going to have a Mathematica mathematical model for what the steam engine is doing.

**1:19:34** · But it's behaving as if it were an effective model of the steam engine because, hey, when it's slightly out of sync, the arm flexes a little bit. It readjusts its, you know, the spin changes slightly. Things continue to work because if it didn't have the dynamics that were as if it had a model, the thing wouldn't function, it would just fall apart.

**1:19:54** · So I guess what we're all what's all being said here is that systems at different scales will behave as if they had a model, even if they don't necessarily have a model in the sense of a person.

### Importance of Intentional Stance

**1:20:06** · Like a person might have a conscious model from which they develop a plan or whatnot. But all these systems of varying scales and complexities still behave as if they had a model.

**1:20:17** · They act to minimize the free energy as a consequence of, you know, being random dynamical systems that are self-maintaining.

**1:20:26** · Yeah, I think that's a really eloquently put.

**1:20:28** · And actually that this this kind of underwrites some of the worries we had about the principal when we first started working, working on it as kind of coming from an activist or a low road, an activist, this notion of kind of an explicit representationalism that you can you can get in these models where the model is homomorphic with the environment. Right? And it rankles people who've come from behavior based robotics and stuff like this.

**1:20:52** · But then to kind of realize that there's this is a richer relationship between the internal and the external that's being mirrored, right?

**1:20:58** · It doesn't have to be this homomorphic mapping.

**1:21:01** · And also the, you know, the actions are deeply involved in carving out the world that you represent. You live in your umwelt, you're a model of your umwelt you're a model of regulating your umwelt which is not, you know, it's not just a static separation of the of the agent from its environment. There's this deep coupling which, which, you know, which these kind of mirrorings emerge from.

**1:21:22** · But yeah, I think you articulated it really well there.

**1:21:26** · Can can we just call any any comments? Yeah.

**1:21:31** · No, I think you did a great job. I agree with Chris like that. Yeah.

**1:21:36** · So I think we've got about 15 minutes left. So we'll do two more topics.

**1:21:39** · We'll end on structure learning and the practical implementations of the free energy principle. But I just wanted to touch on what you were talking about earlier, Maxwell, which is this notion of the boundaries being potentially vague or maybe even observer relative.

**1:21:51** · Now, in your multiscale paper, you did say you use the word ontological boundaries, I think. And I also wanted to talk about meaning. So there's the boundaries of cognition in the physical world. So we have this dynamical system and it kind of converges and we've got these nested kind of hierarchy of boundaries, but then in a kind of Dennett sense meaning emerges gradually and the meaning kind of depends on your perspective.

**1:22:19** · And the intentional stance also depends on your perspective.

**1:22:23** · So different agents could look at different phenomena going on in their physical environment and they could describe different meaning in their generative models. So we seem to have this kind of weird two tier system where no longer are we even saying that the boundaries, the Markov boundaries are fixed, they are potentially variable.

**1:22:41** · And then the way that the agents construct meaning is also observer dependent. And all of this is kind of touching on what I was saying before with goals, which is that the reason they emerge is because they are unintelligible.

**1:22:55** · They're extremely complex. Do you see what I mean?

**1:22:58** · So it feels like the reason why we need to have this high resolution generative model is because in principle it would be impossible for us to explicitly program it. So a few quick things about that.

**1:23:15** · I mean, I think you're really identifying some of the key issues.

**1:23:20** · I would first, so with respect to ontology, I would, you know, distinguish ontology from metaphysics.

**1:23:30** · Ontology is just talking about what kind of things are.

**1:23:34** · So when we say that the boundaries are ontological, what we're saying is we're trying to capture kind of features of the map in some sense.

**1:23:44** · And you know, what we've argued in a paper recently is that the free energy principle is, metaphorically speaking, a map of that part of the territory that behaves like a map.

**1:23:55** · So I want to contrast this with metaphysics in the sense that, like, this is all of this is a modeling approach. This is a physics.

**1:24:05** · This isn't saying like once and for all these boundaries are here and crystalized and just, you know. Are there independently of the way that we are experiencing or sampling or interacting with the world like that? That kind of metaphysical stuff is not what's at stake. Yeah. So in the paper you're referring to, we describe we describe these Markov blankets as existential boundaries in the sense that they're both epistemological and ontological.

**1:24:39** · They're ontological in the sense that they are definitional of what a thing is in this kind of physics based approach.

**1:24:46** · If you can pick out a thing as a physical thing, then it it it ought it has to have this blanket structure.

**1:24:55** · And it's it's epistemological in the sense that it's this interface, right? Like the thing itself can only know the world and indeed we can only know the world the thing through this boundary. Okay. So like this isn't meant to be a priori. It's, it's sort of weird. It's in some sense it's sort of like an, a posteriori it's like an empirically driven way to carve up the world. That's that's fine. I mean, on that, I think that that answers my question because there's always this confusion about whether we're talking about the map or the territory.

**1:25:32** · And just to be clear, we are we are always talking about the map when we talk about these boundaries. Yeah, the free energy principle is a map of the boundaries you can think of and a map of what happens when things have boundaries that. And so yeah, that that is important to keep in mind. Like we don't want to engage in map territory Fallacies. The free energy principle is a model.

**1:25:56** · It's a scientific model and it's a map.

**1:25:58** · And it turns out to be the canonical way of modeling systems that are engaged in modeling. So if maximum entropy is the canonical way of modeling physical systems in physics, it's the way of arriving at the most parsimonious model that generates, you know, some data set, right? Well, the free energy principle is equally a canonical way of modeling systems that also in turn seem to be engaged in this kind of modeling behavior.

**1:26:27** · But yeah, it's it's a model. It's a map.

**1:26:30** · You know, this probably is not the final word.

**1:26:34** · And, you know, we're we're uncovering some, you know, mathematical structure underneath the free energy principle and the principle of unitarity and maximum caliber and all of this stuff that we're tentatively calling G theory for now in homage to M theory from string theory physics. So, yeah, you know, as most scientific models like the progress of science means that things will probably change. Again, this isn't a metaphysics.

**1:27:03** · This is just a cohesive modeling approach that inherits from the physics of information and self-organization.

**1:27:12** · I would quickly just point out that the these things seem intrinsically related to observer dependance because they are in some deep sense Carl's 2019 monograph, particular free energy principle for a particular physics ends on this idea that the free energy principle at core is a metrological statement where metrological means measure theoretic or relating to measurement. And it basically says, well, things that exist look as if they're constantly measuring themselves and like keeping themselves within certain bounds.

**1:27:48** · So this is and, you know, this is even clearer from the quantum information theoretic formulation where literally what we're saying is that the free energy principle is a theory of observer ness.

**1:28:00** · You know, the sort of the it from bit, right? Like it's thingness.

**1:28:04** · But from another perspective, it's observer ness, which which are kind of the same thing. I'm sure Carl could say that again more eloquently than I, but at a high level, that's how I would respond to your point. Maybe Carl would like to maybe go since we. Yeah. Carl, we could do that.

**1:28:26** · And then also, since you're trying to decide if you're an an activist, you know, maybe. What other questions do we need to ask for? Both of us actually to decide, you know, that we haven't that we haven't covered yet.

**1:28:42** · Yeah, we can we can ask Maxwell and Chris to, um, um, so just to pick up on that last exchange and come back to the Free Energy principle as being gloriously gray. Um, I think I like that because, you know, the validity of that principle as a method.

**1:29:03** · So, you know, as a physicist, you would read any principle as a method, something that you apply to something.

**1:29:08** · Um, I think is underwritten not by its explanatory scope, but by its internal consistency with other principles that people do apply.

**1:29:21** · And Maxwell just mentioned one. Um, I think one important example of that, you know, beyond the principles of least action or variational principles that underwrite sort of, you know, say, Richard Feynman's work. Um, I'm thinking of Jaynes's maximum entropy principle. So Maxwell alluded to that in terms of maximum caliber. So maximum entropy of distributions over states just now becomes transformed into distributions over paths. When you move from when you move to the maximum caliber principle.

**1:29:57** · So the maximum power principle is just a max entropy Jaynesian max entropy principle for a path integral formulation. Um, and I think that's important to realize. The free energy principle just is that it is just a constrained maximum caliber principle or maximum entropy principle. And you may ask, well, where do the constraints from come from? That's just the generative model.

**1:30:21** · It's just the description of the characteristic states of pullback attractor that constitutes the girls were just talking about.

**1:30:27** · So, you know, if you remember, free energy is just the expected energy, the constraint part plus the entropy. And therefore, when you're now drilling down on the constraint part, where does that come from?

**1:30:42** · It's just a description of the pullback attractor or the characteristic states of the system that you're trying to trying to understand. So I really look at the free energy principle as something terribly new. It's been implicit there all the time. It's just people using slightly different words for different concepts.

**1:30:58** · So I think that's I can't remember why I'm saying this, but it seemed important to say. And. Maxwell what were you just talking about? Because there was a link in terms of were you maybe leading into the metrological aspects, the self measurement, that that was really important? Yes, that's right.

### Future of FEP

**1:31:17** · So just looking backwards, um, you know, what is the the sibling of the Or. Yeah. The sibling of the free energy principle of in the past century. In the past few decades.

**1:31:34** · I think that would be the maximum entropy principle constrained maximum entropy principle looking forwards. What would be the bedfellows of the free energy principle? And I think I think that the that metrological or relational, um, thing is vitally important.

**1:31:51** · And you know, I love the work of, um, Carlo Rovelli and his work with, you know, quantum relational approaches to quantum mechanics, which is all about relationships. And of course, how do you how do you quantify a relationship? Well, it's just in terms of the interaction, the coupling, which is going to be a sparse coupling.

**1:32:14** · It is just a measurement. It is just an observation.

**1:32:17** · So inference, measurement, synchronization, sparse coupling, they're all the same thing. And so I think that what will hopefully happen is that somebody will write down a math, possibly Dalton will write down a calculus that says all of these things are just the same way of looking at it. And I read yesterday because I had to because I was reviewing this paper for synthesis about Ontic structural realism. Ontic structural realism.

**1:32:42** · And it seems to me that that is basically philosophers having discovered the same underlying fabric. The reality is in the measurement, but it's the measurement of how we relate to each other via that measurement of of each other or things measuring other things purely in terms of their relationships.

**1:33:05** · So I, I think that, you know, there is a lot of, if you like, work to be done from the point of view of the free energy principle theorists in consolidating the links to what has gone in terms of things like maximum entropy principle and what is to come in terms of, say, quantum loop gravity or Chris Fields quantum information theoretic treatment of holographic screens in the Markov blanket. And you know, at each point the will become grayer because it will be less easy to discriminate it from.

**1:33:41** · Everything else that stood the test of time.

**1:33:46** · Uh, Chris, do you have any comments on that?

**1:33:49** · You're on mute. You're on mute. Yeah, you're on mute. Chris. Sorry.

**1:33:56** · So, yeah, I think I'll leave it there.

**1:33:58** · It's a bit too deep into the philosophy for me, and we've got two experts here, so I'll. I'll pass one. Wonderful.

**1:34:05** · And to my point earlier, I mean, we won't go into it now, but one of I guess my perspective is it all seems like epistemology to me rather than on ontology. And maybe we can debate that a little bit more a bit later on. But as our uploads are all quite slow and I want to check that we secure this beautiful interview, I'm going to cut it off at this point. But gentlemen, it's been an absolute honor. Thank you so much for coming on.

**1:34:31** · I mean, so much to me, genuinely. Always a pleasure, gentlemen.

**1:34:35** · This is always great fun. Beautiful. Beautiful. Yeah.

**1:34:42** · Always enjoyed. Wonderful.