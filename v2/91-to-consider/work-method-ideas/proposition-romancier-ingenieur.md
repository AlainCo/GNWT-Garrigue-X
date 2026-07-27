# 📘 Mode d'Emploi Complet v2 : Système Agentique Zettelkasten — "Romancier-Ingénieur"

*Document de référence à sauvegarder sous `00_Meta/MODE_EMPLOI.md`*

---

## 0. L'Identité du Projet : Le Romancier-Ingénieur

Ce projet n'est ni un projet technique habillé de fiction, ni un roman illustré de schémas. C'est une **saga à la Asimov**, où chaque concept technique est un personnage, chaque MVP est un chapitre, et chaque nanonouvelle est une porte d'entrée autonome dans l'univers.

**La posture de travail** : Vous êtes un romancier-ingénieur. Vous écrivez comme un romancier (par scènes, par personnages, par tensions), mais vous construisez comme un ingénieur (par principes, par tests, par décisions traçées).

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
| 5 | **Le Méta-Système Agentique** | Prompts, scripts, workflows | Vous (outillage interne) | `99_Agents/` |

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
```

---

## 6. L'Équipe Agentique (6 Agents)

Vous êtes le **Rédacteur en Chef (Human-in-the-Loop)**. Les agents proposent, vous validez.

### 🤖 Agent 1 : Le Botaniste (Extracteur & Atomiseur)
- **Déclencheur** : Vous soumettez un texte brut (français ou anglais)
- **Mission** : Découper en atomes selon la typologie (C, P, A, L, E, N, W, K, R). Un concept par atome.
- **Consigne** : Proposer le nom de fichier en anglais, le contenu en anglais, les tags `#Mythos` / `#Logos` / `#Bridge`, le statut (*draft, validated, obsolete*)
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
- **Déclencheur** : Revue hebdomadaire ou à la demande
- **Mission** : Détecter les dérives
  - *Dérive Mythos* : "Cette nouvelle suppose une capacité qui viole un `P-`. C'est de la magie."
  - *Dérive Logos* : "Cette décision `A-` tue l'élégance du `C-` et rend le projet invendable."
- **Livrable** : Rapport "Tensions à résoudre" + 3 propositions d'ajustement

### 🤖 Agent 4 : Le Lexicographe (Gardien de l'Ontologie)
- **Déclencheur** : Nouveau terme détecté OU revue hebdomadaire
- **Mission** : Gérer le cycle de vie du vocabulaire bilingue (voir §7)
- **Livrable** : Fiches dans `Ontology_Pending.md`, mises à jour de `Ontology_FR_EN.md`

### 🤖 Agent 5 : Le Contrôleur Qualité (Détecteur de Doublons)
- **Déclencheur** : À la demande, ou quand le nombre d'atomes dépasse un seuil
- **Mission** : Identifier les chevauchements sémantiques. Proposer fusions ou clarifications.
- **Livrable** : Rapport "Fusionner A et B en C ? [Oui/Non]"

### 🤖 Agent 6 : Le Synthétiseur (Générateur de Livrables)
- **Déclencheur** : À la demande (présentation, publication, recrutement)
- **Mission** : Assembler les atomes validés en livrables externes
- **Livrables** : Brouillon de Livre Blanc, Roadmap MVP, Anthologie, Pitch d'une page

---

## 7. Le Processus Bilingue : "Penser en Français, Publier en Anglais"

### Règle fondamentale
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

## 8. Le Flux de Travail Quotidien

### Niveau 1 : Chat + Éditeur (Recommandé pour démarrer)

