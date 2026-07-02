### Full System Cycle

#### Résumé
  
Le Full System Cycle décrit le fonctionnement global du système, de la perception à l’action, en passant par la cognition, la décision et l’apprentissage.  
Il représente la boucle dynamique centrale qui relie tous les modules de l’architecture.

---

#### Rôle dans le système
  
Ce module sert de :
- vue dynamique globale du système  
- référence pour comprendre les interactions entre modules  
- base conceptuelle pour l’implémentation  

Il permet de relier :
- perception  
- GNWT  
- control (context routing)  
- décision  
- mémoire  
- apprentissage  

---

#### Fonctionnement
  
Le système fonctionne en boucle continue, structurée en plusieurs phases :

##### 1. Perception & encodage
- acquisition des données  
- encodage en espace latent (JEPA)  
- intégration mémoire  

→ Output : état latent du monde (Z_t)

---

##### 2. Évaluation & surprise
- comparaison prédiction vs réalité  
- calcul :
  - erreur de prédiction  
  - incertitude  

→ faible erreur :
- mise à jour locale  

→ forte erreur :
- ignition GNWT  

---

##### 3. Broadcast GNWT
- diffusion globale  
- accès partagé aux modules :
  - mémoire  
  - planner  
  - self-model  
  - moral agents  

→ Output : état global  

---

##### 4. Context Routing (Control)
- extraction du contexte global  
- sélection dynamique :
  - policies  
  - adaptateurs  
  - stratégies  
  - modules actifs  

→ sélection de la configuration de traitement  

---

##### 5. Simulation & planification
- génération d’actions candidates  
- simulation de trajectoires  
- évaluation (coût, risque, contraintes)  

→ Output : ensemble de trajectoires  

---

##### 6. Sélection d’action
- intégration multi-critères :
  - valeur  
  - contraintes  
  - éthique  

→ action sélectionnée  

---

##### 7. Exécution
- transformation action abstraite → action réelle  
- invocation des modules moteurs / adaptateurs  

→ interaction avec l’environnement  

---

##### 8. Feedback & mémoire
- observation des résultats  
- stockage :
  - mémoire épisodique  
  - meta-données  

→ création d’un épisode  

---

##### 9. Adaptation (online)
- ajustements rapides :
  - fine-tuning local  
  - LoRA  
  - adaptateurs  

→ correction immédiate  

---

##### 10. Consolidation (offline)
- replay  
- simulation  
- abstraction  

→ transformation :
expérience → connaissance → policies  

---

#### Interfaces
  
Entrées :
- perception (environnement)
- mémoire
- prédictions des niveaux supérieurs

Sorties :
- action vers environnement
- mises à jour mémoire
- signaux vers GNWT

Relations :
- utilise tous les modules  
- traverse toute l’architecture  

---

#### Intégration dans le système
  
- présent à tous les niveaux (N0 → N6)  
- structuré autour du GNWT  
- dépend du routing et du planner  

C’est :
- le cœur dynamique de l’architecture  
- la boucle perception-action-apprentissage  

---

#### Contraintes
  
- temps réel (latence critique)
- coût computationnel (simulation, replay)
- stabilité du système
- coordination multi-modules  

---

#### Limites
  
- complexité élevée  
- dépendance forte au GNWT  
- coût des phases de simulation  
- possible instabilité si mal calibré  

---

#### Relations avec autres modules
  
- [[GNWT (Global Neuronal Workspace Theory)]]
- [[Context Routing]]
- [[Planner / Process Composer]]
- [[Simulation]]
- [[Action Selection]]
- [[Memory Consolidation]]
- [[Adaptation (LoRA, Adaptateurs & Fine-Tuning)]]

---

#### Questions ouvertes
  
- calibration des seuils GNWT  
- fréquence du replay  
- coût vs qualité des simulations  
- équilibre réactivité vs stabilité  

---
