Voici la synthèse complète et définitive. Ce document est conçu pour être **autonome** : vous pouvez le copier tel quel dans votre dépôt sous `00_Meta/MODE_EMPLOI.md`, le relire dans six mois, ou l'adapter à un tout autre projet. Il contient l'intégralité de la méthode qui a émergé de nos échanges.

---

# 📘 MODE D'EMPLOI COMPLET
## Système Agentique Zettelkasten en Double Hélice
### *Méthode du Romancier-Ingénieur*

---

## 0. PHILOSOPHIE & VISION

### Le Constat de Départ
Un projet ambitieux qui mêle recherche technique de pointe, vision architecturale à 20 ans, et volonté de transmettre ne peut pas être géré comme un projet logiciel classique (backlog linéaire, sprints, livrables figés). Il ne peut pas non plus être traité comme une œuvre de fiction pure (inspiration libre, pas de contraintes). Il est **les deux à la fois**, et c'est cette tension qui fait sa force.

### La Double Hélice
Le projet s'organise autour de deux brins d'ADN entrelacés. Chaque brin a un but distinct, mais ils sont reliés par des "ponts" (les atomes Zettelkasten).

| Brin | Nom | Horizon | But | Nature | Exemple |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **A** | **Mythos** | 20-50 ans | Inspirer, faire rêver, explorer les limites, recruter | Fiction dramatique, architecture mythique, "thought experiments" extrêmes | Le GAN-14, la saga de guerre future, les nanonouvelles |
| **B** | **Logos** | 6-18 mois | Prouver, enseigner, crédibiliser, agir | Plateforme technique, MVP, expérimentations tangibles | Garrigue-X, robots, simulations, code |

**Règle fondamentale** : Aucun brin ne doit vivre sans l'autre. Un concept technique (`C-`) sans nouvelle (`N-`) qui l'incarne est un concept mort. Une nouvelle sans principe (`P-`) ni expérimentation (`E-`) qui la fonde est de la fantasy, pas de la science-fiction.

### L'Identité du Créateur
Vous êtes un **Romancier-Ingénieur**. Comme Asimov, vous écrivez une saga où chaque concept technique est un personnage, chaque MVP est un chapitre, et chaque principe architectural est une loi de l'univers. Le "worldbuilding" n'est pas une distraction : c'est l'outil de conception.

---

## 1. LES 5 LIVRABLES CIBLES

Tout travail doit nourrir l'un de ces 5 piliers. Si une activité ne contribue à aucun d'eux, elle est du bruit.

| # | Livrable | Format | Source (Atomes) | Public |
| :--- | :--- | :--- | :--- | :--- |
| 1 | **Le Codex Conceptuel** (Zettelkasten) | Notes Markdown interconnectées | `C-`, `P-`, `A-`, `L-`, `R-` | Vous, collaborateurs, curieux |
| 2 | **Le Livre Blanc Architectural** | Document de synthèse vivant | `C-`, `P-`, `A-`, `R-` | Labs de recherche, décideurs |
| 3 | **L'Anthologie des Nanonouvelles** | Recueil de fictions courtes | `N-`, `W-`, `K-` | Grand public, étudiants |
| 4 | **Le Kit de Validation MVP** | Code, simulations, règles du jeu | `E-`, `A-`, `P-` | Réseau immédiat, écoles, clubs |
| 5 | **Le Méta-Système Agentique** | Prompts, scripts, workflows | Tous | Vous (automatisation) |

---

## 2. LA TYPOLOGIE COMPLÈTE DES ATOMES (9 TYPES)

Chaque idée, décision, élément de décor ou critique doit être découpé en **un seul fichier Markdown**, nommé avec un préfixe strict. C'est le cœur du Zettelkasten.

### Atomes de Fond (Techniques & Conceptuels)

| Code | Type | Description | Exemple |
| :--- | :--- | :--- | :--- |
| **`C-`** | **Concept** | Une idée théorique unique, indivisible et définie. Neutre (nourrit Mythos et Logos). | `C-Markov_Blanket_Isolation.md` |
| **`P-`** | **Principe / Exigence** | Une règle non-négociable, une "plante sacrée", une contrainte constitutionnelle. | `P-Identity_Impermeability.md` |
| **`A-`** | **Architecture / Décision** | Un choix d'ingénierie tranché (ADR) qui respecte un ou plusieurs `P-`. | `A-Stack_N3_Mamba.md` |
| **`L-`** | **Limite / Critique** | Un angle mort, une vulnérabilité, une dette technique ou théorique. | `L-Inhibitory_Attention_Deficit.md` |
| **`R-`** | **Référence** | Un ancrage externe : papier, auteur, théorie, lien URL. | `R-Friston_2010_Free_Energy.md` |

