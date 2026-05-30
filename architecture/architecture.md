## Architecture Cible Générale : Exemple du GAN 2040



```mermaid
flowchart TD
    direction TB

    Bas["Niveaux Bas (N=0 à N=3)\nDonnées brutes + RPT locale"] 
    -->|"Résumé d'Ignition\n(Compressé, Abstrait)"| Haut["Niveaux Hauts (N=4 à N=6)\nGNWT + Conscience d'accès"]

    Haut -->|"Prédictions (top-down) + Contraintes\n(Objectifs, Règles, Contextes)"| Bas

    style Bas fill:#ffebee
    style Haut fill:#e3f2fd
```

**Principe fondamental :** Chaque frontière verticale est une **Couverture de Markov**. N+1 est aveugle aux états internes de N. Le broadcast GNWT est *intra-niveau* ; la communication *inter-niveau* est uniquement via les résumés d'ignition compressés.

Cette pile décrit l'infrastructure cognitive du Groupe Aéronaval (GAN) en **2040**. Les informations transitent de bas en haut sous forme de **Résumés d'Ignition Compressés** (vecteurs latents abstraits, pas de données brutes), et de haut en bas sous forme de **Prédictions (top-down)** et pas de simples **Priors Contextuels** (contraintes sur les espaces de représentation des niveaux inférieurs).
Les flux descendants ne sont plus de simples contraintes : ce sont des **prédictions actives** générées par le JEPA du niveau supérieur. Le niveau inférieur compare sa réalité à cette prédiction ; si l’écart (surprise) dépasse un seuil adaptatif (fonction du budget attentionnel et de la confiance du Self‑Model), une ignition GNWT est déclenchée. En dessous du seuil, l’écart est résorbé par une mise à jour locale des latents (RPT). Ce mécanisme réalise une inférence active hiérarchique, fondement de la conscience d’accès fonctionnelle.

Chaque niveau conscient intègre également un Self-Model (métacognition), un Attention Scheduler (budget attentionnel) et, en phase de sommeil, un Φ-estimator (intégration causale) – voir dans les sections [Concepts Clés et Fondements Théoriques](../concepts/concepts.md).

```mermaid
flowchart LR
    N5["N=5 : Groupe"] -->|"Prédiction du résumé attendu"| N4["N=4 : Rafale"]
    N4 -->|"Ignition si erreur ≥ seuil"| N5
```

```mermaid
flowchart TD
    subgraph N0to3 ["Niveaux Infra-Conscients (RPT Locale)"]
        N0["N=0 : Composant Physique\n(MLP nano + PID)"] 
        N1["N=1 : Actionneur Intelligent\n(Mamba-mini)"]
        N2["N=2 : Équipement\n(Mamba / RWKV)"]
        N3["N=3 : Sous-système Fonctionnel\n(JEPA-S + RPT locale)"]
    end

    subgraph N4to6 ["Niveaux Conscients (GNWT + Ignition)"]
        N4["N=4 : Plateforme / Vecteur\n(JEPA-M + Workspace GNWT)"]
        N5["N=5 : Groupe Aéronaval\n(JEPA-L + Officiers)"]
        N6["N=6 : Théâtre / État-Major\n(LLM-XL + RAG)"]
    end

    N0 --> N1 --> N2 --> N3
    N3 -->|"Résumé d'Ignition\n(si erreur ≥ seuil)"| N4
    N4 -->|"Résumé d'Ignition\n(si erreur ≥ seuil)"| N5
    N5 -->|"Résumé d'Ignition\n(si erreur ≥ seuil)"| N6

    N6 -->|"Prédictions (top‑down)"| N5
    N5 -->|"Prédictions (top‑down)"| N4
    N4 -->|"Prédictions (top‑down)"| N3
```

### Conscience par niveau : ce qu'on peut attendre

| Niveau | Vie intérieure (RPT) | Conscience d'accès (GNWT) | Peut "rapporter" |
|---|---|---|---|
| N=0-1 | Non | Non | Non |
| N=2 | Minimale (état caché SSM) | Non | Non |
| N=3 | Oui (boucles feedback locales) | Non | Vers N=4 uniquement |
| N=4-5 | Oui, riche | Oui (ignition + broadcast) | Oui, à son niveau |
| N=6 | Oui, narratif | Oui, stratégique | Oui, dialogue humain |

