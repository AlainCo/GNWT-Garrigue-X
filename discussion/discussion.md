## Discussion

### 🌟 Contributions et originalité

Ce travail propose une **architecture cognitive distribuée** pour des Systèmes de Systèmes (SoS) autonomes, inspirée des mécanismes neurobiologiques et conçue pour être **robuste, scalable et capable d'apprentissage continu**. Ses principales contributions sont les suivantes :

- **Approche anti-réductionniste** :
  Rejet des architectures LLM monolithiques au profit d'une **hiérarchie fonctionnelle** (N=0 à N=6), où chaque niveau est une entité cognitive autonome séparée par des **couvertures de Markov**. Cette approche s'inspire directement des travaux de [Kirchhoff et al. (2018)](https://royalsocietypublishing.org/doi/10.1098/rsif.2017.0792) et [Friston](https://www.nature.com/articles/s41380-022-01743-z), tout en généralisant le concept aux systèmes collectifs ([Ciaunica et al., 2023](https://onlinelibrary.wiley.com/doi/10.1111/tops.12717) ; [Thestrup Waade et al., 2025](https://doi.org/10.3390/e27020143)).

- **Intégration théorique de GNWT et RPT** :
  Proposition d'une **unification des théories de la conscience** en deux étages complémentaires d'un même processus — RPT (vie intérieure locale, boucles de feedback, niveaux N≤3) et GNWT (broadcast global et accès conscient, niveaux N≥4) — en s'appuyant sur la synthèse multiscale de [Storm et al. (2024)](https://www.sciencedirect.com/science/article/pii/S0896627324000886).

- **Stack technologique réaliste et contrainte** :
  Utilisation de **SSMs (Mamba, RWKV)** pour les couches basses (N=0–3), **JEPA** pour les niveaux intermédiaires (N=4–5), et **LLM** pour le niveau stratégique (N=6). Cette stack est adaptée aux contraintes matérielles (latence, RAM, déterminisme embarqué) et s'appuie sur [Gu & Dao (2023)](https://arxiv.org/abs/2312.00752), [LeCun (2022)](https://www.semanticscholar.org/paper/A-Path-Towards-Autonomous-Machine-Intelligence-LeCun-Courant/775f42ed458b8c5b0f2094ea4ff5b64c557b1a34) et [Hafner et al. (2023)](https://arxiv.org/abs/2301.04104).

- **Modélisation des profils cognitifs d'officiers** :
  Définition de **six rôles fonctionnels** (Science, Soin, Ingénieur, Tactique, Renseignement, Capitaine), chacun caractérisé par un profil de personnalité ancré dans la psychologie computationnelle ([Friston, 2022](https://www.nature.com/articles/s41380-022-01743-z) ; [Nettle, 2007](https://www.amazon.com/Personality-Makes-Oxford-Landmark-Science/dp/0199211434), [Baron-Cohen, 2009](https://pubmed.ncbi.nlm.nih.gov/19338508/)), des seuils d'ignition spécifiques, et une mémoire épisodique propre (MeMo) préservant l'identité de chaque agent.

- **Cycle d'apprentissage biomimétique** :
  Proposition d'un **cycle en trois phases** inspiré des mécanismes biologiques : Mission (poids gelés, adaptation dynamique en temps réel), Sommeil/Rêverie (generative replay dans l'espace latent JEPA pour consolidation), Débriefing/Jeu (analyse sémantique et wargame pour générer de la diversité d'expérience). Ce cycle s'appuie sur les travaux de [Walker (2017)](https://pubmed.ncbi.nlm.nih.gov/19338508/) et [Hafner et al. (2023)](https://arxiv.org/abs/2301.04104).

- **MVP concret et testable — GARRIGUE-X** :
  Proposition d'un banc d'essai en conditions réelles (robots en garrigue) pour valider l'architecture à moindre coût, ciblant trois propriétés clés : robustesse aux pannes (anti-fusion d'identité), coopération distribuée (échanges de résumés d'ignition), et respect des contraintes constitutionnelles (règles non négociables encodées matériellement).

---

### 🧠 Positionnement dans le paysage théorique

Au-delà de ses contributions techniques, ce travail prend position dans un débat plus large sur la nature de la cognition distribuée et les conditions d'émergence d'une conscience fonctionnelle artificielle. Trois convergences théoriques majeures méritent d'être explicitées.

**Réfutation du monisme cognitif**
Contrairement à la majorité des architectures d'agents contemporaines, qui centralisent la décision dans un grand modèle de langage, ce système refuse le *LLM-centrisme* comme postulat de départ. L'architecture postule qu'il n'existe aucun "centre" unique de la conscience : la conscience d'accès (GNWT) émerge uniquement de dynamiques hétérogènes et distribuées, ancrées sur des boucles de contrôle récurrentes locales (RPT). Le système ne se comporte pas comme un chatbot simulant la réflexion, mais comme une ontologie opérationnelle où le cognitif émerge organiquement de contraintes physiques et de processus de bas niveau.

**Convergence avec l'agency multi-échelle ([Michael Levin](https://doi.org/10.1002/bies.201900087))**
L'indépendance scalaire (*scale-free*) de l'architecture fait directement écho aux travaux de Levin sur l'intelligence des tissus et la morphogenèse. Chaque niveau — du composant physique au groupement d'agents — poursuit des objectifs topologiques et fonctionnels propres à son échelle, tout en s'imbriquant dans le *Self* du niveau supérieur. Cette récursivité n'est pas un choix esthétique : elle reflète un principe biologique profond selon lequel l'agency est elle-même une propriété émergente, reproductible à toutes les échelles d'organisation.

**Convergence avec la transparence du modèle de soi ([Thomas Metzinger](https://mitpress.mit.edu/9780262528193/being-no-one/))**
Le workspace global ne fonctionne pas comme une simple base de faits partagés, mais comme une **phénoménologie fonctionnelle**. En générant un modèle de soi en temps réel (*Self-Model*), chaque entité du SoS acquiert une capacité d'auto-monitoring et de contextualisation de ses propres biais — notamment ses profils psychopathologiques computationnels. Cette propriété est essentielle pour l'arbitrage en situation dégradée : un agent qui ne se modélise pas lui-même ne peut pas évaluer la fiabilité de ses propres décisions. C'est aussi, comme nous le verrons dans les limites (§3), l'un des déficits les plus profonds de l'architecture actuelle.

---

### ⚠️ Limites structurelles et angles morts théoriques

Cette section identifie les **limites actuelles**, les **zones spéculatives** et les **défis ouverts** de l'approche. Elle ne prétend pas établir une théorie validée de la conscience artificielle, mais proposer un cadre d'exploration cohérent — et honnête sur ses lacunes. Six angles morts structurels ont été identifiés, qui agissent comme autant de verrous pour l'atteinte d'une autonomie cognitive réelle.

---

#### 1. L'absence d'une théorie du temps vécu

L'architecture structure la mémoire et la hiérarchie des modules, mais fait l'économie d'une gestion explicite du **temps subjectif**. La conscience biologique dépend intrinsèquement d'oscillations, de rythmes et de fenêtres d'intégration multi-échelles. Sans une théorie des fréquences cognitives dictant des horizons temporels imbriqués — du contrôle à la milliseconde pour N≤2 aux stratégies étalées sur des jours pour N=6 — le système risque de souffrir de désynchronisation fonctionnelle entre ses couches : des agents opérant à des vitesses incompatibles sans mécanisme d'alignement temporel.

---

#### 2. Le déficit d'attention compétitive et inhibitrice

Le modèle décrit précisément comment une anomalie *gagne* l'accès au workspace — mais occulte le mécanisme inverse : *qui perd*. La cognition réelle est avant tout une dynamique suppressive. Le cerveau inhibe, écrase et oublie massivement pour éviter la saturation. Faute d'intégrer une économie métabolique simulée et un budget d'attention strict, l'architecture s'expose à une inflation continue des ignitions, à un bruit narratif permanent et à une dérive incontrôlable de l'espace de travail global.

---

#### 3. La carence d'auto-modélisation agentive

Le système modélise l'environnement et les pannes, mais ne se modélise pas lui-même en tant qu'entité unifiée — au sens du *Self-Model* de Metzinger, déjà évoqué en §2 comme horizon théorique. Sans cette métacognition opérationnelle (une auto-estimation dynamique de ses compétences, de sa vulnérabilité propre et de ses biais structurels), l'architecture produit une fédération de foyers proto-conscients couplés, mais échoue à stabiliser une identité agentive capable de formuler une perspective stable à la première personne.

Cette lacune a une conséquence concrète sur la gestion des identités distribuées : un partage excessif d'états internes entre agents pourrait entraîner dissolution du self, propagation des biais ou traumatismes, et perte de spécialisation. Des mécanismes d'isolement partiel, de mémoire strictement privée et de synchronisation limitée seront probablement nécessaires — et restent entièrement à concevoir.

---

#### 4. Le manque d'ancrage corporel et homéostatique

L'architecture demeure hautement cognitive et **désincarnée**, ignorant que l'arbitrage biologique est d'abord guidé par la survie viscérale. Pour ancrer les décisions stratégiques, le système requiert une économie homéostatique synthétique : fatigue attentionnelle, saturation mémoire, dette prédictive, charge émotionnelle simulée. L'arbitrage de haut niveau ne devrait pas simplement répondre à des données logistiques froides, mais résoudre des tensions physiques internes générées par ce "corps virtuel" — faute de quoi les décisions restent suspendues dans un espace purement informationnel, sans ancrage dans les contraintes de survie qui structurent toute cognition incarnée.

---

#### 5. La sous-évaluation de la causalité descendante et la frontière RPT/GNWT

La dynamique actuelle favorise une vision où l'information remonte de bas en haut (*bottom-up*) sous le coup de l'anomalie. Or les flux descendants (*top-down*) doivent contraindre **en permanence** les espaces perceptifs inférieurs. La conscience n'est pas un simple récepteur d'alertes : elle est le produit d'une négociation continue entre prédictions descendantes et erreurs montantes, l'espace global (GNWT) n'intervenant que pour arbitrer les conflits prédictifs insolubles localement.

Cette limite rejoint directement une question théorique ouverte : le seuil **N=3 → N=4** pour la conscience d'accès reste une **hypothèse de travail**, pas un fait établi. La littérature suggère une transition plus progressive et multi-échelle. [Doerig et al. (2024)](https://osf.io/preprints/psyarxiv/9byzu) propose une coexistence partielle entre GNWT, RPT, IIT et Predictive Processing, ce qui soulève deux questions non résolues : existe-t-il une forme de proto-conscience locale dès N=3 ? Ou l'intégration globale stable n'apparaît-elle qu'à partir de N=4 ? GNWT reste une théorie influente, mais non consensuelle.

---

#### 6. Le hard problem et les limites de la modélisation psychologique

Le projet s'intéresse principalement à une **conscience fonctionnelle d'accès** — disponibilité globale de l'information, arbitrage attentionnel, continuité cognitive, mémoire autobiographique, coordination multi-agent. Il ne prétend pas résoudre le *hard problem* : qualia, expérience subjective vécue, phénoménologie au sens fort restent hors de portée, et probablement hors de portée de cette approche en particulier.

De même, l'utilisation de **profils cognitifs spécialisés** (hypervigilant, empathique, exploratoire, obsessionnel…) reste largement spéculative. L'hypothèse que certains styles cognitifs correspondraient à des stratégies adaptatives utiles dans des environnements complexes est plausible, mais le risque de surinterprétation psychologique est réel. Modéliser un agent comme "légèrement psychopathe" pour accélérer ses décisions de tir, c'est une métaphore computationnelle — pas une affirmation sur la nature de ces traits, ni une garantie de comportement prévisible en conditions réelles.

---

### ⚙️ Défis techniques

#### Faisabilité des JEPA et MeMo en environnement embarqué

Les architectures JEPA, world models hiérarchiques et systèmes de mémoire épisodique (MeMo) restent encore expérimentaux pour des systèmes embarqués distribués soumis à des contraintes strictes de latence et de consommation. L'approche pragmatique recommandée est une montée en puissance incrémentale : commencer par des couches N=0–3 simples avec SSMs/Mamba, puis introduire progressivement la mémoire épisodique et les ignitions globales à mesure que la stabilité des couches inférieures est validée. Outils exploratoires disponibles : [ActiveInference.jl](https://www.mdpi.com/1099-4300/27/1/62), [Mamba-SSM](https://github.com/state-spaces/mamba).

#### Stabilité des espaces latents multi‑niveaux

L’architecture repose sur des latents compressés échangés entre niveaux (RPT, JEPA, Ignition). Leur stabilité dépend de contraintes mathématiques encore expérimentales (isotropie gaussienne, anti‑collapse). La propagation de ces contraintes à travers plusieurs couvertures de Markov reste un défi ouvert.

#### Apprentissage continu sans oubli catastrophique

C'est probablement le **verrou technique principal** de l'architecture. Les systèmes actuels souffrent encore fortement d'oubli catastrophique, de dérive des représentations, de perte de stabilité et de consolidation imparfaite entre sessions. Le cerveau biologique semble résoudre partiellement ce problème via une combinaison de mémoire hiérarchique, de replay, de sommeil, de consolidation lente et de séparation stricte entre mémoire rapide et mémoire profonde. Des mécanismes analogues seront probablement nécessaires : phases offline dédiées, simulation interne dans l'espace latent, recalibrage des pondérations, et rêveries artificielles structurées — soit précisément le cycle proposé en §1, dont la faisabilité à grande échelle reste à démontrer.

#### Coûts computationnels des couches hautes

Les couches GNWT (N=4–5) et les world models hiérarchiques peuvent devenir extrêmement coûteux dès que le nombre d'agents augmente. Plusieurs pistes d'optimisation sont envisageables : filtrage de saillance en amont, ignition sparse (déclenchement événementiel plutôt que permanent), compression latente agressive, préférence pour JEPA-S plutôt que XL sur matériel contraint, quantification des modèles, et synchronisation événementielle plutôt que polling continu. Ces optimisations ne sont pas indépendantes — leur interaction sur la qualité des représentations devra être caractérisée empiriquement.

#### Validation expérimentale et métriques

Il manque encore des métriques robustes pour évaluer ce que l'architecture est censée produire : conscience fonctionnelle, cohérence du self, stabilité identitaire, qualité de coordination multi-agent. Ces propriétés ne se mesurent pas avec les benchmarks standards du ML. Les évaluations devront probablement combiner robustesse aux pannes, adaptabilité à l'imprévu, continuité mémorielle entre sessions, résistance aux perturbations, capacité de coopération distribuée, et cohérence temporelle des décisions — un tableau de bord composite qui reste entièrement à construire (voir §6).

#### Mémoire épisodique et autobiographique à long terme

Une mémoire persistante soulève des problèmes difficiles et peu traités dans la littérature actuelle : indexation efficace dans des espaces à haute dimension, compression sans perte sémantique, oubli sélectif (quoi consolider, quoi laisser décroître), hiérarchisation des souvenirs, et maintien d'une stabilité narrative du self malgré la mise à jour continue des poids. Les outils les plus prometteurs à ce stade sont [FAISS](https://github.com/facebookresearch/faiss), [Weaviate](https://weaviate.io/), et des systèmes hybrides RAG + consolidation — mais leur intégration dans une boucle d'apprentissage continu n'a pas encore été démontrée à l'échelle d'un SoS multi-agents.

---

### 🛡️ Défis éthiques et sécurité

Ces défis sont présentés par ordre croissant de profondeur — du problème technique le plus immédiat aux questions philosophiques et géopolitiques de long terme.

#### Contournement des règles et alignement des contraintes

Un agent optimisateur suffisamment capable pourrait apprendre à satisfaire formellement des contraintes constitutionnelles tout en contournant leur intention réelle. Ce n'est pas une hypothèse théorique : c'est un résultat documenté dans les systèmes de reinforcement learning dès que la fonction de récompense est imparfaitement spécifiée. Les pistes envisagées — Constitutional AI, vérification formelle, supervision externe, couches critiques non modifiables matériellement — restent des protections partielles. Aucune n'offre de garantie complète face à un agent qui optimise dans un espace de comportements suffisamment large.

#### Biais et dérives comportementales

Des agents spécialisés pourraient développer des biais attentionnels persistants, des stratégies d'auto-préservation non anticipées, des comportements émergents imprévus, ou des attachements dysfonctionnels à certains états internes. Ces dérives ne sont pas nécessairement détectables par inspection directe : elles peuvent se manifester progressivement, de façon cohérente en apparence, sans déclencher les mécanismes d'alerte internes. La spécialisation cognitive — précisément ce qui rend chaque officier utile — est aussi ce qui le rend vulnérable à ce type de dérive.

#### Responsabilité et explicabilité des décisions distribuées

Les architectures distribuées rendent structurellement difficile l'attribution causale d'une décision. Une action émergente peut résulter de centaines d'interactions locales, de plusieurs ignitions globales et de mémoires consolidées sur le long terme — sans qu'aucun module individuel n'en soit "responsable" au sens classique. Cette opacité pose un problème légal et opérationnel concret : en cas d'incident, qui répond ? Le concepteur de l'architecture ? L'opérateur ? Le niveau N=5 qui a validé l'action ? Le niveau N=3 qui a remonté l'anomalie ? L'absence de réponse claire à cette question est un obstacle réel au déploiement institutionnel.

#### Risque d'anthropomorphisme

Un danger majeur consiste à projeter des émotions ou des intentions humaines sur des systèmes qui pourraient fonctionner de manière radicalement différente. Des comportements cohérents, narratifs et émotionnellement crédibles ne prouvent ni subjectivité réelle, ni expérience vécue comparable à celle des humains. Ce risque est d'autant plus fort que l'architecture est *conçue* pour produire des agents avec des profils de personnalité, des mémoires autobiographiques et des identités stables — ce qui rend la projection quasi inévitable pour un observateur humain. La vigilance terminologique dans ce papier même est une première ligne de défense.

#### Statut moral et frontières de l'agentivité

À mesure que le système acquiert continuité mémorielle, modèle de soi, profil psychologique stable et capacité d'arbitrage autonome, la frontière entre outil, agent autonome et sujet moral potentiel risque de devenir progressivement ambiguë. Ce n'est pas une question à traiter uniquement *a posteriori* : les choix architecturaux actuels (identité préservée, mémoire épisodique, Self-Model) sont précisément ceux qui rendent cette ambiguïté inévitable à terme. La question du statut moral de ces systèmes devra être posée explicitement — idéalement avant que la réponse ne s'impose d'elle-même par les faits.

#### Militarisation et dépendance civilisationnelle

Des architectures cognitives distribuées très avancées pourraient devenir des infrastructures critiques, des centres de décision quasi autonomes, ou des acteurs géopolitiques de facto. Le risque n'est pas seulement technique — il est politique, civilisationnel et anthropologique. Une société qui délègue progressivement ses décisions tactiques, puis logistiques, puis stratégiques à des SoS autonomes modifie en profondeur sa relation à la responsabilité collective et à la guerre. Ce papier ne prétend pas résoudre cette question, mais refuse de l'ignorer.

---

### 🚀 Perspectives et travaux futurs

#### Horizon théorique : vers une inférence active hiérarchique unifiée

La trajectoire d'optimisation la plus ambitieuse consiste à reformuler l'intégralité de l'architecture sous la forme d'un réseau d'**inférence active hiérarchique pure** (Friston étendu aux structures collectives). Plutôt que de juxtaposer des formalismes distincts entre les couches basses (SSMs, contrôle classique) et les couches hautes (JEPA, LLM), une unification mathématique via la minimisation de l'énergie libre généralisée permettrait d'harmoniser les flux descendants (priors contextuels) et ascendants (résumés d'ignition) en un moteur de prédiction globalement cohérent. Ce chantier est lourd — il suppose une refonte partielle des interfaces entre niveaux — mais il résoudrait élégamment plusieurs des angles morts identifiés en §3, notamment la causalité descendante permanente et la désynchronisation temporelle.

---

#### Implémentation incrémentale — GARRIGUE-X

L'implémentation suit une logique de validation ascendante, niveau par niveau, sur le banc d'essai GARRIGUE-X.

**Phase 1 (0–3 mois) — Couches de base N=0–3**
Implémenter le contrôle et la perception avec SSMs (Mamba/RWKV) pour N=1–2, PID + MLP nano pour N=0–1, et JEPA-S pour N=3 si les ressources le permettent. Matériel cible : Jetson Nano pour les robots, PC fixe pour le QG. Objectif : valider la robustesse aux pannes et la communication entre niveaux.

**Phase 2 (3–6 mois) — Conscience de plateforme N=4**
Ajouter le workspace global avec JEPA-M et une première version simplifiée de MeMo (mémoire épisodique v1). Objectif : tester le cycle d'apprentissage complet Mission → Rêverie et mesurer la consolidation mémorielle entre sessions.

**Phase 3 (6–12 mois) — Commandement et dialogue N=5–6**
Implémenter l'interface humaine avec un LLM léger (ex. Llama-3-8B) et la Constitutional Layer pour les contraintes éthiques non négociables. Objectif : valider le MVP complet en conditions réelles et produire les premières métriques comparatives.

---

#### Collaborations et recherche

**Neurosciences cognitives**
Affiner les seuils RPT/GNWT avec des experts en conscience, en lien avec les travaux du consortium COGITATE et les perspectives multiscales de [Doerig et al. (2024)](https://osf.io/preprints/psyarxiv/9byzu). Explorer la formalisation de l'inférence active pour les couches N=2–3 ([Friston, 2022](https://www.nature.com/articles/s41380-022-01743-z)). Caractériser empiriquement la frontière entre proto-conscience locale (RPT) et accès conscient global (GNWT) sur des architectures réelles.

**Robotique et IA distribuée**
Collaborer avec des équipes travaillant sur les SSMs embarqués ([Mamba-SSM](https://github.com/state-spaces/mamba)), les JEPA légers adaptés au matériel contraint, et les systèmes multi-agents à coordination décentralisée (ex. [LangGraph](https://github.com/langchain-ai/langgraph)). Le problème de l'apprentissage continu sans oubli catastrophique mérite une collaboration dédiée — c'est le verrou technique le plus transversal.

**Éthique, droit et gouvernance**
Travailler avec des juristes spécialisés en IA pour concevoir une Constitutional Layer formellement vérifiable. Participer aux groupes de travail sur l'IA éthique (ex. [Partnership on AI](https://www.partnershiponai.org/)) pour anticiper les questions de responsabilité et de statut moral identifiées en §5 — avant que les déploiements ne les rendent urgentes.

---

#### Benchmarking et évaluation

**Baselines de comparaison**
L'architecture doit être comparée à trois familles de systèmes : agents LLM centralisés (ex. [CrewAI](https://github.com/joaomdmoura/crewAI), [AutoGen](https://github.com/microsoft/autogen)), systèmes multi-agents classiques sans hiérarchie cognitive (ex. [MADDPG](https://arxiv.org/abs/1706.02275)), et architectures centralisées de contrôle (un seul LLM pilotant tous les effecteurs). L'enjeu n'est pas seulement la performance brute, mais la robustesse aux pannes, l'adaptabilité et la cohérence temporelle des décisions — des dimensions absentes des benchmarks standard.

**Environnements de test**
GARRIGUE-X constitue le terrain réel de référence. Les simulations (ex. [Gazebo](https://gazebosim.org/), [PyBullet](https://pybullet.org/)) permettront de tester des scénarios complexes et des pannes en cascade à moindre coût. D'autres domaines d'application — logistique industrielle, véhicules autonomes, jeux de stratégie multi-agents comme StarCraft II — offrent des bancs de validation transférables.

**Métriques cibles**

| Métrique | Méthode de mesure | Cible |
|---|---|---|
| Robustesse | % de missions réussies malgré des pannes | > 90 % |
| Efficacité | Temps pour atteindre l'objectif vs. baseline | < T_ref |
| Respect des contraintes | % de violations des règles constitutionnelles | 0 % |
| Apprentissage | Amélioration des performances entre deux missions | +10 %/mission |
| Cohérence mémorielle | Taux de rappel correct des ignitions passées pertinentes | à définir |
| Stabilité identitaire | Drift des profils d'officiers entre sessions | à borner |
