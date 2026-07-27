Bonne nouvelle : ce que tu décris colle assez naturellement à l'architecture de Hermes Agent (le projet open source de Nous Research, sorti début 2026). Je ne le connaissais pas avant de vérifier, donc je te partage ce que j'ai trouvé en cherchant, avec les limites de ce qui est documenté publiquement.

## Ce qu'est réellement Hermes Agent

Ce n'est pas un framework d'orchestration multi-agents façon LangGraph/CrewAI. C'est un agent auto-hébergé (CLI + passerelle messagerie Telegram/Discord/Slack/WhatsApp) qui tourne en continu sur ta machine, avec :

- **Mémoire persistante** (SQLite FTS5 + un moteur de modélisation dit "Honcho") stockée dans `~/.hermes/`
- **Système de compétences** au format `SKILL.md` (standard ouvert agentskills.io), avec création automatique de skills quand il résout un problème complexe
- **Sous-agents parallèles** : il peut lancer des sous-agents isolés, chacun avec sa propre conversation/terminal, pour des workflows en parallèle
- **Environnements d'exécution** : terminal local, Docker, SSH distant, Modal
- **Contrôle navigateur complet** (recherche, scraping, extraction de pages) — exactement ce qu'il te faut pour ton Engraisseur
- **Planificateur cron** intégré pour de l'automatisation non surveillée

Donc : pas de moteur de workflow à états avec des rôles figés nativement, mais tous les briques pour construire ce que tu imagines.

## Comment ça mapperait à ton besoin

**Botaniste et Engraisseur = deux `SKILL.md` distincts**, pas deux "agents" séparés au sens produit. Un skill Hermes, c'est un fichier markdown avec :
- une description de la tâche/procédure
- les outils autorisés
- éventuellement des exemples

Tu écrirais donc quelque chose comme :

```
mon-projet-git/
├── inbox/              # textes bruts à traiter
├── candidates/         # atomes proposés par Botaniste
├── current/             # atomes validés par toi
├── .hermes-skills/
│   ├── botaniste.md     # SKILL.md : extraction de concepts
│   └── engraisseur.md   # SKILL.md : enrichissement bibliographique
```

**Botaniste** — tu l'invoques en chat ("utilise la compétence botaniste sur inbox/texte-x.md") ou via cron s'il doit surveiller `inbox/` automatiquement. Le skill décrirait : lire le texte, comparer avec les atomes déjà présents dans `current/` (recherche full-text via le terminal, `grep`/`ripgrep` sur le repo), générer un fichier markdown normalisé dans `candidates/` avec code d'atome, description courte, catégories. Comme Hermes a un accès terminal complet, il peut faire ça avec de simples commandes shell + son propre raisonnement, sans API externe.

**Engraisseur** — invoqué par toi, ciblé ("thème X" ou "nom de fichier"), utilise le contrôle navigateur pour chercher/scraper des sources, puis édite le fichier markdown dans `current/` pour ajouter résumé pédagogique + bibliographie. Là le contrôle navigateur intégré est exactement l'outillage "recherche + scraping" que tu demandais.

**Le point de friction** : Hermes n'a pas de notion native de "pipeline avec étapes de validation humaine bloquantes" (comme une vraie PR review automatisée). Ton geste "je regarde candidates/, je complète, je déplace vers current/" resterait un geste manuel à toi — ce qui, en fait, correspond bien à ce que tu décris (tu veux rester dans la boucle), donc ce n'est pas un manque, juste à noter que rien ne "poussera" automatiquement candidates → current sans ton action, sauf si tu écris toi-même cette logique en skill/cron.

**Git** : pas d'intégration Git structurée (pas de PR, pas de review UI) — mais comme Hermes a un accès terminal complet, il peut faire `git add/commit/push` lui-même si tu le lui demandes dans le skill. Ça reste artisanal (des commandes shell), pas un vrai GitOps.

## Ce que je ne peux pas garantir

Le projet a l'air très récent (post ma coupure de connaissances, quelque part début-mi 2026) et évolue vite — les infos ci-dessus viennent de leur site et de quelques articles, pas d'une doc technique exhaustive que j'ai pu explorer en détail (format exact des `SKILL.md`, syntaxe précise pour invoquer un sous-agent avec un rôle donné, etc.). Je te recommande de regarder directement leur repo GitHub (`NousResearch/hermes-agent`) et le format `agentskills.io` avant de te lancer, pour valider la syntaxe exacte des skills.

Tu veux que je regarde plus précisément la doc GitHub pour te donner un exemple concret de `SKILL.md` fonctionnel ?

Bien reçu — je suis allé regarder le repo GitHub et la doc technique. Voici comment ça marche concrètement, mécanisme par mécanisme.

## Le mécanisme de base : la boucle outil

Hermes fonctionne comme la plupart des agents LLM modernes : à chaque tour, le modèle reçoit ta demande + le contexte, et peut décider d'appeler un outil (une fonction structurée) plutôt que de répondre directement. Le résultat de l'outil revient dans la conversation, et le modèle continue à raisonner — potentiellement en enchaînant plusieurs appels — jusqu'à te donner une réponse finale. Rien de mystérieux : c'est le même principe que les tool calls d'API classiques, mais Hermes vient avec ~70 outils déjà câblés, organisés en "toolsets" (web, terminal, file, browser, memory, skills, delegation...).

Les outils qui t'intéressent :
- **Fichiers** : `read_file`, `write_file`, `patch` (modification ciblée), `search_files` (grep/recherche dans un dossier)
- **Web** : `web_search` (recherche), `web_extract` (récupère une URL et la convertit en markdown propre — marche aussi sur des PDF)
- **Terminal** : `terminal` (exécute des commandes shell, donc `git`, `ripgrep`, etc.)
- **Orchestration** : `delegate_task` (sous-agents parallèles), `cronjob` (planification)

