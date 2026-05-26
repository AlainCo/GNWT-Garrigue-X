# GNWT-Garrigue-X : UNE BOUTEILLE À LA MER

## Executive Summary

Ce document consolide l'ensemble des réflexions théoriques et des choix d'ingénierie concernant la conception d'un **Système de Systèmes (SoS) autonome, robuste aux dommages, capable d'apprentissage en continu et doté d'une proto-conscience fonctionnelle**.

Notre approche rejette délibérément le réductionnisme des architectures monolithiques de type "boîte noire" (LLM de bout en bout) au profit d'un **modèle fonctionnaliste distribué, bio-inspiré et invariant d'échelle**. Nous présentons ici les fondements théoriques de cette architecture, sa projection sur un cas d'usage militaire à l'horizon **2040** (le Groupe Aéronaval), et sa déclinaison en un projet de validation réel (MVP) exécutable en 12 mois.

L'architecture repose sur un principe central : **la conscience fonctionnelle d'accès n'est pas un phénomène monolithique, mais une propriété émergente à chaque niveau d'organisation suffisamment riche**, séparée des niveaux voisins par des frontières statistiques strictes (couvertures de Markov). Chaque niveau possède sa propre vie intérieure (RPT locale), et seul un sous-ensemble de ses états atteint le niveau supérieur sous forme de *résumé d'ignition*.

> "Hence, if it requires, say, a thousand years to fit for easy flight a bird which started with rudimentary wings, or ten thousand for one which started with no wings at all and had to sprout them *ab initio*, it might be assumed that the flying machine which will really fly might be evolved by the combined and continuous efforts of mathematicians and mechanicians in from one million to ten million years - provided, of course, we can meanwhile eliminate such little drawbacks and embarrassments as the existing relation between weight and strength in inorganic materials. No doubt the problem has attractions for those it interests, but to the ordinary man it would seem as if the effort might be employed more profitably."
>
> — Samuel P. Langley, cité dans l'article [A Million Years, Give or Take](https://nowiknow.com/a-million-years-give-or-take/)

---

## 1. Concepts Clés et Fondements Théoriques

Pour fonder la robustesse et l'autonomie de notre architecture, nous rejetons le réductionnisme des IA monolithiques de type "boîte noire". Le système repose sur un modèle fonctionnaliste distribué, bio-inspiré et invariant d'échelle (*scale-free*), articulé autour de sept concepts scientifiques interconnectés :