### Atomes de Surface (Narratifs & Décoratifs)

| Code | Type | Description | Exemple |
| :--- | :--- | :--- | :--- |
| **`N-`** | **Narratif / Scénario** | Une micro-fiction (1-5 pages) illustrant la dynamique d'un concept ou d'un principe. | `N-Story_4_The_Last_Token.md` |
| **`W-`** | **World / Setting** | Un élément de décor : lieu, matériel, technologie diégétique, époque. | `W-Rafale_M_Stealth.md`, `W-Marne_Valley_Campus.md` |
| **`K-`** | **Kin / Character** | Un personnage, un équipage, une faction, une entité agentique. | `K-Admiral_Thessalos.md` |

### Atomes de Preuve (Logos)

| Code | Type | Description | Exemple |
| :--- | :--- | :--- | :--- |
| **`E-`** | **Expérimental / MVP** | Une hypothèse testable concrètement dans un délai de 6-18 mois. | `E-Jetson_Sleep_Cycle.md` |

### Règles de Nommage
- **Langue** : Les noms de fichiers et les liens `[[ ]]` sont **toujours en ANGLAIS**.
- **Format** : `Code-Mots_Cles_Separes_Par_Underscore.md`
- **Unicité** : Un atome = Une idée. Si une note aborde deux sujets, elle doit être scindée.

### Règle de Création des Atomes de Décor (`W-` et `K-`)
**Ne créez un atome `W-` ou `K-` QUE lorsqu'une nouvelle (`N-`) ou un MVP (`E-`) en a concrètement besoin.** Pas avant. Cela évite le piège du "worldbuilding procrastinateur".

---

## 3. STRUCTURE DU DÉPÔT GIT

Organisation plate, optimisée pour Obsidian, VS Code, et les liens Markdown natifs.

```text
NOM_DU_PROJET/
│
├── 00_Meta/                       ← MÉTA-SYSTÈME (en français, pour vous)
│   ├── MODE_EMPLOI.md             ← Ce document
│   ├── Ontology_FR_EN.md          ← Glossaire bilingue validé (source de vérité)
│   ├── Ontology_Pending.md        ← Propositions de termes en attente de validation
│   └── STORY_BIBLE.md             ← Canon minimal du Mythos (2 pages max)
│
├── 00_Inbox/                      ← CAPTURE BRUTE (en français, non structuré)
│   └── vrac_du_jour.md            ← Idées en vrac, notes vocales, emails
│
├── 10_Atoms/                      ← CŒUR ZETTELKASTEN (en anglais, nommés par code)
│   ├── C_Concepts/
│   ├── P_Principles/
│   ├── A_Architecture/
│   ├── L_Limits/
│   ├── E_Experiments/
│   ├── N_Narratives/
│   ├── W_World/
│   ├── K_Kin/
│   └── R_References/
│
├── 20_Mythos/                     ← VUES D'ENSEMBLE DU RÊVE (MOC = Maps of Content)
│   ├── MOC_Universe.md            ← Index de l'univers fictionnel
│   ├── MOC_Saga_Arc.md            ← Arc narratif principal
│   └── Manifesto_Inspiration.md   ← Compilation pour "faire rêver"
│
├── 30_Logos/                      ← VUES D'ENSEMBLE DU RÉEL
│   ├── MOC_Roadmap_MVP.md         ← Backlog technique dérivé des E- et A-
│   ├── MOC_Tech_Stack.md          ← Vue d'ensemble des choix techniques
│   └── Specifications.md          ← Cahier des charges dérivé des P-
│
├── 40_Bridges/                    ← PONT ENTRE MYTHOS ET LOGOS
│   ├── Bridge_Concept_To_MVP.md   ← Ex: Comment C-Markov_Blanket guide E-Sleep_Cycle
│   └── White_Paper_Draft.md       ← Généré par l'Agent Synthétiseur
│
├── 50_Sources/                    ← IMPORTS BRUTS
│   ├── PDFs/
│   └── Raw_Imports/
│
└── 99_Agents/                     ← OUTILLAGE AGENTIQUE
    ├── Prompts/                   ← Prompts système de chaque agent
    ├── Scripts/                   ← Scripts Python (Niveau 2+)
    └── Logs/                      ← Traces d'exécution
```

