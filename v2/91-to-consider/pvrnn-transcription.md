Voici une synthèse et une explication détaillée du papier de recherche **PV-RNN** (*A Novel Predictive-Coding-Inspired Variational RNN Model for Online Prediction and Recognition*, Ahmadi & Tani, 2019, arXiv:1811.01339) et de ses liens profonds avec les neurosciences computationnelles et l'apprentissage automatique bayésien.

---

### 1. Contexte & Problématique : Qu'est-ce que PV-RNN ?

Dans les réseaux récurrents classiques (RNN) ou même les modèles bayésiens récurrents standards (VRNN), la modélisation de séquences temporelles hautement incertaines et stochastiques présente deux limites fondamentales :

1. **Transfert d'information descendant/ascendant inefficient** : Dans un VRNN standard, les observations futures ou actuelles sont réinjectées directement en entrée lors de la passe avant (*forward pass*). Le modèle a tendance à devenir dépendant des entrées immédiates au lieu de construire des représentations dynamiques internes riches.
2. **Incapacité à s'adapter en ligne (*online adaptation*)** : Lors de l'évaluation ou du déploiement (ex. sur un robot), un modèle doit réajuster ses croyances internes sans ré-entraîner tous ses poids.

Le **PV-RNN** (*Predictive-Coding-Inspired Variational RNN*) résout ces défis en fusionnant l'ingénierie des **Auto-encodeurs Variationnels (VAE)** avec les principes biologiques du **Codage Prédictif (*Predictive Coding*)** et de l'**Inférence Active**.

---

### 2. Les Piliers Théoriques et Conceptuels

#### A. Le Codage Prédictif (*Predictive Coding*) & Predictive Processing

Dans le codage prédictif (Rao & Ballard, Clark), le cerveau est perçu comme une **machine à prédire** :

* **Top-Down (Descendant)** : Les couches supérieures génèrent en permanence des prédictions sur les signaux sensoriels des couches inférieures.
* **Bottom-Up (Ascendant)** : Ce ne sont pas les données brutes qui remontent, mais uniquement l'**erreur de prédiction** (la différence entre la donnée réelle et la prédiction).
* **Mise à jour** : Les états internes sont ajustés dynamiquement pour minimiser cette erreur de prédiction.

#### B. Les VAE & la Bornes Inférieure Variationnelle (ELBO)

PV-RNN formalise ce processus au sein d'un cadre Bayésien variationnel :

* Il cherche à maximiser la borne inférieure de la vraisemblance marginale des données (ELBO) ou, de façon équivalente, à **minimiser l'Énergie Libre Variationale (FEP de Karl Friston)**.
* L'objectif se compose de deux termes :
1. **L'erreur de reconstruction / prédiction** : mesure la précision de la prédiction générée.
2. **La divergence KL** ($D_{KL}$) : mesure l'écart entre la distribution a priori (*prior*) et la distribution a posteriori approximée (*posterior*).



#### C. Le Principe de l'Énergie Libre (Free Energy Principle) & Active Inference de Karl Friston

Dans la théorie de Friston, tout système vivant ou agent autonome minimise son Énergie Libre pour maintenir son homéostasie et éviter le désordre (l'entropie) :

* **Perception (Inférence)** : L'agent ajuste ses états internes $z$ pour mieux expliquer les observations (minimisation de l'erreur de prédiction).
* **Inférence Active (Action)** : L'agent agit sur l'environnement pour rendre les observations conformes à ses prédictions internes (ex. imiter un mouvement).

Dans PV-RNN, cela se traduit par le mécanisme de **Régression d'Erreur (*Error Regression*)** pendant la phase de test.

---

### 3. Architecture et Fonctionnement de PV-RNN

#### A. Vectors Adaptatifs d'État (*Adaptive Vectors*)

Plutôt que d'avoir un encodeur ascendant traditionnel qui traite les données à chaque pas de temps, PV-RNN introduit des **vecteurs adaptatifs d'état** $A_i$ associés à chaque séquence d'entraînement :

* Durant l'entraînement, ces vecteurs $A$ apprennent à représenter le vecteur moyen/variance du prior/posterior de la séquence.
* Pendant l'inférence en ligne (test), le réseau **n'injecte pas les observations dans la passe avant** ; il ajuste les valeurs de $A$ en rétropropageant uniquement le signal d'erreur de prédiction.

#### B. La Régression d'Erreur (*Error Regression*) en Ligne

C'est le cœur de l'inspiration "Predictive Coding" :

1. Le réseau génère une prédiction sensorielle $\hat{x}_t$ au temps $t$.
2. Il observe la vraie valeur $x_t$ et calcule l'erreur $e_t = x_t - \hat{x}_t$.
3. L'erreur est rétropropagée (*backpropagated*) à travers le temps pour ajuster les variables latentes internes (les états $A$), sans modifier les poids synaptiques du réseau.
4. Cette mise à jour ajuste immédiatement la trajectoire future prédite.

#### C. Le Méta-Prior ($\beta$)

Le papier introduit un paramètre de pondération (souvent noté $\beta$ ou méta-prior) pour équilibrer la divergence KL et l'erreur de prédiction :

* **Méta-prior élevé** : Le réseau restreint la stochastique et développe un **chaos déterministe** (il imite la variabilité des données par des politiques déterministes complexes).
* **Méta-prior faible** : Le réseau réagit comme un processus stochastique pur (bruit aléatoire).
* **Valeur intermédiaire** : Offre la meilleure capacité de généralisation et capte les véritables structures probabilistes sous-jacentes.

---

### 4. Synthèse des Apports Majeurs

| Concept | VRNN Standard | PV-RNN (Ahmadi & Tani) |
| --- | --- | --- |
| **Passage d'information** | Entrées brutes transmises dans la passe avant (*Forward*) | Erreurs de prédiction rétropropagées (*Backward / Error Regression*) |
| **Adaptation en ligne** | Difficile sans ré-entraînement | Immédiate grâce à l'ajustement dynamique du vecteur $A$ |
| **Lien biologique** | Limité au cadre bayésien | Alignement strict avec le Codage Prédictif et l'Inférence Active |

---

[Predictive-Coding-Inspired Variational RNN (PVRNN)](https://www.youtube.com/watch?v=POK36o95kyE)

Cette vidéo offre une présentation claire des principes théoriques et algorithmiques sous-jacents aux PV-RNN et à leur lien avec la modélisation variationnelle et le codage prédictif.