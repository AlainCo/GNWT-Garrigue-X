## Predictive Processing

### Résumé
  
Le predictive processing est un cadre théorique selon lequel un système cognitif **ne perçoit pas directement le monde**, mais génère en permanence des **prédictions internes** qu’il confronte aux observations.  

- Pourquoi ce concept existe  
→ expliquer la perception, l’action et la cognition comme un processus unifié  

- Ce qu'il apporte  
→ une vision unifiée perception / action / apprentissage basée sur l’erreur de prédiction  

- Pourquoi il est important pour Garrigue-X  
→ il fournit le **mécanisme fondamental** derrière JEPA, l’inférence active et la dynamique des modules  

### Idée essentielle
  
Question à laquelle le concept répond :  
Comment un système peut-il comprendre le monde malgré l’incertitude et le bruit ?

Réponse courte :  
En prédisant en permanence ce qui devrait arriver et en corrigeant ses erreurs.

### Description
  
Le predictive processing repose sur l’idée que le cerveau (ou un système artificiel) fonctionne comme un **modèle génératif** du monde.

Plutôt que de traiter des entrées passivement :
- il anticipe les entrées sensorielles  
- il compare prédiction et réalité  
- il minimise l’erreur de prédiction  

Principes importants :
- primauté de la prédiction sur la perception  
- minimisation de l’erreur de prédiction  
- hiérarchie de modèles latents  
- incertitude et pondération de la précision  

Mécanismes :
- prédiction top-down (modèle → attentes)  
- erreur bottom-up (monde → surprise)  
- mise à jour des états internes  
- action pour réduire l’erreur (active inference)  

Boucle fondamentale :
- prédire → observer → comparer → corriger → agir → recommencer  

### Intérêt pour Garrigue-X
  
Dans l’architecture V2 :
- les modules JEPA apprennent à **prédire des états latents**, pas à reconstruire   
- l’ignition est déclenchée par une **erreur de prédiction significative**
- le système fonctionne comme une **hiérarchie de modèles qui minimisent leur surprise**  
- la planification consiste à **simuler des futurs pour minimiser une erreur anticipée**  

Exemples :
- perception = sélection des hypothèses les plus probables  
- mémoire = stabilisation de régularités prédictives  
- action = modification du monde pour le rendre conforme aux prédictions  

Limites connues :
- dépendance forte à la qualité du modèle interne  
- difficulté de calibration de l’incertitude (précision)  
- risque de sur-ajustement ou hallucination interne  

### Relations avec d'autres concepts
  
Concepts parents :
- [[Free Energy Principle]]
- [[Inférence variationnelle]]

Concepts associés :
- [[Active Inference]]
- [[JEPA (Joint Embedding Predictive Architecture)]]
- [[Ignition]]
- [[Modèle du monde]]

Concepts potentiellement en tension :
- [[Apprentissage supervisé classique]]
- [[Traitement purement réactif]]

### Questions ouvertes
  
Questions encore non résolues.
- Comment calibrer correctement la précision des erreurs ?
- Comment éviter les boucles auto-confirmantes (hallucination) ?
- Quelle granularité pour la hiérarchie prédictive ?
- Comment intégrer efficacement mémoire et prédiction ?

### Références

#### Références fondatrices
- Rao & Ballard, *Predictive Coding in the Visual Cortex*, 1999
- Karl Friston, *The free-energy principle*, 2010

#### Références récentes
- Andy Clark, *Surfing Uncertainty*, 2016
- Jakob Hohwy, *The Predictive Mind*, 2013

#### Ressources complémentaires
- Article
- Vidéo
- Blog
- Dépôt GitHub

### Historique
- 2026-07 : création du document