---

## 4. L'ÉQUIPE AGENTIQUE (5 RÔLES)

Vous êtes le **Rédacteur en Chef (Human-in-the-Loop)**. Les agents ne décident jamais seuls. Ils **proposent**, vous **validez, corrigez ou rejetez**.

### 🤖 Agent 1 : Le Botaniste (Extracteur & Atomiseur)
| | |
| :--- | :--- |
| **Déclencheur** | Nouveau texte dans `00_Inbox/` ou dans le chat |
| **Mission** | Découper le texte brut en atomes selon la typologie (9 types). Proposer le nom de fichier en anglais, le contenu en anglais, et le tag `#Mythos` ou `#Logos`. |
| **Consigne stricte** | Un seul concept par atome. Extraire les métadonnées (source, date, statut : *draft, validated, obsolete*). |
| **Livrable** | Blocs de code Markdown prêts à copier-coller dans `10_Atoms/`. |

### 🤖 Agent 2 : Le Tisserand (Cartographe des Liens)
| | |
| :--- | :--- |
| **Déclencheur** | Nouveaux atomes créés |
| **Mission** | Analyser sémantiquement les atomes pour détecter les relations. Chercher activement les ponts entre Mythos et Logos. |
| **Types de liens** | `[[resolves]]` (un A- résout un L-), `[[illustrates]]` (un N- illustre un C-), `[[threatens]]` (un L- menace un P-), `[[tests]]` (un E- teste un P-), `[[features]]` (un N- met en scène un W- ou K-), `[[contradicts]]`, `[[nuances]]` |
| **Livrable** | Mise à jour des liens `[[ ]]` dans les fichiers. Signalement des "atomes orphelins" (sans lien). |

### 🤖 Agent 3 : L'Avocat du Diable (Gardien de la Tension)
| | |
| :--- | :--- |
| **Déclencheur** | Revue hebdomadaire ou à la demande |
| **Mission** | Détecter les dérives dans les deux sens. *Dérive Mythos* : "Cette nouvelle viole le principe P-Latence." *Dérive Logos* : "Cette décision technique tue l'élégance du concept." |
| **Livrable** | Rapport de "Tensions à résoudre" avec 3 propositions d'ajustement par tension. |

### 🤖 Agent 4 : Le Lexicographe (Gardien de l'Ontologie)
| | |
| :--- | :--- |
| **Déclencheur** | Nouveau terme détecté (réactif) ou scan hebdomadaire (proactif) |
| **Mission** | Détecter les termes importants non répertoriés. Proposer des traductions FR→EN cohérentes. Maintenir `Ontology_FR_EN.md`. |
| **Livrable** | Fiches de proposition dans `Ontology_Pending.md`. Mises à jour du glossaire maître après validation. |

### 🤖 Agent 5 : Le Synthétiseur (Générateur de Livrables)
| | |
| :--- | :--- |
| **Déclencheur** | Demande explicite ("Génère le draft du Livre Blanc") |
| **Mission** | Assembler les atomes validés pour produire des livrables externes sans rédaction manuelle. |
| **Livrable** | Drafts de Livre Blanc, Roadmap MVP, Anthologie, Pitch de recrutement. |

---

## 5. LE PROCESSUS D'ONTOLOGIE VIVANTE (BILINGUE)

### Principe : "Penser en Français, Publier en Anglais"
Vous raisonnez, discutez et capturez en français (votre langue de puissance cognitive). Les atomes, les liens et les livrables publics sont en anglais (votre langue de diffusion).

### La Boucle en 4 Étapes

```
[Détection] → [Proposition] → [Négociation] → [Ratification & Propagation]
```

**Étape 1 — Détection** : Vous écrivez en français. L'Agent Lexicographe repère un terme important absent du glossaire.

