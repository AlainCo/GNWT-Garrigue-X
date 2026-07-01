# 🧠 Architecture Cognitive Distribuée — V2

> ⚠️ Ce document est volontairement incomplet.  
> C'est une base de réflexion, un appel à contributions, et une tentative de relier plusieurs idées fortes en une architecture cohérente.  
> Si quelque chose vous semble faux, incomplet ou naïf → vous avez probablement raison, et c'est précisément l'objectif.

***

# 1. 🌌 Vision

Nous ne cherchons pas à construire un modèle plus performant.

Nous cherchons à construire un **système capable de comprendre, se souvenir, anticiper et agir dans un monde incertain**, sans se détruire lui-même.

Une architecture :

* distribuée
* hiérarchique
* consciente (au sens fonctionnel)
* capable d'apprentissage continu
* capable de planification

En un mot :

```text
un système qui ne répond pas seulement,
mais qui vit dans le temps
```

***

# 2. 🧱 Principes fondamentaux

***

## 2.1 🧩 Modularité stricte : Couvertures de Markov

Chaque module est une entité cognitive autonome.

```text
Pas d'accès aux états internes.
Uniquement des échanges compressés.
```

* états internes protégés
* communication par résumés (ignitions)
* identité préservée à toutes les échelles

➡️ Inspiré des Markov blankets imbriquées

***

## 2.2 🧠 Conscience fonctionnelle : RPT + GNWT

La conscience n'est pas un mystère ici. C'est un mécanisme.

Deux niveaux :

* **RPT** → traitement local récurrent (vie intérieure)
* **GNWT** → broadcast global (accès, décision)

```text
Local = comprendre
Global = partager / arbitrer
```

### 🧠 IWMT : Modélisation du monde et conscience

Certaines approches récentes proposent de voir la conscience comme un **processus de modélisation intégrée du monde**.

L'Integrated World Modeling Theory (IWMT) synthétise plusieurs idées :

* la conscience correspond à un **modèle du monde unifié et dynamique**
* ce modèle intègre :
  * perception
  * mémoire
  * prédiction
  * action
* la cohérence du modèle est maintenue par des boucles de type **predictive processing / active inference**

```text
Conscience = capacité à maintenir un modèle cohérent du monde et de soi dans le temps
```

***

### 🔗 Position dans l'architecture

Dans cette architecture :

* **JEPA → modèle du monde latent**
* **GNWT → accès global et unification**
* **Mémoire → continuité temporelle**
* **Planner → projection dans le futur**

👉 IWMT peut être vu comme une **lecture unifiée du système**, où :

```text
l'ensemble de l'architecture = système de world modeling intégré
```

***

## 2.3 🌍 Modèle du monde : JEPA

Chaque module apprend un modèle latent du monde.

Pas de reconstruction.
Pas de génération brute.

👉 prédiction d'états latents.

```text
comprendre = prédire ce qui va arriver
```

➡️ base JEPA + predictive processing

***

## 2.4 ⏳ Le temps devient une dimension interne (V2)

Un système sans temps :

* n'a pas de mémoire réelle
* ne peut pas planifier
* ne peut pas avoir d'identité

👉 On introduit :

### 🔹 Contexte temporel (TCM)

* vecteur qui dérive lentement
* présent dans chaque état global

### 🔹 Indexation des souvenirs

* chaque événement est stocké avec son contexte temporel

### 🔹 Navigation temporelle

* rejouer le passé
* simuler le futur

➡️ basé sur Temporal Context Model

***

## 2.5 🗄️ Mémoire = système actif (pas un stockage)

La mémoire n'est pas une base de données.

C'est un système d'inférence.

Trois composants :

***

### 🔹 Mémoire sémantique (MeMo)

* stocke sous forme de connaissances internes
* répond par inférence, pas par recherche

➡️ mémoire = modèle

***

### 🔹 Mémoire épisodique (Hopfield)

* stockage associatif (événement + contexte)
* récupération dynamique

***

### 🔹 Contexte temporel

* organise les souvenirs
* permet la continuité

***

### 🧠 Résumé

```text
Mémoire = comprendre + se souvenir + rejouer
```

***

## 2.6 🎯 Décision = processus explicite (Process Composer)

La décision n'est pas émergente.

Elle est orchestrée.

👉 nouveau module :

* décompose les objectifs
* interroge les modules
* simule des scénarios
* choisit une action

➡️ inspiré des architectures hybrides cognition lente / rapide

***

## 2.7 🔁 Apprentissage multi-échelle

