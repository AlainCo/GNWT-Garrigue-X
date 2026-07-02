## Latent Dynamics

### Résumé
  
Les latent dynamics décrivent la façon dont les représentations internes (latents) **évoluent dans le temps**, en réponse au contexte et aux actions.  
Elles permettent de modéliser la dynamique du monde dans un espace latent, sans passer par des observations brutes.  

- Pourquoi ce concept existe  
→ modéliser l’évolution du monde de manière prédictive  

- Ce qu'il apporte  
→ une structure temporelle interne au système  

- Pourquoi il est important pour Garrigue-X  
→ il permet la **simulation, la planification et l’anticipation dans le temps**  

### Idée essentielle
  
Question à laquelle le concept répond :  
Comment représenter l’évolution du monde dans le temps de manière compacte ?

Réponse courte :  
En apprenant une dynamique interne qui transforme un état latent en un futur latent.

### Description
  
Les latent dynamics définissent une transition :

- Z_t → Z_{t+1}  
- Z_t + action → Z_{t+1}  

où :
- Z_t représente l’état latent du monde à un instant donné  
- Z_{t+1} représente l’état latent futur  

Contrairement aux modèles classiques :
- on ne prédit pas directement les observations  
- on prédit leur représentation abstraite  

Principes importants :
- dynamique dans un espace latent  
- dépendance au temps  
- influence des actions  
- prédiction continue  

Mécanismes :
- encodage de l’état courant : Z_t  
- application d’une fonction de transition :  
  - Z_{t+1} = f(Z_t)  
  - ou Z_{t+1} = f(Z_t, action)  
- propagation dans le temps (Z_t → Z_{t+1} → Z_{t+2} …)  
- accumulation des trajectoires  

Propriété clé :
- le système développe une **physique interne du monde**  

### Intérêt pour Garrigue-X
  
Dans l’architecture :
- les agents JEPA produisent des états latents  
- les latent dynamics permettent de :
  - faire évoluer ces états dans le temps  
  - simuler des trajectoires  
- elles sont utilisées par :
  - la simulation (projection de futurs)  
  - le planner (évaluation de plans)  
  - la mémoire (continuité temporelle)  

Exemples :
- simuler la conséquence d’une action sur plusieurs étapes  
- anticiper une situation future  
- reconstruire une trajectoire passée  

Lien clé :
- JEPA → représentation du monde  
- Latent Dynamics → évolution du monde  
- Simulation → exploitation de cette évolution  

### Limites connues :
- accumulation d’erreurs sur long horizon  
- difficulté à capturer des dynamiques complexes  
- dépendance à la qualité de l’espace latent  
- instabilité possible des trajectoires  

### Relations avec d'autres concepts
  
Concepts parents :
- [[World Models]]
- [[Dynamique des systèmes]]

Concepts associés :
- [[JEPA (Joint Embedding Predictive Architecture)]]
- [[Simulation]]
- [[Latent Space Stability]]
- [[Temporal Context Model]]

Concepts potentiellement en tension :
- [[Modèles statiques]]
- [[Réactivité immédiate]]

### Questions ouvertes
  
Questions encore non résolues.
- Comment stabiliser les dynamiques sur le long terme ?
- Comment intégrer des actions complexes dans la transition ?
- Quelle granularité temporelle choisir ?
- Comment gérer les incertitudes dans les transitions ?

### Références

#### Références fondatrices
- Travaux sur les modèles dynamiques latents
- Recherche sur les systèmes dynamiques en apprentissage profond

#### Références récentes
- Dreamer, MuZero, architectures de world models dynamiques
- Travaux sur JEPA dynamique

#### Ressources complémentaires
- Article
- Vidéo
- Blog
- Dépôt GitHub

### Historique
- 2026-07 : création du document