**Étape 2 — Proposition** : L'agent crée une fiche dans `00_Meta/Ontology_Pending.md` :
> **Proposition #N**
> - **Terme FR** : "Sommeil génératif"
> - **Contexte** : Utilisé dans N-Story_4 et E-Jetson_Sleep_Cycle
> - **Proposition EN** : "Generative Replay" (technique) OU "Consolidating Reverie" (littéraire)
> - **Recommandation** : "Generative Replay" pour E- et A-, "Consolidating Reverie" pour N- et C-
> - **Statut** : ⏳ En attente

**Étape 3 — Négociation** : Vous lisez la proposition. Vous pouvez :
- ✅ Valider tel quel
- ✏️ Corriger ("Non, utilise 'Dreaming Phase'")
- 🔍 Demander une recherche bibliographique à l'agent pour trancher

**Étape 4 — Ratification & Propagation** : Une fois validé, l'agent :
1. Déplace le terme dans `Ontology_FR_EN.md` (source de vérité).
2. Propose un "commit de refactorisation" pour mettre à jour rétroactivement les anciens fichiers qui utilisaient des termes approximatifs.

---

## 6. LA MÉTHODE D'INITIALISATION EN 3 COUCHES

Ne cherchez pas à tout définir avant de commencer. Procédez par sédimentation.

### 🟦 Couche 1 : La Story Bible (Le Canon Minimal)
**Un seul fichier** : `00_Meta/STORY_BIBLE.md`. **Deux pages maximum.** C'est le "contrat" avec l'univers, contenant les faits non-négociables.

