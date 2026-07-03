## ToM-X (Theory of Mind eXtended)

### Résumé
  
ToM-X désigne la capacité du système à modéliser les autres agents comme des entités intentionnelles, dotées d’états internes, d’objectifs et de croyances.  
Il permet de prédire leur comportement et d’adapter ses propres actions en conséquence.  

- Pourquoi ce concept existe  
→ permettre l’interaction avec d’autres agents intelligents  

- Ce qu'il apporte  
→ une compréhension des intentions et comportements d’autrui  

- Pourquoi il est important pour Garrigue-X  
→ il permet la **coordination, la coopération et la gestion des interactions complexes**  

### Idée essentielle
  
Question à laquelle le concept répond :  
Comment un système peut-il anticiper le comportement des autres agents ?

Réponse courte :  
En construisant un modèle interne de leurs états et de leurs intentions.

### Description
  
ToM-X repose sur une extension de la théorie de l’esprit classique :

- modélisation des états internes d’autrui  
- représentation de leurs croyances et objectifs  
- prise en compte de l’incertitude  

Dans cette architecture :
- l’état est factorisé en plusieurs composantes :
  - s_self : état du système  
  - s_other : état estimé de l’autre  
  - s_other_of_me : ce que l’autre pense du système  

Cela permet une modélisation récursive :

- niveau 1 : comprendre l’autre  
- niveau 2 : comprendre ce que l’autre pense de moi  
- niveau 3 : récursions plus profondes (limitées en pratique)  

Principes importants :
- modélisation probabiliste des autres  
- incertitude sur les états  
- récursivité  
- intégration dans la décision  

Mécanismes :
- détection d’agentivité (est-ce un agent ?)  
- inférence des états internes de l’autre  
- mise à jour des croyances  
- simulation des comportements possibles  
- intégration dans le GNWT  

Propriété clé :
- comprendre l’autre = **prédire ses états latents**  

### Intérêt pour Garrigue-X
  
Dans l’architecture :
- ToM-X est intégré dans le GNWT comme n’importe quel contenu  
- il enrichit les états latents utilisés pour :
  - la planification  
  - la simulation  
  - la décision  

Rôles fonctionnels :

#### 1. Prédiction du comportement
- anticiper les actions des autres agents  
- réduire l’incertitude sociale  

#### 2. Coordination et coopération
- adapter ses actions aux attentes des autres  
- favoriser les interactions stables  

#### 3. Modélisation récursive
- tenir compte de :
  - ce que l’autre pense  
  - ce qu’il pense que je pense  

#### 4. Interaction avec l’éthique
- les décisions morales prennent en compte :
  - les impacts sur les autres  
  - leurs états internes  
- l’incertitude sur l’autre influence la prudence  

Exemples :
- anticiper une action adverse  
- coopérer efficacement avec un agent  
- ajuster son comportement pour être prévisible  

Lien clé :
- [[Agency Detection]] → détecte les agents  
- [[Self-Model]] → modèle interne du système  
- [[Planner / Process Composer]] → utilise ToM-X  
- [[Moral Agents]] → évaluent les impacts sociaux  

Dans l’architecture V3 :
- ToM-X est un état latent du GNWT  
- il participe à la simulation et à la décision   

### Limites connues :
- estimation incertaine des états des autres  
- coût computationnel élevé  
- récursion difficile à contrôler  
- risques de sur-interprétation  

### Relations avec d'autres concepts
  
Concepts parents :
- [[Social Cognition]]
- [[Cognition]]

Concepts associés :
- [[Agency Detection]]
- [[Self-Model]]
- [[Simulation]]
- [[Planner / Process Composer]]
- [[Uncertainty]]

Concepts potentiellement en tension :
- [[Hypothèses simplistes]]
- [[Paranoïa computationnelle]]

### Questions ouvertes
  
Questions encore non résolues.
- Quel niveau de récursion optimal ?
- Comment calibrer l’incertitude sur les autres ?
- Comment éviter les biais d’interprétation ?
- Comment intégrer efficacement multi-agents ?

### Références

#### Références fondatrices
- Premack & Woodruff, Theory of Mind

#### Références récentes
- Architectures multi-agents avec modélisation sociale
- Travaux sur IA interactive et coopération

#### Ressources complémentaires
- Article
- Vidéo
- Blog
- Dépôt GitHub

### Historique
- 2026-07 : création du document