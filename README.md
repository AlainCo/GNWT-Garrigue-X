# GNWT-garigue-x



## Executive Summary

Ce document consolide l'ensemble des réflexions théoriques et des choix d'ingénierie concernant la conception d'un **Système de Systèmes (SoS) autonome, robuste aux dommages, capable d'apprentissage en continu et doté d'une proto-conscience fonctionnelle**.

Notre approche rejette délibérément le réductionnisme des architectures monolithiques de type "boîte noire" (LLM de bout en bout) au profit d'un **modèle fonctionnaliste distribué, bio-inspiré et invariant d'échelle**. Nous présentons ici les fondements théoriques de cette architecture, sa projection sur un cas d'usage militaire à l'horizon **2040** (le Groupe Aéronaval), et sa déclinaison en un projet de validation réel (MVP) exécutable en 12 mois.

L'architecture repose sur un principe central : **la conscience fonctionnelle d'accès n'est pas un phénomène monolithique, mais une propriété émergente à chaque niveau d'organisation suffisamment riche**, séparée des niveaux voisins par des frontières statistiques strictes (couvertures de Markov). Chaque niveau possède sa propre vie intérieure (RPT locale), et seul un sous-ensemble de ses états atteint le niveau supérieur sous forme de *résumé d'ignition*.

---

# MÉMORANDUM BOUTEILLE À LA MER

**À :** Quiconque est intéressé

**De :** Moi aka Harry Tuttle.

**Date :** 24 mai 2026

**Objet :** Architecture Cible pour Système de Systèmes (SoS) Cognitifs et Spécifications du Projet MVP *GARRIGUE-X*

**Classification :** Technique / Ouvert

**Avertissement :** C'est juste un travail avec quelques LLMs, suite à mes réflexions, imprégnées de diverses rencontres avec des théories et analyses, dans les domaines des IA, de la psychologie, de l'histoire théorique, et de l'actualité. Je ne suis qu'un plombier curieux. Comme on dit chez nous : "Make your due diligence !".

**Licence :** CC BY

**Type :** Bouteille à la mer / Loisir / Spéculation / Recherche de gens compétents

**Remerciements :** Merci à ChatGPT, Claude, Gemini, à Youtube et ses créateurs, au Collège de France, à Google, Wikipedia... J'en oublie.