| Étape | Qui | Action |
| :--- | :--- | :--- |
| 1. Capture | **Vous** (en FR) | Écrivez votre idée en vrac dans le chat ou dans `00_Inbox/` |
| 2. Atomisation | Agent (l'IA) | Retourne des blocs Markdown en anglais : nom, contenu, liens, tags |
| 3. Validation | **Vous** | Lisez, ajustez un mot si la nuance anglaise ne convient pas, copiez dans votre éditeur |
| 4. Commit | **Vous** | `git add` + `git commit`. L'historique Git est votre trace de décision |

### Niveau 2 : Script Python Local (Semi-automatisation, plus tard)
- Vous écrivez dans `00_Inbox/vrac.md`
- Un script envoie le texte à un LLM (API ou Ollama local)
- Le script crée automatiquement les fichiers `.md` dans les bons sous-dossiers
- Vous relisez et corrigez dans VS Code / Obsidian

### Niveau 3 : Obsidian + Plugins (Visualisation du graphe, plus tard)
- Le repo Git est ouvert dans Obsidian
- Plugin "Smart Connections" ou "Text Generator" pour l'assistance IA
- Le **graphe visuel** montre immédiatement les orphelins et les nœuds surchargés

### ⚠️ Règle absolue
**Ne jamais coder une IHM personnalisée.** L'outil ne doit pas devenir le projet.

---

## 9. Le Modèle de Recrutement : "Chaque Élève Écrit sa Nouvelle"

Pour convaincre des passionnés, des élèves, des clubs de travailler sur des projets difficiles :

1. **Présentez la Saga** (15 min) : le rêve, le GAN-14, les enjeux. Ils s'identifient.
2. **Montrez le Codex** : ils voient la rigueur, la documentation, la vie du projet.
3. **Proposez des "Briques Jouables"** : chaque atome `E-` est un mini-projet autonome de 6-12 mois.
   - *Exemple* : "Qui veut coder le module 'Rêverie' du N=3 sur Jetson Nano ? Ça donne lieu à une nouvelle où le personnage principal EST cet algorithme."
4. **Chaque élève adopte un atome `E-`** et devient co-auteur de sa nanonouvelle (`N-`).
5. **En fin d'année** : recueil publié *"Garrigue-X : Chronicles of GAN-14 — Season 1"*

---

## 10. Le Plan de Démarrage (4 Semaines)

### Semaine 1 : Le Canon Minimal
- [ ] Rédiger `STORY_BIBLE.md` (2 pages max, 5-10 faits non-négociables)
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

---

## 11. Les 5 Règles d'Or

1. **Un seul dépôt, une seule vérité.** Le français reste dans l'Inbox. Le dépôt public est en anglais.
2. **Un atome = Une idée.** Si une note aborde deux sujets, scindez-la.
3. **L'outil ne doit pas devenir le projet.** Pas d'IHM custom. Chat + éditeur + Git.
4. **Le décor se crée à la demande.** Pas de worldbuilding sans récit qui l'exige.
5. **La fiction est un outil de validation.** Si la nouvelle ne "tient pas" face aux principes, c'est que le principe est mal défini OU la fiction mal écrite. Les deux s'améliorent mutuellement.

---

## 12. Comment Invoquer les Agents (Formules Pratiques)

Quand vous soumettez un texte à l'IA, précisez le rôle :

| Besoin | Formule |
| :--- | :--- |
| Découper une idée en atomes | *"Agis en Botaniste. Voici mon texte en FR : [texte]"* |
| Trouver des liens pour un nouvel atome | *"Agis en Tisserand. Voici le nouvel atome : [contenu]. Quels liens proposes-tu ?"* |
| Vérifier la cohérence d'une nouvelle | *"Agis en Avocat du Diable. Cette nouvelle viole-t-elle un P- ou un C- ?"* |
| Traduire / standardiser un terme | *"Agis en Lexicographe. J'utilise le terme FR 'X'. Proposition EN ?"* |
| Détecter des doublons | *"Agis en Contrôleur Qualité. Ces 3 atomes se chevauchent-ils ?"* |
| Générer un livrable | *"Agis en Synthétiseur. Génère un pitch d'une page basé sur les P- et E-."* |
| Mode complet | *"Agis selon le Mode d'Emploi, §8, Niveau 1."* |

---

## 13. Format Standard d'un Atome (Template)

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

*Fin du Mode d'Emploi v2. Ce document est vivant : il évolue avec le projet. Prochaine révision prévue après la Semaine 4.*