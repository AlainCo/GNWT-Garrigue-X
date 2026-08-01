---
title: "Microsoft Copilot : Projets"
source: "https://copilot.microsoft.com/projects/cS98Z9kxi1fWKkjKy4fsr/chats/PW8xBZxWTTVQvvpbgLgsS"
author:
published:
created: 2026-07-31
description: "Microsoft Copilot est votre compagnon pour informer, divertir et inspirer. Obtenez des conseils, des commentaires et des réponses simples. Essayez Copilot maintenant."
tags:
  - "clippings"
---
Aujourd’hui

Peux tu me décrire les Obsidian Bases, et comment on les utilise, comment on crée des documents qui en bénéficient?
Il s'agit de Bases dans Obsidian ≥ 1.9.10... et on me dit de travailler avec le plugin navigateur Obsidian Web Clipper qui génère des fichiers... je crois qu'il y a des headers yaml a utiliser, mais la suite avec Bases je ne comprend pas comment ca marche dans Obsidian.

Bonne nouvelle Alain: **je sais exactement de quoi tu parles.** Depuis **Obsidian 1.9.10**, une nouvelle fonctionnalité majeure est arrivée: **les Bases**.

Et oui, elles sont étroitement liées au **Web Clipper** (le plugin navigateur officiel), aux **fichiers générés automatiquement**, et à des **headers YAML structurés**.

Je vais t’expliquer *clairement*, *techniquement*, *sans flou*, comment ça marche — parce que la doc officielle est encore très pauvre.

## 🎯 Résumé clair: qu’est‑ce qu’une Base dans Obsidian?

Une **Base** est un **type de note** défini par un schéma YAML. Elle permet à Obsidian de:

- reconnaître automatiquement qu’une note appartient à un type (ex: `article`, `bookmark`, `person`, `project`)
- appliquer un **template automatique**
- afficher des **vues dédiées** (listes, tables, cartes)
- permettre au **Web Clipper** de créer des notes déjà conformes à ce type
- valider les champs YAML (types, formats, champs obligatoires)

👉 C’est une **brique de données structurées**, intégrée nativement dans Obsidian.

C’est la première étape vers un Obsidian “semi‑base‑de‑données”.

## 🧱 Comment fonctionne une Base?

Une Base est définie par un fichier `.json` dans:

```
.obsidian/bases/
```

Chaque base décrit:

- un **nom**
- un **template**
- un **schéma YAML**
- des **champs** (string, date, list, url, number…)
- des **vues** (table, liste, galerie)
- des **règles de création automatique**

## 🧩 Exemple concret: Base “Web Article”

C’est celle utilisée par le **Web Clipper**.

Quand tu clippes une page, Obsidian génère un fichier avec un YAML comme:

```
base: web-article
title: "Titre de la page"
url: "https://example.com"
created: 2024-01-01
tags:
  - web
  - article
```

Ce YAML correspond au **schéma de la Base**.

## 🔧 Comment créer une Base?

Tu vas dans:

**Paramètres → Bases → Créer une Base**

Tu définis:

### 1) Le nom

Ex: `web-article`

### 2) Le schéma YAML

Ex:

```
{
  "fields": {
    "title": { "type": "text", "required": true },
    "url": { "type": "url", "required": true },
    "created": { "type": "date" },
    "tags": { "type": "list" }
  }
}
```

### 3) Le template associé

Ex:

```
---
base: web-article
title: {{title}}
url: {{url}}
created: {{created}}
tags: {{tags}}
---

# {{title}}

Source : {{url}}
```

### 4) Les vues

Tu peux créer une vue “Table”:

- colonnes: `title`, `url`, `created`
- filtre: `base = web-article`

## 📄 Comment créer une note qui utilise une Base?

Trois méthodes:

## 1) Via le Web Clipper

C’est le cas d’usage principal.

Le Web Clipper détecte la Base “web-article” et génère automatiquement:

- le fichier
- le YAML conforme
- le template rempli

## 2) Via “Nouvelle note → Choisir une Base”

Dans Obsidian:

