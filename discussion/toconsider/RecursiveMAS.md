D'après la page du projet, **RecursiveMAS** (Recursive Multi-Agent System) est un framework qui étend le principe de scaling par récursion, observé dans les modèles de langage récursifs, aux systèmes multi-agents.

L'idée centrale est de traiter l'ensemble du système comme un **calcul récursif unique dans un espace latent continu**. Au lieu que les agents communiquent entre eux en produisant du texte (ce qui est coûteux et peut faire perdre de l'information), ils s'échangent des "pensées latentes" (leurs états cachés). Cela permet une collaboration beaucoup plus efficace.

Voici comment cette architecture fonctionne, en décomposant ses composants clés.

### 🧠 1. Le Module Central : `RecursiveLink`

C'est le cœur technique qui permet les échanges. Il s'agit d'un petit module neuronal (deux couches avec connexion résiduelle) qui joue deux rôles principaux:

*   **Lien Interne (`Inner Link`)** : À l'intérieur d'un même agent, ce module prend l'état caché de sa dernière couche et le projette dans l'espace d'entrée du modèle. L'agent peut alors continuer à "réfléchir" en générant une séquence de pensées, le tout **sans jamais décoder en texte**.
*   **Lien Externe (`Outer Link`)** : Entre deux agents différents, ce module projette les pensées latentes d'un agent pour les passer comme **entrée conditionnante** à l'agent suivant. Il gère même les différences de tailles de modèles (hidden sizes) entre agents de familles différentes.

> **L'astuce de la connexion résiduelle** : En ajoutant la sortie du module à l'état latent original, le modèle préserve le sens sémantique de base et n'a besoin d'apprendre que le "changement" (distributional shift) nécessaire. Cela rend l'entraînement plus stable et efficace.

### 🔄 2. La Collaboration en Boucle

L'architecture transforme le système multi-agents en une unique **boucle récursive**:

1.  **Dans l'agent** : Le `Inner Link` permet à l'agent de générer une séquence de pensées latentes en continu, sans jamais produire de texte intermédiaire.
2.  **Entre les agents** : Le `Outer Link` transfère ces pensées latentes à l'agent suivant, qui les utilise comme contexte en plus de sa propre entrée.
3.  **Fermeture de la boucle** : Le dernier agent renvoie ses sorties latentes au premier agent. Le système peut alors effectuer un nouveau "round" de raisonnement, en affinant le travail du round précédent. **Seul le dernier round décode le résultat final en texte** ; tous les rounds intermédiaires collaborent purement dans l'espace latent.

C'est ce fonctionnement en boucle qui donne son nom au système : chaque passe dans la boucle est un niveau de récursion qui approfondit le raisonnement.

### 🎯 3. Schémas de Collaboration (Plug-and-Play)

RecursiveMAS est flexible et peut s'adapter à différents motifs de collaboration, en utilisant des agents de diverses familles de modèles (Qwen, Llama, Gemma, etc.). La page en présente quatre:

*   **Séquentiel** : Une chaîne de rôles complémentaires (ex: Planificateur → Critique → Solveur).
*   **Mixte** : Des spécialistes (Math, Code, Science) raisonnent en parallèle, et un agent "Synthétiseur" agrège leurs sorties latentes.
*   **Distillation** : Un "Expert" plus gros guide un "Apprenant" plus petit pour lui transmettre ses capacités.
*   **Délibération** : Un "Réflecteur" critique et guide itérativement un agent qui utilise des outils externes (code, recherche).

### ⚙️ 4. L'Entraînement : Une Boucle à Double Niveau

Pour optimiser l'ensemble du système, RecursiveMAS utilise un algorithme d'apprentissage en **deux boucles**:

*   **Boucle Interne** : Au niveau du modèle, elle optimise chaque agent pour qu'il génère de bonnes pensées latentes en réponse à une entrée donnée.
*   **Boucle Externe** : Au niveau du système, elle "déroule" la récursion sur plusieurs rounds et ajuste les liens (`RecursiveLink`) pour que la collaboration complète aboutisse à la bonne réponse finale.

**Un point clé pour l'efficacité** : Tous les paramètres des LLM de base sont **gelés** (frozen). Seuls les modules `RecursiveLink` (environ **13 millions de paramètres**, soit ~0.31% du système total) sont entraînés. C'est ce qui rend l'approche si légère et efficace.

### 📈 5. Pourquoi l'Espace Latent ?

La page justifie ce choix par deux avantages théoriques majeurs:

1.  **Efficacité (Proposition 1)** : Échanger des pensées latentes est **bien moins coûteux en calcul** que de décoder et encoder du texte à chaque interaction, car la taille du vocabulaire (`|V|`) n'entre pas en compte dans la complexité.
2.  **Stabilité (Théorème 1)** : La récursion dans l'espace latent préserve des signaux de gradient informatifs, ce qui rend l'entraînement de la boucle entière **plus stable** et évite les problèmes de gradients qui peuvent survenir avec du texte.

### 🚀 6. Résultats Impressionnants

Ces choix de conception se traduisent par des performances de pointe. Sur 9 benchmarks (mathématiques, sciences, code, etc.), RecursiveMAS surpasse les meilleurs modèles单-agent et multi-agents avec:

*   Une **amélioration moyenne de la précision de +8.3%**.
*   Un **accélération de 1.2× à 2.4×** (moins de temps de calcul).
*   Une **réduction des tokens de 34.6% à 75.6%** (moins de texte généré, donc plus efficace).

En résumé, RecursiveMAS propose une nouvelle façon de faire collaborer des agents : en les connectant dans une boucle de raisonnement continu et purement latent, rendant l'ensemble plus rapide, plus économe et plus performant que les systèmes traditionnels qui échangent du texte.