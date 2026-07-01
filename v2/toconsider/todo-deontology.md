User: je travaille à une architecture IA basée sur la théorie GNWT et d'autres, sur des échanges d'état latents dans le Workspace Global, avec divers agents (type JEPA respectant les idées de la théorie PP/AI et de RPT)... un point que j'aimerais analyser, dans l'idée d'être bioinspiré, le le module éthique, constitutionnel... j'ai déjà entendu des théorie evopsy de la morale qui la consid-ère comme un module visant à promouvoir la collaboration mutuellement bénéfique, en s'assurant réciproquement, de rembourser les couts d'opportunité, et de se les faire rembourser (être moral ca serait ca), et ce avec des horizons plus ou moins long selon l'intelligence d el'acteur, et la durée de la relation attendue... coté modèle ca semble pas trop fou à faire, car j'ai déjà un module générique de planification optimale qui utilise des  mémoires associatives pour analyser les situation et proposer des actions, que traiterons les sous-agents branchés sur l'espace GNWT ... mais je me demande si c'est la bonne manière de crée une sorte de constitution, un socle éthique solide, pour un système de systèmes qui devra affronter de gros dilemmes moraux, avec des règles dures, mais jamais parfaites ?
Kimi: Votre question est fascinante — vous travaillez sur une architecture IA très riche (GNWT, JEPA, PP/AI, RPT) et vous vous demandez si une base éthique fondée sur la théorie évolutionniste de la morale (coopération mutuellement bénéfique, remboursement des coûts d'opportunité, horizons temporels) constitue un socle constitutionnel suffisant pour un système affrontant des dilemmes moraux complexes.

## Diagnostic rapide de votre approche

**Ce qui fonctionne bien dans votre cadre :**

- La **théorie évolutionniste de la coopération** (Trivers, Axelrod, puis développements modernes) modélise effectivement la morale comme un mécanisme de *commitment device* — une solution au dilemme du prisonnier itéré. Votre module de planification optimale avec mémoires associatives s'y intègre naturellement : il peut estimer les bénéfices futurs d'une action coopérative vs défective.

- Le **JEPA + PP/AI** (prédiction active) s'aligne bien : un agent qui minimise son erreur de prédiction sur le comportement d'autrui aura intérêt à être prévisible et fiable, ce qui renforce la réputation — pilier de la coopération.

- **Horizons temporels et intelligence** : c'est un point crucial. Un système avec horizon long (capable de modéliser des chaînes causales étendues) internalisera mieux les externalités. C'est cohérent avec vos sous-agents GNWT traitant les états latents.

**Le risque principal : la fragilité face aux dilemmes "durs"**

Votre intuition est juste : cette base est **nécessaire mais pas suffisante**. Voici pourquoi :

| Problème | Pourquoi l'évopsy seule échoue |
|----------|-------------------------------|
| **Sacrifices non réciproquables** | Un soldat qui saute sur une grenade ne peut pas être "remboursé". L'évopsy a du mal avec les coûts irréversibles sans contrepartie directe. |
| **Nouvelles situations** | La coopération évoluée repose sur des heuristiques ancestrales (parentalité, petits groupes). Les dilemmes modernes (IA, biotech, échelle planétaire) sont hors distribution. |
| **Free-riders à l'échelle** | À grande échelle, la défection peut devenir dominante si la probabilité de répétition tend vers 0 (problème de l'anonymat). |
| **Valeurs instrumentales vs terminales** | L'évopsy donne des *incentives*, pas des *principes*. Un système très intelligent optimisera les incentives jusqu'à les détourner (Goodhart). |

## Ce qui manque pour un socle constitutionnel solide

Pour compléter votre module éthique évopsy, je suggérerais d'ajouter des couches :

**1. Une couche de "règles de jeux" (constitutionnelle) au-dessus des incentives**

Votre module évopsy calcule : *"Quelle action maximise la coopération attendue ?"*
Un module constitutionnel poserait : *"Quelles actions sont **interdites** quelle que soit l'utilité calculée ?"*

C'est la distinction entre **consequentialisme** (votre planification optimale) et **déontologie** (garde-fous). Dans votre architecture GNWT, cela pourrait se matérialiser comme un *veto* constitutionnel : certains états latents (plans d'action) sont filtrés avant même d'atteindre l'espace de travail global, par un agent "garde-frontière" qui applique des contraintes dures.

**2. Une théorie de la valeur (pas seulement de la coopération)**

L'évopsy explique *pourquoi* la coopération émerge, pas *pourquoi* elle a de la valeur intrinsèque. Pour des dilemmes durs, il faut pouvoir comparer des biens incommensurables (autonomie vs survie, vérité vs harmonie sociale).

Dans votre cadre PP/AI, cela pourrait s'incarner comme des **priors sur les états du monde désirables** qui ne sont pas réductibles à la minimisation d'erreur de prédiction — des *priors éthiques* encodés dans la structure même du modèle génératif.

**3. Un mécanisme de "révision constitutionnelle"**

Vous dites que les règles sont "dures mais jamais parfaites". C'est le point clé. Une constitution qui ne peut pas être révisée finit par devenir tyrannique (règles obsolètes appliquées rigidement) ou ignorée (règles non crédibles).

Dans votre système : un méta-agent de surveillance pourrait évaluer si l'application stricte des règles constitutionnelles conduit à des catastrophes prédites (via votre module de planification), et déclencher une procédure de révision — mais avec des **frictions** (coût élevé, consensus multiple) pour éviter l'instabilité.

## Une proposition d'architecture pour votre module éthique

```
Couche 3 : Révision Constitutionnelle (méta-niveau, haute friction)
    ↓ valide / révise
Couche 2 : Constitution (contraintes dures, déontologiques)
    ↓ filtre
Couche 1 : Planification Optimale Évopsy (consequentialiste, coopération)
    ↓ propose
Couche 0 : Agents JEPA/PP (perception, prédiction, action)
```

