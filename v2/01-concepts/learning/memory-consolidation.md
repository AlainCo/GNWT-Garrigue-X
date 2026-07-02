## Memory Consolidation

### Résumé
  
La Memory Consolidation désigne le processus par lequel le système transforme des expériences récentes en connaissances stables et réutilisables.  
Elle se déroule principalement lors de phases hors ligne (replay / rêverie) et constitue le cœur de l’apprentissage durable.  

- Pourquoi ce concept existe  
→ éviter que les expériences restent locales et temporaires  

- Ce qu'il apporte  
→ une intégration progressive de l’expérience dans la mémoire globale  

- Pourquoi il est important pour Garrigue-X  
→ il permet un apprentissage stable sans dégrader les compétences existantes  

### Idée essentielle
  
Question à laquelle le concept répond :  
Comment un système peut-il apprendre de manière durable sans se destabiliser ?

Réponse courte :  
En rejouant ses expériences et en les intégrant progressivement dans ses structures internes.

### Description
  
La consolidation est un processus multi-étapes :

1. acquisition d’expérience  
2. stockage dans la mémoire épisodique  
3. replay (simulation interne)  
4. abstraction et généralisation  
5. intégration dans la mémoire sémantique ou procédurale  

Ce processus est séparé en deux modes :

#### Mode online (temps réel)
- adaptation légère  
- ajustements locaux (adaptateurs, LoRA)  
- réponse immédiate  

#### Mode offline (rêverie / replay)
- revisite des épisodes passés  
- simulation via JEPA  
- extraction de régularités  
- consolidation progressive  

Principes importants :
- séparation apprentissage rapide / lent  
- replay comme mécanisme central  
- généralisation des expériences  
- protection du système contre la dérive  

Mécanismes :
- récupération d’épisodes (Hopfield)  
- simulation et recombinaison (JEPA)  
- abstraction (MeMo)  
- optimisation contrôlée des modèles  
- création de policies  

Propriété clé :
- la consolidation transforme :
  
  expérience → connaissance → automatisme  

### Intérêt pour Garrigue-X
  
Dans l’architecture :
- la consolidation intervient lors des phases de “sommeil”  
- elle permet :
  - stabilisation des adaptations  
  - intégration des nouvelles connaissances  
  - création de comportements automatisés  

Rôles fonctionnels :

#### 1. Stabilisation de l’apprentissage
- évite l’oubli catastrophique  
- protège les compétences existantes  

#### 2. Transformation des expériences
- épisodes → connaissances abstraites  
- épisodes → policies  

#### 3. Amélioration du modèle du monde
- enrichissement de MeMo  
- amélioration des dynamiques JEPA  

#### 4. Support de la décision
- meilleures simulations  
- meilleures planifications  
- accès plus rapide à des solutions  

👉 La consolidation permet au système de :
- apprendre sans se détruire  

Lien clé :
- [[Episodic Memory (Hopfield)]] → fournit les expériences  
- [[Semantic Memory (MeMo)]] → intègre les abstractions  
- [[Policies]] → stocke les automatismes  
- [[Simulation]] → supporte le replay  

Dans le système :
- le cycle clé est :

```

expérience → replay → abstraction → automatisation

```

### Limites connues :
- coût computationnel élevé  
- dépendance à la qualité du replay  
- risque de sur-généralisation  
- difficulté de sélection des expériences à consolider  

### Relations avec d'autres concepts
  
Concepts parents :
- [[Learning]]
- [[Memory System]]

Concepts associés :
- [[Episodic Memory (Hopfield)]]
- [[Semantic Memory (MeMo)]]
- [[Policies]]
- [[Simulation]]

Concepts potentiellement en tension :
- [[Adaptation rapide]]
- [[Stabilité des modèles]]

### Questions ouvertes
  
Questions encore non résolues.
- Quels épisodes consolider en priorité ?
- Quelle fréquence de replay optimale ?
- Comment éviter la sur-généralisation ?
- Comment équilibrer coût vs bénéfice ?

### Références

#### Références fondatrices
- Neurosciences : consolidation hippocampe → cortex

#### Références récentes
- Replay en RL et world models
- Architectures mémoire hybrides

#### Ressources complémentaires
- Article
- Vidéo
- Blog
- Dépôt GitHub

### Historique
- 2026-07 : création du document