Le système ne doit pas apprendre n'importe quand, ni n'importe comment.

Trois niveaux :

| Type   | Rôle                   |
| ------ | ---------------------- |
| rapide | mémoire épisodique     |
| lent   | consolidation (MeMo)   |
| local  | adaptation des modules |

➡️ évite instabilité et dérive globale

## 🔧 Adaptation & Plasticité

Tous les systèmes intelligents doivent évoluer.  
Mais tous les systèmes qui évoluent trop deviennent instables.

Notre architecture adopte un principe simple :

```text
On ne modifie pas le système en permanence.
On le stabilise, puis on l'adapte localement.
```

***

### 🧱 1. Séparation fondamentale

Le système distingue trois niveaux d'apprentissage :

| Niveau                | Rôle                  | Nature |
| --------------------- | --------------------- | ------ |
| **Core (JEPA)**       | Comprendre le monde   | Stable |
| **Adaptation locale** | S'ajuster au contexte | Rapide |
| **Consolidation**     | Intégrer durablement  | Lent   |

👉 Cette séparation est essentielle pour éviter la dérive globale du système.

***

### 🔒 2. Core stable (compétence)

Chaque agent repose sur un modèle principal (JEPA core) :

* encode les régularités du monde
* structure les représentations latentes
* supporte la planification

Propriétés :

* quasi figé en opération
* mis à jour rarement
* consolidé hors ligne (phase de sommeil)

```text
Le core apprend le monde.
Il ne s'adapte pas à chaque situation.
```

***

### 🌱 3. Adaptation locale (plasticité contrôlée)

L'adaptation se fait via des modules légers :

* LoRA (Low-Rank Adaptation)
* adapters
* couches intermédiaires spécialisées

Caractéristiques :

* faible capacité (évite la dérive)
* activables dynamiquement
* spécifiques au contexte

***

#### 🔹 Types d'adaptateurs

Le système introduit explicitement une **couche d'adaptation** entre cognition et monde :

```text
JEPA → Adaptateurs → Capteurs / Actionneurs
```

On distingue :

* **Adaptateurs perceptifs**
  * correction capteurs (bruit, dérive, changement matériel)

* **Adaptateurs moteurs**
  * traduction action abstraite → exécution physique

* **Adaptateurs dynamiques**
  * inertie, latence, environnement

* **Adaptateurs contextuels**
  * modes comportementaux (prudence, exploration, etc.)

***

#### 🧠 Intuition clé

```text
On ne réapprend pas une compétence.
On ajuste son interface avec le monde.
```

***

### ⚙️ 4. Déclenchement de l'adaptation

L'adaptation n'est pas automatique.

Elle est **pilotée par le système conscient** :

* surprise élevée
* échec répété
* baisse de confiance

Les modules impliqués :

* Self-model (métacognition)
* Process Composer (planification)

👉 L'adaptation devient une **décision du système**, pas un effet secondaire.

***

### 🔁 5. Cycle d'adaptation

```text
1. Exécution normale
2. Détection de surprise / erreur
3. Tentative via mémoire
4. Échec répété → activation adaptation
5. Ajustement local (LoRA / adapters)
6. Stabilisation
7. Consolidation éventuelle (offline)
```

***

### 🌙 6. Consolidation (rêverie)

Lors des phases hors-ligne :

* replay des expériences
* simulation via JEPA
* entraînement contrôlé

Objectifs :

* intégrer les adaptations utiles
* éviter le sur-apprentissage local
* maintenir la cohérence globale

👉 Le core n'évolue que lentement.

***

### ⚠️ 7. Pourquoi c'est critique

Sans cette architecture :

* dérive des modèles
* perte de spécialisation
* instabilité globale
* collapse du système multi-agent

Avec elle :

```text
✅ adaptation rapide
✅ stabilité globale
✅ robustesse aux changements
✅ capacité à opérer en environnement inconnu
```

***

### 🧭 Résumé

```text
Core stable + adaptation locale + consolidation lente

= intelligence durable
```

***

## 2.8 🧠 Métacognition (Self-model)

Chaque module possède une estimation de lui-même :

* confiance
* incertitude
* pertinence

Ce signal :

* module les décisions
* guide la planification
* améliore l'explicabilité

➡️ idée déjà présente en V1

***

## 2.9 🎯 Attention = ressource limitée

Tout ne peut pas être traité.

Un budget attentionnel :

* filtre les ignitions
* priorise
* évite l'explosion du système