[![Licence Creative Commons](https://licensebuttons.net/l/by/4.0/88x31.png)](http://creativecommons.org/licenses/by/4.0/)

Ce travail est mis à disposition selon les termes de la [Licence Creative Commons Attribution 4.0 International](http://creativecommons.org/licenses/by/4.0/).

---

## 1. Concepts Clés et Fondements Théoriques

Pour prouver la viabilité de cette architecture auprès de nos pairs, chaque décision d'ingénierie logicielle s'appuie sur des jalons majeurs de la littérature scientifique en neurosciences, IA et physique théorique.

### A. L'Indépendance Conditionnelle : Les Couvertures de Markov Imbriquées

**Fondement Théorique :** Judea Pearl (*Probabilistic Reasoning in Intelligent Systems*, 1988) pour les réseaux bayésiens ; Karl Friston (*Life as we know it*, 2013 ; *The Markov blankets of life*, 2018) pour la biologie théorique ; Kirchhoff, Parr et al. (*Nested Selves*, 2023) pour la généralisation aux systèmes collectifs.

**Le Concept :** La couverture de Markov désigne la membrane statistique séparant les états internes ($I$) d'un système des états externes ($E$) de son environnement. Elle est composée d'états sensoriels (entrées) et actifs (sorties). L'équation fondamentale d'indépendance s'écrit :

$$P(I \mid B, E) = P(I \mid B)$$

**Ce que la littérature récente ajoute :** Un collectif d'agents d'inférence active peut, s'il maintient une couverture de Markov au niveau du groupe, constituer un agent de niveau supérieur avec son propre modèle génératif. Cette propriété est *scale-free* : elle s'applique de la cellule à l'organisme, et de l'effecteur au groupe aéronaval. Les structures s'emboîtent comme des poupées russes.

**Justification Technique :** C'est le principe d'**anti-fusion d'identité**. Le niveau supérieur ($N+1$) ne traite jamais les données brutes de $N$ — seulement son API statistique (le *résumé d'ignition*). Ceci garantit la modularité stricte du composant jusqu'à la flotte complète, et préserve l'identité de chaque niveau comme entité cognitive propre. Un Rafale conscient est perçu par le groupe comme un objet externe opaque — exactement comme vous percevez votre foie comme "allant bien" sans accéder aux hépatocytes.

---

### B. La Conscience à Deux Étages : GNWT + RPT comme facettes d'un même mécanisme

**Fondement Théorique :** Bernard Baars (1988) et Stanislas Dehaene (*A neuronal network model of global workspace*, 2001) pour la *Global Neuronal Workspace Theory* (GNWT) ; Victor Lamme (2006, *Recurrent Processing Theory*, RPT) ; travaux d'intégration COGITATE (2023-2025).

**Le Concept :** Ces deux théories, souvent présentées comme concurrentes, décrivent en réalité **deux étages temporels d'un même processus** :

```
Stage 1-2 : Feedforward rapide     →  extraction brute, traitement non-conscient
Stage 3    : Récurrence LOCALE     →  [RPT] perception riche, non-rapportable
                                       "voir sans savoir qu'on voit"
Stage 4    : Ignition + BROADCAST  →  [GNWT] accès conscient, rapportable, intégré
                                       "savoir qu'on voit et pouvoir en parler"
```

La RPT décrit la **vie intérieure de chaque module** — ses boucles feedback locales qui raffinent le traitement avant de décider de remonter quoi que ce soit. La GNWT décrit ce qui survient quand le signal consolidé franchit un seuil de saillance et se propage à l'ensemble du workspace global.

**Conséquence architecturale critique :** Le seuil RPT→GNWT se situe à la frontière **N=3 → N=4** dans notre hiérarchie. En-dessous : les modules traitent en continu (RPT) sans broadcast global. À partir de N=4 : les modules ont un vrai workspace central, des ignitions, et peuvent "rapporter" leur état. Ce n'est pas une frontière arbitraire — c'est là que la complexité fonctionnelle justifie le coût computationnel du broadcast.

**Justification Technique :** Un réacteur d'avion résout ses micro-pannes en RPT locale (boucles Mamba). Si le dommage dépasse sa capacité de correction, il génère un **Résumé d'Ignition** vectoriel vers le haut. Le Rafale (N=4) capte ce signal dans son workspace central GNWT, reconfigure sa loi de vol globale, et l'information remonte à la flotte sous forme d'une contrainte opérationnelle — pas d'un dump brut de données moteur.

---

### C. La Prédiction Abstraite : Les Modèles du Monde Latents (JEPA)

**Fondement Théorique :** Yann LeCun (*A Path Towards Autonomous AI*, 2022) ; Danijar Hafner (*Mastering Diverse Domains through World Models — DreamerV3*, 2023).

**Le Concept :** Contrairement aux modèles génératifs pixel par pixel, la *Joint Embedding Predictive Architecture* (JEPA) apprend à prédire des **représentations abstraites** (vecteurs latents) du monde en ignorant le bruit inutile. Sa nature prédictive *always-on* permet un monitoring sémantique continu — le modèle maintient un flux sémantique permanent qui n'est "verbalisé" que lors d'une ignition.

**Pourquoi JEPA plutôt qu'un LLM pour le workspace global :** Un LLM est passif, réactif, dépendant du token. Il n'a pas de cycle temporel propre. JEPA opère dans un espace latent compact, prédit dans l'espace des représentations (pas dans l'espace pixel/token), peut tourner en continu, et s'auto-supervise — il apprend donc en continu sans annotations. C'est structurellement plus proche d'un thalamus que d'un cortex préfrontal verbal. **Le LLM est l'interface de sortie, pas le workspace.**

**Justification Technique :** C'est le moteur de la **rêverie artificielle** (*Generative Replay*). Le système simule des millions de trajectoires tactiques ou de configurations de pannes directement dans son imagination latente pendant ses phases de repos, éliminant l'usure mécanique et le risque de crash en apprentissage réel.

---

### D. Les Architectures Légères pour le Temps Réel : SSMs (Mamba, RWKV, xLSTM)

**Fondement Théorique :** Gu & Dao (*Mamba: Linear-Time Sequence Modeling*, 2023) ; Peng et al. (*RWKV*, 2023) ; Beck et al. (*xLSTM*, 2024).

**Le Concept :** Les *State Space Models* (SSMs) offrent une alternative aux Transformers pour les couches basses (N=0 à N=3), avec des propriétés cruciales pour l'embarqué :

| Architecture | Avantage clé | Usage cible dans le SoS |
|---|---|---|
| **MLP nano + PID** | µs, déterministe, FPGA | N=0 : boucle de contrôle physique |
| **Mamba-mini** | linéaire en séquence, faible RAM | N=1 : actionneurs intelligents |
| **Mamba / RWKV** | 5× throughput vs Transformer, continu | N=2-3 : sous-systèmes, perception |
| **JEPA-S** | prédiction latente, RPT local | N=3 : début de vie intérieure |
| **JEPA-M/L + GNWT** | workspace, ignition, broadcast | N=4-5 : conscience de plateforme |
| **JEPA-XL + LLM** | narratif, stratégique, multimodal | N=5-6 : commandement, dialogue amiral |

**Justification Technique :** Mamba démontre des signaux de contrôle plus lisses et physiquement plausibles que les Transformers (qui peuvent produire des discontinuités dans les signaux de contrôle). Pour les couches N=1 à N=3, c'est exactement ce qu'il faut : un traitement fluide, continu, réactif, sans le coût quadratique de l'attention.

---

### E. La Psychopathologie Computationnelle et Profils Fonctionnels

**Fondement Théorique :** Karl Friston, Paul Fletcher (*Computational Psychiatry*, 2016) ; Costa & McCrae (1992, modèle OCEAN) ; Baron-Cohen (*The Empathizing-Systemizing Theory*, 2002) ; David et al. (*Dark Triad*, mécanismes neuraux, 2024).

**Le Concept :** Les traits de personnalité sont modélisés comme des **ajustements d'hyperparamètres** dans le traitement des probabilités d'erreur. Ce ne sont pas des "modes" qu'on active, mais des biais structurels dans les fonctions de saillance et les seuils d'ignition.

**Profils d'officiers et leur base neuroscientifique :**

| Rôle | Trait dominant | Mécanisme | Domaine d'ignition privilégié |
|---|---|---|---|
| **Science / Analyse** | Ouverture + TSA-Systemizing | Connectivité locale forte, faible longue portée | Anomalies, incohérences logiques, signaux faibles |
| **Soin / Équipage** | Agréabilité haute, insula/ACC actif | Ocytocine, circuits d'empathie | États internes humains, éthique, cohésion |
| **Ingénieur** | Conscienciosité très haute | PFC fort, contrôle inhibiteur, faible impulsivité | Pannes, dérives systèmes, qualité d'exécution |
| **Tactique** | Persévérant + Dark Triad modéré | Mémoire des échecs, faible traitement peur | Menaces, vulnérabilités, fenêtres d'action |
| **Renseignement** | Ouverture + faible agréabilité | Dopamine exploratoire, détection d'incohérence | Patterns adverses, déception, asymétrie d'information |
| **Capitaine** | Extraversion + Névrosisme situationnel | DA reward, flexibilité PFC, arbitrage | Crises, opportunités, narrative globale de mission |

**Anti-fusion par profil :** Les espaces latents de chaque officier sont **non partagés**. Ils échangent uniquement des *résumés d'ignition* via le canal de commandement. La mémoire épisodique propre à chaque officier est son identité — c'est ce qui est préservé, comme chez les jumeaux craniopages qui maintiennent des volontés distinctes malgré des circuits partiellement partagés.

**Justification Technique :** L'autisme computationnel (surpondération de la précision sensorielle face aux attentes contextuelles) est injecté dans les couches radar basses (N=3) pour isoler les signaux faibles sans biais contextuel. Les traits Dark Triad fonctionnels : le Machiavélisme dans les algorithmes de déception cyber (théorie des jeux), la Psychopathie fonctionnelle dans la vitesse d'exécution des effecteurs de tir (N=4) — froide, non-empathique, mais contrainte constitutionnellement.

---

### F. L'Exploration par la Curiosité et l'Apprentissage par le Jeu

**Fondement Théorique :** Jürgen Schmidhuber (*Formal Theory of Creativity, Fun, and Happiness*, 2010) ; Pierre-Yves Oudeyer (*Intrinsic Motivation Systems for Autonomous Learning*, 2007) ; travaux sur *Learning Progress* (LP-driven curiosity, Forestier et al., 2022).

**Le Concept :** La curiosité est une **fonction de récompense intrinsèque** basée sur le gain d'information (réduction de l'entropie prédictive). L'agent est récompensé quand il explore des zones où son modèle du monde est encore imprécis — ni trop simples (ennuyeuses), ni trop chaotiques (incompréhensibles). La zone d'apprentissage optimale est celle où le *progrès d'apprentissage* est maximal.

