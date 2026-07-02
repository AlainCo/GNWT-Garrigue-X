## Agency Detection

### Résumé
  
Agency Detection désigne la capacité du système à **identifier qu’une entité est un agent**, c’est-à-dire qu’elle possède des intentions, des objectifs et une capacité d’action autonome.  
Elle constitue une étape préalable essentielle à la modélisation sociale (ToM-X).  

- Pourquoi ce concept existe  
→ distinguer les agents des objets ou processus passifs  

- Ce qu'il apporte  
→ déclenchement de la modélisation sociale  

- Pourquoi il est important pour Garrigue-X  
→ il permet d’activer ToM-X uniquement lorsque c’est pertinent  

### Idée essentielle
  
Question à laquelle le concept répond :  
Comment un système peut-il savoir si une entité doit être traitée comme un agent ?

Réponse courte :  
En détectant des indices d’autonomie, d’intentionnalité et de comportement orienté vers un but.

### Description
  
La détection d’agentivité consiste à distinguer :

- entités passives (objets, phénomènes)  
- entités actives (agents intentionnels)  

Elle repose sur des indices tels que :

- comportement non aléatoire  
- réaction au contexte  
- cohérence dans le temps  
- orientation vers des objectifs  

Principes importants :
- hypothèse d’intentionnalité  
- détection probabiliste  
- possibilité d’erreur  
- lien avec l’incertitude  

Mécanismes :
- observation de l’environnement  
- analyse des trajectoires et des actions  
- détection de motifs :
  - adaptation au contexte  
  - comportement dirigé  
- estimation d’un score d’agentivité  
- décision d’activation de ToM-X  

Propriété clé :
- la détection d’agentivité est un **gating mechanism** pour la cognition sociale  

### Intérêt pour Garrigue-X
  
Dans l’architecture :
- Agency Detection est exécuté à partir des observations (via JEPA ou modules perceptifs)  
- il produit un score d’agentivité  

Rôles fonctionnels :

#### 1. Déclenchement de ToM-X
- agent détecté :
  - activation de la modélisation sociale  
- agent non détecté :
  - traitement comme objet ou système passif  

#### 2. Allocation de ressources
- modéliser un agent est coûteux  
- activation seulement si nécessaire  

#### 3. Interaction avec l’incertitude
- score intermédiaire → incertitude élevée  
- comportement prudent  
- exploration des hypothèses  

#### 4. Impact sur la décision
- présence d’agents :
  - amélioration de la planification sociale  
  - activation de contraintes éthiques spécifiques  

Exemples :
- distinguer un humain d’un objet  
- reconnaître un agent autonome dans un environnement  
- différencier un comportement intentionnel d’un bruit  

Lien clé :
- [[ToM-X (Theory of Mind eXtended)]] → nécessite Agency Detection  
- [[Uncertainty]] → influence la détection  
- [[World Models]] → fournissent les patterns  
- [[Self-Model]] → ajuste la confiance dans la détection  

### Limites connues :
- faux positifs (voir des agents partout)  
- faux négatifs (ne pas détecter un agent réel)  
- dépendance aux données observées  
- difficulté dans les environnements bruités  

### Relations avec d'autres concepts
  
Concepts parents :
- [[Social Cognition]]
- [[Perception]]

Concepts associés :
- [[ToM-X (Theory of Mind eXtended)]]
- [[Uncertainty]]
- [[World Models]]
- [[Simulation]]

Concepts potentiellement en tension :
- [[Hypothèses simplistes]]
- [[Paranoïa computationnelle]]

### Questions ouvertes
  
Questions encore non résolues.
- Quels critères optimaux pour détecter l’agentivité ?
- Comment calibrer le seuil d’activation ?
- Comment gérer les erreurs de détection ?
- Comment intégrer l’apprentissage de l’agentivité ?

### Références

#### Références fondatrices
- Heider & Simmel, perception de l’intentionnalité

#### Références récentes
- Travaux en cognition sociale et perception d’agentivité
- Approches IA pour détection d’intention

#### Ressources complémentaires
- Article
- Vidéo
- Blog
- Dépôt GitHub

### Historique
- 2026-07 : création du document