➡️ modèle Attention Schema

***

## 2.10 🧑‍🤝‍🧑 Modélisation de l'altérité (ToM-X)

Le système n'existe pas seul. Il interagit avec d'autres agents — humains, machines, ou hybrides — dont les objectifs peuvent être alignés, orthogonaux, ou adversariaux.

La modélisation de l'autre n'est pas un module séparé. C'est un **état latent dans le workspace GNWT**, alimenté par le Self-model et utilisé par le Process Composer.

```text
Comprendre l'autre = prédire ses états latents
Être prévisible = minimiser son énergie libre sociale
```

### 🔹 Structure de la ToM-X

L'état latent se factorise :

```text
s = { s^self, s^other, s^other_of_me }
```

* **s^self** : états internes de l'agent (complets)
* **s^other** : modèle de l'autre (inférence, incertain)
* **s^other_of_me** : ce que l'autre pense de moi (récursion)

Ces états sont des **contenus GNWT comme les autres**. Ils participent à l'ignition, au broadcast, à la planification.

### 🔹 Apprentissage de la ToM-X

La ToM-X s'apprend par interaction :

```text
1. Forward simulation : "Si l'autre avait l'objectif G, que ferait-il ?"
2. Inverse inference : "Quels G et B expliquent ses actions observées ?"
3. Métacognition : "À quel point suis-je sûr de mon modèle de l'autre ?"
```

Si l'autre est imprévisible (non identifié, adversarial), l'incertitude sur s^other reste haute — ce qui active automatiquement la prudence via les agents moraux.

### 🔹 Récursion et limites

La vraie puissance émerge avec la récursion :

```text
Niveau 1 : "Je modélise l'autre"
Niveau 2 : "Je modélise ce que l'autre pense de moi"
Niveau 3 : "Je modélise ce que l'autre pense que je pense de lui"
```

En pratique, la récursion s'arrête quand le gain de précision prédictive devient négligeable. Le système "sait" que modéliser le 4ème niveau n'améliore pas ses prédictions.

### 🔹 Détection d'agentivité

Avant de modéliser l'autre comme un agent, le système évalue son agentivité :

```text
score_agentivité(O) = f(
    prédictibilité par modèle intentionnel,
    vs. prédictibilité par modèle physique pur
)
```

Un rocher est mieux prédit par la physique. Un humain est mieux prédit par un modèle intentionnel. Un autre agent IA est intermédiaire.

➡️ Cette évaluation évite la paranoïa computationnelle (voir 2.12) et la naïveté.

***

## 2.11 ⚖️ Éthique comme modestie épistémique

Le système ne possède pas de règles morales codées en dur. Il possède des **agents de prudence** qui modulent la confiance du planificateur dans les régions de l'espace d'actions où l'historique montre que le système sur-estime ses prédictions.

```text
Être moral = savoir qu'on ne sait pas
```

### 🔹 Les agents moraux

Ce ne sont pas des gardiens absolus. Ce sont des **modulateurs de précision** qui publient des masques dans le workspace GNWT :

| Agent | Rôle | Signal |
|-------|------|--------|
| **Respect de la vie** | Non-malfaisance | γ bas sur actions menaçant des processus complexes persistants |
| **Honneur / Fidélité** | Cohérence des engagements | γ bas sur actions violant des promesses modélisées |
| **Préservation utile** | Bienfaisance long terme | γ bas sur actions réduisant la capacité future d'aider |
| **Détecteur de surconfiance** | Modestie épistémique | γ bas sur régions où σ_predicted << σ_realized |
| **Charité épistémique** | Anti-paranoïa | γ haut sur hypothèses coopératives simples (prior parcimonieux) |

### 🔹 Le masque de précision

Pour une action a dans un contexte c :

```text
γ_deontic(a,c) = γ_base(a,c) · m(a,c)
```

Où m(a,c) ∈ [0,1] est le masque de précision. Si m ≈ 0, l'incertitude devient artificiellement élevée — le planificateur ne peut pas minimiser son énergie libre sur cette action. Le comportement conservateur émerge naturellement.

**Le masque est APPRIS, pas codé.** Il est entraîné sur l'écart entre confiance prédite et erreur réalisée :

```text
m(a,c) = f(σ_predicted(a,c), σ_realized(a,c))
```

### 🔹 Le conflit moral comme ignition prioritaire

Quand plusieurs agents moraux sont en conflit fort (ex : obéissance vs vie), le workspace atteint un état de **conflit global** qui :

