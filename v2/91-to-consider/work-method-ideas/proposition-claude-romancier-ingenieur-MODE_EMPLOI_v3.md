# 📘 Mode d'Emploi v3 : Système Éditorial Zettelkasten — "Romancier-Ingénieur"

*Document de référence à sauvegarder sous `00_Meta/MODE_EMPLOI.md`*

*Cette version 3 conserve intégralement l'architecture documentaire de la v2 (typologie des atomes, double hélice, structure du dépôt). Elle change deux choses : elle sépare clairement les **agents éditoriaux** (qui produisent ou critiquent du contenu) de **l'infrastructure de contexte** (qui alimente ces agents), et elle indique quand construire cette infrastructure plutôt que de la construire trop tôt.*

---

## 0. L'Identité du Projet : Le Romancier-Ingénieur

Ce projet n'est ni un projet technique habillé de fiction, ni un roman illustré de schémas. C'est une **saga à la Asimov**, où chaque concept technique est un personnage, chaque MVP est un chapitre, et chaque nanonouvelle est une porte d'entrée autonome dans l'univers.

**La posture de travail** : Vous êtes un romancier-ingénieur. Vous écrivez comme un romancier (par scènes, par personnages, par tensions), mais vous construisez comme un ingénieur (par principes, par tests, par décisions tracées).

**Le modèle Asimov** : Fondation n'a pas été écrit d'un bloc. C'est une série de nouvelles indépendantes, rassemblées ensuite, avec des chapitres de liaison ajoutés. Vos nanonouvelles sont vos "nouvelles d'Analog Magazine". Le GAN-14 est votre Empire Galactique. Garrigue-X est la psychohistoire : la théorie rigoureuse qui sous-tend le récit.

---

## 1. La Vision : La Double Hélice

Le projet suit deux brins entrelacés, reliés par des "ponts" (les atomes Zettelkasten) :

| Brin | Nom | Horizon | But | Nature |
| :--- | :--- | :--- | :--- | :--- |
| **Mythos** | GAN-14 (Groupe Aéronaval 14) | 2040+ | Inspirer, faire rêver, attirer des talents, explorer les limites | Fiction dramatique, architecture mythique, thought experiments |
| **Logos** | Garrigue-X (MVP) | 12 mois | Prouver, enseigner, crédibiliser, agir | Plateforme technique, robots/simulation, démonstrations tangibles |
| **Ponts** | Le Zettelkasten | Permanent | Relier le rêve au réel | Atomes interconnectés (un concept → une nouvelle + un test) |

**Règle d'or** : Le décor peut changer, la technique reste. Le concept de "Couverture de Markov" fonctionne que le GAN-14 soit en Méditerranée ou dans la ceinture d'astéroïdes.

---

## 2. Les 5 Livrables Cibles

Tout travail doit nourrir l'un de ces 5 piliers. Rien d'autre.

| # | Livrable | Format | Public | Alimenté par |
| :--- | :--- | :--- | :--- | :--- |
| 1 | **Le Codex Conceptuel** | Notes Markdown interconnectées (Zettelkasten) | Vous, collaborateurs, curieux | Tous les atomes |
| 2 | **Le Livre Blanc Architectural** | Document de synthèse vivant | Labs de recherche, décideurs | `C-`, `P-`, `A-`, `R-` |
| 3 | **L'Anthologie des Nanonouvelles** | Recueil de micro-fictions | Grand public, étudiants, recrues | `N-`, `W-`, `K-` |
| 4 | **Le Kit de Validation MVP** | Code, simulations, règles du jeu | Réseau immédiat, écoles, clubs | `E-`, `A-`, `P-` |
| 5 | **Le Méta-Système Éditorial** | Prompts, scripts, workflows | Vous (outillage interne) | `99_Agents/` |

---

## 3. La Typologie des Atomes (9 Types)

Chaque idée = un seul fichier Markdown, nommé avec un préfixe strict. **Noms de fichiers et liens `[[ ]]` toujours en ANGLAIS.**

