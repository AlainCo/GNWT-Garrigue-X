Voici le **Mode d’Emploi Complet** de votre système de travail. Considérez ce document comme la "Constitution" de votre projet. Vous pourrez le sauvegarder dans votre dépôt (par exemple sous `00_Meta/MODE_EMPLOI.md`) et vous y référer à chaque fois que vous aurez un doute sur la méthode.

---

# 📘 Mode d’Emploi : Système Agentique Zettelkasten (GNWT-Garrigue-X)

## 1. La Vision : La Double Hélice
Le projet ne suit pas une ligne droite, mais deux brins entrelacés qui s’alimentent mutuellement :
*   **Mythos (GAN-14)** : Le rêve, la fiction, l’architecture mythique. *But* : Inspirer, explorer les limites, justifier les choix par le récit.
*   **Logos (Garrigue-X MVP)** : Le réel, le code, les preuves. *But* : Valider, enseigner, crédibiliser via des expérimentations tangibles.
*   **Les Ponts** : Les atomes Zettelkasten qui relient un concept théorique à une nouvelle (Mythos) et à un test technique (Logos).

## 2. Les 5 Livrables Cibles
Ne pas disperser l’énergie. Tout travail doit nourrir l’un de ces 5 piliers :
1.  **Le Codex Conceptuel** : Notes atomiques interconnectées (Zettelkasten).
2.  **Le Livre Blanc Architectural** : Synthèse des choix ambitieux et de leurs justifications.
3.  **L’Anthologie des Nanonouvelles** : Fictions illustrant les dilemmes techniques et philosophiques.
4.  **Le Kit de Validation MVP** : Code, simulations et règles du jeu (les "plantes sacrées").
5.  **Le Méta-Système Agentique** : Les prompts et scripts qui automatisent la gestion des 4 premiers.

---

## 3. La Typologie des Atomes (Zettelkasten 2.0)
Chaque idée doit être découpée en un seul fichier Markdown, nommé avec un préfixe strict. **Les noms de fichiers et les liens `[[ ]]` sont toujours en ANGLAIS.**

| Code | Type | Rôle | Exemple de nom de fichier |
| :--- | :--- | :--- | :--- |
| **`C-`** | **Concept** | Idée théorique unique et définie. | `C-Markov_Blanket_Isolation.md` |
| **`P-`** | **Principe / Exigence** | Règle non-négociable ("plante sacrée"). | `P-Identity_Impermeability.md` |
| **`A-`** | **Architecture / Décision** | Choix d’ingénierie tranché (ADR). | `A-Stack_N3_Mamba.md` |
| **`L-`** | **Limite / Critique** | Angle mort, vulnérabilité ou dette technique. | `L-Inhibitory_Attention_Deficit.md` |
| **`E-`** | **Expérimental / MVP** | Hypothèse testable concrètement (Logos). | `E-Jetson_Sleep_Cycle.md` |
| **`N-`** | **Narratif / Scénario** | Micro-fiction illustrant un concept (Mythos). | `N-Story_4_The_Last_Token.md` |
| **`R-`** | **Référence** | Ancrage externe (papier, auteur, lien). | `R-Friston_2010_Free_Energy.md` |

---

## 4. Structure du Dépôt Git
Organisation minimale et plate, optimisée pour Obsidian/VS Code et les liens Markdown.

```text
GNWT-Garrigue-X/
├── 00_Meta/                   ← MODE_EMPLOI.md, Ontology_FR_EN.md, Ontology_Pending.md
├── 00_Inbox/                  ← Capture brute (idées en vrac, notes en français)
├── 10_Atoms/                  ← CŒUR DU SYSTÈME (Fichiers en anglais, nommés par code)
│   ├── C_Concepts/
│   ├── P_Principles/
│   ├── A_Architecture/
│   ├── L_Limits/
│   ├── E_Experiments/
│   ├── N_Narratives/
│   └── R_References/
├── 20_Mythos_GAN14/           ← Maps of Content (MOC) et compilations narratives
├── 30_Logos_GarrigueX/        ← MOC, Roadmaps, Cahier des charges du MVP
├── 40_Bridges/                ← Documents expliquant le lien Concept → MVP
├── 50_Sources/                ← PDFs, articles, imports bruts
└── 99_Agents/                 ← Prompts système, scripts Python, logs
```

