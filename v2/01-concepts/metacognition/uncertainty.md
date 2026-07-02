## Uncertainty

### Résumé
  
L’Uncertainty désigne la capacité du système à représenter et gérer **l’incertitude associée à ses connaissances, ses prédictions et ses décisions**.  
Elle constitue un signal global qui influence fortement la planification, l’exploration et, dans certains cas, la prise de décision éthique.  

- Pourquoi ce concept existe  
→ permettre au système de reconnaître les limites de sa connaissance  

- Ce qu'il apporte  
→ une gestion explicite de l’inconnu  

- Pourquoi il est important pour Garrigue-X  
→ il soutient la **robustesse, la prudence et la décision en contexte incertain**  

### Idée essentielle
  
Question à laquelle le concept répond :  
Comment un système peut-il agir de manière appropriée lorsqu’il ne sait pas ?

Réponse courte :  
En représentant explicitement ce qu’il ne sait pas et en adaptant son comportement en conséquence.

### Description
  
L’incertitude diffère de la confiance :

- la confiance → fiabilité d’une estimation donnée  
- l’incertitude → absence ou insuffisance d’information globale  

Elle peut provenir de plusieurs sources :

- incertitude épistémique (manque de connaissance)  
- incertitude aléatoire (variabilité du monde)  
- incertitude structurelle (modèle incomplet)  

Principes importants :
- reconnaissance des limites du système  
- propagation de l’incertitude dans les décisions  
- interaction avec la confiance  
- rôle régulateur global  

Mécanismes :
- estimation de l’incertitude à partir :
  - dispersion des prédictions  
  - incohérence entre modèles  
  - manque de données similaires en mémoire  
  - instabilité des simulations  
- agrégation dans le Self-Model  
- propagation dans le GNWT  
- modulation des modules décisionnels  

Propriété clé :
- l’incertitude guide non seulement l’action, mais aussi **l’évitement de certaines actions**  

### Intérêt pour Garrigue-X
  
Dans l’architecture :
- l’incertitude est un signal global partagé via le GNWT  
- elle influence :
  - le planner  
  - l’attention  
  - la décision  

Rôles fonctionnels :

#### 1. Régulation comportementale
- forte incertitude :
  - augmentation de la prudence  
  - réduction de la prise de risque  
  - exploration contrôlée  
- faible incertitude :
  - exploitation  
  - décision directe  

#### 2. Déclenchement de la simulation
- incertitude élevée → simulation plus profonde  
- incertitude critique → activation du mode "conscience"  

#### 3. Rôle éthique (fondamental)
- en situation de forte incertitude :
  - limitation des actions irréversibles  
  - activation de contraintes déontologiques  
  - réduction de la confiance dans la planification  

👉 L’incertitude devient alors un signal de :
- prudence morale  
- modestie épistémique  
- refus d’optimiser à partir de prédictions fragiles  

Dans cette architecture :
- des décisions peuvent être **restreintes non pas parce qu’elles sont mauvaises, mais parce qu’elles sont incertaines**  

Cela rejoint l’idée que :
- la déontologie peut être vue comme une **réponse au manque de fiabilité du modèle**  

### Liens avec l’architecture V2
  
Dans l’architecture :
- chaque module expose des signaux :
  - confiance  
  - incertitude  
  - pertinence 【1-49e50d】  

- ces signaux :
  - modulent la planification  
  - influencent les décisions  
  - améliorent la robustesse globale 【1-49e50d】  

### Limites connues :
- difficulté d’estimation robuste  
- propagation d’incertitude complexe  
- risque de paralysie (inaction excessive)  
- dépendance à la qualité des modèles  

### Relations avec d'autres concepts
  
Concepts parents :
- [[Metacognition]]
- [[Self-Model]]

Concepts associés :
- [[Confidence Estimation]]
- [[Planner / Process Composer]]
- [[Simulation]]
- [[Epistemic Modesty]]

Concepts potentiellement en tension :
- [[Prise de décision rapide]]
- [[Optimisation agressive]]

### Questions ouvertes
  
Questions encore non résolues.
- Comment calibrer correctement l’incertitude ?
- Comment éviter la paralysie décisionnelle ?
- Comment intégrer l’incertitude dans la planification ?
- Quelle interaction optimale avec les contraintes éthiques ?

### Références

#### Références fondatrices
- Travaux sur incertitude en IA probabiliste
- Approches bayésiennes et Active Inference

#### Références récentes
- Architectures métacognitives avec gestion d’incertitude
- Travaux sur robustesse et décision en IA

#### Ressources complémentaires
- Article
- Vidéo
- Blog
- Dépôt GitHub

### Historique
- 2026-07 : création du document