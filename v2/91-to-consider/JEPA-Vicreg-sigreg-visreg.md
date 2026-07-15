User: Peux tu m'expliquer, dans le domaine des Modèles JEPA, laes régularisation SIGREG et VICREG (et autre similaires si tu connait).
Kimi: Je vais rechercher les informations les plus récentes sur les régularisations SIGREG et VICREG dans le contexte des modèles JEPA (Joint Embedding Predictive Architecture


## Régularisations dans les Modèles JEPA : VICReg, SIGReg et VISReg

### Contexte : le problème du *collapse* en SSL

Dans les architectures JEPA (Joint Embedding Predictive Architecture), l'entraînement en auto-supervision repose sur un prédicteur qui apprend à prédire des représentations latentes. Sans contrainte adéquate, le modèle peut converger vers une solution dégénérée où toutes les représentations se « collabent » vers un point constant — on parle de **representation collapse**. Les régularisations VICReg, SIGReg et VISReg ont été conçues pour prévenir ce phénomène, chacune avec une approche différente.

---

### 1. VICReg (Variance-Invariance-Covariance Regularization)

VICReg est une méthode de régularisation non-contrastive qui décompose la perte totale en trois termes distincts  :

| Terme | Rôle | Formulation |
|-------|------|-------------|
| **Variance** | Empêche le collapse en forçant l'écart-type de chaque dimension à rester proche d'une cible γ | $s(\mathbf{z}) = \frac{1}{d}\sum_{j=1}^{d}\max(0, \gamma - \sqrt{\text{var}_j(\mathbf{z})+\epsilon})$ |
| **Invariance** | Préserve la similarité entre les embeddings de vues augmentées de la même image | $i(\mathbf{z}, \mathbf{z}') = \|\mathbf{z} - \mathbf{z}'\|_2^2$ |
| **Covariance** | Décorrèle les dimensions pour éviter la redondance d'information | Matrice de covariance hors-diagonale |

**Limitation** : La régularisation de covariance ne capture que les **statistiques d'ordre 2**. Deux distributions peuvent avoir la même moyenne et covariance tout en étant très différentes — elle ne peut donc pas forcer la forme distributionnelle complète de l'espace latent .

---

### 2. SIGReg (Sketched Isotropic Gaussian Regularization)

Introduit dans **LeJEPA** (Balestriero & LeCun, 2025), SIGReg part du constat théorique que la **distribution optimale des embeddings est une gaussienne isotrope** .

**Principe** : Aligner la distribution des embeddings avec une gaussienne isotrope cible en utilisant :
- Le **test d'Epps-Pulley** pour comparer la fonction caractéristique empirique des embeddings avec la fonction cumulative cible
- Le **théorème de Cramér-Wold** pour réduire la vérification en dimension D à des projections 1D

**Avantages** : Contrôle distributionnel direct, complexité linéaire $\mathcal{O}(D)$.

**Limitations critiques**  :
1. Le gradient du test d'Epps-Pulley **diminue lors du collapse** — exactement quand le signal correctif est le plus nécessaire
2. Ne découple pas l'échelle (scale) de la forme (shape) de la distribution

---

### 3. VISReg (Variance-Invariance-Sketching Regularization)

VISReg est une méthode récente (2025) qui cherche à combiner les forces de VICReg et SIGReg tout en corrigeant leurs faiblesses .

**Architecture de la perte** :

$$\mathcal{L}_{VISReg} = \underbrace{\mathcal{L}_{scale}}_{\text{variance}} + \underbrace{\mathcal{L}_{shape}}_{\text{sketching}} + \mathcal{L}_{invariance}$$

- **Scale** : conserve le terme de variance de VICReg pour contrôler l'échelle
- **Shape** : remplace la covariance par un objectif de *sketching* basé sur la **distance de Wasserstein tranchée (SWD)**, alignant la distribution vers une gaussienne isotrope
- **Invariance** : MSE entre embeddings de vues augmentées

**Avantages** :
- Gradient **robuste contre le collapse** (contrairement à SIGReg)
- Contrôle distributionnel complet (au-delà des statistiques d'ordre 2)
- Découplage scale/shape pour plus de flexibilité
- Complexité linéaire $\mathcal{O}(NDK)$ où K est le nombre de tranches

---

### 4. Autres méthodes connexes

| Méthode | Principe | Contexte |
|---------|----------|----------|
| **Barlow Twins** | Minimisation de la redondance dans la matrice de corrélation croisée | SSL non-contrastif pré-VICReg |
| **W-MSE** | Projection sur la sphère unitaire + blanchiment | Régularisation géométrique |
| **KerJEPA** | MMD (Maximum Mean Discrepancy) pour estimer la régularisation sur des projections infinies | Complexité $\mathcal{O}(N^2)$ |
| **RDMReg** (LpJEPA) | Rectified Distribution Matching — enforce la parcimonie des embeddings | Approche contemporaine |

---

### Synthèse comparative

| Critère | VICReg | SIGReg | VISReg |
|---------|--------|--------|--------|
| **Contrôle distributionnel** | Ordre 2 seulement | Complet (gaussienne) | Complet (OT) |
| **Gradient anti-collapse** | Fort | Faible (s'évanouit) | Fort |
| **Découplage scale/shape** | Non | Non | Oui |
| **Complexité** | $\mathcal{O}(ND^2)$ | $\mathcal{O}(ND)$ | $\mathcal{O}(NDK)$ |
| **Heuristiques** | Aucune | Aucune | Aucune |
| **Généralisation OOD** | Bonne | Bonne | **Meilleure** |

En pratique, VISReg semble actuellement la solution la plus aboutie pour l'entraînement stable et scalable des JEPA, notamment grâce à sa résilience sur des données de qualité variable et sa meilleure généralisation hors distribution .