- `Ctrl+N`
- Choisir la Base dans la liste
- Le template se remplit automatiquement

## 3) En ajoutant le champ base: dans le YAML

Ex:

```
---
base: web-article
title: "Mon test"
url: "https://example.com"
---
```

Obsidian reconnaît immédiatement la Base et:

- valide les champs
- applique les vues
- active les fonctionnalités associées

## 🧪 Comment Obsidian utilise les Bases?

### ✔ Validation du YAML

Si un champ obligatoire manque → Obsidian te le signale.

### ✔ Auto‑complétion des champs

Les champs définis dans la Base apparaissent dans l’éditeur YAML.

### ✔ Vues automatiques

Tu peux créer des vues qui affichent toutes les notes d’une Base.

### ✔ Intégration Web Clipper

Le Clipper génère des notes conformes à la Base.

### ✔ Intégration future (annoncée)

- relations entre Bases
- types de données avancés
- formulaires de création
- API pour plugins

## 🧭 Synthèse

| Élément | Rôle |
| --- | --- |
| **Base** | Définition d’un type de note |
| **Schéma YAML** | Structure des champs |
| **Template** | Modèle de note |
| **Vues** | Affichage des notes de ce type |
| **Web Clipper** | Génère des notes conformes à la Base |

## 🚀 Tu veux aller plus loin?

Je peux t’aider à:

- créer une **Base Web Article complète** (Base Web Article)
- créer une **Base Project** pour ton workflow OpenWrt / scripts Bash (Base Project)
- créer une **Base Person** pour gérer des contacts techniques (Base Person)
- comprendre comment **structurer ton vault autour des Bases** (Structurer avec Bases)

Dis‑moi quelle Base tu veux créer, et je te génère le schéma + template + vues.

proposition-qwen-romancier-ingenieur-SFP-BDD-MODE\_DEMPLOI\_v4.md

Markdown

intéressant. en fait j'ai un projet de me construire un système un peu zettelkasten, mais avec plusieurs types de fiches (on avait travaillé sur un mode d'emploi... c'est encore discutable, je cherche ma méthode et mes outils, j'ai pas tout compris)... visiblement il était prévu de mettre des headers que "Bases" pourrait gérer et des templates aussi... comment je pourrais utiliser "Bases" dans mon Vault Obsidian?

Je vais t’expliquer **exactement** comment utiliser *Bases* dans Obsidian pour construire un système **Zettelkasten multi‑types**, cohérent, structuré, et compatible avec ton *Mode d’Emploi* de “Romancier‑Ingénieur”.

Tu vas voir: *Bases* est **précisément** l’outil qui manquait pour faire ce que tu veux.

## 🎯 Takeaway

Tu peux utiliser **Bases** pour définir tes **types de fiches Zettelkasten** (Concept, Fiche‑Idée, Personnage, Projet, Source, etc.), leur **schéma YAML**, leurs **templates**, et leurs **vues**. Ensuite, chaque nouvelle note créée avec une Base est automatiquement **typée**, **validée**, **structurée**, et **affichée** dans des vues dédiées.

C’est un Zettelkasten… mais **avec des types de données**.

## 🧱 Pourquoi Bases est parfait pour ton système Zettelkasten

Ton projet “Romancier‑Ingénieur” repose sur:

- plusieurs **types de fiches**
- des **relations**
- des **templates**
- des **règles de structuration**
- des **vues** (listes, tables, cartes)
- des **métadonnées YAML cohérentes**

Avant Obsidian 1.9.10, tu devais bricoler ça avec:

- Templater
- Dataview
- dossiers
- conventions manuelles

Maintenant, **Bases** te donne:

- des **types de notes officiels**
- des **schémas YAML validés**
- des **templates automatiques**
- des **vues natives**
- une **intégration Web Clipper**
- une **cohérence garantie**

Tu peux donc créer un système Zettelkasten **typé**, **fiable**, **reproductible**, exactement comme tu aimes travailler.

## 🧩 Comment utiliser Bases dans ton Vault Obsidian

## 1) Définir tes types de fiches (tes “Bases”)

