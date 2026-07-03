## World Models

### Résumé
  
Un world model est une représentation interne du monde qui permet à un système de **comprendre, prédire et simuler son environnement**.  
Il constitue la base sur laquelle reposent la perception, la mémoire, la simulation et la décision.  

- Pourquoi ce concept existe  
→ permettre au système d’agir sans dépendre uniquement des données immédiates  

- Ce qu'il apporte  
→ une compréhension interne du monde et de sa dynamique  

- Pourquoi il est important pour Garrigue-X  
→ il soutient la **simulation, la planification et l’adaptation dans des contextes inconnus**  

### Idée essentielle
  
Question à laquelle le concept répond :  
Comment un système peut-il agir intelligemment dans un monde qu’il ne connaît pas complètement ?

Réponse courte :  
En construisant une représentation interne du monde et en l’utilisant pour anticiper ce qui va se passer.

### Description
  
Un world model est un modèle interne capable de :

- représenter l’état du monde  
- prédire son évolution  
- simuler les conséquences d’actions  

Il peut être :
- implicite (réseaux neuronaux)  
- explicite (structures symboliques)  
- ou hybride  

Principes importants :
- représentation abstraite du monde  
- capacité de prédiction  
- simulation interne  
- invariance aux détails non pertinents  

Mécanismes :
- encodage du monde en un état latent (Z_t)  
- prédiction de transitions (Z_{t+1})  
- conditionnement par l’action (Z_t + action → Z_{t+1})  
- utilisation dans des boucles de simulation  

Propriété clé :
- un world model permet au système de **penser avant d’agir**  

Dans l’architecture :
- les modèles JEPA jouent le rôle de world model latent 
- ces modèles sont utilisés pour simuler des futurs et planifier 

### Intérêt pour Garrigue-X

Dans l’architecture :
- chaque agent possède un world model (souvent implémenté via JEPA)  
- ces modèles fournissent :
  - une compréhension locale du monde  
  - une capacité de prédiction  
- ils sont utilisés par :
  - le planner (simulation de trajectoires)  
  - la mémoire (structuration des expériences)  
  - le GNWT (intégration globale)  

Exemples :
- prédire l’évolution d’une situation  
- simuler l’impact d’une action  
- généraliser à des situations nouvelles  

Lien clé :
- JEPA = implémentation spécifique du world model  
- Simulation = utilisation du world model  
- Planner = exploitation du world model  

Limites connues :
- dépendance à la qualité des représentations  
- difficulté à capturer des dynamiques complexes  
- erreurs cumulées sur long horizon  

### Relations avec d'autres concepts
  
Concepts parents :
- [[Représentation du monde]]
- [[Cognition prédictive]]

Concepts associés :
- [[JEPA (Joint Embedding Predictive Architecture)]]
- [[Simulation]]
- [[Planner / Process Composer]]
- [[Latent Space Stability]]

Concepts potentiellement en tension :
- [[Réactivité pure]]
- [[Absence de modélisation interne]]

### Questions ouvertes
  
Questions encore non résolues.
- Quelle structure optimale pour un world model ?
- Comment intégrer la causalité explicite ?
- Comment gérer les erreurs long terme ?
- Faut-il un modèle unique ou plusieurs modèles spécialisés ?

### Références

#### Références fondatrices
- Ha & Schmidhuber, *World Models*, 2018

#### Références récentes
- Travaux sur JEPA, Dreamer, MuZero
- Recherches sur les modèles prédictifs latents

#### Ressources complémentaires
- Article
- Vidéo
- Blog
- Dépôt GitHub

### Historique
- 2026-07 : création du document
