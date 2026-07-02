## Episodic Memory (Hopfield)

### Résumé
  
La mémoire épisodique désigne la capacité du système à **stocker et rejouer des expériences vécues sous forme associative**.  
Dans Garrigue-X, elle est implémentée comme un réseau de type Hopfield, permettant une **récupération dynamique des souvenirs à partir du contexte**.  

- Pourquoi ce concept existe  
→ permettre au système de se souvenir d’expériences concrètes  

- Ce qu'il apporte  
→ une mémoire des événements passés, utilisable pour la simulation  

- Pourquoi il est important pour Garrigue-X  
→ il fournit des **exemples concrets pour guider la décision et la planification**  

### Idée essentielle
  
Question à laquelle le concept répond :  
Comment un système peut-il se souvenir d’expériences passées de manière utilisable ?

Réponse courte :  
En stockant des états associés et en les réactivant à partir d’indices partiels.

### Description
  
La mémoire épisodique repose sur des mécanismes associatifs :

- stockage d’états complets (événements)  
- association entre éléments du contexte  
- récupération à partir d’un indice partiel  

Dans l’architecture :
- chaque événement est encodé comme un vecteur latent  
- ce vecteur est stocké dans une structure associative (Hopfield)  
- il peut être récupéré par similarité ou via le contexte  

Principes importants :
- mémoire associative  
- stockage dense des expériences  
- récupération par correspondance  
- reconstruction plutôt que lecture brute  

Mécanismes :
- encodage : stockage d’un état latent X_t  
- association avec le contexte C_t  
- construction d’une matrice ou structure mémoire  
- récupération via une requête (query)  
- convergence vers un souvenir cohérent  

Propriété clé :
- la mémoire épisodique est une **mémoire de reconstruction**  

### Intérêt pour Garrigue-X
  
Dans l’architecture :
- la mémoire épisodique stocke des couples :
  - (état latent, contexte temporel) 【2-89bdb3】  
- elle permet :
  - le replay d’expériences  
  - la récupération de situations similaires  
- elle est utilisée par :
  - le planner  
  - la simulation  
  - la métacognition  

Exemples :
- retrouver une situation passée similaire  
- rejouer un épisode pour analyser une erreur  
- initialiser une simulation à partir d’un cas connu  

Lien clé :
- Hopfield → stockage associatif  
- TCM → organisation temporelle  
- Simulation → exploitation des souvenirs  

### Limites connues :
- capacité limitée (interférences entre souvenirs)  
- sensibilité au bruit dans les requêtes  
- difficulté à gérer des représentations très complexes  
- dépendance à la qualité des latents  

### Relations avec d'autres concepts
  
Concepts parents :
- [[Memory System]]
- [[Associative Memory]]

Concepts associés :
- [[Semantic Memory (MeMo)]]
- [[Temporal Context Model]]
- [[Simulation]]
- [[Latent Space Stability]]

Concepts potentiellement en tension :
- [[Représentation statique]]
- [[Stockage exact des données]]

### Questions ouvertes
  
Questions encore non résolues.
- Quelle capacité optimale pour la mémoire associative ?
- Comment limiter les interférences ?
- Comment intégrer efficacement multi-échelle ?
- Comment optimiser le replay ?

### Références

#### Références fondatrices
- Hopfield, *Neural networks and physical systems*, 1982

#### Références récentes
- Modern Hopfield Networks
- Travaux sur mémoire associative en deep learning

#### Ressources complémentaires
- Article
- Vidéo
- Blog
- Dépôt GitHub

### Historique
- 2026-07 : création du document 
