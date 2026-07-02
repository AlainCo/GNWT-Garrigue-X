## Action Selection

### Résumé
  
L’Action Selection est le mécanisme par lequel le système **choisit une action spécifique** à exécuter parmi plusieurs options possibles.  
Elle intervient après la phase de simulation et constitue l’étape finale du processus de décision.  

- Pourquoi ce concept existe  
→ transformer plusieurs possibilités en une décision unique  

- Ce qu'il apporte  
→ un mécanisme de résolution du choix  

- Pourquoi il est important pour Garrigue-X  
→ il permet le **passage de la planification à l’action réelle**  

### Idée essentielle
  
Question à laquelle le concept répond :  
Comment un système choisit-il une action parmi plusieurs options possibles ?

Réponse courte :  
En évaluant les options disponibles et en sélectionnant la plus pertinente selon ses critères.

### Description
  
L’Action Selection intervient après que le système ait :
- compris la situation (GNWT)  
- généré des options (Planner)  
- simulé leurs conséquences (Simulation)  

Elle consiste à :
- comparer plusieurs alternatives  
- appliquer des critères de sélection  
- produire une action unique  

Principes importants :
- unicité de la décision  
- évaluation comparative  
- prise en compte de l’incertitude  
- arbitrage entre objectifs  

Mécanismes :
- réception des trajectoires simulées  
- calcul de scores (coût, risque, utilité, cohérence)  
- intégration des contraintes :
  - attentionnelles  
  - éthiques  
  - contextuelles  
- sélection de l’option optimale  
- transmission vers l’exécution  

Propriété clé :
- le système passe de **plusieurs futurs possibles à un seul futur réel**  

### Intérêt pour Garrigue-X
  
Dans l’architecture :
- l’Action Selection est la dernière étape du planner  
- elle utilise :
  - les résultats de simulation  
  - les contraintes issues du GNWT  
  - les limitations attentionnelles  
- elle produit une action cohérente avec :
  - les objectifs  
  - le contexte  
  - les contraintes du système  

Exemples :
- choisir une stratégie parmi plusieurs plans possibles  
- arbitrer entre sécurité et performance  
- décider d’agir ou de ne pas agir  

Lien clé :
- GNWT → fournit les informations  
- Simulation → fournit les options  
- Action Selection → tranche  

Limites connues :
- dépendance à la qualité de l’évaluation  
- sensibilité aux biais de scoring  
- difficulté à gérer des objectifs contradictoires  

### Relations avec d'autres concepts
  
Concepts parents :
- [[Prise de décision]]
- [[Active Inference]]

Concepts associés :
- [[Planner / Process Composer]]
- [[Simulation]]
- [[GNWT (Global Neuronal Workspace Theory)]]
- [[Attention]]

Concepts potentiellement en tension :
- [[Exploration continue]]
- [[Indécision prolongée]]

### Questions ouvertes
  
Questions encore non résolues.
- Comment définir les fonctions de score ?
- Comment gérer les conflits entre objectifs ?
- Comment intégrer l’incertitude dans la décision ?
- Faut-il toujours produire une action ?

### Références

#### Références fondatrices
- Sutton & Barto, *Reinforcement Learning*, 2018
- Newell & Simon, travaux sur la prise de décision

#### Références récentes
- Travaux sur la sélection d’action en RL et IA hybride
- Architectures de planification et contrôle moderne

#### Ressources complémentaires
- Article
- Vidéo
- Blog
- Dépôt GitHub

### Historique
- 2026-07 : création du document