Tu vas dans:

**Paramètres → Bases → Nouvelle Base**

Et tu crées par exemple:

- **Fiche Concept**
- **Fiche Idée**
- **Fiche Personnage**
- **Fiche Projet**
- **Fiche Source**

Chaque Base contient:

- un **schéma YAML**
- un **template**
- des **vues**

## 2) Définir le schéma YAML de chaque type

Exemple pour une **Fiche Concept**:

```
{
  "fields": {
    "title": { "type": "text", "required": true },
    "summary": { "type": "text" },
    "links": { "type": "list" },
    "created": { "type": "date" },
    "updated": { "type": "date" }
  }
}
```

Exemple pour une **Fiche Projet**:

```
{
  "fields": {
    "title": { "type": "text", "required": true },
    "status": { "type": "text", "options": ["active", "paused", "done"] },
    "start": { "type": "date" },
    "due": { "type": "date" },
    "related": { "type": "list" }
  }
}
```

Tu peux définir autant de types que tu veux.

## 3) Créer les templates associés

Exemple template pour **Fiche Concept**:

```
---
base: concept
title: {{title}}
summary: {{summary}}
links: {{links}}
created: {{created}}
updated: {{updated}}
---

# {{title}}

## Résumé
{{summary}}

## Liens
{{links}}
```

Exemple template pour **Fiche Projet**:

```
---
base: project
title: {{title}}
status: {{status}}
start: {{start}}
due: {{due}}
related: {{related}}
---

# {{title}}

## Objectif
…

## Tâches
- [ ] …

## Liens
{{related}}
```

## 4) Créer des vues pour chaque type

Dans **Bases → Vues**, tu peux créer:

### Vue “Concepts”

- filtre: `base = concept`
- colonnes: `title`, `summary`, `updated`
- tri: `updated desc`

### Vue “Projets actifs”

- filtre: `base = project AND status = active`
- colonnes: `title`, `due`, `related`

### Vue “Sources”

- filtre: `base = source`
- colonnes: `title`, `url`, `created`

Tu obtiens un Zettelkasten **navigable**, **structuré**, **vivant**.

## 5) Créer une note qui utilise une Base

Trois méthodes:

### Méthode A — “Nouvelle note → Choisir une Base”

Tu choisis “Concept”, “Projet”, “Idée”, etc. Le template se remplit automatiquement.

### Méthode B — Ajouter base: dans le YAML

Ex:

```
---
base: concept
title: "La notion de système narratif"
---
```

Obsidian reconnaît immédiatement la Base.

### Méthode C — Via le Web Clipper

Si tu crées une Base “source”, le Web Clipper peut générer automatiquement:

```
base: source
title: "Article intéressant"
url: "https://example.com"
created: 2026-07-31
```

## 🧭 Comment intégrer ça dans ton Mode d’Emploi “Romancier‑Ingénieur”

Tu peux définir:

### 1) Les types de fiches du système

- Concept
- Idée
- Projet
- Personnage
- Source
- Note de travail
- Fragment narratif
- Fiche technique
- Fiche univers

### 2) Leur schéma YAML

Bases valide automatiquement la structure.

### 3) Leur template

Bases remplit automatiquement les champs.

### 4) Leur vue

Bases affiche automatiquement les fiches par type.

Tu obtiens un système:

- cohérent
- reproductible
- typé
- structuré
- compatible avec ton workflow d’ingénieur

## 🚀 Prochaine étape

Je peux te construire:

- **la liste complète des types de fiches**
- **les schémas YAML pour chaque type**
- **les templates pour chaque type**
- **les vues pour chaque type**
- **l’intégration avec ton Mode d’Emploi**

Souhaites‑tu que je t’aide à définir:

👉 **la liste des types de fiches** 👉 **le schéma YAML de chaque type** 👉 **les templates pour chaque type** 👉 **les vues pour chaque type**

Dis‑moi ce que tu veux construire en premier.

- proposition-qwen-romancier-ingenieur-SFP-BDD-MODE\_DEMPLOI\_v4.md
	Markdown