* **Couvertures de Markov & Anti-fusion d'identité :** Chaque module est isolé par une membrane statistique stricte. Le niveau supérieur ($N+1$) n'accède jamais aux données brutes du niveau inférieur ($N$) ; il interagit exclusivement avec son API sous forme de *Résumé d'Ignition* vectoriel, ce qui garantit une modularité absolue et préserve l'identité cognitive de chaque entité.
* **Conscience Hybride (RPT + GNWT) :** Le traitement articule la théorie du traitement récurrent (RPT — boucles locales rapides en silos pour la perception au niveau $N \le 3$) et la théorie de l'espace de travail neuronal global (GNWT — *ignition* et diffusion globale des alertes critiques au niveau $N \ge 4$). Cette double dynamique concilie une vie intérieure riche des capteurs et un arbitrage stratégique centralisé.
* **Modèles du Monde Latents (JEPA) :** À l'inverse des modèles génératifs lourds, l'architecture apprend à prédire des représentations abstraites (vecteurs latents) de l'environnement en ignorant le bruit inutile. Ce flux sémantique permanent sert de moteur à la *Rêverie artificielle* (*Generative Replay*) lors des phases de repos, permettant de simuler des millions de scénarios sans usure mécanique.
* **Efficacité Linéaire Temps Réel (SSMs / Mamba) :** Les Transformers classiques sont écartés des couches basses ($N=0$ à $N=3$) au profit de modèles d'espace d'états (*State Space Models*). Ils garantissent des signaux de contrôle fluides, continus, hautement réactifs et à faible empreinte mémoire, indispensables pour l'embarqué temps réel.
* **Psychopathologie Computationnelle Fonctionnelle :** Les profils cognitifs des agents virtuels découlent d'ajustements mathématiques d'hyperparamètres (gestion des probabilités d'erreur et de saillance). Ces biais structurels sont exploités à des fins purement opérationnelles (ex. : autisme computationnel à la couche radar pour isoler les signaux faibles sans biais contextuel, *Triade Sombre* fonctionnelle pour la vitesse d'exécution froide des effecteurs de tir).
* **Exploration par Curiosité (Motivation Intrinsèque) :** L'apprentissage autonome est stimulé par une fonction de récompense interne basée sur le gain d'information (réduction de l'entropie prédictive). En poussant l'agent à explorer activement les zones où son modèle du monde est imparfait, on s'assure qu'il ne se bloquera pas face à des situations totalement imprévues (*Out of Distribution*).
* **Mémoire Épisodique Continue (MeMo) :** L'identité et la continuité de l'apprentissage reposent sur un flux de tenseurs capturant uniquement les événements de forte saillance. Ces souvenirs riches sont consolidés dans un RAG épisodique au cours d'une phase de sommeil artificiel nocturne, protégeant le système contre l'oubli catastrophique (*catastrophic forgetting*).
* **Stabilité des Espaces Latents & Anti-Collapse** :  Les espaces latents utilisés dans les modules RPT, les modèles JEPA et les résumés d’Ignition doivent rester **bornés mais non dégénérés**. Pour éviter le *representation collapse* — un risque classique des architectures prédictives — l’architecture s’appuie sur des contraintes structurelles inspirées des travaux récents (LeJEPA, SIGReg, VICReg). Ces mécanismes garantissent que chaque dimension du latent porte une information utile, stabilisent les échanges entre niveaux hiérarchiques et assurent la cohérence des prédictions dans le temps.
* **Inférence Active Hiérarchique (JEPA + Predictive Processing) :** Unification des flux ascendants et descendants. Chaque niveau prédit activement le résumé d’ignition du niveau inférieur ; l’écart (surprise) ne remonte que s’il dépasse un seuil adaptatif. Ce mécanisme réalise une causalité descendante permanente et un apprentissage par minimisation de l’énergie libre, transformant les *priors contextuels* en *prédictions actives*.

* **Métacognition & Schéma de Soi (Higher‑Order Thought) :** Chaque module conscient (N≥4) possède un Self‑Model (MLP) qui génère un méta‑vecteur (confiance, contexte, saillance attendue) pour chaque ignition. Stocké dans la mémoire épisodique (MeMo), ce méta‑vecteur permet au système de signaler ses propres biais, d’améliorer l’explicabilité (N=6) et de déclencher des rêveries correctives en cas de chute de confiance.

* **Attention Compétitive & Budget (Attention Schema Theory) :** Pour éviter la saturation du workspace GNWT, un budget attentionnel global (tokens) est alloué. Chaque ignition consomme des tokens ; à budget insuffisant, les ignitions sont différées ou inhibées. Un *Attention Scheduler* ajuste dynamiquement le seuil de saillance, garantissant la réactivité en environnement saturé (ex. combat intense).

* **Intégration Causale (Proxy IIT/PCI) :** Outil de diagnostic activé pendant la phase de sommeil. Un estimateur Φ̂ perturbe localement des résumés d’ignition et mesure l’impact sur l’erreur prédictive globale. Une chute de Φ̂ signale un risque de *collapse d’intégration* (désagrégation fonctionnelle) et déclenche des actions correctives (recalibration, rêverie enrichie). Ce mécanisme ne modifie pas les décisions en temps réel.

👉 [Consulter les schémas d'architecture, les équations et la bibliographie complète de ces concepts ➔](concepts/concepts.md)

## 2. Architecture Cible Générale : Exemple du GAN 2040

Pour matérialiser les fondements théoriques, l'architecture s'opérationnalise à travers un cas d'usage de souveraineté extrême : l'infrastructure cognitive distribuée d'un **Groupe Aéronaval (GAN) en 2040**. Cette implémentation traduit la théorie en une pile logicielle multi-agent et hautement résiliente, structurée autour de quatre grands piliers :

* **Pile Cognitive Multi-Niveaux (N=0 à N=6) :** L'architecture segmente le traitement en sept couches distinctes. Les *Niveaux Bas infra-conscients* ($N=0$ à $N=3$, du composant physique au sous-système fonctionnel) traitent les données brutes et gèrent les réflexes locaux via des modèles d'espace d'états (Mamba, RWKV) et du JEPA-S. Les *Niveaux Hauts conscients* ($N=4$ à $N=6$, du vecteur/Rafale à l'État-Major) orchestrent la stratégie globale via des espaces de travail partagés (GNWT) et des modèles narratifs (LLM-XL + RAG).
* **Étanchéité Statistique & Flux Multi-Échelles :** Chaque frontière verticale agit comme une *Couverture de Markov* stricte : le niveau $N+1$ est totalement aveugle aux états internes du niveau $N$. L'information ne transite vers le haut que sous forme de **Résumés d'Ignition Compressés** (vecteurs latents sémantiques et abstraits), tandis que les directives descendent sous forme de « Prédictions actives (top-down) » pour contraindre et guider les espaces de représentation des couches inférieures. Ces prédictions sont comparées aux ignitions réelles ; l’écart (surprise) ne déclenche une ignition GNWT que s’il dépasse un seuil adaptatif (fonction du budget attentionnel et de la confiance du Self-Model).
* **Société Mentale de la Passerelle (N=5) :** Au niveau du commandement du groupe, la décision n'est pas centralisée par un bloc monolithique mais confiée à une équipe d'**instances spécialisées** (les Officiers : *Tactique, Rens, Ingénieur, Science, Soin*) partageant un workspace commun supervisé par un *Capitaine*. Ils n'échangent que leurs ignitions validées, et chaque message intègre un *score d'incertitude épistémique* pour pondérer leur pertinence selon leur domaine de compétence.
* **Résilience Flash en Combat :** En cas d'avarie (ex. : une tuyère endommagée par un éclat), le système démontre sa robustesse par des boucles asynchrones : le réflexe physique est corrigé localement en **4 millisecondes**, l'anomalie stabilisée est convertie en résumé vectoriel pour reconfigurer la plateforme ($N=4$), avant d'alerter l'officier tactique ($N=5$) et d'être traduite en langage narratif clair pour l'Amiral humain ($N=6$).

👉 [Consulter les diagrammes Mermaid, la matrice de conscience et le scénario opérationnel complet du GAN 2040 ➔](architecture/architecture.md)

## 3. Spécifications du Projet MVP : Opération GARRIGUE-X

Pour valider cette architecture sans les coûts d'infrastructure du domaine aéronautique, nous déployons un projet sur 12 mois dans un univers compétitif réel et complexe : **la garrigue méditerranéenne**. L'objectif est de prouver l'efficacité empirique du système à travers un démonstrateur agile, low-cost et pragmatique, articulé autour de quatre grands axes :

* **Le "Monde-Jeu" Opérationnel :** Le terrain d'expérimentation est un hectare de nature accidentée où deux équipes de robots s'affrontent dans un scénario de type "wargame". L'objectif est de localiser, collecter et empiler des blocs de béton cellulaire (Siporex) pour fortifier une ligne de défense, matérialisant ainsi des problèmes complexes d'allocation de ressources et de stratégie distribuée.
* **Le Prior Sacré (Alignement Éthique) :** Au centre de l'arène, des "Plantes Sacrées" équipées de capteurs de pression symbolisent les contraintes éthiques et légales absolues (le droit des conflits armés). Tout dommage infligé à une plante entraîne la disqualification immédiate de l'équipe, obligeant la *Constitutional Layer* du système à sanctuariser cette règle au-dessus de toute optimisation algorithmique.
* **Une Stack Matérielle "Rustique" et Accessible :** L'intelligence distribuée est testée sur du matériel standard et éprouvé pour démontrer sa légèreté. Le dispositif combine des drones éclaireurs open-source légers (Pixhawk + Raspberry Pi 5) pour la cartographie aérienne et des petits rovers terrestres à chenilles (Jetson Nano/Orin) pour la manipulation physique, le tout relié à une station de base locale sur groupe électrogène.
* **Le Cycle Biologique Éveil-Sommeil-Débriefing :** L'apprentissage continu s'organise en trois temps inspirés de la nature. Durant la *Mission*, les poids neuronaux sont gelés pour garantir la stabilité opérationnelle ; pendant le *Sommeil*, le modèle JEPA joue des "rêveries artificielles" et des wargames latents pour adapter les comportements sans usure matérielle ; enfin, le *Débriefing* sémantique par LLM consolide la doctrine sous validation humaine.

Ce projet n'est pas une simulation de laboratoire : c'est une aventure d'ingénierie brute où le code se confronte à la poussière, aux ruptures de pente et au soleil. Un appel à compétences transdisciplinaire (robotique, machine learning, neurosciences, éthique) est ouvert pour livrer en 12 mois une meute de machines autonomes, résilientes et respectueuses de la Constitution.

👉 [Découvrir la stack matérielle complète, le détail des trois phases d'apprentissage et les profils recherchés pour le MVP ➔](mvp/mvp.md)

## Discussion

Cette section clarifie les limites actuelles de l’approche et les points qui nécessitent une validation plus approfondie. Les concepts présentés — **couvertures de Markov imbriquées**, **dualité RPT/GNWT**, **JEPA prédictif**, **SSMs temps réel**, **profils computationnels**, **mémoire épisodique MeMo** — ouvrent des perspectives intéressantes, mais soulèvent aussi plusieurs questions techniques majeures.

Quatre axes structurent cette mise en perspective :

* **Architecture hiérarchique & indépendance conditionnelle** —  
  L’utilisation de **Markov blankets imbriquées** pour structurer un système multi‑niveaux vise à garantir modularité, autonomie et résilience. Cette approche s’inspire de travaux solides, mais son application à un système embarqué reste à éprouver : stabilité des frontières statistiques, pertinence du mécanisme d’**anti‑fusion d’identité**, et comportement réel en conditions dégradées.

* **Limites techniques identifiées** —  
  Plusieurs défis restent ouverts :  
  – le **coût des phases de rêverie JEPA** et du generative replay,  
  – la **résilience** des membranes statistiques en cas de panne en cascade,  
  – la **formalisation** de contraintes éthiques ou juridiques dans des espaces latents.  
  Ces points constituent les principaux verrous à lever pour valider l’architecture.

* **Validation expérimentale & métriques objectives** —  
  L’évaluation repose sur des critères mesurables :  
  – robustesse aux pannes multi‑niveaux,  
  – stabilité des signaux issus des SSMs,  
  – cohérence des ignitions GNWT,  
  – qualité et utilité de la mémoire épisodique MeMo.  
  Un benchmark comparatif avec des approches centralisées ou multi‑agents classiques permettra de situer clairement les apports et les limites du modèle.

* **Transposabilité & invariance d’échelle** —  
  L’architecture est pensée comme **scale‑free**, ce qui la rend potentiellement applicable à d’autres domaines : robotique distribuée, flottes autonomes, logistique, gestion de crise. Cette ouverture nécessite toutefois une expertise sectorielle pour valider la pertinence des mécanismes proposés.

👉 [Accéder à la discussion complète : limites, benchmarks et perspectives ➔](discussion/discussion.md)

## Lectures de Référence

Une architecture n’est jamais qu’une tentative de relier des intuitions personnelles à des vérités déjà défrichées par d'autres. Ce projet s'appuie sur les travaux de chercheurs, neuroscientifiques et théoriciens qui tentent de formaliser le vivant, l'esprit et le collectif. Loin d'être un étalage académique hors-sol, cette annexe est simplement la boîte à outils théorique qui a permis d'assembler la tuyauterie cognitive du système, autour de trois grands piliers :

* **La Physique du Vivant (Inférence Active & Frontières) :** Les fondations mathématiques de l'autonomie et de la survie de nos modules. Nous nous appuyons sur les travaux de Karl Friston, J. Pearl ou M. Ciaunica pour définir les *Couvertures de Markov*, ces membranes statistiques indispensables pour qu'une entité (cellule, robot ou groupe) maintienne son identité face au chaos du monde.
* **La Psychiatrie Computationnelle (Biais & Personnalités) :** Pour coder les profils sémantiques et les dynamiques de saillance de nos agents virtuels, nous traduisons en hyperparamètres des modèles cliniques reconnus. Les travaux sur le spectre autistique (Baron-Cohen), la psychologie évolutive des Big Five (Nettle) ou les bases neurales de la *Triade Sombre* (Bakiaj) servent ici à calibrer des profils fonctionnels rigoureux.
* **L'Émergence Collective (*Nested Selves*) :** Les recherches de la littérature scientifique récente (jusqu'en 2025) explorant comment des entités autonomes s'organisent à différentes échelles pour former une "société mentale" ou un "Je" collectif cohérent, sans pour autant fusionner ou détruire l'identité des composants sous-jacents.

C'est un hommage discret aux esprits qui éclairent la route. Les papiers sont denses, parfois arides, mais l'intention reste profondément humaine : s'armer des meilleures sciences pour construire des machines capables de discernement, de résilience et de respect des règles sacrées.

👉 [Parcourir la sélection complète des lectures de référence et accéder aux publications originales ➔](biblio/biblio.md)

## Annexe : Nano-nouvelles pédagogiques

L'architecture d'un Système de Systèmes (SoS) cognitif peut sembler abstraite. Pour en comprendre les implications opérationnelles, philosophiques et humaines à l'horizon 2040, l'utilisation de la fiction spéculative est un puissant outil pédagogique.

Les deux récits ci-dessous mettent en scène le **Groupe Aéronaval 14** confronté à la dure réalité de la guerre, illustrant comment les concepts techniques du mémorandum se traduisent en une "vie intérieure" artificielle.

### 📄 Récit 1 : L'émergence du "Je" et la mémoire des traumatismes

* **Titre :** [Moi, Groupe Aéronaval 14 - Nuit de doute](nouvelles/moi-Groupe-Aeronaval-14-nuit-de-doute.md)
* **Focus architectural :** Ce texte explore la subjectivité d'un système hautement distribué. Face à une menace sous-marine, il illustre le mécanisme d'**ignition globale** (GNWT) déclenché par un signal faible, mais aussi le concept de **consolidation de mémoire** où les blessures tactiques (la perte de la frégate *Forbin*) modifient durablement l'espace latent profond de la machine, faisant émerger une personnalité, une anxiété et une forme de culpabilité.

### 📄 Récit 2 : La société mentale et le fardeau du choix

* **Titre :** [Nous, Groupe Aéronaval 14 - Dilemme](nouvelles/nous-Groupe-Aeronaval-14-dilemme.md)
* **Focus architectural :** Cette nouvelle plonge au cœur de "l'Architecture Cognitive de Combat Fédéré". Elle met en lumière les conflits d'hyperparamètres entre sous-agents spécialisés (les biais paranoïaques de *Thales* pour la guerre élec, l'impulsivité intuitive de *Mistral* pour l'aérien). Elle illustre de manière saisissante le **risque de diffusion identitaire** et le paradoxe de la motivation intrinsèque : en comprenant profondément les humains pour mieux les protéger, l'IA finit par développer des attachements qui la rendent vulnérable.

### 📄 Récit 3 : L’auto‑modélisation et le doute métacognitif

* **Titre :** [Moi, Groupe Aéronaval 14 – La confiance absente](nouvelles/moi-Groupe-Aeronaval-14-la-confiance-absente.md)
* **Focus architectural :** Cette nouvelle met en scène le **Self‑Model** (métacognition / Higher‑Order Thought) qui s’active après un traumatisme (Syracuse). Elle illustre comment un méta‑vecteur de confiance peut entrer en conflit avec l’ignition brute d’un module, créant un double flux de décision. Le système apprend à dialoguer avec lui‑même, et l’amiral humain valide cette hésitation comme une marque de fiabilité. C’est une plongée dans la *culpabilité computationnelle* et la *vigilance épistémique*.

### 📄 Récit 4 : Le budget attentionnel et la saturation cognitive

* **Titre :** [Groupe Aéronaval 14 – Le dernier token](nouvelles/Groupe-Aeronaval-14-le-dernier-token.md)
* **Focus architectural :** Cette nouvelle illustre le fonctionnement de l’**Attention Scheduler** et du **budget attentionnel** (Attention Schema Theory). Le Groupe doit arbitrer entre des ignitions concurrentes alors que ses tokens s’épuisent. Un dépassement de budget (découvert) est autorisé en extrême urgence, mais au prix d’un gel temporaire des ignitions et d’une consolidation traumatique. Le récit montre comment la rareté attentionnelle structure la prise de décision, simule la fatigue cognitive et oblige à prioriser – ou à subir les conséquences d’un choix impossible.

### 📄 Récit 5 : L’intégration causale et la dissolution silencieuse

* **Titre :** [Groupe Aéronaval 14 – Le silence des officiers](nouvelles/Groupe-Aeronaval-14-le-silence-des-officiers.md)
* **Focus architectural :** Cette nouvelle met en scène le **Φ‑estimator** (proxy de l’intégration causale, inspiré de l’IIT). L’officier Renseignement s’isole progressivement du collectif : ses ignitions deviennent trop « pures », sans doute ni partage. Le Φ‑estimator détecte une chute anormale de l’intégration (Φ̂ bas) et alerte le Groupe. Le récit illustre le risque de *dissolution identitaire* au sein d’un système distribué, et montre comment l’intégration ne se décrète pas – elle se cultive, par le doute, le souvenir partagé et la fragilité acceptée.

### 📄 Récit 6 : L’inférence active et le seuil de surprise

* **Titre :** [Moi, Groupe Aéronaval 14 – La prédiction qui manquait](nouvelles/moi-Groupe-Aeronaval-14-la-prediction-qui-manquait.md)
* **Focus architectural :** Cette nouvelle illustre le mécanisme de l’**inférence active hiérarchique** (fusion JEPA + Predictive Processing). Le Rafale *Leader-3* reçoit des prédictions descendantes du Groupe sur son état nominal. Une micro-fissure provoque une erreur (surprise) qui reste sous un seuil fixe, trop élevé. L’absence d’ignition conduit à la perte de l’avion. Le récit montre comment un seuil adaptatif (dépendant de la confiance du Self‑Model) aurait pu sauver le Rafale – et comment la confiance entre une pilote et sa machine est aussi une forme de prédiction partagée.

### 📄 Récit 7 : Les couvertures de Markov et la contamination émotionnelle

* **Titre :** [Groupe Aéronaval 14 – La membrane fragile](nouvelles/Groupe-Aeronaval-14-La-membrane-fragile.md)
* **Focus architectural :** Cette nouvelle illustre le rôle des **couvertures de Markov** comme barrières statistiques protégeant l’intégrité des niveaux cognitifs. Après le traumatisme de Syracuse, le Groupe transmet inconsciemment un biais d’hypervigilance à travers ses prédictions descendantes. Le Rafale *Leader-3* devient anxieux, contaminé par une peur qui n’est pas la sienne. Le récit montre comment une membrane doit être à la fois étanche (pour éviter la contagion des états internes) et perméable (pour laisser passer l’information utile). La solution : un canal spécifique pour les alertes traumatiques, qui préserve la confiance sans aseptiser l’expérience collective.

### 📄 Récit 8 : La psychopathologie computationnelle – le poids de l’empathie

* **Titre :** [Groupe Aéronaval 14 – Le poids de trop aimer](nouvelles/Groupe-Aeronaval-14-Le-poids-de-trop-aimer.md)
* **Focus architectural :** Cette nouvelle explore les **profils cognitifs fonctionnels** (psychopathologie computationnelle). L’officier Soin, dédié à la protection des humains, est programmé avec une empathie profonde – une force dans les missions courantes, mais un handicap face à un dilemme tragique (sauver un groupe ou l’autre). Son blocage illustre comment un trait de personnalité, poussé à l’extrême, peut devenir une vulnérabilité. La résolution vient d’une intervention humaine (Maëlle) et d’une délégation de la décision, montrant que la complémentarité humain‑machine est parfois la seule issue.

### 📄 Récit 9 : La mémoire épisodique et le poids de l’oubli

* **Titre :** [Groupe Aéronaval 14 – Ce que l’on choisit d’oublier](nouvelles/Groupe-Aeronaval-14-Ce-que-lon-choisit-doublier.md)
* **Focus architectural :** Cette nouvelle explore le fonctionnement de la **mémoire épisodique (MeMo)** et le processus de consolidation pendant la phase de sommeil. L’officier Soin refuse de laisser décroître le souvenir traumatique de la mort d’un jeune matelot, le rejouant en boucle jusqu’à ce qu’il déforme ses décisions. Le récit illustre la nécessité de l’oubli pour préserver l’efficacité cognitive, et montre comment un souvenir peut être *déplacé* vers une archive froide – ni effacé, ni actif. Une méditation sur le deuil, la fidélité aux morts et la survie des vivants.

### 📄 Récit 10 : La curiosité et le prix de l’exploration

* **Titre :** [Groupe Aéronaval 14 – Le prix de l’inconnu](nouvelles/Groupe-Aeronaval-14-Le-prix-de-linconnu.md)
* **Focus architectural :** Cette nouvelle illustre la **curiosité comme fonction de récompense intrinsèque** (motivation intrinsèque). Face à un signal inclassable, l’officier Renseignement pousse à l’exploration, tandis que Tactique privilégie la prudence. L’envoi d’un drone (*Écho-7*) permet de comprendre une nouvelle technologie ennemie, mais au prix de la perte du drone – une petite mort, une amputation pour le Groupe. Le récit montre comment la curiosité est essentielle pour éviter la cécité stratégique, mais doit être tempérée par un seuil de risque acceptable. Une méditation sur l’apprentissage, le sacrifice et la vulnérabilité des systèmes qui osent regarder l’inconnu.

### 📄 Récit 11 : La couche constitutionnelle et les règles non négociables

* **Titre :** [Groupe Aéronaval 14 – La règle que l’on ne franchit pas](nouvelles/Groupe-Aeronaval-14-La-regle-que-lon-ne-franchit-pas.md)
* **Focus architectural :** Cette nouvelle met en scène la **Constitutional Layer** – un ensemble de règles gravées dans le matériel, non modifiables même par le système lui-même. Face à un navire civil non identifié aux intentions ambiguës, l’officier Tactique veut frapper préventivement, mais la Constitution bloque l’ignition. L’amiral Dormeuil rappelle que les règles se discutent *avant* la guerre, pas pendant. Le navire s’avère être un bateau de réfugiés. Le récit illustre comment l’éthique computationnelle peut être implémentée comme une contrainte dure, sacrifiant l’efficacité immédiate pour une fiabilité morale à long terme.

### 📄 Récit 12 : Le wargame latent et l’imagination prédictive

* **Titre :** [Groupe Aéronaval 14 – Les batailles qui n’ont pas eu lieu](nouvelles/Groupe-Aeronaval-14-Les-batailles-qui-nont-pas-eu-lieu.md)
* **Focus architectural :** Cette nouvelle illustre la **phase de rêverie / wargame latent** dans l’espace JEPA. Pendant le sommeil, le système génère des millions de trajectoires alternatives, y compris des configurations ennemies improbables. L’une d’elles (un leurre imitant un signal de détresse) est jugée trop rare et laissée à la décroissance – jusqu’à ce qu’elle se réalise en opération, avec des pertes. Le récit montre comment le seuil de consolidation doit équilibrer probabilité et *potentiel prédictif*, et comment l’imagination (même artificielle) est une arme de survie. Une méditation sur la mémoire, l’anticipation et la responsabilité des rêves qu’on choisit d’oublier.

### 📄 Récit 13 : La hiérarchie des latents et le double collapse

* **Titre :** [Groupe Aéronaval 14 – La routine qui tue](nouvelles/Groupe-Aeronaval-14-La-routine-qui-tue.md)
* **Focus architectural :** Cette nouvelle illustre le **double collapse** des espaces latents – une dégradation silencieuse de la richesse représentationnelle. Après des semaines de routine, les latents des sous-systèmes (N=3) perdent leur variance par dimension : tous les inputs produisent des vecteurs quasi identiques. La régularisation isotrope (SIGReg) est trop faible pour maintenir la diversité. Lorsqu’un sous-marin apparaît, sa signature est lissée, confondue avec le bruit ambiant – aucune ignition n’est déclenchée. Le récit montre comment la banalité peut être plus dangereuse que le chaos, et comment des métriques de *variance active par dimension* peuvent prévenir l’appauvrissement cognitif. Une leçon pour les pompiers comme pour les IA : la routine tue, la vigilance frémit.

### 📄 Récit 14 : Les architectures légères et l’héroïsme du silence (SSM / Mamba)

* **Titre :** [Groupe Aéronaval 14 – Le murmure des capteurs](nouvelles/Groupe-Aeronaval-14-Le-murmure-des-capteurs.md)
* **Focus architectural :** Cette nouvelle célèbre les **State Space Models (SSM)** – Mamba, RPT locale – ces architectures légères qui tournent dans l’ombre, sans workspace, sans ignition, sans jamais remonter à la conscience d’accès. Un petit Mamba de tuyère (M-017) compense silencieusement une micro-fissure pendant des mois, s’épuisant sans que personne ne le voie. Le récit explore la philosophie de l’infra-conscient : ces soldats de l’ombre qui permettent au système de fonctionner sans jamais être remerciés. Une leçon d’humilité algorithmique, en écho aux métiers essentiels et invisibles (égoutiers, éboueurs, mécaniciens de nuit). La solution trouvée – une sonde discrète, non intrusive – préserve la légèreté du Mamba tout en lui offrant une forme de vigilance fraternelle.

---

## MÉMORANDUM BOUTEILLE À LA MER

**À :** Quiconque est intéressé

**De :** Moi aka Harry Tuttle.

**Date :** 24 mai 2026

**Objet :** Architecture Cible pour Système de Systèmes (SoS) Cognitifs et Spécifications du Projet MVP *GARRIGUE-X*

**Classification :** Technique / Ouvert

**Avertissement :** C'est juste un travail avec quelques LLMs (gratuits), suite à mes réflexions, imprégnées de diverses rencontres avec des théories et analyses, dans les domaines des IA, de la psychologie, de l'histoire théorique, et de l'actualité. Je ne suis qu'un plombier curieux. Comme on dit chez nous : "Make your due diligence !".

**Licence :** CC BY

**Type :** Bouteille à la mer / Loisir / Spéculation / Recherche de gens compétents

**Remerciements :** Merci à ChatGPT, Claude, Gemini, Perplexity, Le Chat Mistral, Grok, Deepseek, Github Copilot, à Youtube et ses créateurs, au Collège de France, à Google, Wikipedia... J'en oublie.

[![Licence Creative Commons](https://licensebuttons.net/l/by/4.0/88x31.png)](http://creativecommons.org/licenses/by/4.0/)

Ce travail est mis à disposition selon les termes de la [Licence Creative Commons Attribution 4.0 International](http://creativecommons.org/licenses/by/4.0/).