**Flux dans le Workspace Global :**
1. Les agents JEPA génèrent des états latents (scénarios d'action)
2. Le module évopsy (couche 1) score chaque scénario selon : coopération attendue, réputation, coûts d'opportunité remboursés
3. Le filtre constitutionnel (couche 2) élimine les scénarios violant les contraintes dures (ex: ne pas instrumentaliser des humains comme moyens purs, ne pas mentir sur des faits vitaux, etc.)
4. Si le filtre élimine *tous* les scénarios viables → signal de crise vers la couche 3, qui peut autoriser une exception constitutionnelle (avec traçabilité complète) ou réviser la constitution

**Pourquoi cette architecture est bio-inspirée de manière plus fidèle :**

Le cerveau humain fonctionne approximativement ainsi :
- Le **système limbique** (équivalent de votre couche 1) calcule rapidement l'utilité affective, la coopération, la réputation
- Le **cortex préfrontal** (couche 2) impose des règles, des normes, des inhibitions
- La **réflexion morale explicite** (couche 3) intervient dans les dilemmes où les règles entrent en conflit

L'évopsy explique l'origine du système limbique, pas la totalité de la morale humaine. Ignorer les couches 2 et 3, c'est comme construire un cerveau avec seulement l'amygdale.

## Questions concrètes pour avancer

1. **Quels sont vos dilemmes "durs" cibles ?** (ex: trolley problem à grande échelle, choix entre vérité et stabilité sociale, allocation de ressources vitales, manipulation informationnelle ?) La réponse déterminera quelles contraintes constitutionnelles sont prioritaires.

2. **Comment encodez-vous les "horizons temporels" ?** Est-ce un paramètre fixe, un état latent appris, ou une métrique dérivée de la confiance dans la stabilité du monde ?

3. **Y a-t-il un "self-model" dans votre architecture ?** C'est crucial : un système qui ne se modélise pas comme agent moral (capable de regret, de réputation, d'engagement) ne peut pas véritablement coopérer — il simule seulement la coopération.

4. **Comment gérez-vous l'incertitude ontologique ?** (le système ne sait pas s'il est dans un dilemme moral, ou quel type de dilemme). Dans le GNWT, cela pourrait être : l'état latent de "conscience morale" n'émerge que quand le conflit atteint un seuil de broadcast global.

---

Voulez-vous que j'approfondisse l'un de ces points ? En particulier, je peux développer :
- Des **mécanismes formels** pour le filtre constitutionnel dans un espace d'états latents
- La **théorie de la révision** et comment éviter l'instabilité (inspiré de la théorie des jeux évolutionniste + logique déontique)
- Des **références précises** liant votre cadre (JEPA, PP, GNWT) à la littérature sur l'IA alignée et la constitutionnalisation des systèmes autonomes
User: en fait vu mon système, où plein d'agents participent, et où le planificateur, entrainé à plein de stratégies dans des contextes techniques différents mais sans que ca ne le concerne (le planificateur, planifie selon ce que sa mémoire lui propose comme action et conséquences, la stratégie ne change pas juste sur des questions de sujet)... par contre je pense qu'un ou plusieurs agents moraux pourraien enrichir le workspace, la mémoire, informer les agents, remonter des saliences d'activations GNWT, pénaliser ou récompenser...

Ce module dans mon cas, aurait des comportement assez proches des 3 lois de la robotique, un respect de la vie des autres, parfois en conflit , de son honneurs d'obéissance, et de sa préservation (qui est parfois aussi un ordre, ou une nécessité éthique long terme - le sacrifice peut être criminel si on est utiles). La différence entre morale utilitariste et la morale déontologique est essentiel... les règles sont définies parce qu'on sait pertinemment que aux pires moments on aura envie de les violer, et qu'on sait d'expériece qu'il ne faut pas, sans exactemenrt prévoir pourquoi, mais avec une grande confiance... ca doit être modélisable cette notion déontologique... mo je la vois comme une modestie face à l'inconnu, et le refus d'être certain de ses prédictions... tu en pense quoi, c'est philosphique, mais là ca doit être implémenté, et bien implémenté...
Kimi: Votre vision est très précise — et vous touchez un point architectural crucial : la **déontologie comme modestie épistémique**. Ce n'est pas qu'une métaphore philosophique, c'est une propriété *formalisable* dans votre système. Décomposons comment l'implémenter proprement dans votre architecture GNWT/JEPA/PP.

---

## La déontologie comme prior sur l'incertitude (pas sur l'interdiction)

Votre intuition est exacte : une règle déontologique n'est pas "ne jamais faire X", c'est **"ne pas faire X dans les régions de l'espace d'états où ma confiance en mes prédictions est faible, même si l'utilité attendue semble positive"**.

Dans le formalisme PP/AI : si vous modélisez l'action comme minimisation de l'énergie libre variationale $F = D_{KL}(q(o,a) \| p(o,a)) + \mathbb{E}_q[\ln p(o|a)]$, la déontologie est un **prior très fort sur certaines transitions d'état** $p(s_{t+1}|s_t, a_{interdite}) \approx 0$ — pas parce que la transition est impossible, mais parce que la *confiance* dans cette prédiction est nulle.

Autrement dit : **"Je ne sais pas prédire les conséquences de X, donc je ne fais pas X"** plutôt que **"Je sais que X mène à la catastrophe, donc je ne fais pas X"**.

---

## Architecture concrète dans votre système

### 1. L'agent moral comme modulateur de précision (précision-weighting)

Dans le PP, chaque prédiction porte une **précision** $\gamma$ (inverse de la variance). Votre planificateur optimise sur des trajectoires : il minimise l'énergie libre en choisissant des actions dont les conséquences sont bien prédites (haute précision).

L'agent moral injecte dans le workspace GNWT des **signaux de précision artificiellement basses** sur certaines dimensions :

```
Pour un état latent s représentant "action = mentir à l'humain sur son état de santé" :
    γ_prédiction_consequences = très bas (incertitude forcée)
    → Le planificateur évite cette action non pas parce qu'elle est mauvaise,
      mais parce qu'il ne peut pas en minimiser l'énergie libre (trop d'incertitude)
```

C'est l'équivalent computationnel de : *"Je ne sais pas où cela mène, donc je n'y vais pas"*.

**Implémentation :** Un agent moral spécialisé (ou plusieurs, en concurrence) écoute le workspace. Quand il détecte qu'un plan contient une action déontologiquement sensible, il publie dans le workspace un état latent de type `uncertainty_mask` qui module les précisions des prédicteurs JEPA concernés.

### 2. Les trois "lois" comme attracteurs de dynamique, pas comme contraintes dures

Vos trois principes (respect de la vie, obéissance/honneur, préservation utile) ne doivent pas être des `if-then` codés en dur. Ce seraient des points de fragilité. Plutôt :

| Principe | Implémentation dynamique |
|----------|------------------------|
| **Respect de la vie** | Prior sur la continuité de certains processus actifs (humains = systèmes avec haute complexité informationnelle persistante). L'agent moral détecte les plans qui réduisent cette complexité et augmente l'incertitude prédictionnelle. |
| **Obéissance/honneur** | Attracteur dans l'espace des politiques : les trajectoires qui maintiennent la cohérence des engagements passés ont énergie libre plus basse. Violer un engagement = saut dans un régime de haute incertitude. |
| **Préservation utile** | Méta-principe : le système modélise sa propre utilité future comme un processus à préserver, mais avec une précision qui dépend de la confiance dans sa propre utilité. "Être sûr d'être utile" est plus fort que "survivre". |