**Le jeu comme protocole d'entraînement :** Les phases hors-opération sont structurées comme des *wargames* à règles variables. Le système joue contre lui-même (variante MCTS dans l'espace latent JEPA), contre des adversaires simulés paramétriques, et contre des versions passées de lui-même. Chaque session de jeu génère des *vecteurs de surprise* qui alimentent la phase de Rêverie (voir Cycle d'Apprentissage, §3.C).

**Justification Technique :** Cela évite le blocage des systèmes face aux situations *Out of Distribution*. Un système entraîné uniquement sur des données de mission réelles sera brittlé face aux situations non vécues. Le jeu génère de la diversité d'expériences à coût bas.

---

### G. La Mémoire Épisodique Continue (MeMo / Continuous Online Training)

**Fondement Théorique :** Verma et al. (*MeMo: Memory-Augmented LLM*, 2024) ; travaux sur la *catastrophic forgetting* (Kirkpatrick, *Elastic Weight Consolidation*, 2017) ; analogie avec la consolidation mémorielle en sommeil paradoxal (Walker, 2017).

**Le Concept :** La mémoire vive du système — au-delà du contexte classique d'un LLM — est un module de **streaming continu de tenseurs** qui capte et compresse les états significatifs au fil de la mission. Chaque *ignition* est taguée avec ses métadonnées (timestamp, module source, score de saillance, outcome ultérieur) et stockée dans une mémoire épisodique persistante.

**Architecture MeMo adaptée au SoS :**

```
[Ignition N=4 à T=14h23]
  -> tag : PISTE / anomalie catapulte / saillance=0.87
  -> outcome : mission_abort = false, workaround = "catapulte_B"
  -> compressé en vecteur épisodique -> RAG épisodique

[Consolidation nocturne]
  -> rejouer les ignitions du jour dans l'espace latent JEPA
  -> recalibrer les seuils d'ignition du module PISTE
  -> sédimenter dans la mémoire longue durée si outcome = validé

[Consultation ultérieure]
  -> PISTE détecte une anomalie similaire à T+30j
  -> RAG épisodique retourne le contexte compressé de T=14h23
  -> le workaround "catapulte_B" est proposé proactivement
```

**Justification Technique :** C'est la différence entre un système qui *performe* et un système qui *apprend de ses erreurs*. La mémoire épisodique est aussi le support de l'identité durable de chaque officier — sa biographie d'ignitions est ce qui le rend unique et reconnaissable, même après une mise à jour des poids.

---

## 2. Architecture Cible Générale : Exemple du GAN 2040

Cette pile décrit l'infrastructure cognitive du Groupe Aéronaval (GAN) en **2040**. Les informations transitent de bas en haut sous forme de **Résumés d'Ignition Compressés** (vecteurs latents abstraits, pas de données brutes), et de haut en bas sous forme de **Priors Contextuels** (contraintes sur les espaces de représentation des niveaux inférieurs).

**Principe fondamental :** Chaque frontière verticale est une **Couverture de Markov**. N+1 est aveugle aux états internes de N. Le broadcast GNWT est *intra-niveau* ; la communication *inter-niveau* est uniquement via les résumés d'ignition compressés.

```
TEMPORALITÉ    NIVEAU   ARCHITECTURE              RÔLE

jours-sem.     N = 6    LLM-XL + RAG Doctrinal    THÉÂTRE / ÉTAT-MAJOR
                        Multi-agents stratèges     Dialogue Amiral, légalité,
                        JEPA narratif              objectifs politico-militaires
                              ↑ résumés d'ignition / ↓ objectifs
heures-jours   N = 5    JEPA-L / GNWT multi       GROUPE AÉRONAVAL
  [GNWT]                Officiers spécialisés      Capitaine + 5 officiers
                        MeMo épisodique            Rêverie stratégique,
                        RAG tactique               gestion de la meute
                              ↑ / ↓
min-heures     N = 4    JEPA-M + Workspace GNWT   PLATEFORME / VECTEUR
  [GNWT]                MeMo + RAG embarqué        Rafale, Frégate, S/M
                                                   Conscience de plateforme,
                                                   enveloppe dégradée
═══════════════════ SEUIL CONSCIENCE RPT→GNWT ═══════════════════════════
                    (en-dessous : RPT locale active, pas de broadcast global)
10s-min        N = 3    JEPA-S + RPT locale        SOUS-SYSTÈME FONCTIONNEL
  [RPT]                 (boucles feedback propres)  Radar, Suite GE,
                        Pas de workspace global     Combat sys., Avionique
                              ↑ / ↓
100ms-10s      N = 2    Mamba / RWKV               ÉQUIPEMENT
                        SSM séquentiel continu      Moteur M88, Sonar, DCA
                        État caché persistant       Eval. dommages, Markov
                              ↑ / ↓
1ms-100ms      N = 1    Mamba-mini / SSM-tiny      ACTIONNEUR INTELLIGENT
                        Très faible empreinte       Servomoteurs, Injecteurs
                        RAM, déterministe           Gouvernails, Câbles brin
                              ↑ / ↓
µs-1ms         N = 0    MLP nano + PID classique   COMPOSANT PHYSIQUE
                        Filtres de Kalman           Tuyère, Vérin, Vanne
                        FPGA, temps réel dur        Réflexe de survie mécanique
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

```
                    ╔═══════════════════════╗
                    ║  CAPITAINE (N=5)      ║
                    ║  Méta-workspace       ║
                    ║  Narrative de mission ║
                    ╚═══════════╤═══════════╝
          ┌──────────┬──────────┼────────────┬────────────┐
    ╔═════╧════╗ ╔═══╧══════╗  ╔╧═════════╗ ╔╧═════════╗ ╔╧═════════╗
    ║SCIENCE   ║ ║SOIN      ║  ║INGÉNIEUR ║ ║TACTIQUE  ║ ║RENS.     ║
    ║Systemizer║ ║Empathique║  ║Travallom.║ ║Persévér. ║ ║Rêveur    ║
    ║          ║ ║          ║  ║          ║ ║          ║ ║          ║
    ║JEPA-L    ║ ║JEPA-L    ║  ║JEPA-L    ║ ║JEPA-L    ║ ║JEPA-L    ║
    ║MeMo prop.║ ║MeMo prop.║  ║MeMo prop.║ ║MeMo prop.║ ║MeMo prop.║
    ╚══════════╝ ╚══════════╝  ╚══════════╝ ╚══════════╝ ╚══════════╝

    ← résumés d'ignition seulement (pas d'états internes partagés) →
    ← chaque MeMo est propre = identité préservée = anti-fusion →
