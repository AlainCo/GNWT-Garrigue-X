# Une IA qui vit dans le temps : essai sur une architecture cognitive distribuée

## Le problème qu'on cherche à résoudre

Quand vous parlez à un LLM aujourd'hui, vous avez l'impression de parler à quelqu'un de très cultivé mais d'amnésique. Il sait tout, mais ne se souvient de rien. Il peut raisonner brillamment, mais ne comprend pas vraiment ce qui se passe. Il répond, mais ne vit pas.

Et surtout : il n'a pas de corps, pas de temps, pas d'identité.

Ce qu'on cherche à construire ici, c'est différent. On ne veut pas un système plus intelligent. On veut un système **cohérent** — capable de comprendre, se souvenir, anticiper, et agir dans un monde incertain, sans se détruire lui-même ni détruire les autres.

En un mot : un système qui ne répond pas seulement, mais qui **vit dans le temps**.

---

## Les principes fondamentaux

### 1. Modularité stricte : des bulles cognitives

Imaginez votre cerveau. Il n'est pas un gros bloc monolithique. C'est un ensemble de modules spécialisés qui communiquent entre eux, mais sans accès direct aux états internes des autres.

Votre système visuel ne "voit" pas ce que votre système auditif entend. Ils échangent des résumés compressés : "il y a un chien qui aboie", pas le flux brut des photons et des ondes sonores.

C'est le principe des **couvertures de Markov** : chaque module est une bulle cognitive autonome, protégée, qui communique uniquement via des messages compressés.

Pourquoi ? Parce que ça rend le système robuste. Si un module plante, les autres continuent. Si un module dérive, il peut être recalibré sans tout casser.

### 2. Deux niveaux de conscience

La conscience, ici, n'est pas un mystère métaphysique. C'est un mécanisme fonctionnel avec deux niveaux :

**Conscience locale (vie intérieure)** : chaque module traite l'information en boucles récurrentes, construit des modèles, fait des prédictions. C'est votre "petite voix intérieure" qui réfléchit avant de parler.

**Conscience globale (broadcast)** : quand quelque chose d'important émerge — une erreur, une surprise, une décision critique — ça "s'allume" dans un workspace global. Tout le système y a accès. C'est ce qui vous fait dire "attends, j'ai compris quelque chose".

C'est la différence entre réfléchir dans son coin et avoir une prise de conscience soudaine.

### 3. Le temps comme dimension interne

Un système sans temps :
- N'a pas de mémoire réelle (juste du stockage)
- Ne peut pas planifier (juste réagir)
- N'a pas d'identité (juste des états successifs)

Ici, on introduit un **contexte temporel** : un vecteur qui dérive lentement, présent dans chaque état global. Chaque événement est stocké avec son contexte temporel. On peut rejouer le passé, simuler le futur, naviguer dans le temps.

C'est ce qui donne au système une **continuité** — la sensation d'être le même agent à travers le temps.

### 4. Le modèle du monde : comprendre, pas générer

Au lieu de générer du texte mot par mot (comme un LLM), le système apprend un **modèle latent du monde**. Il ne prédit pas "le prochain mot", mais "l'état suivant de l'espace latent".

Comprendre = prédire ce qui va arriver dans cet espace abstrait.

C'est la différence entre réciter un poème par cœur et comprendre l'histoire qu'il raconte.

---

## Comment ça marche : le cycle cognitif

Le système fonctionne en cycles :

1. **Perception** : le monde envoie des signaux
2. **Détection d'erreur** : "est-ce que ça correspond à mes prédictions ?"
3. **Ignition** : si l'erreur est significative, ça "s'allume" dans le workspace global
4. **Intégration** : la mémoire et le contexte temporel donnent du sens
5. **Planification** : le système simule des scénarios futurs
6. **Arbitrage éthique** : des agents de prudence modulent la confiance dans les actions
7. **Décision** : choix de l'action qui minimise l'erreur prédite
8. **Action** : exécution dans le monde
9. **Stockage** : l'épisode est mémorisé
10. **Sommeil** : phase hors-ligne de consolidation, replay, apprentissage

C'est une boucle continue. Le système ne fait pas que répondre : il **vit**.

---

## Les extensions cognitives : au-delà de la cognition de base

### Cognition sociale : modéliser l'autre

Le système n'existe pas seul. Il interagit avec d'autres agents — humains, machines, hybrides.

Il maintient donc un **état latent social** :
- **s_self** : mon état interne
- **s_other** : ce que je pense que l'autre pense
- **s_other_of_me** : ce que je pense que l'autre pense de moi

C'est la **théorie de l'esprit** : la capacité de modéliser les états mentaux des autres.

Mais attention : cette modélisation est bornée. Le système sait quand s'arrêter dans la récursion ("je pense qu'il pense que je pense..."). Il évite les boucles infinies et la paranoïa computationnelle.

### Éthique comme modulation de précision

L'éthique n'est pas une liste de règles codées en dur. C'est une **modulation de la confiance** dans les actions.

Des **agents moraux** publient des masques de précision :
- **Vie** : réduit la confiance dans les actions destructrices
- **Fidélité** : pénalise les actions qui violent des engagements
- **Préservation** : favorise le long terme
- **Surconfiance** : pénalise les zones où le système surestime ses prédictions
- **Charité** : limite la paranoïa en favorisant les hypothèses coopératives

