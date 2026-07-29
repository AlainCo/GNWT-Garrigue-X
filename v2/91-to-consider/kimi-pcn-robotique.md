User: Peux tu de décrire techniquement les Predictive Coding Networks (PCN) ? Je m'intéresse à construire un système robotique intelligente sur base Jepa, mais inspiré aussi par les travaux de Friston, PP/AI/FEP et je me demande si on pourrait utiliser les PCN.
Kimi: Les **Predictive Coding Networks (PCN)** constituent une famille d'architectures neuronales profondément ancrées dans le **Free Energy Principle (FEP)** de Karl Friston et le cadre de la **Predictive Processing (PP)**. Elles représentent une alternative fondamentale aux réseaux feedforward classiques en inversant la logique de l'inférence : au lieu de propager des activations vers l'avant pour produire une sortie, les PCN propagent des **erreurs de prédiction** vers l'arrière pour mettre à jour des représentations internes. Voici une description technique détaillée, suivie d'une analyse de leur compatibilité avec JEPA et la robotique.

---

## 1. Architecture et mécanismes fondamentaux

### 1.1 Principe de base : minimisation de l'erreur de prédiction

Dans un PCN hiérarchique, chaque couche $l$ maintient un vecteur de représentation $\mu^{(l)}$ (les "causes" ou états cachés) qui génère une prédiction descendante $\hat{\mu}^{(l-1)} = f(\mu^{(l)}; \theta^{(l)})$ pour la couche inférieure. L'objectif est de minimiser l'**erreur de prédiction** (prediction error, PE) à chaque niveau :

$$\varepsilon^{(l)} = \mu^{(l)} - \hat{\mu}^{(l)} = \mu^{(l)} - f(\mu^{(l+1)}; \theta^{(l+1)})$$

Cette erreur est pondérée par une **précision** (inverse de la variance) $\pi^{(l)}$, reflétant l'incertitude associée à chaque niveau. La fonction de coût globale est l'énergie libre variationnelle (ou une approximation quadratique) :

$$F = \sum_l \frac{1}{2} (\varepsilon^{(l)})^T \Pi^{(l)} \varepsilon^{(l)} + \frac{1}{2} \|\mu^{(l)} - \mu_{prior}^{(l)}\|^2_{\Pi_{prior}}$$

### 1.2 Dynamique d'inférence : relaxation neuronale

Contrairement au forward pass unique d'un réseau classique, l'inférence dans un PCN est un **processus dynamique itératif** :

1. **Initialisation** : les activations $\mu^{(l)}$ sont initialisées (souvent par feedforward rapide).
2. **Propagation descendante** : les couches supérieures envoient des prédictions aux couches inférieures.
3. **Calcul des erreurs locales** : chaque couche calcule $\varepsilon^{(l)} = \mu^{(l)} - \hat{\mu}^{(l)}$.
4. **Mise à jour des activations** : les représentations sont ajustées via descente de gradient sur $F$ :
   $$\Delta \mu^{(l)} \propto -\frac{\partial F}{\partial \mu^{(l)}} = \varepsilon^{(l)} - \frac{\partial f}{\partial \mu^{(l)}} \varepsilon^{(l-1)}$$
5. **Itération** : les étapes 2-4 sont répétées jusqu'à convergence (point fixe où les erreurs sont minimisées).

Ce processus est **local et parallèle** : chaque neurone ajuste son activité pour réduire son erreur de prédiction, sans supervision globale.

### 1.3 Apprentissage des poids : Hebbian-like et bio-plausible

L'apprentissage des poids synaptiques $\theta$ suit une règle de **descente de gradient sur l'énergie libre**, qui se réduit à une forme de **règle de Hebb** modifiée** :

$$\Delta \theta^{(l)} \propto -\frac{\partial F}{\partial \theta^{(l)}} = \varepsilon^{(l-1)} \cdot \left(\frac{\partial \hat{\mu}^{(l-1)}}{\partial \theta^{(l)}}\right)^T$$