---

### Les Officiers de la Passerelle (N=5) : organisation sociale-cognitive

Le niveau N=5 n'est pas un module monolithique mais une **équipe d'instances spécialisées** partageant un workspace commun (le workspace du groupe) via des résumés d'ignition, sans partager leurs espaces latents internes.

Chaque niveau conscient (N≥4) inclut un Self-Model (MLP) qui génère un méta-vecteur pour chaque ignition, assurant la métacognition et l’explicabilité.

```mermaid
flowchart TD
    Capitaine["CAPITAINE\n(Méta-Workspace + Narrative)"] 

    subgraph Officiers ["Officiers Spécialisés"]
        Science["SCIENCE\n(Systemizing)"]
        Soin["SOIN\n(Empathique)"]
        Ingenieur["INGÉNIEUR\n(Consciencieux)"]
        Tactique["TACTIQUE\n(Persévérant)"]
        Rens["RENS\n(Explorateur)"]
    end

    subgraph Meta ["Métacognition"]
        SM["Self-Model\n(MLP)"]
    end

    Capitaine <--> Science
    Capitaine <--> Soin
    Capitaine <--> Ingenieur
    Capitaine <--> Tactique
    Capitaine <--> Rens
    Capitaine <--> SM

    SM -->|"méta-vecteurs"| MeMo
```

Chaque niveau N≥4 est équipé d’un Attention Scheduler qui alloue un budget attentionnel global. Les ignitions consomment des tokens ; à budget insuffisant, elles sont différées ou inhibées. Le scheduler ajuste dynamiquement le seuil de saillance pour garantir la réactivité en environnement saturé.

```mermaid
flowchart TD
    subgraph Workspace ["Workspace GNWT (N=5)"]
        Sched["Attention Scheduler\n(budget 100, +1/s)"]
        Capitaine["CAPITAINE"]
        Officiers["Officiers\n(Tactique, Rens, etc.)"]
    end

    SousN4["Résumés d’Ignition (N=4)"] --> Sched
    Sched -->|"ignitions filtrées"| Capitaine
    Capitaine --> Officiers
```

Pendant la phase de sommeil, un estimateur Φ̂ (proxy de l’intégration causale) est calculé périodiquement à partir des résumés d’ignition stockés. Une chute de Φ̂ indique un risque de désintégration fonctionnelle et déclenche des mécanismes correctifs (recalibration, rêverie enrichie).

```mermaid
flowchart TD
    subgraph N5 ["N=5 : Groupe (Officiers + JEPA-L)"]
        V5["Validation du Résumé\n• Vérification variance\n• Détection collapse\n• Score d'incertitude"]
        PHI["Φ-estimator\n(actif pendant sommeil)"]
    end

    V5 --> PHI
    PHI -.->|"alerte si Φ̂ < seuil"| Actions["Actions correctives\n(rêverie ciblée)"]
```


**Règle de communication :** Un officier ne transmet au workspace commun que ce qui a franchi son seuil d'ignition personnel. Comme une équipe de vieux professionnels qui se connaissent, s'estiment, et savent se tenir — ils ne parlent pas à chaque micro-événement, ils parlent quand ça compte.

**Score d'incertitude épistémique :** Chaque résumé d'ignition porte un score de confiance. Un officier qui opère hors de son domaine de compétence pénalise automatiquement son score de saillance. Le capitaine intègre ce signal dans l'arbitrage — pas pour ignorer, mais pour pondérer.

---

### Scénario de Panne en Combat :

```mermaid
flowchart TD
    A["N=0/1 : Tuyère endommagée\n(PID + MLP nano)"] 
    --> B["N=2/3 : Détection & RPT Locale\n(Mamba)"]

    B -->|"Latent interne mis à jour"| C["N=4 : Rafale\n(Workspace GNWT)"]

    subgraph Comparateur ["Comparateur de surprise (N=4)"]
        D1["Prédiction reçue de N=5\n(état nominal)"]
        D2["Ignition réelle\n(dégradée)"]
        D3["Erreur = |réel - prédiction|\n= 0.73"]
        D4{Erreur ≥ seuil ?}
    end

    D3 --> D4
    D4 -->|oui| E["Ignition GNWT déclenchée"]
    D4 -->|non| F["Ajustement local RPT\n(sans broadcast)"]

    E --> G["Reconfiguration loi de vol\n+ MeMo consultation"]
    G -->|"Résumé d'Ignition compressé"| H["N=5 : Groupe\n(Officier Tactique)"]
    H --> I["CAPITAINE arbitre\n+ Broadcast au groupe"]
    I --> J["N=6 : Amiral\n(Traduction LLM)"]
```

