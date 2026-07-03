## 🧠 Architecture Cognitive Distribuée — V3.5

⚠️ Ce document étend la V3 narrative en conservant un **noyau industriel stable**, et en réintroduisant de manière modulaire des couches cognitives avancées :
- cognition sociale
- régulation éthique
- profils cognitifs
- apprentissage enrichi en phase de sommeil

---

## 1. 🌌 Vision

Nous cherchons à construire un système :
- capable d’agir dans le temps
- stable sous incertitude
- modulaire et distribué
- auto-régulé

👉 V3.5 introduit explicitement :
> un système **qui reste cohérent non seulement techniquement, mais socialement et épistémiquement**

---

## 2. 🧱 Noyau Industriel (inchangé)

Le noyau V3 reste la base opérationnelle :

- Hiérarchie N0 → N6 avec couvertures de Markov
- Échanges via résumés d’ignition compressés
- RPT locale (vie intérieure)
- GNWT (broadcast global)
- JEPA (modèle du monde)
- Inférence active (prédictions top-down / erreurs bottom-up)
- Attention Scheduler (budget)
- Self-model (confiance / métacognition)

👉 Ce noyau garantit :
- robustesse
- modularité
- stabilité des flux latents

---

# 🔺 Extensions V3.5 (Layers optionnels)

---

## Layer 1 — 🧑‍🤝‍🧑 Cognition sociale (ToM-X)

### Principe

Le système maintient un état latent social dans le workspace GNWT :

```

s = { s\_self, s\_other, s\_other\_of\_me }

```

- s_self : état interne
- s_other : modèle de l’autre
- s_other_of_me : ce que l’autre pense de moi

### Mécanismes

#### 1. Inférence sociale
- forward :
  → “si l’autre avait objectif G, que ferait-il ?”
- inverse :
  → “quels objectifs expliquent ses actions ?”

#### 2. Score d’agentivité
Décide si une entité est :
- physique
- agentive
- adversariale

#### 3. Récursion bornée
- limite automatique de profondeur
- évite boucles infinies

### Intégration GNWT

- état ToM-X = contenu standard d’ignition
- utilisé par :
  - planner
  - agents moraux
  - officiers

👉 Ajoute :
- coopération
- adversarial reasoning
- anticipation multi-agent

---

## Layer 2 — ⚖️ Éthique comme modulation de précision

### Principe fondamental

L’éthique n’est pas une règle.
C’est une **modulation de la confiance dans l’action**.

```

γ(a) = γ\_base(a) × m(a)

```

- m(a) ∈ [0,1] = masque de précision

### Agents moraux

Chaque agent publie un masque :

| Agent | Rôle |
|------|------|
| Vie | réduit actions destructrices |
| Fidélité | cohérence engagements |
| Préservation | long terme |
| Surconfiance | pénalise erreurs de calibration |
| Charité | limite paranoïa |

### Effet

- m(a) ≈ 0 → action devient incertaine → non sélectionnée
- décision conservatrice émerge naturellement

### Conflit moral

Quand conflits :
- activation GNWT globale
- ralentissement décision
- possibilité non-action

---

## Layer 3 — 🧠 Profils cognitifs (psychiatrie computationnelle)

### Principe

Les agents ne diffèrent pas par fonction,
mais par **paramétrage probabiliste**

### Paramètres clés

- pondération erreur sensorielle vs prior
- seuil d’ignition
- tolérance incertitude
- vitesse décision

### Exemples de profils

| Profil | Effet |
|--------|------|
| Systemizing | détecte patterns faibles |
| Empathique | priorise agents |
| Tactique | réduit sensibilité à la perte |
| Explorateur | favorise novelty |

👉 Implémentation :
```

profile = {
precision\_bias,
ignition\_threshold,
uncertainty\_gain,
exploration\_rate
}

```

### Effet architectural

- différenciation naturelle des officiers
- anti-collapse collectif
- diversité cognitive

---

# 🌙 Extension majeure : Rêverie et apprentissage enrichi

---

## 1. Cycle étendu

### Phase online
- perception → RPT → GNWT → action

### Phase offline (rêverie)

1. replay épisodique (MeMo) 
2. simulation JEPA
3. recalibration :
   - seuils
   - self-model
   - attention
4. consolidation :
   - mémoire
   - policies
5. adaptation structurelle :
   - profils
   - éthique
   - ToM

---

## 2. Rêverie active (nouveau)

Le système ne rejoue pas seulement.
Il **expérimente latentement** :

- variantes contre-factuelles
- scénarios adversariaux
- interactions sociales simulées

---

## 3. Couplage avec Φ

Φ devient :

- indicateur d’intégration
- trigger de rêverie ciblée

```

si Φ ↓ :
→ renforcer intégration
→ forcer co-activation modules
→ scénarios coopératifs

```

---

## 4. Apprentissage différencié

| Type | Moment | Rôle |
|------|--------|------|
| Adaptation | online | rapide |
| Consolidation | sommeil | stable |
| Révision | sommeil rare | structure |

---

## 5. Révision constitutionnelle

Déclenchée uniquement si :

```

toutes actions → catastrophiques

```

Procédure :
- replay
- simulation
- évaluation globale
- décision coûteuse

---

# 🧠 Vue globale V3.5

```

Noyau V3 :
perception → JEPA → GNWT → action

Extensions :

* ToM-X :
  cognition sociale

* Éthique :
  modulation décision

* Profils :
  diversité cognitive

* Rêverie étendue :
  apprentissage profond

```

---

# 🔥 Ce que V3.5 change réellement

Le système :

- ne traite plus seulement le monde
- mais aussi :
  - les autres agents
  - ses propres limites
  - les risques d’erreur
  - ses biais cognitifs

👉 Passage :

V3 :
> système prédictif hiérarchique

V3.5 :
> système cognitif complet :
> social, adaptatif, prudent, et auto-cohérent dans le temps

