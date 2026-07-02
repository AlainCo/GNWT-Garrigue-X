## Confidence Estimation

### Résumé
  
La Confidence Estimation désigne le mécanisme par lequel le système évalue **le degré de fiabilité de ses propres représentations, prédictions et décisions**.  
Elle constitue un signal métacognitif essentiel utilisé pour guider l’action, l’exploration et la planification.  

- Pourquoi ce concept existe  
→ permettre au système de décider quand faire confiance à ses propres connaissances  

- Ce qu'il apporte  
→ une mesure de la fiabilité interne  

- Pourquoi il est important pour Garrigue-X  
→ il permet d’ajuster le comportement du système face à l’incertitude  

### Idée essentielle
  
Question à laquelle le concept répond :  
Comment un système peut-il savoir s’il peut faire confiance à ce qu’il pense ?

Réponse courte :  
En estimant la qualité et la stabilité de ses représentations et prédictions.

### Description
  
La Confidence Estimation produit un score ou signal traduisant :

- la fiabilité d’une prédiction  
- la stabilité d’une représentation  
- la qualité d’un plan ou d’une décision  

Contrairement à une simple métrique probabiliste :
- elle intègre plusieurs sources  
- elle dépend du contexte  
- elle influence directement le comportement  

Principes importants :
- estimation interne de la fiabilité  
- dépendance au contexte  
- intégration multi-source  
- rôle décisionnel  

Sources d’information :
- erreur de prédiction (JEPA / predictive processing)  
- cohérence interne des modules  
- historique de performance (mémoire)  
- stabilité des latents  
- signaux GNWT (salience, surprise)  

Mécanismes :
- collecte de signaux locaux  
- agrégation dans le Self-Model  
- production d’un score de confiance  
- diffusion vers les modules décisionnels  

Propriété clé :
- la confiance est un **signal de contrôle**, pas seulement une métrique  

### Intérêt pour Garrigue-X
  
Dans l’architecture :
- la confiance est produite par le Self-Model  
- elle est utilisée pour :
  - ajuster le planner  
  - moduler l’attention  
  - guider la sélection d’action  

Rôle fonctionnel :
- haute confiance :
  - action rapide  
  - exploitation  
- faible confiance :
  - exploration  
  - prudence  
  - recours à la mémoire ou à la simulation  

Exemples :
- ignorer une prédiction jugée peu fiable  
- ralentir la prise de décision  
- déclencher une phase de simulation plus profonde  

Lien clé :
- Self-Model → calcule la confiance  
- Confidence → influence la décision  
- Planner → adapte la stratégie  

Dans l’architecture V2 :
- la confiance fait partie des signaux métacognitifs qui modulent la cognition 【1-d66393】  

### Limites connues :
- difficulté de calibration  
- dépendance aux signaux internes  
- sensibilité aux biais d’apprentissage  
- risque de surconfiance ou sous-confiance  

### Relations avec d'autres concepts
  
Concepts parents :
- [[Metacognition]]
- [[Self-Model]]

Concepts associés :
- [[Uncertainty]]
- [[Planner / Process Composer]]
- [[Predictive Processing]]
- [[Simulation]]

Concepts potentiellement en tension :
- [[Surconfiance]]
- [[Sous-estimation]]

### Questions ouvertes
  
Questions encore non résolues.
- Comment calibrer correctement la confiance ?
- Quelle combinaison optimale de signaux ?
- Comment éviter la surconfiance systémique ?
- Comment faire évoluer la confiance dans le temps ?

### Références

#### Références fondatrices
- Travaux sur métacognition et décision

#### Références récentes
- Architectures hybrides avec self-monitoring
- Modèles de calibration de confiance

#### Ressources complémentaires
- Article
- Vidéo
- Blog
- Dépôt GitHub

### Historique
- 2026-07 : création du document
