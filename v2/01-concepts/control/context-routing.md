## Context Routing

### Résumé
  
Le Context Routing désigne le mécanisme par lequel le système sélectionne dynamiquement les modules, stratégies ou formes d’adaptation les plus appropriées en fonction du contexte courant.  
Il agit comme une couche de contrôle permettant d’orchestrer les comportements internes du système.  

- Pourquoi ce concept existe  
→ éviter d’utiliser une seule stratégie pour toutes les situations  

- Ce qu'il apporte  
→ une adaptation ciblée et intelligente  

- Pourquoi il est important pour Garrigue-X  
→ il permet une **sélection dynamique des mécanismes cognitifs et d’adaptation**  

### Idée essentielle
  
Question à laquelle le concept répond :  
Comment un système choisit-il la bonne manière d’agir dans une situation donnée ?

Réponse courte :  
En détectant le contexte et en activant les modules les plus adaptés.

### Description
  
Le Context Routing repose sur une idée clé :

- le système ne doit pas seulement agir  
- il doit choisir COMMENT agir  

Cela implique :

- détection du contexte  
- sélection de comportements  
- adaptation dynamique  

Le routing est inspiré des architectures de type Mixture of Experts (MoE), mais intégré dans un système cognitif.

---

### Mécanismes principaux

#### 1. Encodage du contexte
- extraction d’un vecteur latent c_t  
- basé sur :
  - perception  
  - mémoire  
  - état interne  
  - historique récent  

Ce vecteur représente la “situation globale”.

---

#### 2. Routing (sélection)
  
- transformation du contexte en distribution de sélection  
- choix des modules à activer  

Cela peut activer :
- adaptateurs  
- LoRA  
- policies  
- stratégies (meta-modes)  

Le routing peut être :
- discret (choix d’un expert)  
- continu (combinaison pondérée)  

---

#### 3. Experts / modules
Les éléments sélectionnés peuvent être :

- adaptateurs (modularité structurelle)  
- LoRA (adaptation interne)  
- policies (comportements automatisés)  
- modules cognitifs  

👉 Le routing orchestre l’ensemble du système.  

---

#### 4. Apprentissage du routing
  
Le système apprend à router de manière auto-supervisée :

- erreur de prédiction → signal  
- mise à jour :
  - du routeur  
  - des modules utilisés  

→ il découvre implicitement quels modules sont utiles dans quels contextes  

Ce mécanisme est similaire à :
- l’apprentissage par erreur en architectures prédictives   

---

### Principes importants
  
- sélection contextuelle  
- apprentissage implicite  
- adaptation distribuée  
- séparation contrôle / exécution  

### Propriété clé
  
- le routing décide **quel système agir**  
- pas directement **quelle action choisir**  

---

### Intérêt pour Garrigue-X
  
Dans l’architecture :
- le Context Routing agit comme une couche de contrôle  
- il intervient avant :
  - la décision  
  - l’adaptation  

Rôles fonctionnels :

#### 1. Sélection d’adaptation
- choisir entre :
  - fine-tuning  
  - LoRA  
  - adaptateurs  

#### 2. Stabilisation du système
- éviter les adaptations globales  
- limiter la dérive  

#### 3. Gestion du multi-contexte
- conditions environnementales  
- modes opérationnels  
- variations système  

#### 4. Interface avec le GNWT
- le contexte peut être :
  - broadcasté  
  - partagé  
- influence globale sur les modules  

---

### Intégration avec les autres concepts
  
Lien clé :
- [[Adaptation (LoRA, Adaptateurs & Fine-Tuning)]] → mécanismes activés  
- [[Self-Model]] → supervision et validation  
- [[Uncertainty]] → influence du routing  
- [[Curiosity & Intrinsic Motivation]] → exploration des routes  

Dans l’architecture :

```

perception → contexte → routing → modules activés → action → feedback

```

---

### Limites connues :
- collapse vers un seul expert  
- transitions instables entre contextes  
- coût d’apprentissage  
- difficulté de calibration  

---

### Relations avec d'autres concepts
  
Concepts parents :
- [[Control]]
- [[Cognition]]

Concepts associés :
- [[Adaptation (LoRA, Adaptateurs & Fine-Tuning)]]
- [[Self-Model]]
- [[Uncertainty]]
- [[GNWT (Global Neuronal Workspace Theory)]]

Concepts potentiellement en tension :
- [[Simplicité du système]]
- [[Robustesse globale]]

---

### Questions ouvertes
  
Questions encore non résolues.
- Comment faire émerger des contextes pertinents ?
- Faut-il limiter le nombre d’experts ?
- Comment stabiliser le routing dans le temps ?
- Comment gérer les contextes rares ?

---

### Références

#### Références récentes
- Mixture of Experts (routing appris)
- Adaptation en ligne (AdaJEPA)  

#### Ressources complémentaires
- Article
- Vidéo
- Blog
- Dépôt GitHub  

---

### Historique
- 2026-07 : création du document (version initiale, évolutive)
