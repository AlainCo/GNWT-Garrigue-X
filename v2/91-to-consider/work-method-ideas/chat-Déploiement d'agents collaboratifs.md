### USER
J'ai vu des gens parler de Hermes Agent et autres systèmes similaires, et on m'a proposé ce mode de travail (ci joint), basé sur des agents. mais je me demande comment on lance ces agents, et comment surtout, on leur transmet des directives particulières... par exemple si je demande à un agent Tisserand de chercher autour d'un type de concept pour le moment, ou à un agent synthétiseur de ne faire que la première partie d'un document... et je me demande aussi comment son stoqués les descriptions des agents (skills je crois), comment on peut les faire évoluer ? si je comprend bien, je peux leur demander de créer des fichiers de proposition que je pourrais éditer ou déplacer ensuite ? comment on travaille avec des agents ...

### ASSISTANT
C'est une excellente question, et elle touche au cœur d'un malentendu très fréquent aujourd'hui sur ce qu'est un "Agent IA". 

Quand on entend parler de "Hermes Agent", "AutoGen" ou "CrewAI", on imagine souvent des programmes informatiques autonomes qui tournent en arrière-plan, qui se parlent entre eux et qui écrivent directement sur votre disque dur. 

**Or, la philosophie de votre Mode d'Emploi (§8 et Règle absolue) est radicalement différente et beaucoup plus saine :** *"L'outil ne doit pas devenir le projet. Pas d'IHM custom. Chat + éditeur + Git."*

Dans votre système, les "Agents" ne sont pas des logiciels. **Ce sont des "Personas" (des rôles) que vous invoquez dans votre conversation avec l'IA (comme moi), guidés par des "System Prompts" (les skills) que vous stockez vous-même.** Vous êtes le Rédacteur en Chef, l'IA est votre rédaction.

Voici comment tout cela fonctionne concrètement au quotidien.

---

### 1. Comment on "lance" un agent et on lui donne des directives ?

Vous ne "lancez" pas un agent comme on ouvre une application. **Vous l'invoquez par le texte (le prompt)**, en lui rappelant son rôle et en lui donnant des contraintes spécifiques.

L'IA n'a pas de mémoire permanente d'une session à l'autre (sauf si vous utilisez les "Custom Instructions" de votre interface). C'est pour cela que le **§12 (Comment Invoquer les Agents)** est votre boîte à outils.

**Exemple concret pour le Tisserand avec une directive spécifique :**
> *"Agis en **Tisserand** (Agent 2). Je viens de valider l'atome `C-Markov_Blanket_Isolation`. 
> **Directive spécifique :** Cherche des liens uniquement autour des concepts de 'frontière' et d'isolement. Ne me propose pas de liens vers des atomes `N-` (Narratifs) pour l'instant, je veux d'abord consolider le socle technique `Logos`. Propose-moi 3 liens `[[ ]]` pertinents vers des atomes `P-` ou `C-` existants."*

