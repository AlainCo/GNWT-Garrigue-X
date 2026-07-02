## Temporal Context Model (TCM)

### Résumé
  
Le Temporal Context Model (TCM) décrit un mécanisme par lequel un système maintient un **contexte temporel continu** qui évolue lentement au fil du temps.  
Ce contexte permet d’organiser les souvenirs, de les relier entre eux, et de naviguer dans le passé et le futur.  

- Pourquoi ce concept existe  
→ structurer les expériences dans le temps  

- Ce qu'il apporte  
→ une continuité temporelle et une organisation des souvenirs  

- Pourquoi il est important pour Garrigue-X  
→ il permet la **mémoire cohérente, la simulation et la planification temporelle**  

### Idée essentielle
  
Question à laquelle le concept répond :  
Comment un système peut-il organiser ses souvenirs dans le temps et les rejouer dans le bon ordre ?

Réponse courte :  
En maintenant un contexte qui évolue progressivement et qui sert d’index temporel.

### Description
  
Le TCM repose sur un principe simple :

- le système maintient un vecteur de contexte C_t  
- ce contexte évolue lentement au fil du temps  
- chaque expérience est associée à ce contexte  

Ainsi :
- deux événements proches dans le temps ont des contextes similaires  
- les souvenirs sont naturellement organisés chronologiquement  

Principes importants :
- continuité du contexte  
- évolution lente (drift)  
- association événement-contexte  
- récupération séquentielle  

Mécanismes :
- maintien d’un contexte C_t  
- mise à jour progressive :
  - C_t ← α · C_{t-1} + (1 - α) · f(Z_t)  
- association :
  - stockage de (événement, contexte)  
- récupération :
  - utilisation du contexte comme requête  
- navigation :
  - dérive du contexte pour retrouver d’autres événements  

Propriété clé :
- le temps devient une **dimension interne du système**  

### Intérêt pour Garrigue-X
  
Dans l’architecture :
- le contexte temporel est intégré au broadcast du GNWT  
- il est partagé entre modules  
- il est utilisé pour :
  - organiser les souvenirs  
  - guider la simulation  
  - maintenir la continuité du système  

Rôle central :
- indexer les souvenirs dans la mémoire épisodique  
- permettre le replay séquentiel  
- connecter passé, présent et futur  

Exemples :
- rejouer un épisode dans l’ordre chronologique  
- retrouver un souvenir via son contexte  
- projeter une trajectoire future cohérente  

Lien clé :
- Hopfield → stocke (événement + contexte)  
- TCM → fournit le contexte  
- Simulation → propage le contexte dans le futur  

Dans l’architecture V2 :
- le TCM est explicitement utilisé pour :
  - indexation des souvenirs  
  - navigation temporelle  
  - continuité cognitive  

### Limites connues :
- dérive du contexte difficile à calibrer  
- perte possible de précision à long terme  
- sensibilité aux perturbations  
- difficulté à représenter plusieurs timelines  

### Relations avec d'autres concepts
  
Concepts parents :
- [[Memory System]]
- [[Modélisation temporelle]]

Concepts associés :
- [[Episodic Memory (Hopfield)]]
- [[Semantic Memory (MeMo)]]
- [[Latent Dynamics]]
- [[Simulation]]

Concepts potentiellement en tension :
- [[Temps discret sans continuité]]
- [[Indexation statique]]

### Questions ouvertes
  
Questions encore non résolues.
- Quelle forme optimale pour le contexte temporel ?
- Comment gérer plusieurs échelles temporelles ?
- Comment éviter la dérive excessive ?
- Comment intégrer des événements discontinus ?

### Références

#### Références fondatrices
- Polyn, Kahana — Temporal Context Model

#### Références récentes
- Travaux en neuroscience sur hippocampe et time cells
- Architectures cognitives bio-inspirées

#### Ressources complémentaires
- Article
- Vidéo
- Blog
- Dépôt GitHub

### Historique
- 2026-07 : création du document
