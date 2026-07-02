## Multi-Scale Learning

### Résumé
  
Le Multi-Scale Learning désigne l’organisation de l’apprentissage à plusieurs échelles de temps et de structure, permettant au système de concilier **adaptation rapide, stabilité et généralisation**.  
Il repose sur une séparation entre apprentissage local, consolidation progressive et évolution globale.  

- Pourquoi ce concept existe  
→ éviter les conflits entre adaptation rapide et stabilité  

- Ce qu'il apporte  
→ une organisation cohérente de l’apprentissage  

- Pourquoi il est important pour Garrigue-X  
→ il permet un système capable d’apprendre en continu sans dériver  

### Idée essentielle
  
Question à laquelle le concept répond :  
Comment un système peut-il apprendre rapidement tout en restant stable et cohérent ?

Réponse courte :  
En organisant l’apprentissage sur plusieurs échelles complémentaires.

### Description
  
Le Multi-Scale Learning repose sur une structuration du learning selon trois niveaux principaux :

#### 1. Apprentissage rapide (court terme)
- adaptation locale  
- réponse immédiate  
- faible impact global  

Implémentation :
- adaptateurs (LoRA, modules locaux)  
- ajustements contextuels  

#### 2. Apprentissage intermédiaire (mémoire)
- stockage des expériences  
- replay et sélection  
- structuration de l’information  

Implémentation :
- mémoire épisodique (Hopfield)  
- replay  
- sélection des épisodes  

#### 3. Apprentissage lent (long terme)
- consolidation  
- modification des connaissances abstraites  
- création de policies  

Implémentation :
- MeMo (mémoire sémantique)  
- policies  
- mise à jour rare du core  

---

Principes importants :
- séparation des échelles d’apprentissage  
- protection des structures stables  
- adaptation progressive  
- contrôle global du learning  

Mécanismes :
- online :
  - adaptation locale rapide  
  - réponse à l’environnement  
- offline :
  - replay  
  - consolidation  
  - abstraction  
- décision :
  - pilotée par Self-Model / GNWT  

Propriété clé :
- l’apprentissage est **hiérarchique dans le temps**  

### Intérêt pour Garrigue-X
  
Dans l’architecture :
- le système combine :
  - adaptation rapide (adaptateurs)  
  - mémoire intermédiaire (Hopfield)  
  - consolidation lente (MeMo + policies)  

Rôles fonctionnels :

#### 1. Robustesse
- évite la dérive globale  
- protège les représentations  

#### 2. Flexibilité
- permet adaptation immédiate  
- réaction à l’imprévu  

#### 3. Généralisation
- transforme les expériences en connaissances  
- améliore les capacités globales  

#### 4. Contrôle de l’apprentissage
- le learning est piloté par :
  - surprise  
  - erreur  
  - confiance  

👉 Le système n’apprend pas n’importe quand :
- il décide quand apprendre  

Exemples :
- adaptation à une situation nouvelle  
- stabilisation après apprentissage  
- généralisation d’une stratégie  

Lien clé :
- [[Memory Consolidation]] → apprentissage long terme  
- [[Policies]] → automatisation  
- [[Self-Model]] → contrôle  
- [[Simulation]] → support du replay  

Dans l’architecture :
- la séparation entre :
  - apprentissage rapide  
  - consolidation lente  
- est essentielle pour éviter la dérive 

### Limites connues :
- complexité d’orchestration  
- choix des seuils d’activation  
- coût computationnel  
- dépendance à la qualité des signaux  

### Relations avec d'autres concepts
  
Concepts parents :
- [[Learning]]
- [[Cognition]]

Concepts associés :
- [[Memory Consolidation]]
- [[Policies]]
- [[Self-Model]]
- [[Simulation]]
- [[Latent Dynamics]]

Concepts potentiellement en tension :
- [[Apprentissage rapide]]
- [[Stabilité des modèles]]

### Questions ouvertes
  
Questions encore non résolues.
- Comment calibrer les transitions entre échelles ?
- Quelle granularité temporelle optimale ?
- Comment décider quand consolider ?
- Comment éviter les conflits entre niveaux ?

### Références

#### Références fondatrices
- Neurosciences : apprentissage hippocampe vs cortex  

#### Références récentes
- Continual Learning  
- PEFT (LoRA, adapters)  
- Architectures hybrides multi-échelles  

#### Ressources complémentaires
- Article
- Vidéo
- Blog
- Dépôt GitHub

### Historique
- 2026-07 : création du document