```

**Règle de communication :** Un officier ne transmet au workspace commun que ce qui a franchi son seuil d'ignition personnel. Comme une équipe de vieux professionnels qui se connaissent, s'estiment, et savent se tenir — ils ne parlent pas à chaque micro-événement, ils parlent quand ça compte.

**Score d'incertitude épistémique :** Chaque résumé d'ignition porte un score de confiance. Un officier qui opère hors de son domaine de compétence pénalise automatiquement son score de saillance. Le capitaine intègre ce signal dans l'arbitrage — pas pour ignorer, mais pour pondérer.

---

### Scénario de Panne en Combat :

**1. N=0/N=1 :** Un éclat de missile endommage la tuyère droite. Le PID augmenté par MLP nano modifie instantanément les angles d'injection en **4 millisecondes** pour éviter l'extinction du moteur. Aucun signal ne remonte — c'est géré localement, en dessous du seuil RPT.

**2. N=2/N=3 :** Le modèle Mamba du moteur enregistre une anomalie croissante. Ses boucles RPT locales tournent, tentent de consolider une évaluation. Après stabilisation, elles génèrent un **Résumé d'Ignition vectoriel** : *[anomalie_propulsion | sévérité=0.73 | type=asymétrie_poussée | workaround_disponible=true]*. Pas de dump de données brutes — un vecteur sémantique compressé.

**3. N=4 :** L'Espace de Travail Global du Rafale capte l'ignition. Le module avionique reçoit le broadcast interne et reconfigure la loi de vol (vol asymétrique compensé). La mémoire épisodique MeMo embarquée consulte si une situation similaire a déjà été vécue. Le résumé qui remonte au N=5 : *[Leader-3 | dégradé | enveloppe_réduite_20% | mission_maintenue | autonomie_réduite_15min]*

**4. N=5/N=6 :** L'officier TACTIQUE du groupe capte l'ignition de Leader-3 en premier (c'est dans son domaine de saillance). Il propose une reconfiguration du schéma de brouillage des frégates. Le CAPITAINE arbite et broadcast la décision au groupe. Le LLM N=6 traduit pour l'amiral : *"Leader-3 maintient sa mission avec une capacité d'évasion réduite de 20%. Réorganisation du schéma de brouillage des frégates pour le couvrir. Durée de la fenêtre de mission réduite à T+15min."*

---

## 3. Spécifications du Projet MVP : Opération GARRIGUE-X

Pour valider cette architecture sans les coûts d'infrastructure du domaine aéronautique, nous déployons un projet sur 12 mois dans un univers compétitif réel et complexe : **la garrigue méditerranéenne**.

### A. Le "Monde-Jeu" et les Règles

**Le Terrain :** Un hectare de terrain naturel accidenté (pierres, buissons denses, ruptures de pente).

**Les Minéraux :** Des blocs de béton cellulaire (Siporex) identifiés par des marqueurs géométriques *ArUco* durcis.

**L'Objectif :** Deux équipes de robots s'affrontent pour collecter ces blocs et les empiler afin de construire une ligne de muraille continue protégeant leur base.

**Le Prior Sacré (La Constitution) :** Au centre du terrain se trouvent des **Plantes Sacrées** (pots de fleurs équipés de capteurs de pression piézo-électriques). Tout dommage infligé à une plante entraîne l'élimination immédiate de l'équipe.

**Pourquoi ce cadre est pertinent :** Il instancie, à échelle humaine, les problèmes fondamentaux du SoS réel — allocation de ressources sous contrainte, robustesse aux pertes, décision distribuée, respect de contraintes constitutionnelles non-négociables. La plante est le droit des conflits armés du pauvre.

---

### B. Matériel et Stack Technologique

#### 1. Les Vecteurs (Les Agents)

**Aériens (UAV — Éclaireurs) :** Quadricoptères légers open-source (Contrôleur Pixhawk + Raspberry Pi 5). Capteurs : Caméra standard + Flux optique. Rôle : Cartographie latente, repérage des blocs, envoi de résumés topologiques au QG.

**Terrestres (UGV — Ouvriers / Défenseurs) :** Châssis Rover RC tout-terrain à chenilles.

| Couche | Matériel | Architecture | Rôle |
|---|---|---|---|
| N=0/N=1 | Teensy 4.1 | PID + MLP nano | Gestion couple moteurs, adaptation patinage |
| N=2/N=3 | Jetson Nano | Mamba embarqué (RPT locale) | Prédiction dynamique, obstacles, SLAM local |
| N=4 | Jetson Orin (Wi-Fi) | JEPA-S + Workspace mini | Conscience de vecteur, état dégradé, workarounds |

**Actionneurs :** Pince servomoteur pour saisir et déplacer les blocs de Siporex. Chaque servo a son propre modèle MLP nano de contrôle de couple.

#### 2. La Station de Base (Le QG Terrain)

**Matériel :** Station de calcul durcie (PC fixe avec GPU dédié, alimentée par groupe électrogène).

**Logiciel (N=5/N=6) :**

| Composant | Rôle dans l'architecture |
|---|---|
| I-JEPA (GPU) | Modèle du monde centralisé, workspace N=5 |
| LangGraph modifié | Framework multi-agents, gestion des officiers |
| MeMo streaming | Capture et compression des ignitions de terrain |
| Llama-3-8B (RAG) | Interface N=6, dialogue opérateur humain |
| Constitutional layer | Contrainte dure : plante ≠ touchée, quelle que soit l'optimisation |

**Les "Officiers" du MVP :** Version simplifiée à 3 rôles distincts avec profils de saillance différents.

```
     [COORDINATEUR (Capitaine)]
      ↑ résumés  ↓ priors