*Structure type :*
- **Époque & Contexte** : Quand, où, pourquoi.
- **Entité Centrale** : Le GAN-14 (ou équivalent), sa nature, sa mission.
- **Matériel Canonique** : Les 5-10 éléments de décor intouchables (Rafale, porte-avions, etc.).
- **Géographie du Conflit** : Le théâtre d'opérations.
- **Inspiration Historique** : L'analogie antique ou historique (guerres puniques, etc.).
- **Règle Narrative d'Or** : La contrainte de réalisme (ex: "Aucune magie, toute technologie justifiable par un papier existant").
- **Géographie du Réel (Logos)** : Le lieu physique du MVP (ex: campus de Marne-la-Vallée, terrain d'expérimentation).

**Ce fichier est vivant mais rarement modifié.** Chaque modification est un événement majeur.

### 🟩 Couche 2 : Les Atomes de Décor (Worldbuilding à la Demande)
Créez les atomes `W-` (World) et `K-` (Kin) **uniquement quand une nouvelle ou un MVP en a besoin**. Ne faites pas de worldbuilding spéculatif à vide.

### 🟥 Couche 3 : Les Atomes Techniques (Le Cœur Indépendant)
Les atomes `C-`, `P-`, `A-`, `L-`, `E-` sont **indépendants du décor**. Le concept de "Couverture de Markov" fonctionne quel que soit l'univers fictionnel. C'est cette indépendance qui rend le système robuste : le décor peut évoluer, la technique reste.

---

## 7. LE FLUX DE TRAVAIL QUOTIDIEN

### Niveau 1 : Chat + Éditeur (Recommandé pour démarrer)
*Aucun script à installer. Zéro friction.*

```
1. CAPTURE (Vous, en FR)
   → Écrivez votre idée brute dans le chat ou dans 00_Inbox/
   
2. ATOMISATION (Agent 1 & 2, en EN)
   → L'agent retourne des blocs Markdown :
     - Nom de fichier en anglais (ex: C-Markov_Blanket.md)
     - Contenu en anglais (Définition, Tags, Liens [[ ]])
     - Tag #Mythos ou #Logos
   
3. VALIDATION (Vous)
   → Lisez la proposition.
   → Si la nuance anglaise ne convient pas, corrigez en français dans le chat.
   → Copiez le bloc, créez le fichier dans votre éditeur (VS Code / Obsidian).
   
4. COMMIT (Vous)
   → git add, git commit. L'historique Git est votre trace de décision.
```

### Niveau 2 : Script Python Local (Semi-automatisation, plus tard)
Un script lit `00_Inbox/`, envoie le texte à un LLM via API, et crée automatiquement les fichiers `.md` dans `10_Atoms/`. Vous ne faites plus que de la relecture.

### Niveau 3 : Écosystème Obsidian (Visualisation, plus tard)
Votre repo Git ouvert dans Obsidian avec les plugins "Text Generator" et "Smart Connections". Visualisation du graphe de connaissances en temps réel.

### ⚠️ Règle Absolue
**Ne développez jamais d'interface graphique personnalisée.** L'outil ne doit pas devenir le projet. Votre valeur est dans les concepts et les récits, pas dans l'outillage.

---

## 8. LE MODÈLE DE RECRUTEMENT & COLLABORATION ("Asimov Appliqué")

Pour convaincre des élèves, des passionnés ou des collègues de travailler sur des projets difficiles de 6-18 mois :

1. **Présentez la Saga** (15 min) : Le rêve, le Mythos, les enjeux. Ils s'identifient émotionnellement.
2. **Montrez le Codex** : Le Zettelkasten prouve que c'est rigoureux, documenté, vivant.
3. **Proposez des "Briques Jouables"** : Chaque atome `E-` est un mini-projet autonome de 6-12 mois qui s'insère dans la grande architecture.
4. **Chaque participant "adopte" un atome `E-`** et devient **co-auteur de sa propre nanonouvelle** (`N-`) qui l'illustre. Il n'est plus un exécutant, il est co-auteur de la Saga.
5. **À la fin du cycle** : Vous avez un recueil publié (*"Chroniques du GAN-14 — Saison 1"*) + des MVP techniques validés.

---

## 9. LES 5 RÈGLES D'OR

| # | Règle | Pourquoi |
| :--- | :--- | :--- |
| 1 | **Un seul dépôt, une seule vérité** | Pas de repo séparé pour le français. Le français reste dans l'Inbox et les discussions. Le dépôt public est en anglais. |
| 2 | **Un atome = Une idée** | Si une note aborde deux sujets, scindez-la. La modularité est la condition de la réutilisabilité. |
| 3 | **L'outil n'est pas le projet** | Résistez à la tentation de coder une app de gestion. Utilisez Chat + Éditeur. |
| 4 | **Le décor suit le récit, pas l'inverse** | Ne créez un atome `W-` ou `K-` que quand une histoire ou un test en a besoin. |
| 5 | **Toute fiction doit être falsifiable** | Si une nouvelle (`N-`) viole un principe (`P-`), c'est soit la fiction qu'il faut corriger, soit le principe qu'il faut affiner. La tension est productive. |

---

## 10. PLAN DE DÉMARRAGE (4 SEMAINES)

| Semaine | Action | Livrable |
| :--- | :--- | :--- |
| **S1** | Rédiger la Story Bible (2 pages max). Lister les 5-10 faits non-négociables du Mythos et du Logos. | `00_Meta/STORY_BIBLE.md` |
| **S2** | Initialiser l'ontologie bilingue avec les 10-15 concepts clés. Créer `Ontology_FR_EN.md` et `Ontology_Pending.md`. | `00_Meta/Ontology_FR_EN.md` |
| **S3** | Créer les 10 premiers atomes techniques (`C-`, `P-`, `A-`) à partir du README existant. Créer 3-5 atomes de décor (`W-`, `K-`) à partir des nouvelles existantes. | `10_Atoms/` peuplé |
| **S4** | Prendre une nouvelle existante (`N-`), identifier tous les atomes qu'elle mobilise, créer l'atome `E-` correspondant pour le MVP. Premier pont Mythos↔Logos. | `40_Bridges/` initié |

---

## 11. RÉFÉRENCE RAPIDE : QUI FAIT QUOI ?

| Vous voulez... | Demandez à l'agent... | Phrase type |
| :--- | :--- | :--- |
| Découper un texte en atomes | Botaniste | *"Atomise ce texte selon le Mode d'Emploi."* |
| Trouver des liens entre atomes | Tisserand | *"Quels liens proposes-tu pour ces nouveaux atomes ?"* |
| Détecter des incohérences | Avocat du Diable | *"Stress-teste mes dernières nouvelles face aux principes."* |
| Traduire / standardiser un terme | Lexicographe | *"Nouveau terme détecté : 'rêverie consolidante'. Propose une entrée."* |
| Générer un document de synthèse | Synthétiseur | *"Génère un draft de Livre Blanc à partir des atomes P- et A-."* |

---

*Ce document est la Constitution de votre projet. Il est vivant : modifiez-le quand la méthode évolue, mais chaque modification doit être un choix conscient, pas une dérive.*

**Bonne écriture, Romancier-Ingénieur.** 🚀