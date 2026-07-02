## Moral Agents

### Résumé
  
Les Moral Agents sont des modules spécialisés qui évaluent les actions possibles selon des critères éthiques et influencent la prise de décision du système.  
Ils participent au GNWT en injectant des signaux de contrainte, de priorité ou de pénalisation.  

- Pourquoi ce concept existe  
→ intégrer des considérations éthiques directement dans le processus décisionnel  

- Ce qu'il apporte  
→ une régulation active du comportement  

- Pourquoi il est important pour Garrigue-X  
→ il permet d’opérationnaliser l’éthique dans un système distribué  

### Idée essentielle
  
Question à laquelle le concept répond :  
Comment un système peut-il intégrer des contraintes morales dans ses décisions ?

Réponse courte :  
En utilisant des agents spécialisés qui évaluent les actions et influencent le processus décisionnel.

### Description
  
Les Moral Agents sont des modules autonomes qui :

- évaluent les actions possibles  
- attribuent des scores ou contraintes  
- influencent la sélection finale  

Contrairement à une logique éthique centralisée :
- les Moral Agents sont distribués  
- ils participent à la compétition dans le GNWT  
- ils n’imposent pas forcément une décision, mais la modulent  

Principes importants :
- modularité éthique  
- interaction avec le workspace  
- influence indirecte  
- coexistence de plusieurs contraintes  

Mécanismes :
- réception des options générées par le planner  
- évaluation selon des critères spécifiques :
  - sécurité  
  - respect des agents  
  - impact à long terme  
- production de signaux :
  - pénalisation  
  - inhibition  
  - augmentation de salience  
- injection dans le GNWT  

Propriété clé :
- l’éthique devient un **processus dynamique au sein du workspace**  

### Intérêt pour Garrigue-X
  
Dans l’architecture :
- les Moral Agents participent au GNWT comme les autres agents  
- ils enrichissent les états latents avec des signaux éthiques  
- ils influencent :
  - le planner  
  - la sélection d’action  
  - la priorisation  

Rôles fonctionnels :

#### 1. Évaluation des actions
- chaque action candidate est évaluée  
- certaines sont pénalisées  
- d’autres sont favorisées  

#### 2. Modulation de la décision
- forte pénalisation → action évitée  
- forte valeur morale → action favorisée  


