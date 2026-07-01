Cette confusion entre **MeMo** et d'autres concepts (comme **RAG** ou **MemGPT**) est très fréquente, car l'écosystème des mémoires pour LLM est en pleine effervescence. L'article que vous cherchez (`arXiv:2605.15156`) s'appelle exactement **"MeMo: Memory as a Model"**, et il propose une architecture particulièrement élégante.

Voici une explication détaillée, des bases aux mécanismes techniques, pour vous aider à y voir clair.

---

## 🤖 1. Clarification des termes fondamentaux

Avant de plonger dans l'architecture, clarifions les trois concepts que vous avez mentionnés : **token, embedding et vecteur**. Les comprendre est essentiel pour saisir le fonctionnement de MeMo.

- **Token** : C'est l'unité de base que le LLM lit ou génère. Un token peut être un mot entier (`"voiture"`), une partie d'un mot (`"aut"` + `"omobile"`) ou un caractère (`"!"`). Pour un même texte, le nombre de tokens peut varier selon la méthode de tokenization (ex: `"J'adore les chats."` pourrait devenir 4 ou 5 tokens selon le modèle). Le token est l'unité fondamentale de raisonnement du LLM.

- **Embedding** : Un embedding est la représentation mathématique d'un token (ou d'une phrase, d'un document) sous forme d'une **liste de nombres à virgule flottante**. Pour l'obtenir, on passe le token ou le texte dans un modèle d'embedding (ex: `text-embedding-3-small` d'OpenAI). L'embedding capture le **sens sémantique** : deux mots proches en terme de sens auront des embeddings proches dans l'espace mathématique. Les embeddings sont calculés **une fois** et stockés (généralement dans une base de données vectorielle).

- **Vecteur** : C'est une structure mathématique générique — une liste ordonnée de nombres. Un embedding **est** un vecteur, mais un vecteur n'est pas nécessairement un embedding. Par exemple, le vecteur `[3.5, -1.2, 0.7]` est juste des nombres ; pour qu'il soit un embedding, il faut qu'il soit le **résultat du passage d'un texte dans un modèle d'embedding**. Dans le contexte de MeMo, le vecteur peut être l'embedding d'une question ou d'un document, mais aussi une **représentation interne** du modèle Mémoire.

**Analogie** : Imaginez un fichier CSV avec des milliers de colonnes. La première colonne contient la phrase d'origine (`"Le ciel est bleu"`). Les colonnes suivantes contiennent des valeurs numériques (`0.2`, `-0.5`, `0.8`, ...). L'ensemble des valeurs numériques sur une ligne constitue **l'embedding** de cette phrase. Le fait que ces valeurs soient organisées en liste en fait **un vecteur**.

---

## 🧠 2. Architecture de MeMo : Deux modèles, une seule mémoire

MeMo repose sur une séparation radicale des responsabilités :

### **Le Modèle Exécutif** (Executive Model)
- C'est le LLM principal, capable de raisonnement complexe (ex: GPT-4o, Gemini, Qwen).
- Il est **complètement gelé** (frozen) : ses poids ne sont jamais modifiés, ce qui élimine tout risque de « catastrophic forgetting » (perte des connaissances antérieures lors d'un réentraînement).

### **Le Modèle Mémoire** (Memory Model)
- Un **LLM plus petit** (Qwen2.5-14B dans les expérimentations) dont **l'unique fonction est de stocker et de restituer des connaissances**.
- Il est **entraîné spécifiquement** sur les nouvelles connaissances (documents, bases de données) et son architecture repose sur des **mémoires associatives en couches** (layered associative memories) — une structure qui mime la manière dont le cerveau humain associe des idées entre elles.
- **Avantage clé** : Sa taille réduite le rend beaucoup moins coûteux à réentraîner que le LLM principal.

---

## 🎓 3. Phase d'entraînement : Transformer des documents en « réflexions »

C'est la partie la plus innovante de MeMo. Plutôt que de simplement « chunker » (découper) des documents et de les indexer (comme le fait RAG), MeMo utilise un **pipeline de synthèse en cinq étapes** (five‑step reflection QA synthesis pipeline) pour générer ce que les auteurs appellent des **« réflexions »** (reflections).

### **Les 5 étapes en détail** :

1. **Extraction de faits** : Le modèle `GENERATOR` (Qwen2.5-32B) extrait des documents :
    - Les faits explicitement mentionnés
    - Les informations pouvant être déduites logiquement (inférences)
    Les traitements sont faits en parallèle sur chaque segment.

2. **Consolidation** : Les paires QA partageant un contexte commun (même entité, même période, même relation) sont fusionnées en paires multi‑faits.

3. **Vérification et réécriture** : Chaque paire QA est vérifiée pour s'assurer qu'elle est autonome. Les références implicites (ex: `"Il a dit que..."` sans mentionner `"Il"`) sont réécrites pour inclure le contexte complet.

4. **Mise en surface des entités** : Génération de paires QA qui forcent le modèle à manipuler les relations dans les deux sens. Cela résout le « reversal curse » (si le modèle a appris `"A est B"`, il échoue souvent sur `"B est A"`) en générant explicitement les deux formulations.

5. **Synthèse cross‑document** : Étape la plus critique. Le `GENERATOR` identifie et synthétise deux types de connections :
    - **Indices convergents** : Plusieurs documents parlent de la même entité.
    - **Propriétés parallèles** : Différentes entités partagent des attributs communs.
    Cette étape est tellement importante que, dans l'ablation, la supprimer fait chuter la précision de **24,00% à 6,37%** sur NarrativeQA.

Le produit final est un ensemble de **paires QA** qui encapsulent l'information du corpus source sous tous les angles. C'est **ce jeu de données** qui servira à entraîner le **Modèle Mémoire**.

---

## ⚡ 4. Phase d'inférence : Un protocole structuré en 3 phases

Lorsqu'un utilisateur pose une question, l'interaction entre les deux modèles suit un protocole bien défini :

1. **Décomposition** (Phase 1 — Grounding) : Le Modèle Exécutif reçoit la question `Q` de l'utilisateur. Il ne répond pas directement. Il analyse `Q` et la **décompose en plusieurs sous-questions atomiques** `(q1, q2, q3,...)` qui sont des unités de connaissance indépendantes.  
   *Exemple* : Pour la question `"Quels sont les impacts économiques et écologiques de la nouvelle politique énergétique ?"`, les sous-questions pourraient être `"Quels sont les impacts économiques ?"` et `"Quels sont les impacts écologiques ?"`.

2. **Interrogation** (Phase 2 — Querying) : Pour chaque sous-question `q_i`, le Modèle Exécutif **formule un prompt en langage naturel** et l'envoie au Modèle Mémoire. C'est là que MeMo se distingue fondamentalement de RAG :
    - **RAG** : Convertit `q_i` en embedding, fait une recherche par similarité dans une base vectorielle, et récupère des documents bruts.
    - **MeMo** : Envoie **le texte de `q_i`** au Modèle Mémoire comme on enverrait une requête à un expert. Le Modèle Mémoire, grâce à son entraînement, est capable de **générer** la réponse (pas de la rechercher) — c'est une **inférence**, pas une recherche.
    Le résultat est une réponse `r_i` générée par le Modèle Mémoire.

3. **Synthèse** (Phase 3 — Synthesis) : Le Modèle Exécutif reçoit l'ensemble des `(q_i, r_i)`. Il les agrège, les confronte, et les **synthétise** pour produire la réponse finale `R`, qui est présentée à l'utilisateur.

C'est ce mécanisme que l'article résume par le triplet **"Memorization-retrieval-response"**.

---

## 🆚 5. Différences clés entre MeMo et RAG

Le tableau ci-dessous résume les différences architecturales fondamentales :

| Caractéristique | RAG (Retrieval-Augmented Generation) | MeMo (Memory as a Model) |
| :--- | :--- | :--- |
| **Nature de la mémoire** | Recherche textuelle approximative (similarité vectorielle) | Un **modèle entraîné** qui a *compris* et *internalisé* l'information |
| **Mécanisme d'interrogation** | Embedding → Vector DB → Recherche par similarité | Prompt en langage naturel → Inférence du modèle mémoire |
| **Capacité cross‑document** | Faible (chaque chunk est indépendant) | Excellente (l'étape 5 d'entraînement synthétise explicitement les connections) |
| **Bruit dans les sources** | Très sensible (le LLM final peut être perturbé par du bruit) | Robuste (le modèle mémoire apprend à ignorer le bruit lors de son entraînement) |
| **Coût de mise à jour** | Ajout/remplacement des documents dans la base vectorielle | Réentraînement du modèle mémoire (moins coûteux qu'un LLM complet) |
| **Transparence** | Les documents sources sont récupérés, mais leur interprétation reste opaque | Les réflexions sont des paires QA humainement compréhensibles |

---

## 💎 6. En résumé : L'élégance de la simplicité

La beauté de MeMo est qu'il résout trois problèmes majeurs des approches existantes :
- **Coût** : Pas de réentraînement du LLM principal, seulement du petit modèle mémoire.
- **Obsolescence** : Mise à jour possible sans perdre les capacités antérieures.
- **Portabilité** : Une fois entraîné, le modèle mémoire peut être utilisé avec **n'importe quel LLM exécutif** (open source comme propriétaire).

Techniquement, MeMo remplace la recherche textuelle approximative (RAG) par une **inférence ciblée** et remplace le réentraînement coûteux par un **fine-tuning d'un modèle plus petit**. L'utilisateur final ne voit qu'une réponse, mais en coulisses, c'est une véritable collaboration entre deux intelligences artificielles distinctes.