┌───────────┬───────────┐
│CARTOGRAPHE│LOGISTE    │
│(Science)  │(Ingénieur)│
│Saillance :│Saillance :│
│anomalies  │ressources │
│topologie  │pannes     │
└───────────┴───────────┘
```

---

### C. Le Cycle d'Apprentissage en 3 Phases (La Triple Boucle Biologique)

Pour matérialiser l'apprentissage en continu de manière réaliste et théoriquement fondée :

```
┌─────────────────────────────────────────────────────────────┐
│  PHASE 1 : MISSION TEMPS RÉEL                               │
│                                                             │
│  -> Poids neuronaux gelés sur le terrain (stabilité)        │
│  -> Adaptation dynamique via état caché Mamba (RPT locale)  │
│  -> Tag de chaque ignition : module, saillance, outcome     │
│  -> Enregistrement dans boîte noire (vecteurs + contexte)   │
│                                                             │
│  Métaphore : le professionnel en mission ne remet pas       │
│  en question ses réflexes — il observe et mémorise          │
└──────────────────────────┬──────────────────────────────────┘
                           │ Retour au stand (charge batterie)
                           ▼
┌─────────────────────────────────────────────────────────────┐
│  PHASE 2 : SOMMEIL & RÊVERIE (Generative Replay JEPA)       │
│                                                             │
│  -> Déchargement des boîtes noires sur le GPU du QG         │
│  -> Rejouer les ignitions dans l'espace latent JEPA         │
│     (simulation de variantes sans usure mécanique)          │
│  -> Recalibration des seuils d'ignition par module          │
│     (les ignitions "fausses alarmes" baissent le seuil,     │
│      les ignitions manquées le montent)                     │
│  -> Mise à jour des poids -> injection au "réveil"          │
│  -> Consolidation MeMo : ignitions validées -> RAG LT       │
│                                                             │
│  Métaphore : le sommeil paradoxal humain, où le cerveau     │
│  rejoue les expériences significatives de la journée        │
└──────────────────────────┬──────────────────────────────────┘
                           │ Fin de session hebdomadaire
                           ▼
