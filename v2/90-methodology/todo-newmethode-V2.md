
# 🧭 Méthode de travail (synthèse réutilisable)

## 🎯 Objectif

Construire un projet exploratoire d’architecture cognitive :

```text
→ modulaire
→ évolutif
→ lisible
→ collaboratif
→ compatible avec les contraintes des LLM (petits documents)
```

***

## 🧱 Principe fondamental

```text
Ne pas créer de gros documents monolithiques.
Créer un système de documents navigables.
```

***

## 🧩 Organisation globale

Le projet est structuré en deux niveaux :

***

### 1️⃣ Documents atomiques (cœur du contenu)

* petits fichiers spécialisés
* un concept / module / idée par fichier
* indépendants et lisibles seuls
* faciles à modifier et à générer avec un LLM

Exemples :

```text
concepts/
architecture/
mvp/
discussion/
```

***

### 2️⃣ Document parent (README / hub)

* ne contient PAS le détail
* sert de carte du projet
* contient uniquement :
  * des résumés courts
  * des liens vers les documents atomiques

👉 rôle :

```text
navigation > contenu
```

***

## 🧠 Structure des documents

Chaque document atomique suit une structure simple :

```markdown
# Titre

## Idée
## Référence / contexte
## Utilité dans le projet
## Intégration dans l’architecture
```

***

## 🏗️ Structure de l’architecture

L’architecture est découpée en plusieurs fichiers :

* overview → vision globale [\[README.docx \| Word\]]
* modules (agents, mémoire, planner, adaptation, etc.)
* organisation par :
  * fonction
  * échelle
  * temporalité

***

## 🔁 Principe d’écriture

```text
écrire petit → relier → naviguer
```

et non :

```text
écrire gros → synthétiser → maintenir (évité)
```

***

## ⚙️ Workflow recommandé

1. Générer ou modifier un document atomique
2. Ajouter un résumé dans le README
3. Lier les éléments entre eux
4. Itérer progressivement

***

## 🚫 Ce qu’on évite

* gros documents synthétiques difficiles à maintenir
* duplication d’information
* structuration rigide trop tôt
* perfection initiale

***

## ✅ Ce qu’on privilégie

```text
✔ modularité
✔ lisibilité
✔ évolutivité
✔ capacité à itérer avec des LLM
✔ documents incomplets mais utiles
```

***

## 🧭 Positionnement du projet

Ce projet n’est pas :

```text
❌ un produit logiciel
❌ un papier scientifique
```

C’est :

```text
✅ un espace de réflexion structuré
✅ un prototype conceptuel
✅ un appel à collaboration
```

***

## 🧠 Intuition finale

```text
Le repo est une carte.
Les documents sont le territoire.
```

***

✅ Avec ça, tu peux repartir dans un autre prompt en disant simplement :

> “on reprend la méthode : doc atomiques + README hub + résumés + navigation”


Je pense que tu es arrivé à une conclusion très importante : le rôle de la section `01-concepts` n'est pas de décrire ton architecture, mais de constituer le **socle de connaissances du projet**.

Autrement dit :

* `01-concepts` = "Quelles idées utilisons-nous ?"
* `02-architecture` = "Comment les utilisons-nous ?"

Cette distinction paraît simple, mais elle évite énormément de confusion.

***

# Ce que doit permettre un bon document concept

Un document concept doit être :

✅ compréhensible seul

✅ lisible en 2 minutes (grâce au résumé)

✅ améliorable progressivement

✅ utilisable par un humain ou une IA

✅ capable d'accueillir des contributions de niveaux très différents

Par exemple :

* un collaborateur débutant pourra enrichir la bibliographie ;
* un chercheur pourra ajouter des nuances théoriques ;
* toi tu pourras ajouter des liens vers l'architecture.

***

# Template proposé

Je te conseille quelque chose de volontairement simple.

```markdown
# Nom du concept

## Résumé

Description courte (5 à 10 lignes maximum).

- Pourquoi ce concept existe
- Ce qu'il apporte
- Pourquoi il est important pour Garrigue-X

---

## Idée essentielle

Expliquer le concept de manière intuitive.

Question à laquelle le concept répond :

> ...

Réponse courte :

> ...

---

## Description

Description plus détaillée.

Principes importants :

- ...
- ...
- ...

Mécanismes :

- ...
- ...
- ...

---

## Intérêt pour Garrigue-X

Comment ce concept est utilisé dans le projet.

Exemples :

- ...
- ...
- ...

Limites connues :

- ...
- ...

---

## Relations avec d'autres concepts

Concepts parents :

- [[...]]
- [[...]]

Concepts associés :

- [[...]]
- [[...]]

Concepts potentiellement en tension :

- [[...]]
- [[...]]

---

## Questions ouvertes

Questions encore non résolues.

- ...
- ...
- ...

---

## Références

### Références fondatrices

- Auteur, Titre, Année
- Auteur, Titre, Année

### Références récentes

- ...
- ...

### Ressources complémentaires

- Article
- Vidéo
- Blog
- Dépôt GitHub

---

## Historique

- 2026-07 : création du document
```

***

# Pourquoi je mettrais absolument "Questions ouvertes"

C'est probablement la section la plus sous-estimée.

Dans ton projet, beaucoup de concepts sont encore exploratoires :

* conscience
* métacognition
* ToM-X
* architecture distribuée
* éthique computationnelle

Si quelqu'un arrive sur le document et lit :

```markdown
## Questions ouvertes

- Comment mesurer réellement l'intégration causale ?
- Comment éviter le collapse inter-niveaux ?
- Existe-t-il un seuil minimal de saillance ?
```

il comprend immédiatement :

> "ce document n'est pas une vérité révélée ; c'est un espace de recherche."

C'est extrêmement sain.

***

# Une variante pour les concepts complexes

Pour certains concepts (JEPA, GNWT, Active Inference...), tu auras probablement besoin d'une section supplémentaire :

```markdown
## État de l'art

Principales approches :

### Approche A

...

### Approche B

...

### Approche C

...
```

Mais je ne la mettrais pas dans le template de base.

Sinon tous les documents sembleront vides.

***

# Exemple concret : GNWT

```markdown
# Global Neuronal Workspace Theory (GNWT)

## Résumé

La GNWT propose qu'un contenu devient consciemment accessible
lorsqu'il est diffusé à un ensemble de modules spécialisés via
un espace de travail global.

Dans Garrigue-X, la GNWT sert de modèle pour les mécanismes
d'ignition, de diffusion et d'arbitrage.

---

## Idée essentielle

Question :

> Comment un système coordonne-t-il plusieurs processus spécialisés ?

Réponse :

> Grâce à un espace de travail global permettant la diffusion
d'informations saillantes.

---

## Description

...

---

## Intérêt pour Garrigue-X

- Workspace N=4
- Workspace N=5
- Officiers spécialisés
- Ignitions

---

## Relations avec d'autres concepts

Associés :

- [[RPT]]
- [[Attention Scheduler]]
- [[Self-Model]]

---

## Questions ouvertes

- Quelle granularité pour les ignitions ?
- Quel coût de broadcast ?
- Comment éviter la saturation ?

---

## Références

...
```

***

# Ma recommandation finale

Je garderais exactement **7 sections obligatoires** :

```markdown
1. Résumé
2. Idée essentielle
3. Description
4. Intérêt pour Garrigue-X
5. Relations avec d'autres concepts
6. Questions ouvertes
7. Références
```

C'est suffisamment léger pour un concept simple (2 pages), mais suffisamment riche pour accueillir un concept complexe (20 pages) sans jamais devoir changer la structure. C'est généralement le signe d'un bon template.

