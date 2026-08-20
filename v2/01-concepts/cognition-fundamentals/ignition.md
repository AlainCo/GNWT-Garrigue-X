## Ignition

### Résumé
  
L’ignition est le mécanisme par lequel une information locale devient **globale, partagée et accessible au système entier**.  
Elle correspond au moment où une activité interne dépasse un seuil et est diffusée dans le workspace global (GNWT).  

- Pourquoi ce concept existe  
→ permettre le passage du traitement local à une coordination globale  

- Ce qu'il apporte  
→ un mécanisme de sélection des informations importantes  

- Pourquoi il est important pour Garrigue-X  
→ il constitue le **pont entre RPT (local) et GNWT (global)**  

### Idée essentielle
  
Question à laquelle le concept répond :  
Comment une information devient-elle consciente / globale dans un système distribué ?

Réponse courte :  
Lorsqu’elle devient suffisamment importante (surprise, erreur, saillance), elle déclenche une ignition et est diffusée globalement.

### Description
  
L’ignition correspond à un **événement discret** dans lequel un module :
- produit un résumé de son état interne  
- juge que ce résumé est important  
- décide de le diffuser globalement  

Ce processus repose sur un seuil adaptatif.

Principes importants :
- rareté de l’ignition (tout ne remonte pas)  
- déclenchement basé sur l’erreur ou la surprise  
- compression de l’information (résumé vectoriel)  
- diffusion globale contrôlée  

Mécanismes :
- traitement local (RPT)  
- détection d’un écart (erreur de prédiction)  
- comparaison à un seuil  
- génération d’un résumé d’ignition  
- broadcast dans le GNWT  

Propriété clé :
- en dessous du seuil → résolution locale  
- au-dessus du seuil → globalisation  

Selon l’architecture :
- l’ignition est déclenchée lorsque la **surprise dépasse un seuil adaptatif**   
- ce seuil dépend du **budget attentionnel et du self-model** 

### Intérêt pour Garrigue-X
  
Dans l’architecture :
- les modules ne partagent pas leurs états internes  
- ils communiquent uniquement via des **résumés d’ignition** 
- l’ignition permet de préserver les **couvertures de Markov**  
- le GNWT fonctionne uniquement sur ces ignitions  

Exemples :
- une erreur de prédiction non résoluble localement déclenche une ignition  
- un module remonte un signal critique vers le niveau supérieur  
- plusieurs ignitions concurrentes sont filtrées par le budget attentionnel  

Limites connues :
- choix du seuil non trivial  
- risque de surcharge du workspace (trop d’ignitions)  
- perte d’information liée à la compression  

### Relations avec d'autres concepts
  
Concepts parents :
- [[Predictive Processing]]
- [[Active Inference]]

Concepts associés :
- [[GNWT (Global Neuronal Workspace Theory)]]
- [[RPT (Recurrent Processing Theory)]]
- [[Attention]]
- [[Self-model]]

Concepts potentiellement en tension :
- [[Partage total d'information]]
- [[Communication brute entre modules]]

### Questions ouvertes
  
Questions encore non résolues.
- Comment apprendre dynamiquement le seuil d’ignition ?
- Quelle taille optimale pour les résumés d’ignition ?
- Comment éviter la saturation du GNWT ?
- Comment arbitrer entre ignitions concurrentes ?

### Références

#### Références fondatrices
- Dehaene, *Consciousness and the Brain*, 2014
- Baars, *Global Workspace Theory*, 1988

#### Références récentes
- Travaux récents sur GNWT et ignition neuronale
- Friston et al., lien avec predictive processing et surprise

#### Ressources complémentaires
- Article
- Vidéo
- Blog
- Dépôt GitHub

### Historique
- 2026-07 : création du document