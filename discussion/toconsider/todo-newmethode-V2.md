
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

