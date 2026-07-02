## Memory System

### Résumé
  
Le Memory System désigne l’ensemble des mécanismes par lesquels un système **stocke, structure, transforme et réutilise l’expérience**.  
Dans Garrigue-X, la mémoire n’est pas un stockage passif, mais un **système actif d’inférence et de transformation**.  

- Pourquoi ce concept existe  
→ dépasser la vision de la mémoire comme simple stockage  

- Ce qu'il apporte  
→ une intégration de la mémoire dans la cognition et la décision  

- Pourquoi il est important pour Garrigue-X  
→ il permet la **continuité dans le temps, l’apprentissage et la planification**  

### Idée essentielle
  
Question à laquelle le concept répond :  
Comment un système peut-il utiliser son passé pour agir intelligemment dans le présent et le futur ?

Réponse courte :  
En transformant ses expériences en représentations utilisables et en les réactivant selon le contexte.

### Description
  
Le Memory System regroupe plusieurs sous-systèmes complémentaires :

- mémoire épisodique (expériences vécues)  
- mémoire sémantique (connaissances abstraites)  
- structure temporelle (organisation dans le temps)  

Contrairement à une base de données classique :
- la mémoire est dynamique  
- elle reconstruit l’information plutôt que la récupérer brute  
- elle interagit en permanence avec la cognition  

Principes importants :
- mémoire = reconstruction, pas reproduction  
- séparation entre expérience et abstraction  
- organisation temporelle des contenus  
- rôle actif dans la décision  

Structure générale :
- expériences → encodées dans la mémoire épisodique  
- répétitions / replay → consolidation  
- abstraction → mémoire sémantique  
- utilisation → planification et simulation  

Propriété clé :
- la mémoire est un **processus continu**, pas un stockage statique  

### Intérêt pour Garrigue-X
  
Dans l’architecture :
- la mémoire est un bloc central interconnecté avec :
  - GNWT  
  - Planner  
  - JEPA  
- elle permet au système de :
  - maintenir une continuité temporelle  
  - enrichir la compréhension du monde  
  - guider la simulation et la décision  

Le Memory System se décompose en trois composants principaux :

#### Mémoire épisodique (Hopfield)
- stockage associatif des événements  
- indexation par le contexte  
- récupération dynamique  
→ fournit des exemples concrets passés  

#### Mémoire sémantique (MeMo)
- stockage sous forme de connaissances abstraites  
- réponse par inférence  
→ fournit des règles et des régularités  

#### Contexte temporel (TCM)
- organise les événements dans le temps  
- permet navigation et continuité  
→ relie les expériences entre elles  

Exemples :
- utiliser un souvenir pour guider une décision  
- généraliser une expérience en connaissance  
- simuler un futur à partir du passé  

Lien clé :
- JEPA → comprend le monde  
- Memory → conserve et structure l’expérience  
- Planner → utilise ces deux sources  

### Limites connues :
- complexité élevée d’intégration  
- risque de dérive ou d’incohérence  
- dépendance à la qualité des représentations latentes  
- difficulté à équilibrer stabilité et plasticité  

### Relations avec d'autres concepts
  
Concepts parents :
- [[Cognition]]
- [[Apprentissage]]

Concepts associés :
- [[Episodic Memory (Hopfield)]]
- [[Semantic Memory (MeMo)]]
- [[Temporal Context Model]]
- [[Simulation]]
- [[Planner / Process Composer]]

Concepts potentiellement en tension :
- [[Stockage statique]]
- [[RAG classique]]

### Questions ouvertes
  
Questions encore non résolues.
- Comment équilibrer mémoire épisodique et sémantique ?
- Comment éviter la dérive des connaissances ?
- Quelle granularité pour les souvenirs ?
- Comment optimiser la consolidation ?

### Références

#### Références fondatrices
- Travaux sur mémoire hippocampique (Hopfield)
- Travaux sur mémoire sémantique

#### Références récentes
- MeMo: Memory as a Model 
- Architectures cognitives modernes intégrant mémoire active 

#### Ressources complémentaires
- Article
- Vidéo
- Blog
- Dépôt GitHub

### Historique
- 2026-07 : création du document