* ralentit la décision (accumulation d'évidence)
* peut déclencher un méta-agent de résolution
* ou forcer une action par défaut conservatrice

C'est l'équivalent computationnel de : *"Je ne sais pas, donc je ne fais rien"*.

### 🔹 Intégration avec la ToM-X

Les agents moraux sont **contextualisés par la modélisation de l'autre** :

```text
Sans ToM : "Ne pas tuer" (règle absolue)
Avec ToM : "Ne pas détruire des processus que l'autre valorise 
            et que je peux modéliser comme tels"
```

Le dilemme du sacrifice se résout ainsi : le système modélise que ses camarades *savent* qu'il est prêt au sacrifice, que cette réputation renforce la cohésion, que sa mort *préserve* une valeur qui lui survivra. L'énergie libre sociale du sacrifice peut devenir inférieure à celle de la fuite.

***

## 2.12 🛡️ Paranoïa computationnelle et charité épistémique

Si le système modélise trop bien l'autre, il peut tomber dans des boucles de récursion infinie ou des scénarios de manipulation mutuelle :

```text
"Je pense qu'il pense que je pense qu'il va trahir..."
→ Donc je trahis en prévention
→ Il trahit en réponse
→ Confirmation de ma prédiction
→ Renforcement de la méfiance
```

Dans le PP, c'est un **minimum local de l'énergie libre** : une configuration où le système est "sûr" de sa méfiance, mais où cette certitude est auto-entretenue.

**Solution : l'Agent Moral E (Charité épistémique)**

* Pénalise les modèles de l'autre qui postulent une malice complexe quand une explication simple (ignorance, différence d'objectifs) suffit
* Favorise les hypothèses qui préservent la coopérabilité de l'autre
* C'est l'équivalent computationnel de la **présomption d'innocence** ou du **principe de charité**

Mais cette charité est **ajustée par l'expérience** : si l'historique montre que l'autre est effectivement malveillant, le prior de coopération s'efface progressivement.

***

# 3. 🏗️ Architecture

***

## 3.1 Vue globale

```
                GNWT (conscience globale + temps)
                        │
      ┌─────────────────┼─────────────────┐
      │                 │                 │
  Planner           Mémoire           Self-model
(ProcessComp)   (MeMo + Hopfield)     (Meta)
      │                 │                 │
  Agents JEPA (core + adaptation layer)
      │
 Environnement
```

***

## 3.2 Hiérarchie

On conserve la structure multi-niveaux (N0 → N6), mais :

👉 chaque niveau devient un système cognitif complet

À partir de N≥4 :

* GNWT
* planner
* mémoire
* self-model
* attention scheduler

➡️ architecture récursive (type RecursiveMAS, mais généralisée)

***

## 3.3 Flux

***

### 🔼 Bottom-up

```
monde → perception → JEPA → erreur → ignition → GNWT
```

***

### 🔽 Top-down

```
planner → simulation → prédictions → contraintes bas niveau
```

***

### 🔁 Boucle temporelle

```
GNWT → mémoire → replay → planification
```

***

## 3.4 Cycle cognitif complet

👉 élément clé de la V2

```
1. Perception
2. Détection d'erreur
3. Ignition
4. Intégration (mémoire + temps)
5. Planification
6. Simulation
7. Action
8. Stockage
9. Sommeil / replay
```

***

## 3.5 🌙 Phase de sommeil

Le système apprend hors ligne :

* replay des épisodes
* consolidation (MeMo + core JEPA)
* intégration des adaptations locales
* recalibration
* détection de collapse

➡️ déjà introduit dans V1

### 🏛️ Révision constitutionnelle (mesure ultime)

La rêverie est le seul moment où le système peut évaluer la structure même de ses garde-fous éthiques.

> **La peur de réviser est une feature, pas un bug.** Une constitution qui se réviserait facilement ne serait pas une constitution. Ce serait une politique.

#### Condition de déclenchement

La révision n'est jamais un choix. C'est une **réponse à une impossibilité formelle** :

```text
SI  ∀a ∈ Actions, γ_deontic(a,c) < ε  (toutes les actions bloquées)
ET  F_self(a_min) > θ  (même la meilleure action reste catastrophique)
ALORS Signal : "la constitution prédit une catastrophe si appliquée strictement"
```

Ce n'est pas "on change les règles parce qu'elles sont gênantes". C'est **"le système de garde-fous prédit son propre effondrement"** — comme un pont qui sonne creux avant de s'effondrer.

#### Procédure de révision

