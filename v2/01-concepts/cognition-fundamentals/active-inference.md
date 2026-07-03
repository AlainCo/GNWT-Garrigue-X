## Active Inference

### Résumé
  
L’active inference est une extension du predictive processing dans laquelle un système ne se contente pas de corriger ses prédictions : il **agit également sur le monde pour le rendre conforme à ses attentes**.  

- Pourquoi ce concept existe  
→ unifier perception, action et décision dans un même cadre  

- Ce qu'il apporte  
→ un mécanisme qui relie prédiction et action via la minimisation de l’erreur  

- Pourquoi il est important pour Garrigue-X  
→ il constitue le **principe opérationnel de la décision, de la planification et de l’interaction avec l’environnement**  

### Idée essentielle
  
Question à laquelle le concept répond :  
Comment un système peut-il non seulement comprendre le monde, mais aussi agir efficacement dedans ?

Réponse courte :  
En choisissant des actions qui réduisent l’écart entre ses prédictions et la réalité.

### Description
  
L’active inference repose sur le même socle que le predictive processing :
- le système génère des prédictions  
- il mesure une erreur de prédiction  
- il cherche à la minimiser  

Mais au lieu de seulement ajuster son modèle interne, il peut aussi :
- **changer ses perceptions (inférence)**  
- **changer le monde (action)**  

Deux stratégies complémentaires :
- mise à jour interne : adaptation des états latents  
- action externe : modification de l’environnement  

Principes importants :
- perception et action sont deux faces du même processus  
- minimisation de l’énergie libre (ou de l’erreur prédictive)  
- sélection d’actions en fonction de leurs conséquences attendues  
- prise en compte de l’incertitude (précision)  

Mécanismes :
- génération de politiques (séquences d’actions possibles)  
- simulation des conséquences futures  
- évaluation de l’erreur prédictive attendue  
- sélection de l’action minimisant cette erreur  

Boucle fondamentale :
- prédire → simuler → agir → observer → corriger  

### Intérêt pour Garrigue-X
  
Dans l’architecture V2 :
- le planner simule des futurs et sélectionne des actions minimisant l’erreur attendue  
- les modules JEPA fournissent des **modèles prédictifs latents** utilisés pour ces simulations  
- l’action est un prolongement naturel du predictive processing  
- la décision devient un **processus explicite et orchestré (Process Composer)** 

Exemples :
- choisir une action qui confirme une hypothèse  
- ajuster le comportement pour réduire l’incertitude  
- planifier une séquence d’actions cohérente avec le modèle du monde  

Limites connues :
- complexité combinatoire des politiques possibles  
- dépendance à la qualité du modèle latent  
- difficulté à gérer l’exploration vs exploitation  

### Relations avec d'autres concepts
  
Concepts parents :
- [[Predictive Processing]]
- [[Free Energy Principle]]

Concepts associés :
- [[JEPA (Joint Embedding Predictive Architecture)]]
- [[Planner / Process Composer]]
- [[Modèle du monde]]
- [[Ignition]]

Concepts potentiellement en tension :
- [[Réactivité pure]]
- [[Optimisation court terme]]

### Questions ouvertes
  
Questions encore non résolues.
- Comment générer efficacement des politiques à grande échelle ?
- Comment intégrer la mémoire dans la sélection d’action ?
- Comment équilibrer exploration et exploitation ?
- Comment gérer l’incertitude dans les environnements dynamiques ?

### Références

#### Références fondatrices
- Friston et al., *Active Inference and Learning*, 2016
- Friston, *The free-energy principle*, 2010

#### Références récentes
- Parr, Pezzulo, Friston, *Active Inference*, 2022
- Seth, *Inference to the Best Explanation*, travaux récents

#### Ressources complémentaires
- Article
- Vidéo
- Blog
- Dépôt GitHub

### Historique
- 2026-07 : création du document