---

## 5. L’Équipe Agentique (Vos Assistants)
Vous êtes le **Rédacteur en Chef (Human-in-the-Loop)**. Les agents proposent, vous validez.

1.  **🤖 Le Botaniste (Extracteur)** : Lit votre vrac en français, le découpe en atomes, et propose le contenu en anglais avec les bons préfixes (`C-`, `P-`, etc.).
2.  **🤖 Le Tisserand (Cartographe)** : Analyse les nouveaux atomes et propose des liens `[[ ]]` (ex: `[[resolves]]`, `[[illustrates]]`, `[[threatens]]`). Détecte les orphelins.
3.  **🤖 L’Avocat du Diable (Critique)** : Scanne les tensions. Ex: *"Cette nouvelle (N-) viole le principe de latence (P-). Proposition : ajouter un délai de 200ms dans le récit."*
4.  **🤖 Le Lexicographe (Gardien de l’Ontologie)** : Détecte les nouveaux termes, propose des traductions dans `Ontology_Pending.md`, et assure la cohérence terminologique.
5.  **🤖 Le Synthétiseur (Générateur)** : Assemble les atomes validés pour produire des livrables (brouillon de Livre Blanc, Roadmap, Anthologie) à la demande.

---

## 6. Le Processus de l’Ontologie Vivante (Bilingue)
Règle d’or : **Penser en Français, Publier en Anglais.**

1.  **Détection** : Vous écrivez en français. L’agent repère un terme important non répertorié.
2.  **Proposition** : L’agent crée une fiche dans `00_Meta/Ontology_Pending.md` avec le terme FR, la proposition EN, et le contexte.
3.  **Négociation** : Vous validez, corrigez, ou demandez une recherche bibliographique à l’agent pour trancher.
4.  **Ratification & Propagation** : Une fois validé, le terme passe dans `Ontology_FR_EN.md` (la source de vérité). L’agent peut ensuite proposer de mettre à jour rétroactivement les anciens fichiers.

---

## 7. Flux de Travail Quotidien Recommandé (Niveau 1 : Chat + Éditeur)
*Ne développez pas d’interface graphique personnalisée pour l’instant.*

1.  **Capture (Vous)** : Vous écrivez une idée, une critique ou un paragraphe en français dans le chat (ou dans `00_Inbox`).
2.  **Atomisation (Moi, l’IA)** : Je retourne des blocs de code Markdown prêts à l’emploi : nom de fichier en anglais, contenu en anglais, liens `[[ ]]` suggérés, et tag `#Mythos` ou `#Logos`.
3.  **Validation (Vous)** : Vous lisez, ajustez un mot si la nuance anglaise ne vous convient pas, copiez le bloc, créez le fichier dans votre éditeur local (VS Code / Obsidian) et sauvegardez.
4.  **Commit (Vous)** : Vous validez le changement dans Git. L’historique Git est votre trace de décision.

---

## 8. Les 3 Règles d’Or pour Ne Pas Dérailler
1.  **Un seul dépôt, une seule vérité** : Ne créez jamais de dépôt séparé pour la version française. Le français reste dans l’Inbox et les discussions ; le dépôt public est en anglais.
2.  **Un atome = Une idée** : Si une note devient trop longue ou aborde deux sujets, c’est que l’agent (ou vous) devez la scinder en deux.
3.  **L’outil ne doit pas devenir le projet** : Refusez la tentation de coder une application de gestion de notes. Utilisez le chat + éditeur de texte. Votre valeur est dans les concepts, pas dans l’outillage.

---

### Comment utiliser ce mode d'emploi ?
Copiez ce texte et enregistrez-le sous `00_Meta/MODE_EMPLOI.md` dans votre projet. 

À partir de maintenant, à chaque fois que vous me soumettez une idée, vous pouvez simplement ajouter en préambule : *"Agis selon le Mode d'Emploi, étape 7"*. Je saurai exactement quel rôle jouer, quel format de sortie utiliser, et comment gérer la traduction.

**Souhaitez-vous que nous lancions la première étape concrète : la création du fichier `00_Meta/Ontology_FR_EN.md` avec les premiers concepts, pour initialiser le travail du Lexicographe ?**