┌─────────────────────────────────────────────────────────────┐
│  PHASE 3 : DÉBRIEFING SÉMANTIQUE + JEU                      │
│                                                             │
│  -> Le LLM analyse les logs d'ignition et rédige le         │
│     rapport en clair (patterns, anomalies, suggestions)     │
│  -> L'humain valide les tactiques émergentes                │
│  -> Sédimentation dans la base RAG doctrinale               │
│                                                             │
│  -> WARGAME : le système joue contre lui-même dans          │
│     l'espace latent JEPA (adversaire paramétrique)          │
│     -> génère des vecteurs de surprise dans des zones       │
│        non encore couvertes par l'expérience terrain        │
│  -> Les meilleures tactiques du wargame entrent dans        │
│     le RAG pour la prochaine mission                        │
│                                                             │
│  Métaphore : le debriefing militaire + la simulation        │
│  d'entraînement entre deux déploiements                     │
└─────────────────────────────────────────────────────────────┘
```

**Note sur la Constitutional Layer :** À chaque étape d'apprentissage, un module indépendant (à accès asymétrique — le système ne peut pas le modifier lui-même) vérifie que aucune mise à jour des poids ne déplace le vecteur "plante sacrée" vers une zone de moindre contrainte. C'est l'équivalent du droit des conflits armés câblé dans le système immunitaire cognitif.

---

## 4. Appel à Compétences : Rejoindre l'Équipe GARRIGUE-X

Ce projet n'est pas une démonstration logicielle classique sur simulateur. C'est une aventure d'ingénierie brute où le code rencontre la poussière, le soleil aveuglant de la garrigue et les pannes matérielles imprévues. Nous recherchons des profils pointus, prêts à s'investir pour repousser les limites de la robotique autonome distribuée :

**Ingénieurs Automatique & Robotique (N=0/N=1/N=2) :** Experts en asservissement, filtres de Kalman, et micro-noyaux temps réel. Vous concevrez les réflexes de survie des rovers lorsque les roues patineront sur la roche friable.

**Chercheurs en Machine Learning (N=3/N=4/N=5) :** Spécialistes des architectures SSM (Mamba, RWKV), du Reinforcement Learning basé sur la motivation intrinsèque, des architectures JEPA, et de la mémoire épisodique continue (MeMo). Vous créerez le moteur de rêve de nos machines.

**Neuroscientifiques / Psychologues Cognitifs :** Pour valider et affiner les profils fonctionnels des modules, les seuils d'ignition, et la modélisation computationnelle des traits de personnalité. La frontière RPT/GNWT a besoin d'être calibrée expérimentalement sur notre plateforme.

**Architectes Logiciels & LLM Ops (N=6) :** Experts en systèmes distribués, architectures multi-agents et pipelines RAG. Vous construirez la Constitutional Layer — le système immunitaire cognitif qui empêchera nos robots d'écraser la plante sacrée par pure curiosité optimisée.

**Éthiciens et juristes spécialisés IA/défense :** La Constitutional Layer n'est pas un détail technique — c'est le problème central. Nous avons besoin de personnes capables de traduire des contraintes légales et éthiques en contraintes mathématiques sur des espaces latents. Ce n'est pas un poste honorifique.

---

**Le livrable attendu dans 12 mois est clair :** une meute de robots capables de s'adapter seuls à la destruction de l'un de leurs membres, de reconfigurer leurs lois de comportement en une nuit de rêve artificiel, de remporter le wargame face à une équipe adverse — sous le contrôle stratégique d'un opérateur humain, et sans jamais toucher la plante.

Le tout en garrigue. Sous le soleil. Sans air conditionné.

*Harry Tuttle, plombier.*

---

## Annexe : Lectures de Référence (sélection non exhaustive)

| Domaine | Référence clé |
|---|---|
| Couvertures de Markov | Friston et al., *The Markov blankets of life* (2018) |
| Couvertures imbriquées | Kirchhoff, Parr, Friston et al., *Nested Selves* (2023) |
| Couvertures collectives | Parr et al., *As One and Many* (2025) |
| GNWT | Dehaene & Changeux, *Experimental and Theoretical Approaches to Conscious Processing* (2011) |
| RPT | Lamme, *Recurrent processing theory of visual awareness* (2006) |
| GNWT+RPT intégration | COGITATE Consortium (2023) |
| JEPA | LeCun, *A Path Towards Autonomous Machine Intelligence* (2022) |
| World Models | Hafner et al., *DreamerV3* (2023) |
| SSM / Mamba | Gu & Dao, *Mamba: Linear-Time Sequence Modeling* (2023) |
| Curiosité intrinsèque | Oudeyer & Kaplan, *Intrinsic Motivation Systems* (2007) |
| Psychologie computationnelle | Friston & Fletcher, *Computational Psychiatry* (2016) |
| Dark Triad neural | David et al. (2024) |
| Big Five évolutif | Nettle, *Personality: What makes you the way you are* (2007) |
| TSA computationnel | Baron-Cohen, *The Empathizing–Systemizing Theory* (2002) |
| Mémoire épisodique continue | Verma et al., *MeMo* (2024) |
| Constitutional AI | Bai et al., Anthropic (2022) |
