## Simulation

### Résumé
  
La simulation est le mécanisme par lequel le système **anticipe des futurs possibles** en utilisant son modèle du monde interne.  
Elle permet d’évaluer différentes actions sans les exécuter réellement.  

- Pourquoi ce concept existe  
→ permettre au système d’agir sans devoir tester immédiatement dans le monde réel  

- Ce qu'il apporte  
→ une capacité d’anticipation et de planification  

- Pourquoi il est important pour Garrigue-X  
→ il est au cœur du **planner** et de la prise de décision  

### Idée essentielle
  
Question à laquelle le concept répond :  
Comment un système peut-il choisir une action avant de connaître ses conséquences ?

Réponse courte :  
En simulant différents futurs et en comparant leurs résultats.

### Description
  
La simulation repose sur l’utilisation d’un modèle du monde (ex : JEPA) pour prédire :

- l’évolution d’un état donné  
- l’effet d’une action  
- les conséquences à court et moyen terme  

Le système ne se contente pas d’une prédiction unique :
- il génère plusieurs trajectoires possibles  
- les compare  
- les évalue  

Principes importants :
- anticipation des états futurs  
- exploration de plusieurs trajectoires  
- évaluation des résultats  
- utilisation d’un modèle interne (latent)  

Mécanismes :
- état courant (Z_t)  
- génération d’actions possibles  
- prédiction des états futurs (Z_{t+1}, Z_{t+2}, …)  
- construction d’un arbre de trajectoires  
- évaluation des trajectoires  
- transmission au planner  

Propriété clé :
- la simulation remplace l’essai réel par un **essai interne**  

Dans l’architecture :
- la simulation repose sur le modèle latent (JEPA)   
- elle est utilisée par le planner pour explorer des options 

### Intérêt pour Garrigue-X
  
Dans l’architecture :
- la simulation est activée par le planner  
- elle utilise :
  - le modèle du monde (JEPA)  
  - la mémoire (épisodique et sémantique)  
- elle permet de :
  - anticiper les conséquences  
  - éviter des erreurs coûteuses  
  - structurer des plans complexes  

Exemples :
- simuler plusieurs stratégies possibles avant d’agir  
- anticiper un risque à partir d’un signal faible  
- construire une séquence d’actions multi-étapes  

Limites connues :
- accumulation d’erreurs sur des horizons longs  
- coût computationnel élevé  
- dépendance à la qualité du modèle du monde  

### Relations avec d'autres concepts
  
Concepts parents :
- [[Predictive Processing]]
- [[Modèle du monde]]

Concepts associés :
- [[Planner / Process Composer]]
- [[JEPA (Joint Embedding Predictive Architecture)]]
- [[Mémoire épisodique]]
- [[Action Selection]]

Concepts potentiellement en tension :
- [[Réactivité immédiate]]
- [[Décision sans anticipation]]

### Questions ouvertes
  
Questions encore non résolues.
- Comment limiter l’explosion combinatoire des trajectoires ?
- Comment gérer les erreurs sur long horizon ?
- Quelle profondeur de simulation est optimale ?
- Comment intégrer efficacement la mémoire dans la simulation ?

### Références

#### Références fondatrices
- Tolman, *Cognitive Maps in Rats and Men*, 1948
- Sutton & Barto, *Reinforcement Learning*, 2018

#### Références récentes
- Travaux sur MuZero / Dreamer (simulation latente)
- Recherche sur world models et planification

#### Ressources complémentaires
- Article
- Vidéo
- Blog
- Dépôt GitHub

### Historique
- 2026-07 : création du document