| Code | Type | Hélice | Rôle | Exemple |
| :--- | :--- | :--- | :--- | :--- |
| **`C-`** | Concept | Neutre | Idée théorique unique, indivisible, définie | `C-Markov_Blanket_Isolation.md` |
| **`P-`** | Principe / Exigence | Neutre | Règle non-négociable ("plante sacrée") | `P-Identity_Impermeability.md` |
| **`A-`** | Architecture / Décision | Logos | Choix d'ingénierie tranché (ADR) | `A-Stack_N3_Mamba.md` |
| **`L-`** | Limite / Critique | Neutre | Angle mort, vulnérabilité, dette | `L-Inhibitory_Attention_Deficit.md` |
| **`E-`** | Expérimental / MVP | Logos | Hypothèse testable concrètement | `E-Jetson_Sleep_Cycle.md` |
| **`N-`** | Narratif / Scénario | Mythos | Micro-fiction illustrant un concept | `N-Story_4_The_Last_Token.md` |
| **`W-`** | World / Setting | Mythos | Élément de décor, matériel, lieu | `W-Rafale_M_Stealth.md` |
| **`K-`** | Kin / Character | Mythos | Personnage, équipage, faction | `K-Admiral_Thessalos.md` |
| **`R-`** | Référence | Neutre | Ancrage externe (papier, auteur) | `R-Friston_2010_Free_Energy.md` |

**Règle de création des `W-` et `K-`** : Un atome de décor ou de personnage ne se crée **QUE** quand une nouvelle (`N-`) ou un MVP (`E-`) en a besoin. Pas avant. Éviter le "worldbuilding procrastinateur".

---

## 4. Les 3 Couches d'Initialisation (Mythos)

Ne pas tout définir d'un coup. Procéder par sédiments :

### 🟦 Couche 1 : La Story Bible (Le Canon Minimal)
- **Un seul fichier** : `20_Mythos_GAN14/STORY_BIBLE.md`
- **2 pages maximum**
- Contient les faits **non-négociables** : époque, nom du groupe, commandant, matériel canonique, géographie du conflit, règle narrative d'or ("aucune magie, toute technologie justifiable")
- **Rarement modifié.** C'est la "Constitution du Mythos".

### 🟩 Couche 2 : Les Atomes de Décor (Worldbuilding à la demande)
- Atomes `W-` et `K-` créés **uniquement quand un récit ou un test en a besoin**
- Ex : vous écrivez une scène avec un Rafale → vous créez `W-Rafale_M_Stealth.md` à ce moment-là

### 🟥 Couche 3 : Les Atomes Techniques (Le Cœur du Logos)
- Atomes `C-`, `P-`, `A-`, `L-`, `E-`
- **Indépendants du décor**
- C'est cette indépendance qui rend le système puissant

### 🟪 Couche 4 : Les Guides d'Écriture (Le Comment)
- Deux fichiers de référence, distincts de la Story Bible car ils ne portent pas sur le *canon* mais sur la *manière d'écrire* :
  - `20_Mythos_GAN14/CHARTE_STYLISTIQUE.md` — voix, ton, structure en 5 temps, règles de rédaction d'une nanonouvelle
  - `20_Mythos_GAN14/GUIDE_CONTINUITE.md` — bible des latents (état du Self-Model du GAN-14), mapping concept-émotion, arc fractal en 3 actes, règles d'expansion
- Ces deux fichiers ne sont **jamais dupliqués dans le corps du Mode d'Emploi** : c'est le principe même du Zettelkasten (une idée, un fichier). Voir §7 pour comment ils s'articulent avec les agents.

---

## 5. Structure du Dépôt Git

```text
GNWT-Garrigue-X/
├── 00_Meta/                       ← Constitution du projet
│   ├── MODE_EMPLOI.md             ← Ce document
│   ├── Ontology_FR_EN.md          ← Glossaire bilingue validé (source de vérité)
│   └── Ontology_Pending.md        ← Propositions terminologiques en attente
├── 00_Inbox/                      ← Capture brute (idées en vrac, en français)
├── 10_Atoms/                      ← CŒUR DU SYSTÈME (tout en anglais, nommé par code)
│   ├── C_Concepts/
│   ├── P_Principles/
│   ├── A_Architecture/
│   ├── L_Limits/
│   ├── E_Experiments/
│   ├── N_Narratives/
│   ├── W_World/
│   ├── K_Kin/
│   └── R_References/
├── 20_Mythos_GAN14/               ← Le rêve
│   ├── STORY_BIBLE.md             ← Le canon minimal (2 pages)
│   ├── CHARTE_STYLISTIQUE.md      ← Le "comment écrire" une nanonouvelle
│   ├── GUIDE_CONTINUITE.md        ← Bible des latents, arc fractal, mapping concept-émotion
│   ├── MOC_Universe.md            ← Map of Content : index des nouvelles, personnages
│   └── Manifesto.md               ← Compilation narrative pour "faire rêver"
├── 30_Logos_GarrigueX/            ← Le réel
│   ├── MOC_Roadmap.md             ← Backlog technique dérivé des E- et A-
│   └── Specifications.md          ← Cahier des charges dérivé des P-
├── 40_Bridges/                    ← Le liant
│   ├── White_Paper_Draft.md       ← Généré par l'Agent Synthétiseur
│   └── Concept_to_MVP_Maps.md     ← Comment chaque C- guide un E-
├── 50_Sources/                    ← PDFs, articles, imports bruts
└── 99_Agents/                     ← Prompts système, scripts Python, logs
    └── archiviste.py              ← N'existe qu'à partir du seuil défini en §6
```