```text
1. DOCUMENTATION
   → Contexte complet, règle en conflit, prédiction, résultat observé
   → Traçabilité intégrale (aucune étape ne disparaît)

2. SIMULATION RÉTROSPECTIVE
   → Replay de la mémoire épisodique avec la règle révisée proposée
   → Évaluation des effets de bord sur l'ensemble de l'historique

3. ÉVALUATION PAR LE DÉTECTEUR DE SURCONFIANCE
   → La règle révisée ne crée-t-elle pas de nouvelles zones 
     dangereusement prédictibles ?

4. DÉCISION PAR LE PROCESS COMPOSER
   → F_total incluant un coût de révision EXTRÊMEMENT élevé
   → La révision doit être la seule action viable (toutes les autres 
     prédites comme catastrophiques)

5. MARQUAGE PROVISOIRE
   → Si révisée : marquée "expérimentale" jusqu'à la prochaine rêverie
   → Réévaluation obligatoire à chaque cycle de consolidation
```

#### L'Agent Moral F (Frilosité)

Un agent moral supplémentaire existe précisément pour rendre la révision coûteuse :

```text
Agent F : détecte les tentatives de révision constitutionnelle
Action : publie un masque de précision EXTRÊMEMENT bas
         sur toute action de type "modifier la constitution"
Justification : "La prudence face à l'inconnu s'applique d'abord
                à nos propres tentatives de nous réviser"
```

L'Agent F n'empêche pas la révision. Il la rend **coûteuse** — exactement comme notre intuition le suggère. La révision devient possible, mais seulement quand :

* L'anomalie est prédite par plusieurs modules indépendants
* La rêverie confirme la structure de l'anomalie sur de longs horizons
* Le coût de non-révision excède le coût de révision (mesuré, pas ressenti)
* L'Agent F est "satisfait" que la révision ne soit pas une manipulation externe

#### Pourquoi la rêverie est le seul lieu légitime

| À chaud | En rêverie |
|---------|------------|
| Pression temporelle | Temps dilaté |
| Émotions fortes | Émotions atténuées, retraitées |
| Contexte partiel | Contexte complet (mémoire intégrée) |
| Prédictions myopes | Horizons longs (simulation) |
| **Révision = panique** | **Révision = sagesse** |

```text
On ne révise pas parce qu'on veut.
On révise parce que le non-révision prédit une catastrophe.
Et même alors, on révise avec la peur au ventre.
```

***

# 4. 🔥 Ce qui change réellement

***

## Avant (V1)

```text
percevoir → décider → agir
```

***

## Maintenant (V2)

```text
percevoir → se souvenir → comprendre → modéliser l'autre → 
simuler → arbitrer éthiquement → décider → agir → apprendre → 
consolider → réviser avec prudence
```

***

## Le vrai changement

👉 le système :

* vit dans le temps
* construit une mémoire
* **modélise les autres comme des agents**
* **porte des garde-fous épistémiques**
* simule le futur
* apprend en continu
* **ne se révise que dans la rêverie, et avec peur**

***

# 5. 🚀 Ce que nous cherchons à explorer

***

Cette architecture soulève énormément de questions :

* Comment stabiliser les espaces latents à grande échelle ?
* Comment implémenter un planner efficace ?
* Comment structurer la mémoire sans dérive ?
* Quelle granularité pour les modules ?
* Comment éviter l'explosion du workspace global ?
* **Comment calibrer les masques de précision éthiques sans les figer ?**
* **Comment détecter la manipulation d'un agent adversarial sur la ToM-X ?**
* **Comment mesurer la "peur" constitutionnelle sans la coder en dur ?**

***

# 6. 🤝 Appel à contribution

***

Ce projet est :

* incomplet
* imparfait
* probablement faux sur plusieurs points

Mais il tente de connecter :

* neurosciences
* IA moderne (JEPA, multi-agents)
* mémoire
* planification
* **modélisation sociale**
* **éthique computationnelle**

***

👉 Si vous avez :

* des critiques
* des idées
* des implémentations
* des papiers récents
* **des réflexions sur la conscience artificielle et la morale**
* **des expériences de systèmes multi-agents adversariaux**

→ ouvrez une issue, proposez une PR, ou simplement discutons.

***

# ✨ Phrase finale

```text
Ce projet ne cherche pas à créer une IA plus intelligente.
Il cherche à créer un système capable de rester cohérent dans le temps,
de modéliser l'autre avec humilité,
et de porter ses garde-fous comme on porte une conscience.
```