## Comment un skill se charge (important à comprendre)

Un skill n'est **pas** injecté en entier dans le prompt à chaque fois. Le chargement est progressif :
1. Au démarrage, l'agent voit `skills_list()` — une liste compacte de tous les skills disponibles (~3k tokens pour tous)
2. Quand il juge qu'un skill est pertinent pour la tâche, il appelle `skill_view(nom)` qui charge le `SKILL.md` complet
3. Si le skill référence des fichiers annexes (scripts, docs de référence), ils ne se chargent que si nécessaire

Ça veut dire que tu peux avoir des dizaines de skills installés sans gonfler le contexte — seul celui utilisé pour la tâche en cours coûte des tokens.

## Exemple concret : le skill "Botaniste"

Structure sur disque :
```
~/.hermes/skills/recherche/botaniste/
└── SKILL.md
```

Contenu du fichier :

```markdown
---
name: botaniste
description: Extrait des concepts atomiques d'un texte et crée des fiches candidates dans le dépôt d'idées
---

# Botaniste — extraction de concepts

## Contexte
Le dépôt d'idées est organisé ainsi :
- `inbox/` : textes bruts à traiter
- `current/` : atomes de concepts déjà validés (fichiers .md)
- `candidates/` : propositions en attente de validation humaine

## Étapes

1. Lis le texte source avec `read_file`.
2. Identifie 3 à 8 concepts significatifs et autonomes (pas de paraphrase du texte entier).
3. Pour chaque concept repéré, vérifie s'il existe déjà :
   utilise `search_files` sur `current/` avec des mots-clés proches du concept
   (titre, synonymes). Si un atome proche existe déjà (>70% de recouvrement
   sémantique estimé), NE PAS créer de doublon : note-le en commentaire dans
   le candidat comme "concept proche : current/xxx.md".
4. Pour chaque concept réellement nouveau, écris un fichier avec `write_file`
   dans `candidates/`, nommé `AAAA-MM-JJ-slug-du-concept.md`, au format :

   ```
   ---
   code: BOT-{slug}
   titre: ...
   categories: [cat1, cat2]
   statut: candidate
   ---

   ## Description
   (3-5 phrases, pédagogique, pas de jargon inutile)

   ## Origine
   Extrait de : {nom du fichier source}

   ## Bibliographie
   (à compléter — vide à ce stade)
   ```

5. Termine par un résumé listant les fichiers créés et les concepts jugés
   déjà couverts (avec la référence vers l'atome existant).

## Ce que tu ne dois PAS faire
- Ne modifie jamais un fichier dans `current/`.
- Ne déplace jamais un fichier de `candidates/` vers `current/` toi-même.
```

Tu invoquerais ça par exemple avec :
```
hermes chat --toolsets skills,file -q "Utilise le skill botaniste sur inbox/article-sur-la-thermodynamique.md"
```
ou en conversation normale, simplement : *"Utilise ta compétence botaniste sur ce texte"* — l'agent va lui-même faire `skill_view("botaniste")` puis exécuter les étapes en enchaînant `read_file` → `search_files` → `write_file`.

## Exemple concret : le skill "Engraisseur"

```markdown
---
name: engraisseur
description: Enrichit un atome de concept existant avec un résumé pédagogique et une bibliographie sourcée
---

# Engraisseur — enrichissement bibliographique

## Étapes

1. Lis l'atome ciblé dans `current/` avec `read_file`.
2. Formule 2-3 requêtes de recherche pertinentes à partir du titre et des
   catégories, puis appelle `web_search` pour chacune.
3. Pour les 3-5 sources qui semblent les plus solides (préférer sources
   académiques, encyclopédiques, ou de référence — éviter blogs SEO),
   utilise `web_extract` sur leur URL pour récupérer le contenu en markdown.
4. Rédige un résumé pédagogique de 150-300 mots à partir de ce que tu as lu
   (dans tes propres mots, pas de copier-coller).
5. Construis une section bibliographie au format :
   `- [Titre de la source](url) — une phrase expliquant sa pertinence`
6. Utilise `patch` pour insérer/remplacer les sections "## Résumé" et
   "## Bibliographie" dans le fichier — ne touche pas au reste (description
   initiale, code, catégories).
7. Ne modifie jamais deux atomes dans la même session sans confirmation.
```

Invocation : *"Utilise l'engraisseur sur current/thermodynamique-entropie.md"* — l'agent charge le skill, fait ses `web_search`, filtre, `web_extract` sur les pages retenues, rédige, puis `patch` le fichier.

## Le point sur git et les sous-agents

Comme le terminal est un outil normal, tu peux ajouter une étape "commit" dans le skill (`terminal: git add candidates/ && git commit -m "..."`) — mais rien ne t'empêche aussi de le faire toi-même à la main, ce qui est probablement plus sain pour garder le contrôle.

Pour traiter plusieurs textes de `inbox/` en parallèle, tu utiliserais `delegate_task` : l'agent principal spawn un sous-agent isolé par fichier, chacun avec sa propre conversation, qui applique le skill botaniste indépendamment. Utile si tu as 20 textes à dépouiller d'un coup plutôt qu'un seul.

---

Une dernière précision honnête : ce projet évolue vite et j'ai reconstitué cet exemple à partir de la doc publique (format confirmé, noms d'outils confirmés) mais je n'ai pas testé le comportement réel — avant d'implémenter, je te recommande de faire un test minimal (`hermes chat --toolsets skills -q "..."`) sur un skill jouet pour valider que le comportement observé colle à ce que la doc décrit.