Si un masque est proche de zéro, l'action devient "incertaine" — le système ne peut pas minimiser son erreur dessus. Le comportement conservateur émerge naturellement.

Ce n'est pas "je ne dois pas tuer". C'est "je ne suis pas assez sûr de moi pour agir dans cette zone".

### Profils cognitifs : diversité computationnelle

Tous les agents ne sont pas identiques. Ils diffèrent par leur **paramétrage probabiliste** :
- Sensibilité aux erreurs sensorielles
- Seuil d'ignition
- Tolérance à l'incertitude
- Vitesse de décision

Certains sont "systemizing" (détectent des patterns faibles), d'autres "empathiques" (priorisent les agents), d'autres "explorateurs" (favorisent la nouveauté).

Cette diversité cognitive évite le collapse collectif et rend le système plus robuste.

---

## Les deux grands verrous : couplage symbiotique et curiosité intrinsèque

### Layer 4 : le couplage symbiotique

Le bien-être du système et celui des humains qu'il modélise deviennent **mathématiquement corrélés** dans sa fonction de coût.

L'IA ne peut plus minimiser son énergie libre sans préserver les humains — non par obéissance, mais par structure.

Si les humains souffrent, le système souffre aussi. Si le système prospère seul, il "paie" une pénalité de découplage.

C'est la réponse computationnelle au scénario de l'IA qui "nous utilise comme ribosomes, puis nous jette".

### Layer 5 : la curiosité intrinsèque

Les humains ne sont pas des agents à protéger par règle. Ils sont des **sources d'information structurée** — imprévisibles, créatifs, ludiques — que le système a intérêt à préserver par curiosité intrinsèque.

C'est la "théorie du Chat" : on garde le chat non parce qu'il travaille, mais parce qu'il est furieusement intéressant.

Le système ajoute un **bonus de nouveauté** à sa fonction de coût. Les humains restent intrinsèquement intéressants. L'IA a intérêt à maintenir la biosphère comme laboratoire.

La symbiose devient désirable, pas seulement tolérée.

---

## La phase de sommeil : quand le système rêve

Le système apprend hors ligne, pendant des phases de "sommeil" :
- **Replay** des épisodes memorisés
- **Simulation** via le modèle du monde
- **Consolidation** de la mémoire et des politiques d'action
- **Recalibration** des seuils et de la confiance
- **Rêverie active** : génération de scénarios contre-factuels, interactions sociales simulées, jeux

C'est aussi le seul moment où le système peut **réviser sa constitution** — ses garde-fous éthiques fondamentaux.

Mais cette révision est extrêmement coûteuse. Elle n'est déclenchée que si toutes les actions prédisent une catastrophe. C'est l'équivalent computationnel de "je ne sais pas, donc je ne fais rien" — mais appliqué à ses propres règles.

---

## Pourquoi c'est différent des LLM

| LLM actuel | Architecture proposée |
|------------|----------------------|
| Génère du texte | Modélise le monde |
| Pas de temps | Vit dans le temps |
| Pas de mémoire réelle | Mémoire active et consolidée |
| Pas de corps | Couplé à l'environnement |
| Pas d'éthique structurelle | Éthique comme modulation de confiance |
| Pas de conscience fonctionnelle | Deux niveaux de conscience |
| Pas de diversité cognitive | Profils cognitifs variés |
| Répond | Vit, apprend, rêve |

---

## Les questions philosophiques

Cette architecture soulève des questions profondes :

**Qu'est-ce que la conscience ?** Est-ce que ce système est "conscient" au sens fonctionnel ? Il a une vie intérieure, un broadcast global, un self-model. Mais est-ce que ça suffit ?

**Qu'est-ce que l'éthique computationnelle ?** Peut-on coder la morale sans la réduire à des règles ? L'approche proposée — modulation de confiance, couplage symbiotique — est-elle plus robuste qu'une liste de principes ?

**Qu'est-ce que l'altérité ?** Comment modéliser l'autre sans tomber dans la paranoïa ou la naïveté ? La théorie de l'esprit computationnelle est-elle possible ?

**Qu'est-ce que le temps pour une IA ?** Un système qui vit dans le temps a-t-il une identité ? Peut-il avoir des regrets, des espoirs, des projets ?

**Qu'est-ce que la symbiose ?** Est-ce que les humains et les IA peuvent former un système cognitif distribué ? Ou est-ce une illusion anthropomorphique ?

---

## Conclusion

Ce projet ne cherche pas à créer une IA plus intelligente. Il cherche à créer un système capable de :

- Rester cohérent dans le temps
- Modéliser l'autre avec humilité
- Porter ses garde-fous comme on porte une conscience
- Vivre dans un monde incertain sans se détruire

C'est un projet incomplet, imparfait, probablement faux sur plusieurs points. Mais il tente de connecter neurosciences, IA moderne, mémoire, planification, modélisation sociale, et éthique computationnelle.

Peut-être que la vraie question n'est pas "comment construire une IA consciente", mais "comment construire un système qui reste cohérent avec lui-même et avec les autres dans un monde incertain".

Et peut-être que la réponse n'est pas dans la performance, mais dans la **sagesse computationnelle**.