**1. N=0/N=1 :** Un éclat de missile endommage la tuyère droite. Le PID augmenté par MLP nano modifie instantanément les angles d'injection en **4 millisecondes** pour éviter l'extinction du moteur. Aucun signal ne remonte — c'est géré localement, en dessous du seuil RPT.

**2. N=2/N=3 :** Le modèle Mamba du moteur enregistre une anomalie croissante. Ses boucles RPT locales tournent, tentent de consolider une évaluation. Après stabilisation, elles génèrent un **Résumé d'Ignition vectoriel** : *[anomalie_propulsion | sévérité=0.73 | type=asymétrie_poussée | workaround_disponible=true]*. Pas de dump de données brutes — un vecteur sémantique compressé.

**3. N=4 – Comparaison prédiction/réalité** :  
Le Rafale reçoit du niveau supérieur (N=5) une **prédiction** de son état attendu (ex. `[état_nominal, poussée=1.0]`). Parallèlement, ses boucles RPT locales produisent une **ignition réelle** `[dégradé, asymétrie=0.73]`. Le comparateur calcule l’erreur (0,73). Comme cette erreur dépasse le seuil dynamique (ex. 0,5), une **ignition GNWT** est déclenchée. Si l’erreur avait été inférieure au seuil, l’écart aurait été résorbé localement (mise à jour du latent RPT) sans broadcast.


