# 🧠 Concepts — Architecture Cognitive Garrigue-X

Ce dossier regroupe l’ensemble des concepts fondamentaux utilisés dans l’architecture cognitive distribuée Garrigue-X.

L’objectif n’est pas de décrire des théories abstraites, mais de construire une **ontologie opérationnelle** :
- chaque concept correspond à un rôle précis dans le système  
- chaque fichier est volontairement court  
- l’ensemble forme une architecture cohérente  

---

## 🌌 Vision globale

Le système est conçu comme une **hiérarchie de modules cognitifs autonomes**, capables de :

- percevoir
- comprendre
- mémoriser
- simuler
- décider
- agir dans le temps

Ces capacités émergent de l'interaction de plusieurs mécanismes clés.

---

## 🧱 Colonne vertébrale cognitive

Le cœur du système repose sur un enchaînement simple :

```

RPT → Ignition → GNWT

```

- **RPT (Recurrent Processing)**  
  → traitement local récurrent  
  → vie intérieure des modules  

- **Ignition**  
  → sélection des informations importantes  
  → seuil basé sur la surprise / erreur  

- **GNWT (Global Workspace)**  
  → espace global de diffusion  
  → coordination entre modules  

👉 Cette séparation permet :
- efficacité locale  
- rareté du global  
- stabilité du système 【1-cc5f0a】  

---

## ⚙️ Principe fondamental

Le système est basé sur une idée centrale :

> Tout ne doit pas être global.

Conséquences :
- la plupart des traitements restent locaux (RPT)  
- seules les informations critiques deviennent globales (ignition)  
- le global est une ressource rare et régulée  

---

## 🧠 Organisation des concepts

Les concepts sont organisés par **fonction dans le système** (pas par discipline académique).

---

### 🧱 cognition-fundamentals/

Le moteur cognitif de base.

- Markov Blankets → isolation des modules  
- Predictive Processing → prédiction  
- Active Inference → action  
- RPT → traitement local  
- Ignition → seuil d’accès global  
- GNWT → espace global  

---

### 👁️ attention/

Gestion d’une ressource critique.

- Budgeted Attention → limite les ignitions  
- Attention Schema Theory → modélisation de l’attention  

👉 L’attention régule l’accès au GNWT.

---

### 🌍 world-modeling/

Représentation du monde.

- JEPA → modèle latent prédictif  
- World Models → représentation du monde  
- Latent Space Stability → robustesse des représentations  

---

### 🧠 memory/

Continuité dans le temps.

- Mémoire épisodique (MeMo)  
- Mémoire sémantique  
- Contexte temporel (TCM)  

---

### 🎯 decision/

Action et planification.

- Planner / Process Composer  
- Simulation  
- Sélection d’actions  

👉 Le planner utilise le GNWT pour orchestrer la décision.

---

### 📚 learning/

Adaptation du système.

- Multi-scale learning  
- Adaptation (LoRA / adapters)  
- Motivation intrinsèque / curiosité  

---

### 🧍 metacognition/

Connaissance de soi.

- Self-model  
- Estimation de confiance  

---

### 🧑‍🤝‍🧑 social-cognition/

Interaction avec d'autres agents.

- ToM-X  
- Détection d’agentivité  

---

### ⚖️ ethics/

Régulation et prudence.

- Agents moraux  
- Modestie épistémique  
- Révision constitutionnelle  

---

## 🔁 Flux cognitif global

Une boucle typique :

```

Perception
→ RPT (traitement local)
→ erreur de prédiction
→ Ignition (si seuil)
→ GNWT (intégration)
→ Planner (décision)
→ Action
→ Mémoire
→ Apprentissage

```

👉 Le système vit dans le temps, apprend, et s’adapte en continu.

---

## 🎯 Philosophie du projet

- modularité stricte (couvertures de Markov)
- séparation local / global
- apprentissage multi-échelle
- mémoire active (pas base de données)
- décision explicite
- prudence épistémique

---

## 🧩 Méthode de travail

Chaque concept :
- est autonome  
- décrit un rôle précis  
- possède ses relations avec les autres concepts  

L’objectif est de construire progressivement un **graphe de concepts cohérent et exploitable**.

---

## 🚀 Contribution

Ce projet est évolutif.

Si vous ajoutez un concept :
- gardez-le simple  
- reliez-le aux autres  
- précisez son rôle dans l’architecture  

---

## ✨ Intuition finale

Ce système n’est pas un modèle unique.

C’est une **écologie cognitive** :

- des modules autonomes  
- une communication rare et sélective  
- une coordination globale émergente  

👉 Intelligence = organisation dans le temps