Dans sa forme la plus simple (prédicteurs linéaires), cela donne $\Delta W \propto \varepsilon^{(l-1)} \cdot \mu^{(l)}$, c'est-à-dire que la mise à jour dépend du produit de l'erreur de prédiction (signal d'erreur) et de l'activité de la couche supérieure (prédicteur). C'est bio-plausible car il ne nécessite que des signaux locaux.

### 1.4 Précision et attention

Un aspect technique crucial souvent négligé est l'**apprentissage de la précision** $\pi^{(l)}$. Dans le FEP, la précision modèle la confiance relative des signaux sensoriels versus les attentes descendantes. Un PCN complet apprend donc non seulement *quoi* prédire, mais aussi *à quel point* il faut faire confiance aux prédictions versus aux observations. Cela équivaut à une forme d'**attention bayésienne** :

- Haute précision sur l'entrée $\rightarrow$ le système se fie aux données sensorielles.
- Haute précision sur la prédiction $\rightarrow$ le système se fie au modèle interne (hallucination contrôlée).

---

## 2. Lien avec Friston, FEP et Active Inference

### 2.1 PCN comme implémentation du FEP

Les PCN sont la réalisation computationnelle la plus directe du **Free Energy Principle** pour l'inférence perceptuelle :

- **Minimisation de l'énergie libre** : les dynamiques de $\mu$ minimisent $F$, qui majore la surprise (negative log-evidence) du modèle génératif.
- **Inférence variationnelle** : les activités $\mu$ agissent comme des paramètres variationnels approchant la vraie posterior $p(s|o)$ sur les états cachés $s$ étant donné les observations $o$.
- **Dualité action-perception** : dans le cadre de l'**Active Inference**, les actions sont sélectionnées pour minimiser l'erreur de prédiction *futur* (ou l'énergie libre attendue), ce qui fait du PCN un candidat naturel pour l'embodiment.

### 2.2 Predictive Processing (PP)

La PP de Clark et Friston postule que le cerveau est essentiellement une machine de prédiction. Les PCN matérialisent cela :
- **Unification des processus** : perception, attention, imagination, et même l'action partagent le même mécanisme (minimisation d'erreur).
- **Top-down dominance** : la cognition est pilotée par les attentes (priors), avec les données sensorielles servant principalement à corriger les prédictions erronées.

---

## 3. Comparaison avec JEPA et potentiel de fusion

### 3.1 JEPA : Joint Embedding Predictive Architecture

JEPA (LeCun, 2022) est une architecture d'apprentissage autosupervisé qui apprend des représentations en prédisant des **embeddings latents** plutôt que des pixels bruts :

- **Encodeur** $E_x$ : transforme une observation $x$ en représentation $s_x = E_x(x)$.
- **Prédicteur** $P$ : prédit la représentation d'une cible $s_y$ à partir d'un contexte $s_x$ et d'une action/condition $a$ : $\hat{s}_y = P(s_x, a)$.
- **Apprentissage** : minimise la distance $\|\hat{s}_y - s_y\|$ dans l'espace latent (souvent via VICReg, BYOL, ou stop-gradient).

### 3.2 Différences structurelles clés

| Aspect | PCN (Friston) | JEPA (LeCun) |
|--------|---------------|--------------|
| **Objectif** | Minimisation d'énergie libre | Prédiction dans l'espace latent |
| **Inférence** | Itérative, dynamique, relaxation | Feedforward (ou récurrent limité) |
| **Hiérarchie** | Multi-couche avec PE explicite | Généralement encodeur-prédicteur |
| **Bio-plausibilité** | Forte (Hebb, local) | Faible (backprop globale) |
| **Action** | Intégrée via Active Inference | Souvent séparée (planification) |
| **Incertitude** | Explicite (précision) | Souvent implicite |

### 3.3 Complémentarité et fusion possible

Votre intuition de combiner JEPA et PCN est **très pertinente** et correspond à une direction de recherche émergente. Voici comment les deux pourraient s'intégrer :

#### A. PCN comme moteur d'inférence pour JEPA
Utiliser la dynamique de relaxation des PCN **à l'intérieur** de l'architecture JEPA :
- Le prédicteur JEPA devient un réseau de prédiction descendante dans un PCN.
- Au lieu d'un forward pass unique pour prédire $\hat{s}_y$, on initialise $\hat{s}_y$ et on le relaxe via minimisation d'erreur de prédiction, permettant au système de "réfléchir" ou de compléter des informations manquantes.
- Cela rend le prédicteur **itératif et robuste au bruit**, capable de gérer l'ambiguïté.

#### B. JEPA comme pré-encodeur pour un PCN hiérarchique
- Les encodeurs JEPA (entraînés sur des tâches autosupervisées massives) fournissent des représentations latentes de haut niveau, riches et disentanglées.
- Un PCN hiérarchique opère ensuite sur ces embeddings pour la **planification et le contrôle**, en utilisant la dynamique d'Active Inference pour sélectionner des actions minimisant l'erreur de prédiction future.

#### C. Architecture unifiée : "Predictive JEPA" ou "Active JEPA"
Une architecture robotique complète pourrait ressembler à ceci :

```
┌─────────────────────────────────────────────────────────────┐
│                    HIÉRARCHIE PCN                            │
│  Niveau abstrait (intentions, plans)                         │
│       ↓ prédiction descendante + erreur ↑                    │
│  Niveau intermédiaire (objets, relations spatiales)          │
│       ↓ prédiction descendante + erreur ↑                    │
│  Niveau perceptuel (embeddings JEPA)                         │
│       ↓ prédiction descendante + erreur ↑                    │
│  Niveau sensorimoteur (proprioception, vision brute)       │
└─────────────────────────────────────────────────────────────┘
         ↑
    Encodeurs JEPA (entraînés offline sur données non étiquetées)
         ↑
    Flux sensoriels (caméras, lidar, encoders moteurs)
```

Dans cette architecture :
- **JEPA** fournit les représentations de base (ce que LeCun appelle le "world model" de niveau 1).
- **PCN** fournit le mécanisme d'inférence, d'attention (via la précision), et de planification (via Active Inference).

---

## 4. Applications robotiques spécifiques

### 4.1 Avantages pour la robotique

1. **Robustesse au bruit sensoriel** : la précision adaptative permet au robot d'ignorer des capteurs défaillants ou bruyants et de se fier à son modèle interne quand c'est approprié.
2. **Inférence sous contraintes partielles** : comme les PCN relaxent vers un point fixe, ils peuvent compléter des informations manquantes (occlusion, capteur défectueux) via les priors descendants.
3. **Action-perception unifiée** : via Active Inference, la planification et le contrôle moteur émergent naturellement de la même minimisation d'erreur que la perception. Pas besoin de modules séparés pour la planification.
4. **Apprentissage continu et local** : les mises à jour Hebb-like permettent un apprentissage en ligne, potentiellement sur du hardware neuromorphique.
5. **Explicabilité** : l'erreur de prédiction est une métrique interprétable de la "surprise" du robot. Une erreur élevée = anomalie ou situation nouvelle.

### 4.2 Défis pratiques majeurs

1. **Convergence lente** : la relaxation itérative est coûteuse en temps de calcul comparée au feedforward. Pour la robotique temps réel, il faut des approximations (few-step inference, amortized inference).
2. **Stabilité dynamique** : les PCN sont des systèmes dynamiques couplés. La convergence n'est pas garantie sans contraintes sur les poids (contraction mapping, inhibitions latérales).
3. **Entraînement difficile** : l'apprentissage des poids dans les PCN profonds est moins mature que le backprop standard. Des techniques comme l'Equilibrium Propagation (Scellier & Bengio) ou la Contrastive Hebbian Learning sont prometteuses mais moins robustes.
4. **Échelle** : les PCN ont surtout été démontrés sur des tâches simples (MNIST, petits environnements). Passer à l'échelle robotique reste un défi ouvert.
5. **Précision et métacognition** : l'apprentissage de la précision est instable et peu exploré dans les implémentations modernes.

---

## 5. Implémentations et ressources techniques

Si vous souhaitez prototyper, voici les pistes techniques :

- **Rao & Ballard (1999)** : l'article fondateur sur les PCN pour la vision hiérarchique.
- **Friston (2005, 2008)** : formalisation du FEP avec les équations de dynamique neuronale.
- **Bogacz (2017)** : tutoriel excellent sur les PCN, prouvant l'équivalence avec le backprop sous certaines conditions.
- **Millidge et al. (2020+)** : travaux sur la combinaison PCN + deep learning, et l'application à l'Active Inference.
- **Rosenbaum et al. (2022)** : "Deep Active Inference" pour le contrôle robotique.
- **Ororbia & Kifer (2022)** : "The Neural Coding Framework" qui connecte PCN et apprentissage par renforcement.

Pour l'intégration JEPA :
- Le **prédicteur JEPA** peut être vu comme la couche descendante d'un PCN.
- Le **stop-gradient** de JEPA correspond à la séparation entre phases d'inférence (fixer les cibles) et d'apprentissage (ajuster les prédictions), conceptuellement proche de la dichotomie "perception vs learning" des PCN.

---

## 6. Recommandation pour votre système

Étant donné votre objectif (robotique intelligente, JEPA + FEP), je suggère une approche **hybride pragmatique** :

**Phase 1** : Utilisez JEPA pour l'apprentissage de représentations visuelles/proprioceptives de haut niveau (c'est ce qui fonctionne aujourd'hui à l'échelle).

**Phase 2** : Implémentez un PCN comme couche de **planification et contrôle** opérant sur les embeddings JEPA. Utilisez Active Inference pour la sélection d'actions :
- Définissez un prior préféré sur les états futurs (objectif robotique).
- Le robot choisit l'action qui minimise l'erreur de prédiction entre l'état prédit et l'état préféré.

**Phase 3** : Intégrez l'apprentissage de la précision pour que le robot puisse moduler son comportement entre exploration (haute précision sensorielle, faible confiance dans le modèle) et exploitation (faible précision sensorielle, forte confiance dans les prédictions).

Cette approche combine le **meilleur des deux mondes** : l'efficacité représentationnelle de JEPA et la richesse inférentielle/bio-plausible des PCN/FEP.

Souhaitez-vous que j'approfondisse un aspect particulier (par exemple, les équations d'Active Inference pour la planification, ou les architectures neuromorphiques pour l'implémentation) ?