**4. N=5/N=6 :** L'officier TACTIQUE du groupe capte l'ignition de Leader-3 en premier (c'est dans son domaine de saillance). Il propose une reconfiguration du schéma de brouillage des frégates. Le CAPITAINE arbite et broadcast la décision au groupe. Le LLM N=6 traduit pour l'amiral : *"Leader-3 maintient sa mission avec une capacité d'évasion réduite de 20%. Réorganisation du schéma de brouillage des frégates pour le couvrir. Durée de la fenêtre de mission réduite à T+15min."* (la prédiction de N=5 est mise à jour via apprentissage)


## 🔧 Contraintes Latentes Structurelles (Anti-Collapse)



```mermaid
flowchart LR
    subgraph N3 ["N=3 : Sous-système (RPT + JEPA-S)"]
        L3["Latent Interne\n(128–256d)\n• RPT locale\n• JEPA-S\n• Régularisation isotrope\n(SIGReg / VICReg)"]
    end

    subgraph N4 ["N=4 : Plateforme (JEPA-M + GNWT)"]
        C4["Tête de Compression\n(16–64d)\n• Normalisation\n• Contrôle de norme\n• Quantification optionnelle"]
        L4["Résumé d'Ignition\n(16–64d)\n• Score d'incertitude\n• Signal de saillance"]
    end

    subgraph N5 ["N=5 : Groupe (Officiers + JEPA-L)"]
        V5["Validation du Latent\n• Vérification variance\n• Détection collapse\n• Demande d'Ignition enrichi"]
    end

    L3 -->|"Compression"| C4 --> L4 -->|"Transmission"| V5

    V5 -.->|"Fallback :\nIgnition enrichi"| L3

    classDef latent fill:#e3f2fd,stroke:#1976d2,stroke-width:2px
    classDef comp fill:#fff3e0,stroke:#f57f17,stroke-width:2px
    classDef val fill:#e8f5e9,stroke:#43a047,stroke-width:2px

    class L3 latent
    class C4 comp
    class L4 comp
    class V5 val
```
Les niveaux N=2 à N=5 échangent des **vecteurs latents compressés** (RPT interne, JEPA prédictif, Résumés d’Ignition). Pour garantir la stabilité de ces flux dans une architecture hiérarchique, trois contraintes structurelles sont imposées :

```mermaid
flowchart TD

    %% --- N3 : Latent interne ---
    subgraph N3 ["N=3 : Sous-système (RPT + JEPA-S)"]
        L3["Latent interne (128–256d)\n• Régularisation isotrope (SIGReg)\n• Variance contrôlée\n• RPT locale"]
        V3["Analyse Variance\nVar(z3) > seuil_min ?"]
        S3["Calcul Saillance\ns = f(z3, erreur prédictive)"]
    end

    %% --- N4 : Compression + Seuil d'Ignition ---
    subgraph N4 ["N=4 : Plateforme (JEPA-M + GNWT)"]
        T4["Tête de Compression (16–64d)\n• Normalisation\n• Contrôle de norme\n• Quantification optionnelle"]
        Th4["Seuil d'Ignition\ns > seuil_dyn ?"]
        I4["Ignition\nRésumé latent + score d'incertitude"]
    end

    %% --- N5 : Validation + Fallback ---
    subgraph N5 ["N=5 : Groupe (Officiers + JEPA-L)"]
        V5["Validation du Résumé\n• Vérification variance\n• Détection collapse\n• Score d'incertitude"]
        F5["Fallback :\nDemande d'Ignition enrichi"]
    end

    %% --- Flux ---
    L3 --> V3 --> S3 --> T4 --> Th4 --> I4 --> V5
    V5 -.->|"Ignition enrichi"| L3

    %% --- Styles ---
    classDef latent fill:#e3f2fd,stroke:#1976d2,stroke-width:2px
    classDef comp fill:#fff3e0,stroke:#f57f17,stroke-width:2px
    classDef ign fill:#ffe0b2,stroke:#ef6c00,stroke-width:2px
    classDef val fill:#e8f5e9,stroke:#43a047,stroke-width:2px

    class L3,V3,S3 latent
    class T4,Th4 comp
    class I4 ign
    class V5,F5 val
```

### 1. Latents internes régularisés (RPT / JEPA)

Chaque module maintient un espace latent **borné mais non dégénéré**.  
Sans contrainte, les modèles prédictifs (JEPA, SSMs) convergent vers un **representation collapse** : tous les inputs mappés vers un même vecteur.

Pour éviter cela, les latents internes sont régularisés via :

- **Isotropie gaussienne** (LeJEPA, SIGReg)  
- **Décorrélation** (VICReg / Barlow Twins)  
- **Normalisation stricte** (LayerNorm)  
- **Bruit gaussien léger** pour éviter les dimensions mortes

Ces mécanismes garantissent que chaque dimension porte une information utile et que les prédictions restent stables dans le temps.

---

### 2. Hiérarchie des tailles : interne > ignition

Pour éviter la perte d’information en cascade :

- latent interne RPT/JEPA : **128–256 dimensions**  
- résumé d’Ignition : **16–64 dimensions**

Le résumé d’Ignition est produit par une **tête de compression dédiée**, qui applique :

- normalisation  
- quantification optionnelle  
- contrôle de norme (||z|| ≈ constant)

Cela garantit une API statistique stable entre niveaux, même en conditions dégradées.

---

### 3. Prévention du “double collapse” multi-niveaux

Dans une architecture N=3→N=4→N=5, deux compressions successives peuvent entraîner un **double collapse** :

- collapse interne du JEPA/RPT  
- collapse du résumé d’Ignition

Pour éviter cela :

- chaque niveau vérifie la **variance par dimension** du latent reçu  
- un résumé d’Ignition trop pauvre déclenche un **signal d’incertitude**  
- le niveau supérieur peut demander un **Ignition enrichi** (fallback)

Ce mécanisme maintient la cohérence des flux latents à travers les couvertures de Markov.

---

### 4. Règles pratiques d’implémentation

- **Toujours régulariser les latents internes** (SIGReg ou équivalent)  
- **Toujours compresser via une tête dédiée** (pas de projection brute)  
- **Monitorer la “vie” du latent** (variance, corrélation, norme)  
- **Tester la valeur du latent** (prédiction de variables observables simples)  
- **Limiter la profondeur de compression** (éviter N=3→N=4→N=5→N=6 sans contrôle)

Ces contraintes assurent la stabilité de l’architecture GAN 2040 dans les scénarios de panne, de combat et de coopération distribuée.

