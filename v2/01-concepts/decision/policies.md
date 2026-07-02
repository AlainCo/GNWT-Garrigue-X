## Policies

### Résumé
  
Les Policies désignent des comportements ou procédures automatisées que le système utilise pour agir rapidement dans des situations connues.  
Elles résultent de la **compilation de plans réussis** issus du planner en actions directes.  

- Pourquoi ce concept existe  
→ éviter de recalculer des solutions déjà connues  

- Ce qu'il apporte  
→ une exécution rapide, efficace et stable  

- Pourquoi il est important pour Garrigue-X  
→ il permet de transformer l’expérience en comportement automatisé  

### Idée essentielle
  
Question à laquelle le concept répond :  
Comment un système peut-il agir rapidement dans des situations déjà rencontrées ?

Réponse courte :  
En réutilisant des comportements appris sous forme de policies.

### Description
  
Les policies correspondent à des mappings :

- état → action  
- ou état → séquence d’actions  

Elles sont issues d’un processus d’apprentissage en plusieurs étapes :

1. résolution explicite via le planner  
2. répétition / simulation (replay)  
3. abstraction et generalisation  
4. compilation en policy  

Contrairement aux plans :
- une policy est directe  
- elle ne nécessite pas de simulation complète  
- elle est exécutée rapidement  

Principes importants :
- automatisation de comportements  
- réduction du coût computationnel  
- spécialisation progressive  
- dépendance à l’expérience  

Mécanismes :
- stockage de patterns actionnels  
- activation conditionnelle selon le contexte  
- intégration dans la sélection d’action  
- mise à jour via apprentissage  

Propriété clé :
- une policy est une **procédure compilée**  

### Intérêt pour Garrigue-X
  
Dans l’architecture :
- les policies sont utilisées pour :
  - les situations fréquentes  
  - les comportements routiniers  
- elles permettent :
  - une exécution rapide  
  - une réduction de la charge du planner  

Rôles fonctionnels :

#### 1. Accélération de la décision
- évite de passer par :
  - simulation  
  - planification complète  

#### 2. Mémoire procédurale
- les policies représentent :
  - des compétences acquises  
  - des automatismes  

#### 3. Interaction avec le planner
- si aucune policy pertinente :
  - le planner est activé  
- si policy disponible :
  - exécution directe  

#### 4. Apprentissage par compilation
- les plans réussis → deviennent policies  
- après répétition et validation  

👉 Le système apprend à :
- résoudre un problème → puis ne plus avoir à le résoudre  

Exemples :
- réponse rapide à une situation connue  
- automatisation d’une séquence d’actions  
- comportement réflexe dans un contexte stable  

Lien clé :
- [[Planner / Process Composer]] → génère les plans  
- [[Simulation]] → évalue les solutions  
- [[Memory System]] → stocke les expériences  
- [[Learning / Memory Consolidation]] → transforme en policies  

Dans l’architecture :
- une procédure construite par le planner peut être :
  - répétée  
  - puis compilée en policy 

### Limites connues :
- rigidité dans des contextes nouveaux  
- risque d’inadaptation  
- dépendance à la qualité du replay  
- nécessité de recalibrage  

### Relations avec d'autres concepts
  
Concepts parents :
- [[Decision]]
- [[Learning]]

Concepts associés :
- [[Planner / Process Composer]]
- [[Simulation]]
- [[Memory Consolidation]]
- [[Episodic Memory (Hopfield)]]

Concepts potentiellement en tension :
- [[Flexibilité cognitive]]
- [[Exploration]]

### Questions ouvertes
  
Questions encore non résolues.
- Quand compiler une policy ?
- Comment éviter une sur-spécialisation ?
- Quelle granularité pour les policies ?
- Comment gérer leur obsolescence ?

### Références

#### Références fondatrices
- Reinforcement Learning (policies)

#### Références récentes
- Architectures hybrides planning + policies
- Travaux sur mémoire procédurale

#### Ressources complémentaires
- Article
- Vidéo
- Blog
- Dépôt GitHub

### Historique
- 2026-07 : création du document