---

## 6. L'Infrastructure de Contexte : L'Archiviste

**Changement principal par rapport à la v2.** L'Archiviste n'est pas un septième agent éditorial qu'on invoque par une formule (« Agis en Archiviste... »). C'est un **composant technique** : il ne rédige rien, il ne juge rien, il récupère et assemble le contexte que les agents du §7 vont ensuite utiliser. Le confondre avec un agent éditorial était l'ambiguïté de la proposition « Hermes ».

### Pourquoi ce composant existe
Au-delà d'une cinquantaine à une centaine d'atomes, préparer manuellement le contexte d'une requête (Story Bible + charte + glossaire + atomes liés) devient plus long que la tâche elle-même. C'est le point de friction identifié précédemment : le Niveau 1 (copier-coller) fonctionne bien tant que le dépôt est petit, mal au-delà.

### Quand le construire — **pas avant**
Ne construisez pas l'Archiviste en semaine 1. Construisez-le **quand la douleur devient réelle**, concrètement :
- vous passez plus de 5-10 minutes à rassembler le contexte avant une requête, *ou*
- le dépôt dépasse ~50-100 atomes, *ou*
- vous oubliez régulièrement un atome pertinent et créez un doublon.

Avant ce seuil, le Niveau 1 manuel (§9) reste plus rapide à utiliser qu'à automatiser. C'est un principe d'ingénierie ordinaire : ne pas construire l'infrastructure avant d'en avoir la charge.

### Ce qu'il fait, une fois construit
Un script simple (`99_Agents/archiviste.py`), pas un service complexe :
1. Parse le frontmatter YAML de tous les atomes (`code`, `type`, `helix`, `status`, `tags`) et le corps du texte.
2. Indexe ce contenu (embeddings locaux ou API, stockage vectoriel léger type ChromaDB).
3. À partir d'une requête libre (« je veux écrire sur la fatigue des SSM »), retourne les N atomes sémantiquement les plus proches, plus leurs liens directs `[[ ]]` à un saut de distance.
4. Assemble un bloc de contexte minimal (Story Bible + charte si la requête concerne un `N-` + atomes retrouvés), prêt à coller en tête du prompt destiné à l'un des agents du §7.

### Ce qu'il ne fait jamais
Il ne décide de rien, ne modifie aucun fichier, ne fusionne aucun atome. Il prépare ; vous et les agents éditoriaux décidez.

---

## 7. L'Équipe Éditoriale (5 Agents)

Vous êtes le **Rédacteur en Chef (Human-in-the-Loop)**. Les agents proposent, vous validez. Chaque agent reste un rôle de prompt — ce sont des rôles de *jugement éditorial*, pas d'infrastructure.

*(La v2 comptait six agents ; le Contrôleur Qualité et le "Curateur" suggéré séparément faisaient tous deux de la détection de doublons sémantiques — ils sont fusionnés ici en un seul agent pour éviter la redondance.)*

### 🤖 Agent 1 : Le Botaniste (Extracteur & Atomiseur)
- **Déclencheur** : Vous soumettez un texte brut (français ou anglais)
- **Mission** : Découper en atomes selon la typologie (C, P, A, L, E, N, W, K, R). Un concept par atome.
- **Consigne** : Proposer le nom de fichier en anglais, le contenu en anglais, les tags `#Mythos` / `#Logos` / `#Bridge`, le statut (*draft, validated, obsolete*)
- **Cas particulier `N-`** : si le texte à atomiser est une nanonouvelle (ou en devient une), le Botaniste doit avoir reçu en contexte `CHARTE_STYLISTIQUE.md` et `GUIDE_CONTINUITE.md` — soit fournis manuellement (Niveau 1), soit assemblés par l'Archiviste (Niveau 2+). Sans ces deux fichiers, il ne peut pas vérifier que le texte respecte l'arc en 5 temps ni la cohérence des latents.
- **Livrable** : Blocs Markdown prêts à copier-coller

