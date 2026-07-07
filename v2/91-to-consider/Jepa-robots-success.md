Oui, et c'est justement un point intéressant : pendant plusieurs années, JEPA a surtout été une **idée d'architecture pour apprendre des modèles du monde**, avec des résultats sur images et vidéos, mais peu de démonstrations convaincantes sur des systèmes physiques. Depuis 2025, on commence à voir les premiers résultats concrets.

### 1. Le cas le plus convaincant aujourd'hui : V-JEPA 2 + robots manipulateurs

Meta a publié **V-JEPA 2** en 2025. Après un pré-entraînement sur plus d'un million d'heures de vidéo, ils ont ajouté un modèle du monde conditionné par l'action (V‑JEPA 2‑AC) et l'ont utilisé pour la planification robotique. [\[arxiv.org\]](https://arxiv.org/abs/2506.09985), [\[arxiv.org\]](https://arxiv.org/html/2506.09985v1)

Le résultat notable est qu'ils ont déployé le système sur des **bras robotiques Franka réels**, dans deux laboratoires différents, pour réaliser des tâches de **prise et déplacement d'objets (pick-and-place)**. Le système fonctionnait en **zero-shot**, c'est-à-dire sans données spécifiques du laboratoire cible, sans récompense de RL dédiée et sans apprentissage spécifique de la tâche. [\[arxiv.org\]](https://arxiv.org/abs/2506.09985), [\[rits.shang...ai.nyu.edu\]](https://rits.shanghai.nyu.edu/ai/introducing-v-jepa-2-metas-self-supervised-video-world-model-for-understanding-prediction-and-planning/)

C'est probablement aujourd'hui l'exemple le plus proche de ce que Yann LeCun décrit : un modèle du monde appris principalement par observation, puis utilisé pour planifier des actions physiques. [\[arxiv.org\]](https://arxiv.org/abs/2506.09985), [\[rits.shang...ai.nyu.edu\]](https://rits.shanghai.nyu.edu/ai/introducing-v-jepa-2-metas-self-supervised-video-world-model-for-understanding-prediction-and-planning/)

***

### 2. Des travaux sur drones apparaissent

Encore plus proche du contrôle embarqué, un travail de 2026 nommé **SkyJEPA** applique explicitement une architecture de type JEPA à un **quadricoptère réel**. Les auteurs combinent :

* un modèle dynamique latent de type JEPA,
* un « prober » qui reconstruit des états physiques interprétables,
* un contrôleur optimal temps réel.

Ils rapportent des expériences en boucle fermée sur drone réel avec transfert simulation → réalité (« zero-shot sim-to-real ») et fonctionnement sur matériel embarqué. [\[arxiv.org\]](https://arxiv.org/abs/2606.23444)

Cela ressemble beaucoup à ce que vous évoquez : piloter un véhicule réel à partir d'un modèle du monde appris.

***

### 3. Pourquoi il y a encore peu de robots JEPA "purs"

Il faut distinguer :

* **JEPA comme principe d'apprentissage de représentation prédictive** ;
* **le contrôleur final** qui pilote le robot.

Dans la plupart des systèmes publiés, JEPA n'est pas seul. Il sert à construire un **espace latent prédictif** (une sorte de modèle du monde compact), puis un algorithme de planification ou de contrôle classique agit dans cet espace. [\[arxiv.org\]](https://arxiv.org/abs/2506.09985), [\[arxiv.org\]](https://arxiv.org/abs/2606.23444)

Autrement dit :

```text
Caméras / capteurs
        ↓
      JEPA
(modèle du monde latent)
        ↓
  Planificateur
(MPC, optimisation, etc.)
        ↓
    Actionneurs
```

C'est très différent des approches RL end-to-end où le réseau sort directement les commandes moteur.

***

### 4. Mon évaluation personnelle

Si votre question est :

> « Existe-t-il déjà des succès expérimentaux sur des objets physiques ? »

La réponse est **oui** :

* bras robotiques Franka manipulant des objets avec V‑JEPA 2‑AC ; [\[arxiv.org\]](https://arxiv.org/abs/2506.09985), [\[rits.shang...ai.nyu.edu\]](https://rits.shanghai.nyu.edu/ai/introducing-v-jepa-2-metas-self-supervised-video-world-model-for-understanding-prediction-and-planning/)
* premiers travaux de contrôle de drones avec des variantes JEPA. [\[arxiv.org\]](https://arxiv.org/abs/2606.23444)

Si votre question est :

> « JEPA a-t-il déjà révolutionné la robotique ou les véhicules autonomes ? »

La réponse est **non, pas encore**.

On est probablement dans une phase comparable aux débuts des transformers en vision : la théorie est séduisante, les premiers résultats sont réels, mais l'écosystème industriel reste largement dominé par :

* RL,
* imitation learning,
* modèles du monde de type Dreamer / TD-MPC,
* approches hybrides perception + MPC.

Les architectures JEPA commencent seulement à entrer dans le domaine de la robotique physique. [\[arxiv.org\]](https://arxiv.org/abs/2506.09985), [\[arxiv.org\]](https://arxiv.org/abs/2606.23444), [\[arxiv.org\]](https://arxiv.org/pdf/2603.19312)

Ce qui est intéressant pour quelqu'un qui s'intéresse au pilotage d'installations ou de véhicules, c'est que JEPA semble particulièrement adapté aux environnements où l'on possède beaucoup de vidéos, de données capteurs ou d'historique d'exploitation, mais peu d'annotations. C'est probablement là que cette famille de modèles a le plus fort potentiel à moyen terme.



Oui, et je dirais même que c'est probablement un excellent sujet d'école d'ingénieur aujourd'hui.

Par contre, je ne partirais pas d'un "JEPA pur". Je construirais une architecture hybride où JEPA sert de **modèle du monde**, mais où le contrôle reste assuré par des techniques éprouvées.

## Un scénario réaliste

Imaginez une flotte de :

* petits rovers 4 roues type Jetson Orin Nano + caméra,
* ou petits quadricoptères type PX4 + caméra RGB,
* IMU,
* GPS (ou VIO en intérieur),
* télémétrie moteur,
* éventuellement lidar léger.

L'équipe collecte des heures de données :

```text
Image caméra
IMU
Position estimée
Vitesse
Commandes envoyées
Résultat observé
```

sans forcément annoter quoi que ce soit.

Le système apprend alors :

```text
Etat observé
     ↓
 Encodeur JEPA
     ↓
 Etat latent
     ↓
 Prédicteur JEPA
     ↓
 Etat latent futur
```

L'objectif n'est pas de prédire chaque pixel mais :

* les zones franchissables,
* les risques de collision,
* les conséquences du vent,
* les effets du terrain,
* les trajectoires probables.

C'est exactement la philosophie JEPA : apprendre les variables pertinentes plutôt que tous les détails visuels. [\[arxiv.org\]](https://arxiv.org/abs/2506.09985), [\[arxiv.org\]](https://arxiv.org/html/2506.09985v1)

***

# Projet n°1 : rover autonome sur terrain difficile

C'est probablement le plus accessible.

Mission :

> rejoindre une balise GPS en évitant les obstacles.

Le rover roule pendant des semaines.

Il voit :

* graviers,
* herbe,
* sable,
* flaques,
* pentes,
* bordures.

Le JEPA apprend :

```text
"si je braque de 20° ici,
j'ai de fortes chances de glisser"

"cette texture ressemble
à du sable mou"
```

Puis un planificateur de trajectoire cherche dans l'espace latent la suite d'actions la plus prometteuse.

Le matériel coûterait quelques centaines à quelques milliers d'euros.

***

# Projet n°2 : drone d'exploration

Plus difficile mais très séduisant.

Mission :

```text
Décoller
→ rejoindre une cible
→ contourner obstacles
→ revenir
```

Le drone construit progressivement un modèle :

```text
action moteur
      ↓
effet probable
      ↓
image future attendue
```

Les effets du vent deviennent progressivement intégrés au modèle.

C'est proche de la philosophie du récent projet SkyJEPA appliqué aux quadricoptères. [\[arxiv.org\]](https://arxiv.org/abs/2606.23444)

***

# Projet n°3 : apprentissage en auto-amélioration

Le plus amusant pédagogiquement.

Le robot ne reçoit qu'une consigne :

```text
Explorer
sans se bloquer.
```

Il accumule :

```text
100 h
1000 h
5000 h
```

de données.

À chaque nouvelle version :

1. il reconstruit son monde latent ;
2. il détecte mieux les obstacles ;
3. il estime mieux l'adhérence ;
4. il optimise ses trajectoires.

On obtient une sorte de "bébé modèle du monde".

C'est très proche de la vision de LeCun : beaucoup d'observation, peu d'annotations. [\[arxiv.org\]](https://arxiv.org/abs/2506.09985), [\[arxiv.org\]](https://arxiv.org/html/2506.09985v1)

***

# Ce qui marcherait le mieux aujourd'hui

Si j'étais encadrant d'un projet d'école, je ferais :

```text
Caméra
   +
IMU
   +
Encodeur vision (JEPA)
   +
Monde latent
   +
MPC (Model Predictive Control)
   +
PX4 ou ROS2
```

et non :

```text
Caméra
   ↓
Réseau géant
   ↓
Moteurs
```

La seconde solution est beaucoup plus fragile.

***

# Une architecture réalisable par 5 à 10 étudiants

```text
ROS2
   |
PX4 (ou rover)
   |
Collecte données
   |
JEPA latent
   |
World model
   |
Planificateur MPC
   |
Mission simple
```

Sur un an de projet, je pense qu'une équipe motivée pourrait atteindre :

* navigation autonome extérieure ;
* évitement basique ;
* adaptation partielle au terrain ;
* compréhension empirique du vent (drone) ;
* démonstration visible d'apprentissage progressif.

Ce ne serait pas un système industriel, mais ce serait déjà une démonstration crédible d'un "modèle du monde" embarqué, exactement dans l'esprit des premières applications robotiques de la famille JEPA observées récemment. [\[arxiv.org\]](https://arxiv.org/abs/2506.09985), [\[arxiv.org\]](https://arxiv.org/abs/2606.23444)

À titre personnel, je pense même qu'un rover 4 roues est actuellement un meilleur terrain d'expérimentation qu'un drone : les coûts sont plus faibles, les risques quasi nuls, la collecte de données est massive, et les phénomènes physiques (adhérence, pentes, obstacles, terrain meuble) sont suffisamment riches pour démontrer l'intérêt d'un modèle du monde de type JEPA.


Pas du tout hors de portée.

En fait, je dirais qu'un **rover + bras simple + caméra** est aujourd'hui beaucoup plus accessible qu'un drone volant autonome. Pour un projet étudiant, c'est même probablement la meilleure plateforme pour expérimenter des idées de type JEPA, world model ou apprentissage embarqué.

## Exemple : "chasse aux œufs de Pâques"

Mission :

```text
Parcourir un jardin
↓
Détecter un œuf coloré
↓
S'en approcher
↓
Le saisir
↓
Le déposer dans un panier
```

Techniquement, on peut décomposer cela en briques relativement simples :

### Navigation

Le rover apprend à :

* éviter obstacles ;
* franchir de petites irrégularités ;
* rejoindre des points d'intérêt.

### Perception

La caméra apprend à reconnaître :

* œufs ;
* balle de tennis ;
* jouets ;
* cônes de chantier.

Aujourd'hui, même un petit modèle vision peut faire cela.

### Manipulation

Le bras n'a pas besoin d'être sophistiqué.

Un bras :

* 3 à 5 degrés de liberté ;
* une petite pince ;

suffit largement.

Le plus simple est souvent :

```text
Le rover s'aligne
↓
Le bras descend
↓
La pince ferme
↓
Le bras remonte
```

***

## Ce qui devient intéressant avec un modèle du monde

On peut aller au-delà du simple pilotage.

Le système peut apprendre :

```text
"Cet objet est derrière un buisson."

"Si je contourne par la droite,
j'aurai probablement accès à lui."

"Cet œuf a disparu de la vue,
mais il devrait être encore ici."
```

C'est justement le genre de représentation abstraite que les approches JEPA cherchent à construire.

***

## Variante "pelleteuse"

Je trouve même cela encore plus intéressant.

Mission :

```text
Chercher des cubes colorés
↓
Les charger
↓
Les transporter
↓
Les vider ailleurs
```

ou :

```text
Ramasser des balles
Créer un tas
```

ou :

```text
Nettoyer une zone
```

L'avantage est que :

* la précision nécessaire est faible ;
* les interactions avec le monde sont riches ;
* on accumule énormément de données d'apprentissage.

***

## Niveau de difficulté

Je classerais approximativement :

```text
Rover autonome
⭐⭐

Rover + détection d'objet
⭐⭐⭐

Rover + bras simple
⭐⭐⭐⭐

Rover + bras + apprentissage
⭐⭐⭐⭐⭐

Drone volant + manipulation
⭐⭐⭐⭐⭐⭐⭐⭐
```

Le saut de difficulté entre un rover manipulateur et un drone manipulateur est énorme.

***

## Un projet étudiant très crédible

Si j'avais une équipe de 8 étudiants pendant un an, je viserais :

### Version 1

```text
Rover
+
caméra
+
GPS
```

capable de patrouiller.

### Version 2

```text
Détection d'œufs
ou balles colorées
```

### Version 3

```text
Bras-pince
Ramassage automatique
```

### Version 4

```text
Apprentissage continu
du terrain et des objets
```

### Démonstration finale

```text
Chasse aux œufs autonome
sur terrain inconnu
```

Franchement, ce serait déjà impressionnant à voir et suffisamment complexe pour explorer :

* vision par ordinateur ;
* robotique mobile ;
* manipulation ;
* ROS2 ;
* modèles du monde ;
* JEPA ou architectures voisines.

C'est même le genre de démonstrateur qui ressemble davantage à un "petit robot généraliste" qu'à beaucoup de projets académiques actuels, tout en restant réalisable avec un budget et une équipe d'école d'ingénieur.
