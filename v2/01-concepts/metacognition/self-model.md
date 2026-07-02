## Self-Model

### Résumé
  
Le Self-Model désigne la capacité du système à maintenir une **représentation de lui-même**, incluant ses états, ses capacités et ses limites.  
Il permet au système d’évaluer sa situation interne et d’adapter son comportement en conséquence.  

- Pourquoi ce concept existe  
→ permettre au système de se réguler et de prendre des décisions adaptées à ses capacités  

- Ce qu'il apporte  
→ une connaissance de soi opérationnelle  

- Pourquoi il est important pour Garrigue-X  
→ il permet la **régulation globale, la planification adaptative et la robustesse**  

### Idée essentielle
  
Question à laquelle le concept répond :  
Comment un système peut-il savoir ce qu’il est capable de faire ?

Réponse courte :  
En maintenant une représentation interne de ses états, compétences et limites.

### Description
  
Le Self-Model est une représentation interne qui contient :

- l’état du système  
- les ressources disponibles  
- les compétences activables  
- l’historique de performance  
- les niveaux de confiance et d’incertitude  

Contrairement à une simple introspection :
- il ne se contente pas d’observer  
- il influence activement les décisions  

Principes importants :
- auto-représentation  
- estimation des capacités  
- contrôle des ressources  
- adaptation dynamique  

Mécanismes :
- agrégation d’informations issues de :
  - GNWT (état global)  
  - mémoire (historique)  
  - modules cognitifs (états locaux)  
- construction d’un état latent du système  
- estimation de :
  - confiance  
  - incertitude  
  - coût  
- émission de signaux pour :
  - attention  
  - planner  
  - décision  

Propriété clé :
- le Self-Model est un **contrôleur global du système**  

### Intérêt pour Garrigue-X
  
Dans l’architecture :
- le Self-Model reçoit les informations globales du GNWT  
- il produit des signaux permettant de :
  - ajuster l’attention  
  - guider la planification  
  - moduler les décisions  

Son rôle fonctionnel inclut :

- Estimation :
  - “suis-je capable de résoudre ce problème ?”  
- Décision :
  - “dois-je agir, explorer ou abandonner ?”  
- Contrôle :
  - allocation des ressources  
- Apprentissage :
  - ajustement des limites du système  

Dans le système :
- il agit comme une couche métacognitive  
- il interagit avec :
  - [[Planner / Process Composer]]  
  - [[Budgeted Attention]]  
  - [[Confidence Estimation]]  
  - [[Uncertainty]]  

Exemples :
- réduire l’exploration si l’incertitude est élevée  
- augmenter la prudence en cas de risque  
- déléguer une tâche à d’autres modules  

Lien clé :
- GNWT → fournit l’état global  
- Self-Model → interprète cet état  
- Planner → agit en conséquence  

### Limites connues :
- difficulté à calibrer correctement les estimations  
- dépendance à la qualité des signaux internes  
- risque de sur- ou sous-confiance  
- complexité d’intégration multi-modules  

### Relations avec d'autres concepts
  
Concepts parents :
- [[Metacognition]]
- [[Self-awareness (fonctionnelle)]]

Concepts associés :
- [[Confidence Estimation]]
- [[Uncertainty]]
- [[Planner / Process Composer]]
- [[GNWT (Global Neuronal Workspace Theory)]]

Concepts potentiellement en tension :
- [[Réactivité pure]]
- [[Absence de régulation]]

### Questions ouvertes
  
Questions encore non résolues.
- Comment apprendre un Self-Model fiable ?
- Comment calibrer confiance et incertitude ?
- Quelle granularité pour l’auto-représentation ?
- Comment éviter les biais d’auto-évaluation ?

### Références

#### Références fondatrices
- Travaux en métacognition et self-monitoring

#### Références récentes
- Architectures hybrides avec self-model explicite
- Approches GNWT + metacognition

#### Ressources complémentaires
- Article
- Vidéo
- Blog
- Dépôt GitHub

### Historique
- 2026-07 : création du document 