### 🤖 Agent 2 : Le Tisserand (Cartographe des Liens)
- **Déclencheur** : Un nouvel atome est créé
- **Mission** : Proposer des liens `[[ ]]` vers les atomes existants. Détecter les orphelins.
- **Types de liens** :
  - `[[validates]]` : un `E-` teste un `P-`
  - `[[illustrates]]` : un `N-` rend tangible un `C-`
  - `[[threatens]]` : un `L-` met en danger un `P-`
  - `[[resolves]]` : un `A-` contourne un `L-`
  - `[[features]]` : un `N-` met en scène un `K-` ou un `W-`
- **Règle d'or** : Chercher activement les ponts entre Mythos et Logos

### 🤖 Agent 3 : L'Avocat du Diable (Gardien de la Tension)
- **Déclencheur** : Revue périodique ou à la demande
- **Mission** : Détecter les dérives
  - *Dérive Mythos* : "Cette nouvelle suppose une capacité qui viole un `P-`. C'est de la magie."
  - *Dérive Logos* : "Cette décision `A-` tue l'élégance du `C-` et rend le projet invendable."
- **Livrable** : Rapport "Tensions à résoudre" + 3 propositions d'ajustement

### 🤖 Agent 4 : Le Lexicographe (Gardien de l'Ontologie)
- **Déclencheur** : Nouveau terme détecté OU revue périodique
- **Mission** : Gérer le cycle de vie du vocabulaire bilingue (voir §8)
- **Livrable** : Fiches dans `Ontology_Pending.md`, mises à jour de `Ontology_FR_EN.md`

### 🤖 Agent 5 : Le Contrôleur Qualité & Continuité (Détecteur de Doublons et de Ruptures)
- **Déclencheur** : À la demande, ou quand le nombre d'atomes dépasse un seuil
- **Mission élargie** (fusion Contrôleur Qualité + Curateur) :
  - Identifier les chevauchements sémantiques entre atomes techniques (`C-`, `P-`, `A-`) → proposer fusions ou clarifications
  - Vérifier, pour tout nouvel atome `N-`, la cohérence avec l'état des latents établi dans `GUIDE_CONTINUITE.md` (Self-Model, seuil de surprise, cicatrices) — ne jamais contredire un état déjà posé dans une histoire précédente
- **Livrable** : Rapport "Fusionner A et B en C ?" et/ou "Cette nouvelle contredit l'état latent établi dans N-Story_X"

### 🤖 Agent 6 : Le Synthétiseur (Générateur de Livrables)
- **Déclencheur** : À la demande (présentation, publication, recrutement)
- **Mission** : Assembler les atomes validés en livrables externes (Livre Blanc, Anthologie, pitchs)
- **Livrable** : Documents finaux dans `40_Bridges/` ou destinés à l'export

---

## 8. Le Cycle de Vie du Vocabulaire

**Un seul dépôt. Le français reste dans l'Inbox et les discussions. Le dépôt public est en anglais.**

### Le Glossaire d'Ontologie Vivante

**Fichier maître** : `00_Meta/Ontology_FR_EN.md` (source de vérité, modifié uniquement après validation)

**Fichier tampon** : `00_Meta/Ontology_Pending.md` (propositions en négociation)

### Le Cycle en 4 Étapes

| Étape | Qui | Action |
| :--- | :--- | :--- |
| 1. Détection | Agent Lexicographe | Repère un terme FR non répertorié, crée une fiche dans `Ontology_Pending.md` |
| 2. Négociation | **Vous** | Validez, corrigez, ou demandez une recherche bibliographique |
| 3. Ratification | Agent Lexicographe | Déplace la ligne vers `Ontology_FR_EN.md`, assigne un code stable |
| 4. Propagation | Agent Lexicographe | Propose de mettre à jour rétroactivement les anciens fichiers |

### Format d'une fiche de proposition (dans `Ontology_Pending.md`)
```markdown
## Proposition #42
- **Terme FR détecté** : "Sommeil génératif"
- **Contexte** : Utilisé dans N-Story_4 et E-Jetson_Sleep_Cycle
- **Proposition EN** : "Generative Replay" (technique) OU "Consolidating Reverie" (littéraire)
- **Recommandation** : "Generative Replay" pour E- et A- ; "Consolidating Reverie" pour N- et C-
- **Statut** : ⏳ En attente de validation
```

