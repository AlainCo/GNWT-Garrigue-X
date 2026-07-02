## Semantic Memory (MeMo)

### Résumé
  
La mémoire sémantique désigne la capacité du système à **stocker et utiliser des connaissances abstraites** sous forme de modèles internes.  
Dans Garrigue-X, elle est implémentée via MeMo (Memory as a Model), où la mémoire est un modèle entraîné capable de **générer des réponses par inférence**.  

- Pourquoi ce concept existe  
→ permettre au système de généraliser au-delà des expériences individuelles  

- Ce qu'il apporte  
→ une connaissance abstraite, structurée et réutilisable  

- Pourquoi il est important pour Garrigue-X  
→ il fournit des **règles et contraintes pour guider la simulation et la décision**  

### Idée essentielle
  
Question à laquelle le concept répond :  
Comment un système peut-il transformer ses expériences en connaissances généralisables ?

Réponse courte :  
En apprenant un modèle interne capable d’inférer des réponses à partir de données abstraites.

### Description
  
La mémoire sémantique repose sur une idée fondamentale :

- la mémoire n’est pas un stockage  
- c’est un modèle entraîné qui **a internalisé les connaissances**  

Dans MeMo :
- l’information est transformée en représentations structurées  
- le système apprend des relations entre concepts  
- la récupération devient une inférence, pas une recherche  

Principes importants :
- abstraction des expériences  
- généralisation des connaissances  
- inférence plutôt que retrieval  
- robustesse au bruit  

Mécanismes :
- transformation des données en connaissances structurées  
- synthèse de relations (faits, inférences, liens)  
- entraînement d’un modèle mémoire spécialisé  
- génération de réponses à partir de requêtes  

Processus typique :
1. extraction des faits  
2. consolidation des informations  
3. création de représentations abstraites  
4. apprentissage du modèle mémoire  
5. utilisation par inférence  

Propriété clé :
- la mémoire sémantique est une **mémoire générative interne**  

### Intérêt pour Garrigue-X
  
Dans l’architecture :
- la mémoire sémantique (MeMo) constitue le **niveau abstrait du système mémoire**  
- elle est alimentée par :
  - la mémoire épisodique (expériences)  
  - les phases de replay et de consolidation  
- elle est utilisée par :
  - le planner  
  - la simulation  
  - la compréhension  

Contrairement à une mémoire type RAG :
- MeMo ne récupère pas des documents  
- elle génère des réponses à partir de connaissances internalisées 

Exemples :
- appliquer une règle abstraite à une nouvelle situation  
- compléter une information manquante  
- guider une simulation avec des contraintes du monde  

Lien clé :
- Hopfield → fournit les expériences  
- MeMo → extrait des régularités  
- Planner → utilise ces régularités  

### Limites connues :
- coût d’apprentissage du modèle  
- perte potentielle de détails concrets  
- difficulté à maintenir la cohérence globale  
- dépendance à la qualité des abstractions  

### Relations avec d'autres concepts
  
Concepts parents :
- [[Memory System]]
- [[Apprentissage]]

Concepts associés :
- [[Episodic Memory (Hopfield)]]
- [[Temporal Context Model]]
- [[Simulation]]
- [[World Models]]

Concepts potentiellement en tension :
- [[RAG classique]]
- [[Stockage brut de données]]

### Questions ouvertes
  
Questions encore non résolues.
- Comment optimiser la conversion expérience → abstraction ?
- Comment éviter la perte d’information importante ?
- Quelle granularité pour les connaissances ?
- Comment assurer la mise à jour continue du modèle ?

### Références

#### Références fondatrices
- MeMo: Memory as a Model  

#### Références récentes
- Travaux sur les architectures mémoire vs RAG
- Approches hybrides mémoire + LLM

#### Ressources complémentaires
- Article
- Vidéo
- Blog
- Dépôt GitHub

### Historique
- 2026-07 : création du document
`