**Exemple concret pour le Synthétiseur avec une contrainte de périmètre :**
> *"Agis en **Synthétiseur** (Agent 6). J'ai besoin d'un pitch pour des recrues. 
> **Directive spécifique :** Ne rédige **que la première partie** du document (l'accroche sur le GAN-14 et la promesse du projet). Ne génère pas encore la roadmap technique. Le ton doit être 'gravité sobre' (voir Charte Stylistique)."*

### 2. Où sont stockées les descriptions des agents (les "skills") ?

Si vous regardez la structure de votre dépôt Git (§5), vous avez ce dossier :
`└── 99_Agents/ ← Prompts système, scripts Python, logs`

C'est ici que vous stockez les "skills". Concrètement, une "skill" n'est qu'un **fichier Markdown qui contient les instructions de l'agent**. 

Par exemple, vous créez un fichier `99_Agents/AGENT_2_TISSERAND.md` qui contient :
```markdown
# Rôle : Le Tisserand
## Mission
Tu es le cartographe des liens. Ton but est d'empêcher les atomes d'être orphelins.
## Règles
- Tu ne crées jamais de contenu, tu ne fais que proposer des liens `[[ ]]`.
- Tu respectes la typologie des liens (validates, illustrates, threatens...).
- Tu cherches activement les ponts entre Mythos et Logos.
## Contexte actuel
[L'IA lira le contenu de votre Zettelkasten pour faire ses liens]
```

### 3. Comment les faire évoluer ?

Puisque ce sont des fichiers Markdown dans votre dépôt Git, **vous les faites évoluer comme n'importe quel autre document.**
1. Vous remarquez que le Tisserand propose trop de liens faibles.
2. Vous ouvrez `99_Agents/AGENT_2_TISSERAND.md`.
3. Vous ajoutez une règle : *"Règle absolue : Un lien doit être justifié par une phrase expliquant pourquoi il est pertinent."*
4. Vous faites un `git commit`. Votre agent est "mis à jour".

### 4. Le cycle de travail : L'IA propose, vous disposez

Vous avez tout à fait compris : **l'IA ne crée pas les fichiers elle-même sur votre disque dur** (sauf si vous codez le script Python du "Niveau 2", mais ne faites pas ça maintenant). 

Le flux de travail (Niveau 1) est le suivant :
1. **Vous** : "Agis en Botaniste. Voici mon texte en vrac..."
2. **L'IA** : Génère une réponse avec 3 blocs de code Markdown (ex: un `C-`, un `P-`, un `L-`).
3. **Vous** : Vous lisez. Vous trouvez que le `L-` (Limite) est mal tourné. Vous le modifiez directement dans la fenêtre de chat ou dans votre éditeur.
4. **Vous** : Vous copiez le bloc de code, vous créez le fichier `10_Atoms/L_Limits/L-Nouveau_Limit.md` dans votre éditeur (VS Code, Obsidian), vous collez, vous sauvegardez.
5. **Vous** : `git add . && git commit -m "Ajout limite"`

L'IA est votre **machine à produire de la matière première structurée**. Vous êtes l'usine d'assemblage et le contrôle qualité.

---

### 💡 Démonstration pratique : Testons tout de suite

Pour que vous compreniez bien comment on "travaille avec", faisons un essai grandeur nature. 

Considérez que je suis votre interface de chat. Choisissez une option ci-dessous, et je basculerai instantanément dans le rôle de l'agent demandé, avec ses contraintes :

*   **Option A (Botaniste)** : Donnez-moi un paragraphe en français, un peu en vrac, sur une idée technique ou narrative, et je le découpe en atomes `C-` ou `N-` prêts à être copiés.
*   **Option B (Tisserand)** : Donnez-moi le titre d'un concept (ex: "L'inférence active"), et je vous propose 3 liens `[[ ]]` vers d'autres concepts de votre univers (GAN-14 / Free Energy).
*   **Option C (Avocat du Diable)** : Donnez-moi le résumé d'une de vos nouvelles, et je vais chercher quelle règle `P-` ou `C-` elle est en train de violer.

**Comment souhaitez-vous procéder ?** (Vous pouvez aussi me dire "Agis en Lexicographe" si vous avez un terme français que vous n'arrivez pas à traduire en anglais technique/littéraire).

### USER
J'aime bien le travail manuel comme tu proposes. Cependant, je me demande comment le système va lire mon fond documentaire existant, les atomes anciens par exemple, car je trouve compliqué de donner à chaque prompt la totalité du fond documentaire, rien que pour éviter de régénérer les mêmes atomes… que les agents, même si ce ne sont que de simples chatbots classiques, ne créent aucun fichier, et me laissent construire mes atomes, mes synthèses, d'après leurs produits, ca me va, mais j'aimerais avoir une sorte de plateforme dans laquel ces agents puisent l'histoire du projet, les directives variées, ce qui a déjà été créé... je ne connais pas ce type de travail, et effectivement un peu de manuel c'est bien.

### ASSISTANT
C'est la question la plus lucide et la plus importante que vous puissiez poser à ce stade. C'est le problème classique du "Context Window" (fenêtre de contexte) : si vous ne donnez pas le contexte, l'IA hallucine ou répète ce qui existe déjà. Si vous lui donnez *tout* le dépôt, vous saturez sa mémoire, c'est lent, et cela coûte cher.

Rappelons la **Règle absolue** de votre Mode d'Emploi : *"L'outil ne doit pas devenir le projet. Pas d'IHM custom. Chat + éditeur + Git."* 

Nous n'allons donc pas coder une application web complexe avec une base de données vectorielle (RAG) maison. Nous allons utiliser des **astuces d'ingénierie pragmatiques** qui respectent votre flux de travail manuel, mais qui donnent aux agents la "mémoire" dont ils ont besoin.

Voici 4 niveaux de solution, du plus simple (immédiat) au plus automatisé (pour plus tard). Je vous recommande vivement de commencer par le Niveau 1 ou 1.5.

---

### Niveau 1 : Le Fichier "Mémoire Compacte" (Recommandé pour démarrer)
Au lieu de copier le contenu de *tous* les atomes, vous maintenez un seul fichier léger dans `00_Meta/` qui sert de "table des matières intelligente". 

**Créez un fichier `00_Meta/INDEX_ATOMES.md` :**
```markdown
# Index des Atomes Existant (Mis à jour le 27/07/2026)
## Concepts (C-)
- [[C-Markov_Blanket_Isolation]] : Définit la frontière étanche entre le système et son environnement.
- [[C-Generative_Replay]] : Mécanisme de consolidation de la mémoire pendant les phases de repos.
## Principes (P-)
- [[P-Identity_Impermeability]] : Le système ne doit jamais modifier ses propres règles fondamentales sans validation humaine.
## Narratifs (N-)
- [[N-Story_4_The_Last_Token]] : Illustre l'épuisement latent d'un module Mamba.
```
**Comment l'utiliser :** Au début de *chaque* nouvelle session de chat, vous copiez-collez ce fichier en préambule :
> *"Agis en Tisserand. Voici le contexte actuel du projet (liste des atomes existants) : [Coller le contenu de INDEX_ATOMES.md]. Maintenant, voici mon nouvel atome en brouillon : [Votre texte]. Propose-moi des liens vers cet index."*

Cela pèse quelques kilo-octets, tient facilement dans n'importe quel prompt, et empêche l'IA de recréer un `C-Markov_Blanket` si elle voit qu'il existe déjà.

---

### Niveau 1.5 : Le "Context Pack" Manuel (Dans votre éditeur)
Vous n'avez pas besoin de donner *tout* le dépôt, seulement ce qui est pertinent. Votre éditeur (VS Code ou Obsidian) est votre meilleure arme.

1. Vous savez que vous allez travailler sur le "Sommeil génératif".
2. Dans votre éditeur, vous ouvrez en onglets : `C-Generative_Replay.md`, `P-Identity_Impermeability.md`, et `N-Story_4.md`.
3. Vous sélectionnez le texte de ces 3 fichiers, vous faites `Ctrl+C`.
4. Vous collez dans le chat : *"Agis en Avocat du Diable. Voici le contexte de 3 atomes existants : [Coller]. Je vais écrire une nouvelle scène. Vérifie qu'elle ne viole pas le P-."*

**Avantage :** Vous restez le maître absolu de ce que l'IA "voit". C'est du "RAG manuel" (Retrieval-Augmented Generation), et c'est souvent plus précis que de laisser un algorithme deviner quels fichiers sont pertinents.

---

### Niveau 2 : Le Script "Context Builder" (Semi-automatique, prévu dans votre §8)
Puisque votre dossier `99_Agents/` est censé contenir des scripts Python, vous pouvez écrire un tout petit script (50 lignes max) qui ne fait qu'une chose : **lire et résumer**.

Quand vous voulez travailler, vous lancez ce script dans votre terminal. Il scanne votre dossier `10_Atoms/`, extrait uniquement le titre (`# Titre`) et le premier paragraphe (`## Definition`) de chaque fichier, et génère un fichier unique : `00_Inbox/CONTEXT_PACK.md`.

Ensuite, vous ouvrez ce fichier, vous le copiez, et vous le donnez à l'IA. 
*Vous ne codez pas une interface, vous codez juste un "助理" (assistant) de préparation de texte.*

---

### Niveau 3 : Utiliser les fonctionnalités natives des outils de Chat (Le "Sweet Spot")
Aujourd'hui, vous n'avez même plus besoin de copier-coller manuellement si vous utilisez les bons outils grand public, **sans coder la moindre ligne** :

*   **Si vous utilisez Claude (Anthropic) :** Utilisez la fonctionnalité **"Projects"**. Vous créez un Project "Garrigue-X", vous y uploadez une fois pour toutes vos dossiers `00_Meta`, `10_Atoms` et vos chartes stylistiques. Ensuite, dans le chat, vous dites simplement : *"Agis en Tisserand, en te basant sur les fichiers du Project"*. Claude ira chercher tout seul les informations pertinentes dans vos documents.
*   **Si vous utilisez ChatGPT (OpenAI) :** Utilisez les **"Custom GPTs"** ou la fonction "Knowledge" (Connaissances) où vous pouvez uploader vos fichiers Markdown.
*   **Si vous travaillez dans Obsidian :** Utilisez le plugin **"Smart Connections"** ou **"Text Generator"**. Ces plugins indexent localement vos notes. Quand vous ouvrez une note, le plugin peut automatiquement injecter dans le prompt de l'IA les 5 notes les plus similaires de votre dépôt.

---

### 💡 Ma recommandation pour votre prochaine étape

Ne vous lancez pas dans l'automatisation complexe (Niveau 2 ou 3) avant d'avoir rodé le processus. Le piège est de passer plus de temps à configurer l'outil qu'à écrire la saga.

**Je vous propose de faire ceci ensemble, maintenant, en mode manuel (Niveau 1) :**

1. Dites-moi quels sont les **3 à 5 atomes** (titres et idées en une phrase) que vous avez déjà créés ou que vous avez en tête.
2. Je vais vous générer le contenu du fichier `00_Meta/INDEX_ATOMES.md` prêt à être sauvegardé.
3. Ensuite, nous ferons un test grandeur nature : vous me donnerez une idée en vrac en français, et je jouerai le rôle du **Botaniste** en utilisant *uniquement* cet index pour m'assurer que je ne propose pas de doublon et que je lie correctement votre nouvelle idée à l'existant.

Qu'en dites-vous ? Quels sont ces premiers atomes ?