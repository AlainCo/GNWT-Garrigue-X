## Couverture de Markov (Markov Blanket)

### Résumé
  
La couverture de Markov est un principe fondamental permettant de **définir une frontière informationnelle entre un système et son environnement**.  
Elle détermine ce qu’un système peut percevoir (entrées) et influencer (sorties), tout en protégeant ses états internes.  

- Pourquoi ce concept existe  
→ formaliser l’isolation et l’interaction des systèmes complexes  

- Ce qu’il apporte  
→ une structure claire pour la perception, l’action et l’inférence  

- Pourquoi il est important pour Garrigue-X  
→ il permet la **modularité stricte** et l’autonomie des modules cognitifs  

### Idée essentielle
  
Question à laquelle le concept répond :  
Comment un système peut-il être autonome tout en interagissant avec le monde ?

Réponse courte :  
En étant séparé du monde par une frontière (la couverture de Markov) qui contrôle strictement les échanges d’information.

### Description
  
La couverture de Markov est un ensemble de variables qui séparent un système en quatre composants :
- états internes (inaccessibles directement)
- états externes (environnement)
- états sensoriels (entrées)
- états actifs (sorties)

Propriétés clés :
- les états internes ne sont accessibles que via les états sensoriels
- les états internes n’agissent sur le monde que via les états actifs
- séparation conditionnelle entre intérieur et extérieur

Principes importants :
- séparation informationnelle stricte  
- causalité médiée par la frontière  
- invariance de l’identité du système  

Mécanismes :
- perception : environnement → états sensoriels → états internes  
- action : états internes → états actifs → environnement  
- boucle perception-action fermée  

### Intérêt pour Garrigue-X
  
Dans l’architecture V2 :
- chaque module est entouré d’une couverture de Markov  
- les états internes sont **protégés et non accessibles directement**  
- la communication passe uniquement par des **résumés (ignitions)**  
- les modules deviennent des **agents cognitifs autonomes imbriqués**  

Exemples :
- un module mémoire ne partage pas ses états internes, seulement des activations utiles  
- un module JEPA expose des prédictions latentes compressées  
- le GNWT ne reçoit que des contenus sélectionnés (ignitions), pas les états internes  

Limites connues :
- choix de la frontière non trivial  
- risque de perte d’information via la compression  
- complexité dans la coordination inter-modules  

### Relations avec d'autres concepts
  
Concepts parents :
- [[Inférence variationnelle / Free Energy Principle]]
- [[Systèmes dynamiques]]

Concepts associés :
- [[Conscience globale (GNWT)]]
- [[JEPA (Joint Embedding Predictive Architecture)]]
- [[Ignition]]
- [[Modularité stricte]]

Concepts potentiellement en tension :
- [[Partage global d'information]]
- [[Apprentissage end-to-end]]

### Questions ouvertes
  
Questions encore non résolues.
- Quelle granularité optimale pour une couverture de Markov ?
- Comment apprendre dynamiquement les frontières ?
- Comment éviter la perte d’information sans casser l’encapsulation ?
- Jusqu’où imbriquer les couvertures dans une hiérarchie ?

### Références

#### Références fondatrices
- Karl Friston, *The free-energy principle: a unified brain theory?*, 2010
- Friston et al., *Active Inference and Learning*, 2016

#### Références récentes
- Parr, Pezzulo, Friston, *Active Inference: The Free Energy Principle in Mind, Brain, and Behavior*, 2022
- Kirchhoff et al., travaux sur les Markov blankets en systèmes complexes

#### Ressources complémentaires
- Article
- Vidéo
- Blog
- Dépôt GitHub

### Historique
- 2026-07 : création du document
