## Curiosity & Intrinsic Motivation

### Résumé
  
La Curiosity & Intrinsic Motivation désignent les mécanismes internes qui poussent le système à explorer, apprendre et découvrir de nouvelles connaissances sans objectif externe immédiat.  
Elles permettent d’orienter l’apprentissage vers des expériences informatives et utiles.  

- Pourquoi ce concept existe  
→ éviter un apprentissage purement réactif ou passif  

- Ce qu'il apporte  
→ une exploration intelligente et proactive  

- Pourquoi il est important pour Garrigue-X  
→ il permet un système capable d’apprendre même en l’absence de supervision  

### Idée essentielle
  
Question à laquelle le concept répond :  
Pourquoi un système devrait-il explorer ou apprendre en dehors d’un objectif immédiat ?

Réponse courte :  
Pour améliorer sa compréhension du monde et mieux anticiper les situations futures.

### Description
  
La motivation intrinsèque repose sur plusieurs signaux internes :

- surprise (erreur de prédiction)  
- incertitude  
- nouveauté  
- amélioration potentielle  

Contrairement à une motivation externe :
- elle ne dépend pas d’une récompense explicite  
- elle vise à améliorer le modèle interne  

Principes importants :
- exploration guidée  
- apprentissage auto-supervisé  
- équilibre exploration / exploitation  
- lien avec la métacognition  

Mécanismes :
- détection d’erreurs de prédiction  
- estimation de l’incertitude  
- calcul d’un signal d’intérêt (salience)  
- activation du GNWT  
- déclenchement du planner ou du replay  

Formes principales :

#### 1. Curiosité basée sur la surprise
- forte erreur → exploration  
- apprentissage ciblé  

#### 2. Curiosité basée sur l’incertitude
- manque d’information  
- exploration pour réduire l’inconnu  

#### 3. Curiosité basée sur le progrès
- zones où l’apprentissage est possible  
- recherche de gain cognitif  

Propriété clé :
- la curiosité transforme l’inconnu en **opportunité d’apprentissage**  

### Intérêt pour Garrigue-X
  
Dans l’architecture :
- la curiosité est dérivée de :
  - prediction error (JEPA)  
  - incertitude (Self-Model)  
- elle influence :
  - l’attention  
  - la planification  
  - l’apprentissage  

Rôles fonctionnels :

#### 1. Déclenchement de l’apprentissage
- surprise élevée :
  - activation du GNWT  
  - passage en mode “conscience”  
- exploration des solutions  

#### 2. Sélection des expériences à consolider
- priorisation des épisodes informatifs  
- filtrage du bruit  

#### 3. Guidage de l’exploration
- favoriser les états utiles  
- éviter exploration aléatoire  

#### 4. Interaction avec les méta-stratégies
- en situation inconnue :
  - exploration progressive  
  - prudence accrue  

👉 Le système apprend mieux parce qu’il choisit :
- ce qui vaut la peine d’être appris  

Exemples :
- explorer une situation nouvelle  
- approfondir une incertitude  
- tester une hypothèse  

Lien clé :
- [[Predictive Processing]] → source de surprise  
- [[Uncertainty]] → guide l’exploration  
- [[Self-Model]] → contrôle du signal  
- [[Memory Consolidation]] → apprentissage final  

Dans l’architecture :
- la curiosité est liée :
  - à la surprise  
  - et à la capacité d’apprentissage  

### Limites connues :
- exploration excessive  
- coût computationnel  
- distraction par des signaux non pertinents  
- difficulté de calibrage  

### Relations avec d'autres concepts
  
Concepts parents :
- [[Learning]]
- [[Cognition]]

Concepts associés :
- [[Uncertainty]]
- [[Self-Model]]
- [[Memory Consolidation]]
- [[Simulation]]
- [[Attention]]

Concepts potentiellement en tension :
- [[Exploitation]]
- [[Optimisation immédiate]]

### Questions ouvertes
  
Questions encore non résolues.
- Comment calibrer la curiosité optimale ?
- Comment éviter l’exploration inutile ?
- Comment combiner curiosité et objectifs externes ?
- Quelle relation exacte avec la récompense ?

### Références

#### Références fondatrices
- Théories de la motivation intrinsèque  

#### Références récentes
- Curious RL  
- Exploration dirigée par l’incertitude  

#### Ressources complémentaires
- Article
- Vidéo
- Blog
- Dépôt GitHub

### Historique
- 2026-07 : création du document