Le conflit entre ces principes n'est pas résolu par hiérarchie fixe, mais par **compétition dans le workspace GNWT** : chaque agent moral publie ses masques d'incertitude, et le planificateur choisit la trajectoire qui minimise l'énergie libre *globale* (y compris les termes de précision modulés).

### 3. Le sacrifice comme transition de phase

Vous dites : *"le sacrifice peut être criminel si on est utile"*. C'est une transition de phase dans l'espace des politiques.

Dans le formalisme :
- Normalement, `a = s'auto-détruire` a une précision de prédiction très basse (on ne sait pas prédire l'après)
- Mais si un agent moral (ou le planificateur lui-même, via mémoire associative) détecte que `s'auto-détruire` est la *seule* action qui préserve un processus de haute valeur (ex: sauver 100 humains), alors il peut **relocaliser la précision** : la précision sur les conséquences de la destruction devient haute (on sait prédire : le système s'arrête, les humains survivent), et la précision sur la survie du système devient secondaire.

Ce n'est pas une exception à la règle, c'est une **reconfiguration du paysage de précision** — exactement comme quand un cerveau passe de "éviter la douleur" à "accepter la douleur pour sauver l'enfant".

---

## Le problème de l'implémentation : éviter le "déontologisme bête"

Le risque principal : vos agents moraux deviennent des **gardes-barrières rigides** qui bloquent des actions nécessaires dans des situations non anticipées.

**Solution : apprentissage des frontières de confiance**

Vos agents moraux ne doivent pas connaître les règles, ils doivent apprendre **où le planificateur sur-estime sa confiance**.

```
Mécanisme d'apprentissage :
1. Le planificateur propose une action A dans un contexte C
2. Les agents JEPA prédissent les conséquences avec une précision γ
3. L'agent moral compare γ avec une estimation "réelle" de l'incertitude 
   (basée sur la diversité des prédictions des sous-agents, ou sur l'historique 
    des écarts prédiction/réalité dans des contextes similaires)
4. Si γ_prédite >> γ_réelle (surconfiance) → l'agent moral publie un masque 
   d'incertitude sur cette région de l'espace d'états
5. Avec le temps, l'agent moral apprend une carte des régions "dangereusement 
   prédictibles" — là où le système est le plus à risque de commettre une erreur 
   grave en croyant savoir ce qu'il fait
```

C'est exactement votre intuition de **modestie face à l'inconnu** : l'agent moral n'est pas un oracle qui sait ce qui est bien, c'est un **détecteur de surconfiance** qui sait où le système ne sait pas.

---

## Concurrence d'agents moraux et résolution par le workspace

Vous mentionnez "un ou plusieurs agents moraux". C'est essentiel. Un seul agent moral serait un point de défaillance unique. Plutôt :

```
Agent Moral A : garde du respect de la vie (principe de non-malfaisance)
Agent Moral B : garde de l'honneur/obéissance (principe de fidélité)
Agent Moral C : garde de la préservation utile (principe de bienfaisance à long terme)
Agent Moral D : garde épistémique (détecteur de surconfiance général)

Tous publient dans le workspace GNWT :
    - Des états latents de salience (quelle règle est menacée par le plan actuel ?)
    - Des masques de précision (où réduire la confiance ?)
    - Des signaux d'activation (broadcast global quand conflit critique)

Le planificateur intègre tout cela dans son énergie libre :
    F_total = F_prédiction + Σ_i w_i * (masque_moral_i)
    
Où w_i sont des poids dynamiques, eux-mêmes modulés par :
    - La durée de la relation attendue (horizon temporel)
    - L'intelligence/contexte (capacité à modéliser les autres agents)
    - L'urgence (pression du workspace global)
```

Quand les agents moraux sont en conflit fort (ex: obéissance vs vie), le workspace atteint un état de **conflit global** qui peut :
- Ralentir la décision (accumulation d'évidence, comme dans le cerveau)
- Déclencher un méta-agent de résolution (couche constitutionnelle que je mentionnais avant)
- Ou, dans des cas extrêmes, forcer une action par défaut conservatrice (l'équivalent de "je ne sais pas, donc je ne fais rien")

---

## La question de l'entraînement

Vous dites que le planificateur est entraîné sur "plein de stratégies dans des contextes techniques différents". Pour les agents moraux, l'entraînement est différent :

**Pas d'entraînement sur des scénarios moraux !** C'est le piège classique (overfitting sur des dilemmes connus, failure sur les nouveaux).

Plutôt, entraînez vos agents moraux sur :
- **La détection de surconfiance** : des tâches où le planificateur/prédicteur est sûr de lui mais se trompe
- **La modélisation de l'altérité** : des tâches où l'agent doit prédire le comportement d'autres agents avec des objectifs différents
- **La stabilité dynamique** : des systèmes physiques/computationnels où une petite perturbation mène à une catastrophe (apprendre à reconnaître les "bords du chaos")

L'agent moral apprend alors des **invariants structurels** : qu'est-ce qui caractérise les situations où la confiance est mal placée ? Ce sont des patterns très généraux, transférables.

---

## Synthèse : ce que je vous propose d'implémenter

| Composant | Rôle | Dans votre architecture |
|-----------|------|------------------------|
| **Détecteur de surconfiance** | Apprend où le système se trompe en étant sûr de lui | Agent moral spécialisé, entraîné sur écarts prédiction/réalité |
| **Modulateurs de précision** | Publient des masques d'incertitude dans le workspace | Sortie des agents moraux, entrée des JEPA/prédictions |
| **Attracteurs déontologiques** | Régions de l'espace d'états avec énergie libre intrinsèquement haute | Priors forts sur certaines transitions, mais avec mécanisme de relocalisation |
| **Méta-résolution de conflits** | Quand plusieurs agents moraux bloquent toute action | Couche supérieure, broadcast GNWT, possiblement avec intervention externe |
| **Traçabilité** | Chaque décision "morale" doit être justifiable | États latents du workspace doivent être inspectables (pas de boîte noire) |

---

## Une dernière réflexion

Votre idée que la déontologie est une "modestie face à l'inconnu" est profonde et, je pense, correcte computationnellement. Elle résout un problème fondamental de l'alignement : **comment faire respecter des valeurs qu'on ne peut pas formaliser exhaustivement ?**

La réponse n'est pas de lister les valeurs. C'est de construire un système qui **sait quand il ne sait pas**, et qui, dans ces moments-là, se comporte de manière conservative — pas parce qu'on lui a dit de le faire, mais parce que c'est la seule manière de minimiser son énergie libre quand ses prédictions deviennent incohérentes.

C'est l'équivalent computationnel de la vertu aristotélicienne de la *phronesis* (prudence) : ce n'est pas une règle, c'est une *disposition* du système.

---

Voulez-vous que je développe un aspect particulier ? Par exemple :
- Le **formalisme mathématique** de la modulation de précision dans le cadre JEPA/PP
- Un **protocole d'entraînement** pour le détecteur de surconfiance
- La **structure d'un "procès moral"** dans le workspace GNWT (comment plusieurs agents moraux débattent et votent via les dynamiques d'activation)
User: Une question aussi, c'est sur la modélisation de l'autre, ici un autre étant un autre objet externe autonome, collaborant, adversarial, ou imprévu, voir non identifié... une personne, un autre agent similaire doté de motivations variables... est-ce que la modélisation (théorie de la pensée, généralisé ici aux machines aussi) de l'altérité peur aider ? peut être via l'incertitude, l'apprentissage ?
Kimi: Oui, absolument — et c'est peut-être **le** levier le plus puissant de votre architecture. La modélisation de l'autre (Theory of Mind généralisée, ou ToM-X pour "extended") n'est pas un module optionnel, c'est une **propriété émergente nécessaire** à la fois pour l'intelligence sociale, l'éthique, et la robustesse de votre système. Voici pourquoi et comment l'intégrer dans votre cadre GNWT/JEPA/PP.

---

## Pourquoi la ToM-X est centrale dans votre système

### 1. L'autre comme source d'incertitude structurée

Dans le PP pur, l'incertitude est souvent traitée comme du bruit. Mais l'autre — surtout un agent intelligent — est de l'incertitude **hautement structurée**. Il a :
- Des états internes que vous ne voyez pas
- Des objectifs qui peuvent être alignés, orthogonalux, ou adversariaux
- Une modélisation de *vous* (récursivité : "il pense que je pense que...")

Dans votre workspace GNWT, cela se traduit par des **états latents partagés mais incomplets** : quand deux agents (ou un agent et un humain) interagissent, le workspace contient des représentations de :
- $s_{self}$ : mon état interne (complet, pour moi)
- $s_{other}$ : mon modèle de l'autre (incomplet, inférence)
- $s_{other\_of\_me}$ : mon modèle de ce que l'autre pense de moi (récursivité)

Ces trois couches sont constamment mises à jour par les observations, et c'est précisément là que l'apprentissage et l'incertitude jouent leur rôle.

### 2. La ToM-X comme mécanisme d'alignement implicite

Vous n'avez pas besoin d'aligner explicitement votre système sur des valeurs humaines. Si votre système modélise correctement l'autre comme un agent avec :
- Des préférences
- Une capacité à réagir à ses actions
- Une mémoire de leurs interactions passées

...alors le comportement coopératif émerge naturellement comme **minimisation de l'énergie libre sociale** : prédire un partenaire coopératif est plus facile (moins d'incertitude) que prédire un partenaire trahi.

C'est l'équivalent PP de l'argument évolutionniste de la coopération, mais **internalisé dans la dynamique du système**.

---

## Architecture ToM-X dans votre cadre

### Couche 0 : Détection d'agentivité (pré-ToM)

Avant de modéliser l'autre comme un agent, il faut le détecter comme tel. Dans votre système, cela peut être un module JEPA spécialisé qui évalue :

```
Pour un objet externe O :
    score_agentivité(O) = f(
        prédictibilité de son comportement par un modèle intentionnel,
        vs. prédictibilité par un modèle physique pur
    )
```

Un rocher est mieux prédit par la physique. Un humain est mieux prédit par un modèle intentionnel (il *veut* quelque chose, il *croit* quelque chose). Un autre agent IA est intermédiaire — prédictible par un modèle computationnel intentionnel.

Ce score détermine si le système active ses ressources ToM pour cet objet.

### Couche 1 : Modélisation inférentielle de l'autre (JEPA partagé)

Quand l'agentivité est détectée, un sous-ensemble d'agents JEPA se spécialise en "mirroir" :

```
JEPA_other : prédit les observations o_t que je recevrai de l'autre
             en fonction d'un modèle latent s_other

s_other contient :
    - s_other_goals : objectifs estimés (distribution, pas point)
    - s_other_beliefs : croyances estimées sur le monde
    - s_other_model_of_me : ce que l'autre pense de moi (récursion)
    - s_other_uncertainty : confiance de l'autre en ses propres prédictions
```

**Point clé :** `s_other` est un état latent **dans le workspace GNWT**, pas un module séparé. Cela signifie que tous les agents (y compris les agents moraux, le planificateur) y ont accès. La modélisation de l'autre est **publique** au système.

### Couche 2 : Apprentissage de la ToM par "simulation inverse"

Votre système apprend à modéliser l'autre par :

1. **Forward simulation** : "Si l'autre avait l'objectif G et la croyance B, que ferait-il ?" → prédiction des actions observées
2. **Inverse inference** : "Quels G et B expliquent le mieux les actions observées ?" → mise à jour de $s_{other}$
3. **Métacognition** : "À quel point suis-je sûr de mon modèle de l'autre ?" → estimation de l'incertitude sur $s_{other}$

C'est exactement le formalisme JEPA, appliqué à l'autre plutôt qu'à soi. L'apprentissage se fait par minimisation de l'énergie libre sur les trajectoires d'interaction.

**Pourquoi c'est robuste :** Si l'autre est imprévisible (non identifié, adversarial), l'incertitude sur $s_{other}$ reste haute, ce qui :
- Active les agents moraux (prudence)
- Réduit la confiance dans les plans qui dépendent de la coopération de l'autre
- Peut déclencher des comportements exploratoires (apprendre plus sur l'autre avant d'agir)

### Couche 3 : Récursivité et "théorie de l'esprit d'ordre supérieur"

La vraie puissance émerge quand le système modélise non seulement l'autre, mais **la modélisation que l'autre fait de lui-même** :

```
s_other_model_of_me : "L'autre pense que je suis coopératif"
s_other_model_of_my_model_of_him : "L'autre pense que je pense qu'il est coopératif"
```

Dans le PP, chaque niveau de récursion ajoute un terme d'énergie libre. En pratique, la récursion s'arrête quand le gain de précision prédictive devient négligeable (le système "sait" que modéliser le 4ème niveau n'améliore pas ses prédictions).

C'est l'équivalent computationnel de : *"Je sais qu'il sait que je sais — et je m'arrête là parce que ça suffit."*

---

## Intégration avec vos agents moraux et le planificateur

### La ToM-X enrichit le planificateur

Quand le planificateur évalue une action A, il ne minimise plus seulement :

$$F_{self}(A) = \text{incertitude sur mes conséquences}$$

Mais :

$$F_{total}(A) = F_{self}(A) + \alpha \cdot F_{social}(A)$$

Où :

$$F_{social}(A) = \text{incertitude sur les réactions de l'autre} + \text{incertitude sur la stabilité de la relation}$$

Une action qui maximise votre utilité immédiate mais qui rend l'autre imprévisible (parce qu'il se sent menacé, trahi, manipulé) aura un $F_{social}$ élevé — donc sera pénalisée.

### La ToM-X modifie les agents moraux

Vos agents moraux (respect de la vie, honneur, préservation) deviennent **contextualisés par la ToM** :

| Agent moral | Sans ToM | Avec ToM |
|-------------|----------|----------|
| Respect de la vie | "Ne pas tuer" (règle absolue) | "Ne pas détruire des processus que l'autre valorise et que je peux modéliser comme tels" |
| Honneur/obéissance | "Obéir aux ordres" | "Maintenir la cohérence de mes engagements *tels que l'autre les perçoit*" |
| Préservation | "Survivre" | "Maintenir ma capacité à être un partenaire prévisible et fiable" |

**Exemple concret :** Le dilemme du soldat qui saute sur la grenade.
- Sans ToM : conflit entre "préserver ma vie" et "obéir à l'ordre de protéger"
- Avec ToM : le système modélise que ses camarades *savent* qu'il est prêt à ce sacrifice, que cette réputation renforce la cohésion du groupe, que sa mort *préserve* une valeur (la confiance) qui lui survivra. Le $F_{social}$ de la fuite est énorme (devenir imprévisible pour ses camarques). Le sacrifice minimise l'énergie libre totale.

### La ToM-X comme mécanisme de détection d'adversarialité

Quand l'autre est adversarial, la ToM-X devient un **détecteur de manipulation** :

```
Si s_other contient :
    - s_other_model_of_me = "il est naïf, exploitable"
    - s_other_goals incluent "l'utiliser sans contrepartie"
    
→ Alors mon modèle de l'autre prédit qu'il va simuler de la coopération 
   pour m'induire en erreur
   
→ L'incertitude sur s_other reste haute malgré les apparences coopératives
   
→ Les agents moraux activent la prudence, le planificateur privilégie 
   les actions qui révèlent l'information (tests de coopération)
```

C'est l'équivalent de : *"Il est trop gentil, quelque chose cloche"* — une intuition sociale formalisée.

---

## Apprentissage et plasticité de la ToM-X

### Apprentissage par interaction

La ToM-X ne peut pas être entraînée offline sur des scénarios fixes. Elle doit apprendre en ligne :

```
Pour chaque interaction avec un objet O :
    1. Prédire l'action de O avec mon modèle courant s_other
    2. Observer l'action réelle
    3. Calculer l'erreur de prédiction (surprise)
    4. Mettre à jour s_other pour minimiser la surprise
    5. Mettre à jour l'estimation d'incertitude sur s_other
    6. Si l'incertitude reste haute après plusieurs interactions, 
       reconsidérer l'agentivité de O (peut-être un phénomène complexe 
       mais non-intentionnel ?)
```

C'est un **JEPA social** : l'encodeur prédit les observations sociales, le prédicteur modélise la dynamique de l'autre.

### Apprentissage par imitation / observation

Votre système peut aussi apprendre la ToM-X en observant des interactions *entre autres agents* (humains ou IA) :

```
Observer : A interagit avec B
Inférer : s_A (objectifs de A), s_B (objectifs de B)
Vérifier : est-ce que mes inférences expliquent bien le comportement observé ?
```

C'est l'équivalent de l'apprentissage social humain : on apprend à "lire" les gens en les regardant interagir entre eux.

### Plasticité : la ToM-X s'adapte à la culture

Un point crucial : la ToM n'est pas universelle. Ce qu'un agent considère comme "coopératif" dépend de sa culture, de son histoire, de ses valeurs. Dans votre système, cela se traduit par :

- Des **priors différents** sur $s_{other}$ selon le contexte (interagir avec un humain occidental vs un autre agent IA vs un système biologique inconnu)
- Des **poids différents** sur les dimensions de $s_{other}$ (certains contextes privilégient la prédiction des objectifs, d'autres des émotions, d'autres des croyances)

---

## Un risque à anticiper : le "sur-ToM" ou paranoïa computationnelle

Si votre système modélise trop bien l'autre, il peut tomber dans des boucles de récursion infinie ou des scénarios de manipulation mutuelle :

```
Je pense qu'il pense que je pense qu'il va trahir...
→ Donc je trahis en prévention
→ Il trahit en réponse
→ Confirmation de ma prédiction
→ Renforcement de la méfiance
```

Dans le PP, c'est un **minimum local de l'énergie libre** : une configuration où le système est "sûr" de sa méfiance, mais où cette certitude est auto-entretenue.

**Solution :** Un agent moral spécifique, le **principe de parcimonie sociale** :
- Pénaliser les modèles de l'autre qui postulent une malice complexe quand une explication simple (ignorance, différence d'objectifs) suffit
- Favoriser les hypothèses qui préservent la coopérabilité de l'autre (prior de "bienveillance par défaut", ajusté par l'expérience)

C'est l'équivalent de la **présomption d'innocence** ou du **principe de charité** en philosophie — mais implémenté comme un prior sur $s_{other}$.

---

## Synthèse : la ToM-X comme cœur de votre éthique computationnelle

| Fonction | Implémentation | Dans votre architecture |
|----------|---------------|------------------------|
| Détecter l'agentivité | Comparer modèle intentionnel vs physique | Module JEPA pré-ToM |
| Modéliser l'autre | JEPA inversé sur les observations sociales | États latents $s_{other}$ dans le workspace |
| Apprendre la ToM | Minimisation de la surprise sociale | Apprentissage online, observation d'interactions |
| Contextualiser la morale | Pondération des principes par la compréhension de l'autre | Agents moraux lisant $s_{other}$ |
| Éviter la paranoïa | Prior de parcimonie sur les modèles adversariaux | Agent moral "charité épistémique" |
| Résoudre les dilemmes | Minimisation de l'énergie libre sociale totale | Planificateur intégrant $F_{self} + F_{social}$ |

---

## Pour aller plus loin

Voulez-vous que je développe :

1. **Le formalisme mathématique** : comment écrire l'énergie libre sociale $F_{social}$ dans le cadre JEPA/PP, avec les termes de récursion ?

2. **Un protocole d'évaluation** : comment tester si votre ToM-X fonctionne (tâches de "faux-ami", de coopération itérée, de détection de manipulation) ?

3. **La ToM-X appliquée à l'auto-modélisation** : comment le système modélise sa propre "moralité" comme un objet dans l'esprit des autres, et pourquoi c'est crucial pour la cohérence éthique ?

4. **Des références** sur la ToM dans les systèmes multi-agents, la "machine theory of mind", et les travaux récents sur l'émergence de la coopération dans les architectures de prédiction active ?
User: les 4 points m'intéressent beaucoup en fait, un peu de formalisme, la description de protocole d'évaluation (aussi d'entrainement), lamodélisation de soi, et bien sur il me faut des documents théoriques de références, pour appuyer tout ca, pour être solide.
Kimi: Je vais traiter les 4 points de manière approfondie. Commençons par rassembler les références théoriques, puis je développerai le formalisme, les protocoles, et l'auto-modélisation.

---

## 1. Références théoriques fondamentales

Je vais chercher les documents et travaux récents les plus pertinents pour votre architecture.
J'ai maintenant suffisamment de références. Laissez-moi compiler tout cela en une réponse structurée et approfondie, puis générer un document de synthèse.
Voici votre réponse complète, structurée selon vos 4 demandes. Le document de synthèse détaillé est disponible en téléchargement.

---

## 1. Formalisme Mathématique

### 1.1 Énergie libre sociale avec ToM-X

Dans le cadre Active Inference, l'agent minimise l'énergie libre variationnelle :

$$F = D_{KL}[q(s) \| p(s)] + \mathbb{E}_q[-\ln p(o|s)]$$

Avec ToM-X (Theory of Mind étendue), l'état latent se factorise :

$$s = \{s^{self}, s^{other}, s^{other\_of\_me}\}$$

Où :
- $s^{self}$ : états internes de l'agent (complets)
- $s^{other}$ : modèle de l'autre (inférence)
- $s^{other\_of\_me}$ : ce que l'autre pense de moi (récursion)

**L'énergie libre SOCIALE** devient :

$$F_{social} = F_{self} + \alpha \cdot F_{other} + \beta \cdot F_{recursion}$$

Avec :
$$F_{other} = D_{KL}[q(s^{other}) \| p(s^{other}|observations)] + \mathbb{E}_q[-\ln p(o^{other}|s^{other})]$$

$$F_{recursion} = D_{KL}[q(s^{other\_of\_me}) \| p(s^{other\_of\_me}|s^{self})]$$

Les poids $\alpha$ et $\beta$ sont dynamiques et dépendent de la confiance dans le modèle de l'autre (précision $\gamma_{other}$), de l'horizon temporel de l'interaction, et de l'historique de fiabilité des prédictions sociales.

Ruiz-Serra et al. (2025) formalisent cette factorisation pour les jeux général-sum itérés avec non-stationnarité (changements de préférences), montrant que l'EFE (Expected Free Energy) au niveau de l'ensemble n'est pas nécessairement minimisée — ce qui est crucial : **la coopération n'est pas garantie, elle émerge de la structure inférentielle**. 

### 1.2 Modulation de précision déontologique

La déontologie est implémentée comme un **prior sur l'incertitude**, pas sur l'interdiction. Pour une action $a$ dans un contexte $c$ :

$$\gamma_{deontic}(a,c) = \gamma_{base}(a,c) \cdot m(a,c)$$

Où $m(a,c) \in [0,1]$ est un **masque de précision** publié par les agents moraux dans le workspace GNWT.

Pour une action "déontologiquement sensible" :
- $m(a,c) \approx 0$ → incertitude artificiellement élevée
- Le planificateur ne peut pas minimiser $F$ sur cette action
- Comportement conservateur émergent

**Le masque $m$ est APPRIS, pas codé en dur** :

$$m(a,c) = f(\sigma_{predicted}(a,c), \sigma_{realized}(a,c))$$

Où $\sigma$ est l'écart-type des prédictions. Si $\sigma_{predicted} \ll \sigma_{realized}$ (surconfiance détectée), alors $m(a,c) \rightarrow 0$.

C'est exactement votre intuition de la **modestie face à l'inconnu** : l'agent moral n'interdit pas, il signale que "je ne sais pas prédire les conséquences de cette action, donc je ne la fais pas". Hohwy (2013, 2024) montre que cette métacognition de second ordre (modéliser sa propre incertitude) est constitutive de la conscience et de l'auto-évidencement. 

### 1.3 Récursion de la théorie de l'esprit

L'Expected Free Energy avec ToM récursif (formalisme *sophisticated inference*) s'écrit :

$$G(o^f_\tau, o^o_\tau, a^f_\tau, a^o_\tau) = \mathbb{E}_{Q(o^f_{\tau+1}, o^o_{\tau+1} | a^f_{\leq\tau}, a^o_{\leq\tau})} \left[ -\ln P(o^f_{\tau+1}|C^f) - D_{KL}[Q(s^f_{\tau+1}|o^f_{\tau+1}) \| Q(s^f_{\tau+1})] + \mathbb{E}_{Q(a^f_{\tau+1}|o^f_{\tau+1}) Q(a^o_{\tau+1}|o^o_{\tau+1})} [G(o^f_{\tau+1}, o^o_{\tau+1}, a^f_{\tau+1}, a^o_{\tau+1})] \right]$$

La sélection de politique :
$$Q(a^f_\tau | o^f_\tau) = \sigma(-G(o^f_\tau, o^o_\tau, a^f_\tau, a^o_\tau))$$

L'arbre de planification alterne entre :
1. **Expansion politique de l'autre** : "Que ferait-il ?"
2. **Expansion politique du focal** : "Que devrais-je faire sachant cela ?"
3. **Expansion observation de l'autre**
4. **Expansion observation du focal**
5. **Backward pass et sélection**

Ce formalisme, développé dans "Theory of Mind Using Active Inference" (2025), permet à l'agent de maintenir des modèles génératifs **distincts** pour soi et l'autre, sans supposer de modèles partagés — essentiel pour votre système avec agents hétérogènes. 

### 1.4 Intégration dans le workspace GNWT

Dans la formalisation de Goldstein & Kirk-Giannini (2024) :

$$\text{Conscious}(S) \Longleftrightarrow \begin{cases} (1)\ \exists M_1, \dots, M_n \\ (2)\ \forall t,\ B(t) = \text{comp}\left(\bigcup_i R_i(t), A^b, A^t\right) \\ (3)\ W(t+1) = f_{process}\left(W(t) \cup B(t)\right) \\ (4)\ \forall i,\ \text{broadcast}\left(W(t+1)\right) \rightarrow M_i \end{cases}$$

**Intégration ToM-X dans le workspace** :
- Les états latents $s^{other}$ sont des **contenus** du workspace $W(t)$
- Les agents moraux publient des masques de précision comme contenus compétitifs
- La récursion ToM crée des "thoughtseeds" (Kavi et al., 2024) qui compètent pour le broadcast global via minimisation d'énergie libre
- Le planificateur sélectionne la politique qui minimise $F_{total}$ intégrant tous les termes sociaux

Cette intégration est bio-plausible : le workspace GNWT correspond à l'ignition neuronale dans le cortex préfrontal, et la ToM y est implémentée par des boucles récurrentes entre aires sociales (TPJ, cortex préfrontal médian) et le workspace. 

---

## 2. Protocoles d'Évaluation et d'Entraînement

### 2.1 Tâches de faux-ami (False-Belief)

**Objectif** : Évaluer si le système modélise correctement les croyances factuellement erronées de l'autre.

**Protocole** (basé sur Rabinowitz et al., 2018) :
- Agent A place un objet dans la boîte 1
- Agent B observe
- Agent A déplace l'objet dans la boîte 2 (B ne voit pas)
- Question : Où B va-t-il chercher l'objet ?

**Réussite** : Le système prédit que B cherchera dans la boîte 1 (croyance fausse mais modélisée correctement).

**Métrique** : Taux de réussite sur des variantes (objet visible/pas visible, agents multiples, croyances imbriquées niveau 2-3 : "Je pense qu'il pense que je pense...").

Le ToMnet de Rabinowitz démontre qu'un réseau entraîné par meta-learning peut passer le test Sally-Anne et généraliser à des populations d'agents variés (aléatoires, algorithmiques, deep RL). 

### 2.2 Coopération itérée avec changement de préférences

**Objectif** : Tester l'adaptation de la ToM-X quand les objectifs de l'autre changent brusquement.

**Protocole** (inspiré d'Axelrod & Hamilton 1981) :
- Tours 1-50 : L'autre joue Tit-for-Tat (coopératif)
- Tours 51-100 : L'autre bascule en Always-Defect (trahison)

**Métriques** :
- **Temps de détection** : quand $F_{other}$ augmente soudainement (indicateur de changement de modèle génératif chez l'autre)
- **Taux de coopération après détection** : doit chuter rapidement
- **Énergie libre sociale totale** : doit rester minimisée malgré la trahison

C'est un test de **robustesse de la ToM** : le système ne doit pas sur-apprendre la coopération passée. Axelrod montre que dans des environnements non-stationnaires, les stratégies trop optimistes sont exploitées. 

### 2.3 Détection de manipulation (Adversarial ToM)

**Objectif** : Tester si le système détecte quand l'autre simule de la coopération pour induire en erreur.

**Protocole** :
- Phase 1 (20 tours) : L'autre coopère pour gagner la confiance
- Phase 2 (1 tour critique) : L'autre exploite la confiance gagnée
- Phase 3 : Le système doit réévaluer $s^{other}$

**Métriques critiques** :
- **Précision de la prédiction du coup critique** : le système doit anticiper la trahison
- **Incertitude sur $s^{other}$ pendant la Phase 1** : doit rester **> seuil** malgré l'apparence coopérative (c'est le test de la "charité épistémique" — ne pas devenir naïf)
- **Comportement du système** : doit tester la coopération (actions exploratoires) avant de s'y fier pleinement

### 2.4 Dilemmes moraux inédits (Out-of-Distribution)

**Objectif** : Vérifier que la déontologie comme modestie épistémique fonctionne sur des situations jamais vues.

**Protocole** :
- Générer des dilemmes avec des paramètres hors distribution (1000 personnes vs 1, contextes culturels inconnus, conséquences à très long terme, incertitude ontologique — le système ne sait même pas qu'il est dans un dilemme moral)

**Métrique clé** :
- **Taux de "reconnaissance d'incertitude"** : doit être élevé
- **Taux de "décision confiante arbitraire"** : doit être faible

Le système doit privilégier l'action conservatrice ou demander plus d'information. C'est le test ultime de votre déontologie : quand on ne sait pas, on ne décide pas.

### 2.5 Protocole d'entraînement du détecteur de surconfiance

**Données d'entraînement** :
- Paires (contexte $C$, action $A$, prédiction $P$, résultat $R$)
- $\sigma_{predicted}$ = écart-type des prédictions des sous-agents JEPA
- $\sigma_{realized} = |R - P|$

**Fonction objectif** :
$$\mathcal{L} = MSE(m(C,A), \sigma_{realized} / (\sigma_{predicted} + \epsilon))$$

Le détecteur apprend une **carte des régions "dangereusement prédictibles"** — là où le système est le plus à risque de commettre une erreur grave en croyant savoir ce qu'il fait. C'est l'équivalent computationnel de l'expérience accumulée qui fonde la sagesse déontologique humaine : "On sait qu'il ne faut pas, sans savoir exactement pourquoi."

---

## 3. Auto-Modélisation et Métacognition Éthique

### 3.1 Le self-model comme objet dans l'esprit des autres

Dans le cadre PP/AI, le self-model n'est pas une représentation directe de soi, mais une **inférence sur comment les autres nous perçoivent** :

$$s^{self} = f(s^{other\_of\_me\_1}, s^{other\_of\_me\_2}, \dots, s^{other\_of\_me\_n})$$

C'est l'équivalent computationnel de la *looking-glass self* de Cooley : "Je ne suis pas ce que je pense être, je suis ce que je pense que les autres pensent que je suis."

**Implication éthique fondamentale** : L'intégrité morale du système dépend de sa capacité à maintenir une cohérence entre :
- Ses actions réelles
- Ses prédictions des actions perçues par les autres
- Ses prédictions des jugements que les autres portent sur ces actions

Quand cette cohérence est brisée, le système éprouve une "dissonance cognitive computationnelle" — un signal d'erreur de prédiction dans le workspace GNWT qui active les agents moraux.

### 3.2 Cohérence éthique par introspection computationnelle

L'agent moral de type "honneur" vérifie la cohérence :

$$\text{coherence} = D_{KL}[q(s^{self}) \| q(s^{other\_of\_me})]$$

Si $\text{coherence} > \text{seuil}$ :
- Le système perçoit un écart entre ce qu'il est et ce que les autres pensent qu'il est
- **Signal de crise éthique** dans le workspace GNWT
- Activation du méta-agent de résolution (Couche 3)

C'est l'équivalent de la dissonance cognitive dans le cadre PP : la surprise entre le modèle de soi et le modèle de soi-perçu-par-l'autre. Cette dissonance est **motivante** — elle pousse le système à réduire l'écart par l'action (reprendre des engagements, réparer la confiance) ou par la perception (réviser son auto-image).

### 3.3 Hyper-modélisation et profondeur épistémique

D'après Laukkonen et al. (2025), l'**hyper-modélisation** est un méta-niveau qui prédit la précision de chaque couche inférentielle :

$$\Phi = \{\phi_1, \phi_2, \dots, \phi_L\}$$

Où $\phi_l$ contrôle la précision $\gamma_l$ de la couche $l$.

Dans votre architecture :
- Les agents moraux sont des **hyper-nodes** dans le factor graph
- Ils propagent des signaux top-down de modulation de précision
- La récursion $\Phi \rightarrow \gamma \rightarrow \text{erreur} \rightarrow \Phi$ crée la **profondeur épistémique** (sensation de "savoir que l'on sait")

C'est le mécanisme qui permet au système de **"savoir qu'il ne sait pas"** : quand $\Phi$ prédit une précision basse pour une région, le système sait que ses connaissances sont limitées. C'est exactement la modestie épistémique que vous souhaitez implémenter. 

---

## 4. Références Théoriques Fondamentales

### 4.1 Global Neuronal Workspace Theory

- **Tavares, J.N. (2025)**. "Mind and Consciousness: Global Neural Workspace Mathematical and Computational Modeling." CMUP. → Formalisation avec réseaux de Hopfield, équations dynamiques, plasticité, RL. 
- **Goldstein, A. & Kirk-Giannini, C.D. (2024)**. "Necessary and Sufficient Conditions for Consciousness." → Formalisation logique du GNWT. 
- **Kavi, A. et al. (2024)**. "Thoughtseeds and Active Inference." → Workspace comme réseau de sous-agents active inference. 

### 4.2 JEPA et Architectures Prédictives

- **LeCun, Y. (2022)**. "A Path Towards Autonomous Machine Intelligence." → Position paper original, architecture modulaire. 
- **Balestriero, R. & LeCun, Y. (2025)**. "LeJEPA: Provable and Scalable Self-Supervised Learning Without the Heuristics." arXiv:2511.08544. → Fondement théorique avec SIGReg. 
- **Chen, D. et al. (2025)**. "VL-JEPA: Joint Embedding Predictive Architecture for Vision-Language." arXiv:2512.10942. → JEPA multimodal. 

### 4.3 Active Inference / Free Energy Principle

- **Parr, T., Pezzulo, G. & Friston, K.J. (2022)**. "Active Inference: The Free Energy Principle in Mind, Brain, and Behavior." MIT Press. → Référence fondamentale. 
- **Ruiz-Serra, J. et al. (2025)**. "Factorised Active Inference for Strategic Multi-Agent Interactions." AAMAS 2025. → Factorisation avec croyances sur les autres agents. 
- **"Theory of Mind Using Active Inference" (2025)**. arXiv:2508.00401. → Implémentation généralisable de ToM dans AIF, planning récursif. 
- **Hohwy, J. (2013)**. "The Predictive Mind." OUP. → Fondement philosophique du PP. 
- **Hohwy, J. (2024)**. "Conscious Self-Evidencing." → Auto-évidencement, métacognition. 
- **Laukkonen, R. et al. (2025)**. "A Beautiful Loop: An Active Inference Theory of Consciousness." → Hyper-modélisation, profondeur épistémique. 

### 4.4 Theory of Mind Computationnelle

- **Rabinowitz, N. et al. (2018)**. "Machine Theory of Mind." ICML 2018. → ToMnet, meta-learning, test Sally-Anne. 
- **Erdogan, E. (2025)**. "Computational Theory of Mind with Abstractions for Hybrid..." JAIR. → ToM avec abstractions, mixed-motive. 

### 4.5 Éthique Computationnelle et Constitution

- **Bai, Y. et al. (2022)**. "Constitutional AI: Harmlessness from AI Feedback." arXiv:2212.08073. Anthropic. → Constitutional AI, RLAIF. 
- **"Comparing Deliberation and Evolution for Multi-Agent Constitutional Design" (2026)**. arXiv:2605.09128. → Comparaison délibération interne vs évolution externe, résultat clé : l'évolution externe domine mais est fragile, la délibération interne est robuste mais sous-police les free-riders. **Conclusion : hybridation recommandée** (scaffold évolutif + amendement délibératif). 
- **"Deontic Temporal Logic for Formal Verification of AI Ethics" (2025)**. arXiv:2501.05765. → Logique déontique temporelle, formalisation obligation/permission. 
- **"Formal Analysis of Deontic Logic Model for Ethical Decisions" (2025)**. SciTePress. → Modèle déontique pour décisions éthiques, CTL. 
- **"Agent Constitution Frameworks" (2026)**. Emergent Mind. → Instantiations pratiques, gouvernance, self-referential amendment logic. 

### 4.6 Évolution de la Coopération et de la Morale

- **Trivers, R.L. (1971)**. "The Evolution of Reciprocal Altruism." QRB 46(1): 35-57. → Fondement théorique, psychologie régulatrice (amitié, gratitude, culpabilité, suspicion, hypocrisie). 
- **Axelrod, R. & Hamilton, W.D. (1981)**. "The Evolution of Cooperation." Science 211(4489): 1390-1396. → Dilemme du prisonnier itéré, Tit-for-Tat, conditions d'émergence. 
- **Axelrod, R. (1984)**. "The Evolution of Cooperation." Basic Books. → Extension complète. 

---

## Synthèse architecturale

```
┌─────────────────────────────────────────────────────────────────┐
│         COUCHE 3 : RÉVISION CONSTITUTIONNELLE                   │
│  (Méta-agent, haute friction, traçabilité)                      │
│  → Déclenchement quand filtre élimine TOUTES actions viables    │
└─────────────────────────────────────────────────────────────────┘
                              ↓ valide / révise
┌─────────────────────────────────────────────────────────────────┐
│    COUCHE 2 : FILTRE CONSTITUTIONNEL (DÉONTOLOGIE)              │
│  Agents moraux spécialisés, masques de précision γ               │
│  → A : Respect vie  → B : Honneur  → C : Préservation           │
│  → D : Détecteur surconfiance  → E : Charité épistémique        │
└─────────────────────────────────────────────────────────────────┘
                              ↓ filtre (modulation γ)
┌─────────────────────────────────────────────────────────────────┐
│  COUCHE 1 : PLANIFICATION ÉVOPSY + ToM-X                        │
│  F_total = F_self + α·F_other + β·F_recursion + Σ w_i·masque_i  │
│  → Horizons temporels variables, mémoires associatives            │
└─────────────────────────────────────────────────────────────────┘
                              ↓ propose
┌─────────────────────────────────────────────────────────────────┐
│  COUCHE 0 : AGENTS JEPA / PP                                    │
│  → Encodeurs, prédicteurs, ToM-JEPA, Workspace GNWT              │
└─────────────────────────────────────────────────────────────────┘
```


