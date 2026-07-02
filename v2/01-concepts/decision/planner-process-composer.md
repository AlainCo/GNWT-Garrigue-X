## Planner / Process Composer

### Résumé
  
Le Planner (ou Process Composer) est le module chargé de **prendre des décisions explicites** en orchestrant les capacités du système.  
Il utilise les informations disponibles dans le GNWT pour construire, simuler et sélectionner des actions.  

- Pourquoi ce concept existe  
→ transformer la compréhension du système en action structurée  

- Ce qu'il apporte  
→ un mécanisme explicite de décision et de planification  

- Pourquoi il est important pour Garrigue-X  
→ il permet une **action cohérente dans le temps**, au-delà de réactions locales  

### Idée essentielle
  
Question à laquelle le concept répond :  
Comment un système intelligent décide-t-il quoi faire à partir de ce qu’il sait ?

Réponse courte :  
En construisant des plans d’action, en simulant leurs effets, et en choisissant le plus pertinent.

### Description
  
Le Planner est un module de haut niveau qui :
- reçoit des informations globales depuis le GNWT  
- formule des objectifs ou sous-objectifs  
- génère des plans d’action  
- simule leurs conséquences  
- sélectionne une action  

Contrairement à un système purement réactif :
- la décision est **explicite, séquencée et évaluée**  

Principes importants :
- séparation perception / décision  
- planification explicite  
- utilisation de la simulation  
- choix basé sur des critères (coût, risque, objectif)  

Mécanismes :
- lecture des contenus du GNWT  
- décomposition des objectifs  
- génération de scénarios  
- simulation (via modèle du monde)  
- évaluation des options  
- sélection d’une action  

Propriété clé :
- la décision devient un **processus interne structuré**, pas une simple réaction  

### Intérêt pour Garrigue-X
  
Dans l’architecture :
- le Planner agit sur les contenus du GNWT 
- il orchestre l’interaction entre :
  - mémoire  
  - modèle du monde (JEPA)  
  - simulation  
- il constitue le **point central de la décision consciente**  

Exemples :
- planifier une séquence d’actions à partir d’une situation  
- simuler plusieurs futurs possibles  
- choisir une stratégie en fonction du contexte et de l’incertitude  

Lien clé :
- GNWT fournit l’information  
- Attention limite ce qui est accessible  
- le Planner **transforme cela en action**  

Limites connues :
- complexité combinatoire des plans possibles  
- dépendance à la qualité du modèle du monde  
- coût computationnel des simulations  

### Relations avec d'autres concepts
  
Concepts parents :
- [[Active Inference]]
- [[Prise de décision]]

Concepts associés :
- [[GNWT (Global Neuronal Workspace Theory)]]
- [[Simulation]]
- [[Action Selection]]
- [[JEPA (Joint Embedding Predictive Architecture)]]

Concepts potentiellement en tension :
- [[Réactivité immédiate]]
- [[Décision purement émergente]]

### Questions ouvertes
  
Questions encore non résolues.
- Comment générer efficacement des plans à grande échelle ?
- Comment limiter l’explosion combinatoire ?
- Comment intégrer les contraintes attentionnelles ?
- Quelle interaction fine avec la mémoire et le temps ?

### Références

#### Références fondatrices
- Newell & Simon, *Human Problem Solving*, 1972
- Sutton & Barto, *Reinforcement Learning*, 2018

#### Références récentes
- Travaux sur les architectures hybrides (symbolique + RL)
- Planification dans les systèmes multi-agents et IA moderne

#### Ressources complémentaires
- Article
- Vidéo
- Blog
- Dépôt GitHub

### Historique
- 2026-07 : création du document