## Budgeted Attention

### Résumé
  
Le budgeted attention décrit un mécanisme par lequel l’accès au traitement global est limité par une **ressource attentionnelle finie**.  
Chaque information candidate à une ignition consomme une partie de ce budget, ce qui impose une sélection stricte des contenus diffusés.  

- Pourquoi ce concept existe  
→ éviter la saturation du système global  

- Ce qu'il apporte  
→ un contrôle explicite de la charge cognitive  

- Pourquoi il est important pour Garrigue-X  
→ il garantit la **rareté et la pertinence des ignitions vers le GNWT**  

### Idée essentielle
  
Question à laquelle le concept répond :  
Pourquoi toutes les informations importantes ne deviennent-elles pas globales ?

Réponse courte :  
Parce que le système dispose d’un budget limité, et doit choisir ce qui mérite d’être diffusé.

### Description
  
Le budgeted attention introduit une contrainte explicite :
- le système dispose d’une quantité finie d’attention  
- chaque ignition consomme une partie de cette ressource  
- seules les ignitions les plus pertinentes passent  

Ce mécanisme est souvent implémenté via un **budget discret (tokens)**.

Principes importants :
- ressource limitée  
- compétition entre ignitions  
- priorisation des contenus  
- régulation dynamique  

Mécanismes :
- chaque ignition a un coût attentionnel  
- le budget se recharge progressivement  
- si le budget est insuffisant :
  - l’ignition est retardée  
  - ou inhibée  
- un seuil dynamique peut être ajusté selon la charge  

Propriété clé :
- l’attention agit comme un **goulot d’étranglement volontaire**  

Dans l’architecture :
- le budget attentionnel limite le nombre d’ignitions simultanées  
- seules les ignitions les plus saillantes sont diffusées lorsque le budget est bas 

### Intérêt pour Garrigue-X
  
Dans l’architecture :
- le GNWT ne peut pas traiter un flot illimité d’informations  
- un **Attention Scheduler** gère le budget attentionnel  
- l’ignition est conditionnée par la disponibilité de ce budget  

Exemples :
- en situation normale : peu d’ignitions, traitement stable  
- en situation de surcharge : seules les informations critiques passent  
- en situation d’incertitude : le seuil peut être abaissé pour augmenter la réactivité  

Limites connues :
- calibration du budget non triviale  
- risque de bloquer des informations importantes  
- dépendance au mécanisme de priorisation  

### Relations avec d'autres concepts
  
Concepts parents :
- [[Attention]]
- [[Ressources computationnelles limitées]]

Concepts associés :
- [[Ignition]]
- [[GNWT (Global Neuronal Workspace Theory)]]
- [[Attention Schema Theory]]
- [[Self-model]]

Concepts potentiellement en tension :
- [[Diffusion globale non limitée]]
- [[Traitement exhaustif de l'information]]

### Questions ouvertes
  
Questions encore non résolues.
- Comment apprendre dynamiquement le budget optimal ?
- Comment attribuer un coût aux ignitions ?
- Comment équilibrer stabilité et réactivité ?
- Comment éviter la perte d’informations critiques ?

### Références

#### Références fondatrices
- Broadbent, *Perception and Communication*, 1958
- Kahneman, *Attention and Effort*, 1973

#### Références récentes
- Travaux sur Attention Schema Theory (Graziano)
- Intégrations modernes avec GNWT et architectures distribuées

#### Ressources complémentaires
- Article
- Vidéo
- Blog
- Dépôt GitHub

### Historique
- 2026-07 : création du document