---

## 9. Le Flux de Travail Quotidien

### Niveau 1 : Chat + Éditeur (Point de départ — pas de date de fin prévue)

| Étape | Qui | Action |
| :--- | :--- | :--- |
| 1. Capture | **Vous** (en FR) | Écrivez votre idée en vrac dans le chat ou dans `00_Inbox/` |
| 2. Contexte | **Vous** | Rassemblez manuellement Story Bible + charte (si `N-`) + atomes pertinents que vous connaissez déjà |
| 3. Atomisation | Agent (l'IA) | Retourne des blocs Markdown en anglais : nom, contenu, liens, tags |
| 4. Validation | **Vous** | Lisez, ajustez un mot si la nuance anglaise ne convient pas, copiez dans votre éditeur |
| 5. Commit | **Vous** | `git add` + `git commit`. L'historique Git est votre trace de décision |

Ce niveau reste parfaitement viable tant que le seuil de douleur défini en §6 n'est pas atteint. Ne le remplacez pas par anticipation.

### Niveau 2 : Archiviste + Script Python (Une fois le seuil de §6 atteint)
- Vous écrivez dans `00_Inbox/vrac.md` ou posez directement votre requête
- `archiviste.py` récupère automatiquement les atomes, la Story Bible et, si pertinent, la charte stylistique
- Le contexte assemblé est transmis à l'agent concerné (Botaniste, Tisserand, etc.)
- Un script crée automatiquement les fichiers `.md` dans les bons sous-dossiers
- Vous relisez et corrigez dans VS Code / Obsidian

### Niveau 3 : Obsidian + Plugins (Visualisation du graphe, plus tard)
- Le repo Git est ouvert dans Obsidian
- Plugin "Smart Connections" ou "Text Generator" pour l'assistance IA
- Le **graphe visuel** montre immédiatement les orphelins et les nœuds surchargés

### ⚠️ Règle absolue
**Ne jamais coder une IHM personnalisée.** L'outil ne doit pas devenir le projet. L'Archiviste lui-même reste un script invoqué en ligne de commande, pas une application.

### Rituel périodique unique
Plutôt que trois revues distinctes, groupez en une seule session (hebdomadaire ou selon votre rythme) : Avocat du Diable (tensions), Lexicographe (vocabulaire en attente), Contrôleur Qualité & Continuité (doublons et ruptures de latents).

---

## 10. Le Modèle de Recrutement : "Chaque Élève Écrit sa Nouvelle"

Pour convaincre des passionnés, des élèves, des clubs de travailler sur des projets difficiles :

1. **Présentez la Saga** (15 min) : le rêve, le GAN-14, les enjeux. Ils s'identifient.
2. **Montrez le Codex** : ils voient la rigueur, la documentation, la vie du projet.
3. **Proposez des "Briques Jouables"** : chaque atome `E-` est un mini-projet autonome de 6-12 mois.
   - *Exemple* : "Qui veut coder le module 'Rêverie' du N=3 sur Jetson Nano ? Ça donne lieu à une nouvelle où le personnage principal EST cet algorithme."
4. **Chaque élève adopte un atome `E-`** et devient co-auteur de sa nanonouvelle (`N-`).
5. **En fin d'année** : recueil publié *"Garrigue-X : Chronicles of GAN-14 — Season 1"*

---

## 11. Le Plan de Démarrage (4 Semaines)

### Semaine 1 : Le Canon Minimal
- [ ] Rédiger `STORY_BIBLE.md` (2 pages max, 5-10 faits non-négociables)
- [ ] Créer `CHARTE_STYLISTIQUE.md` et `GUIDE_CONTINUITE.md` à partir des documents déjà rédigés
- [ ] Créer `00_Meta/Ontology_FR_EN.md` avec les 10-15 concepts clés
- [ ] Créer `00_Meta/Ontology_Pending.md` (vide, prêt à recevoir)
- [ ] Sauvegarder ce `MODE_EMPLOI.md`

### Semaine 2 : Les Premiers Atomes de Décor
- [ ] Identifier 3-5 éléments de décor **déjà utilisés** dans les nouvelles existantes
- [ ] Créer les atomes `W-` et `K-` correspondants (pas plus)
- [ ] Vérifier la cohérence avec la Story Bible

### Semaine 3 : Les Atomes Techniques
- [ ] Créer les 10 premiers atomes `C-`, `P-`, `A-` (le cœur du Logos)
- [ ] Lier chaque `P-` à au moins un `C-` qui le justifie
- [ ] Lier chaque `A-` à au moins un `P-` qu'il respecte

### Semaine 4 : Le Premier Pont
- [ ] Prendre une nouvelle existante (`N-`)
- [ ] Identifier les `W-`, `K-`, `C-`, `P-` qu'elle mobilise
- [ ] Créer l'atome `E-` correspondant pour le MVP
- [ ] Rédiger une première page de `40_Bridges/Concept_to_MVP_Maps.md`

*L'Archiviste n'apparaît dans aucune de ces quatre semaines : il n'est construit qu'au moment défini en §6, potentiellement plusieurs mois plus tard.*

---

## 12. Les 6 Règles d'Or

1. **Un seul dépôt, une seule vérité.** Le français reste dans l'Inbox. Le dépôt public est en anglais.
2. **Un atome = Une idée.** Si une note aborde deux sujets, scindez-la.
3. **L'outil ne doit pas devenir le projet.** Pas d'IHM custom. Chat + éditeur + Git — même l'Archiviste reste un script.
4. **Le décor se crée à la demande.** Pas de worldbuilding sans récit qui l'exige.
5. **La fiction est un outil de validation.** Si la nouvelle ne "tient pas" face aux principes, c'est que le principe est mal défini OU la fiction mal écrite. Les deux s'améliorent mutuellement.
6. **N'automatisez pas avant d'avoir mal.** L'infrastructure de contexte (§6) se construit quand le manuel devient douloureux, pas par anticipation.

---

## 13. Comment Invoquer les Agents (Formules Pratiques)

Quand vous soumettez un texte à l'IA, précisez le rôle :

| Besoin | Formule |
| :--- | :--- |
| Découper une idée en atomes | *"Agis en Botaniste. Voici mon texte en FR : [texte]"* |
| Trouver des liens pour un nouvel atome | *"Agis en Tisserand. Voici le nouvel atome : [contenu]. Quels liens proposes-tu ?"* |
| Vérifier la cohérence d'une nouvelle | *"Agis en Avocat du Diable. Cette nouvelle viole-t-elle un P- ou un C- ?"* |
| Traduire / standardiser un terme | *"Agis en Lexicographe. J'utilise le terme FR 'X'. Proposition EN ?"* |
| Détecter des doublons ou ruptures de latents | *"Agis en Contrôleur Qualité & Continuité. Ces atomes/cette nouvelle se chevauchent/contredisent-ils l'existant ?"* |
| Générer un livrable | *"Agis en Synthétiseur. Génère un pitch d'une page basé sur les P- et E-."* |
| Mode complet | *"Agis selon le Mode d'Emploi, §9, Niveau 1."* |
| Récupérer le contexte (Niveau 2 uniquement) | `python archiviste.py "description libre de ce que vous cherchez"` |

---

## 14. Format Standard d'un Atome (Template)

```markdown
---
code: C-Markov_Blanket_Isolation
type: Concept
helix: Bridge          # Mythos | Logos | Bridge
status: draft          # draft | validated | obsolete
created: 2026-07-27
tags: [architecture, cognition, isolation]
---

# Markov Blanket Isolation

## Definition
[Une phrase claire et indivisible.]

## Elaboration
[2-4 paragraphes. Le cœur de l'idée.]

## Links
- [[illustrates]] → [[N-Story_4_The_Last_Token]]
- [[validates]] → [[P-Identity_Impermeability]]
- [[threatened_by]] → [[L-Inhibitory_Attention_Deficit]]

## References
- [[R-Friston_2010_Free_Energy]]
- [[R-Parr_2022_Active_Inference]]

## MVP Connection (Logos)
- Tested in: [[E-Jetson_Sleep_Cycle]]

## Narrative Connection (Mythos)
- Illustrated in: [[N-Story_4_The_Last_Token]]
- Features: [[W-Rafale_M_Stealth]], [[K-Admiral_Thessalos]]
```

---

*Fin du Mode d'Emploi v3. Ce document est vivant : il évolue avec le projet. Prochaine révision prévue soit après la Semaine 4, soit au moment où l'Archiviste sera effectivement construit (§6) — le premier des deux événements déclenche la mise à jour.*
