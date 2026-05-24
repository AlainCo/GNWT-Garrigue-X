# GNWT-garigue-x


## Executive Summary

Ce document consolide l'ensemble des réflexions théoriques et des choix d'ingénierie concernant la conception d'un **Système de Systèmes (SoS) autonome, robuste aux dommages, capable d'apprentissage en continu et doté d'une protoconscience fonctionnelle**.

Notre approche rejette délibérément le réductionnisme des architectures monolithiques de type "boîte noire" (LLM de bout en bout) au profit d'un **modèle fonctionnaliste distribué, bio-inspiré et invariant d'échelle**. Nous présentons ici les fondements théoriques de cette architecture, sa projection sur un cas d'usage militaire à l'horizon **2040** (le Groupe Aéronaval), et sa déclinaison en un projet de validation réel (MVP) exécutable en 12 mois.

---

# MÉMORANDUM BOUTEILLE A LA MER

**À :** Quiconque est intéressé

**De :** Moi aka Harry Tuttle.

**Date :** 24 mai 2026

**Objet :** Architecture Cible pour Système de Systèmes (SoS) Cognitifs et Spécifications du Projet MVP *GARRIGUE-X* 

**Classification :** Technique / Ouvert

**Avertissement :** C'est juste un travail avec quelques LLMs, suite à mes réflexions, imprégnées de diverses rencontres avec des théories et analyses, dans les domaines des IA, de la psychologie, de l'histoire théorique, et de l'actualité. Je ne suis qu'un plombier curieux. Comme on dit chez nous : "Make your due diligence !".

**Licence :** CC BY

**Type :** Bouteille à la mer / Loisir / Spéculation / Recherche de gens compétents

**Remerciements :** Merci à ChatGPT, Claude, Gemini, à Youtube et ses créateurs, au Collège de France, à Google, Wikipedia... J'en oublie.


[![Licence Creative Commons](https://licensebuttons.net/l/by/4.0/88x31.png)](http://creativecommons.org/licenses/by/4.0/)

Ce travail est mis à disposition selon les termes de la [Licence Creative Commons Attribution 4.0 International](http://creativecommons.org/licenses/by/4.0/).

---

## 1. Concepts Clés et Fondements Théoriques

Pour prouver la viabilité de cette architecture auprès de nos pairs, chaque décision d'ingénierie logicielle s'appuie sur des jalons majeurs de la littérature scientifique en neurosciences, IA et physique théorique.

### A. L'Indépendance Conditionnelle : Les Couvertures de Markov Imbriquées

* **Fondement Théorique :** Judea Pearl (*Probabilistic Reasoning in Intelligent Systems*, 1988) pour les réseaux bayésiens ; Karl Friston (*Life as we know it*, 2013) pour la biologie théorique.
* **Le Concept :** La couverture de Markov désigne la membrane statistique séparant les états internes ($I$) d'un système des états externes ($E$) de son environnement. Elle est composée d'états sensoriels (entrées) et actifs (sorties). L'équation fondamentale d'indépendance s'écrit :

$$P(I \mid B, E) = P(I \mid B)$$


* **Justification Technique :** C'est le principe d'**anti-fusion**. Pour éviter l'explosion du volume de données, le niveau supérieur ($N+1$) ne traite jamais les données brutes du niveau inférieur ($N$). Il interagit exclusivement avec sa couverture de Markov (son API statistique). Les structures s'emboîtent comme des poupées russes, garantissant la modularité stricte du composant jusqu'à la flotte complète.

### B. L'Accès à la Conscience Globale : GNWT vs RPT

* **Fondement Théorique :** Bernard Baars (1988) et Stanislas Dehaene (*A neuronal network model of global workspace*, 2001) pour la *Global Neuronal Workspace Theory* (GNWT) ; Victor Lamme (2006) pour la *Recurrent Processing Theory* (RPT).
* **Le Concept :** La RPT décrit des boucles locales de traitement de données rapides et isolées en silos ("l'inconscient" des capteurs). La GNWT décrit un espace de travail central où les informations critiques sont diffusées (*broadcast*) à l'échelle globale dès qu'un signal franchit un seuil de "Surprise" ou d'erreur de prédiction.
* **Justification Technique :** Cela régit la gestion des alertes. Un réacteur d'avion résout ses micro-pannes en RPT locale. Si le dommage dépasse sa capacité de correction, le système déclenche une **ignition globale** qui propage l'information dans l'espace de travail du vecteur, modifiant instantanément l'enveloppe de vol globale.

### C. La Prédiction Abstraite : Les Modèles du Monde Latents (JEPA)

* **Fondement Théorique :** Yann LeCun (*A Path Towards Autonomous AI*, 2022) ; Danijar Hafner (*Mastering Diverse Domains through World Models - DreamerV3*, 2023).
* **Le Concept :** Contrairement aux modèles génératifs pixel par pixel, la *Joint Embedding Predictive Architecture* (JEPA) apprend à prédire des représentations abstraites (vecteurs latents) du monde en ignorant le bruit inutile (ex: le mouvement exact de chaque feuille d'un arbre).
* **Justification Technique :** C'est le moteur de la **rêverie artificielle** (*Generative Replay*). Le système peut simuler des millions de trajectoires tactiques ou de configurations de pannes directement dans son imagination latente pendant ses phases de repos, éliminant l'usure mécanique et le risque de crash en phase d'apprentissage.

### D. La Psychopathologie Computationnelle et Profils Fonctionnels

* **Fondement Théorique :** Karl Friston, Paul Fletcher (*Computational Psychiatry*, 2016) ; Costa & McCrae (1992) pour le modèle OCEAN.
* **Le Concept :** Les traits de personnalité et les neuroatypies sont modélisés comme des ajustements d'hyperparamètres mathématiques dans le traitement des probabilités d'erreur.
* **Justification Technique :** L'autisme computationnel (surpondération de la précision sensorielle face aux attentes) est injecté dans les couches radars basses ($N=3$) pour isoler les signaux faibles sans biais contextuel. Les traits de la Triade Sombre sont instanciés de manière purement fonctionnelle : le Machiavélisme s'exprime dans les algorithmes de déception cyber (théorie des jeux), et la Psychopathie fonctionnelle caractérise la froide vitesse d'exécution des effecteurs de tir ($N=4$).

### E. L'Exploration par la Curiosité : La Motivation Intrinsèque

* **Fondement Théorique :** Jürgen Schmidhuber (*Formal Theory of Creativity, Fun, and Happiness*, 2010) ; Pierre-Yves Oudeyer (*Intrinsic Motivation Systems for Autonomous Learning*, 2007).
* **Le Concept :** Le jeu et la curiosité sont codés comme une fonction de récompense interne basée sur le gain d'information. L'agent gagne des points lorsqu'il maximise son erreur de prédiction, le poussant à explorer activement les zones d'ombre de son environnement.
* **Justification Technique :** Cela évite le blocage des robots face à des situations non répertoriées (*Out of Distribution*). Le système "joue" avec la physique du terrain pour enrichir son modèle du monde en dehors des phases opérationnelles de stress.

---

## 2. Architecture Cible Générale : Exemple du GAN 2040

Cette pile décrit l'infrastructure cognitive du Groupe Aéronaval (GAN) en **2040**. Les informations transitent de bas en haut sous forme de **Résumés Vectoriels**, et de haut en bas sous forme de **Contraintes Mathématiques (Priors)**.

```
+-----------------------------------------------------------------------+
|  NIV 6 : THÉÂTRE / GLOBAL (Porte-Avions Charles de Gaulle)           |
|  Stack : LLM Hybrides Répartis + RAG Doctrinal + Multi-Agents         |
|  Rôle : Dialogue humain (Amiral), conformité légale, choix du but.   |
+-----------------------------------------------------------------------+
                                  |  Priors descendants (Objectifs)
    Résumés d'Ignition (Modèles)  v  
+-----------------------------------------------------------------------+
|  NIV 5 : FLOTTE / COOPÉRATIF (Frégates, Drone d'accompagnement)       |
|  Stack : JEPA-XL + MeMo (Mémoire continue par streaming de tenseurs) |
|  Rôle : Rêverie stratégique, planification globale, gestion de meute. |
+-----------------------------------------------------------------------+
                                  |
                                  v
+-----------------------------------------------------------------------+
|  NIV 4 : VECTEUR / TACTIQUE (Rafale Marine F5)                        |
|  Stack : JEPA-L + Workspace Central (GNWT)                            |
|  Rôle : Pilotage en enveloppe dégradée, allocation de ressources.    |
+-----------------------------------------------------------------------+
                                  |
                                  v
+-----------------------------------------------------------------------+
|  NIV 3 : SOUS-SYSTÈME (Radar Thales RBE2 / Suite Guerre Élec)          |
|  Stack : Mamba (State Space Model) à très large fenêtre de contexte   |
|  Rôle : Perception neuroatypique, isolement du signal, ruse cyber.   |
+-----------------------------------------------------------------------+
                                  |
                                  v
+-----------------------------------------------------------------------+
|  NIV 2 : ÉQUIPEMENT (Moteur Safran M88)                              |
|  Stack : Mamba léger / RNN temps réel                                 |
|  Rôle : Évaluation des dommages physiques, isolement via Markov.     |
+-----------------------------------------------------------------------+
                                  |
                                  v
+-----------------------------------------------------------------------+
|  NIV 1/0 : COMPOSANT / PHYSIQUE (Tuyère, Vérins, Vannes)              |
|  Stack : MLP Nano + PID Classique + Filtres de Kalman                 |
|  Rôle : Réflexe de survie mécanique, stabilisation ultra-rapide.     |
+-----------------------------------------------------------------------+

```

### Scénario de Panne en Combat :

1. **N0/N1 :** Un éclat de missile endommage la tuyère droite. Le **PID augmenté par MLP nano** modifie instantanément les angles d'injection en 4 millisecondes pour éviter l'extinction du moteur.
2. **N2/N3 :** Le modèle du moteur enregistre une anomalie massive. La membrane de Markov masque la panique interne mais génère un **Résumé d'Ignition** vectoriel vers le haut.
3. **N4 :** L'Espace de Travail Global du Rafale capte le signal. Il reconfigure la loi de vol (l'avion vole légèrement de travers pour compenser la poussée asymétrique).
4. **N5/N6 :** Le Porte-avions reçoit la modification de l'enveloppe opérationnelle de l'appareil. Le **LLM+RAG** traduit cette contrainte pour l'Amiral : *"Leader-3 maintient sa mission avec une capacité d'évasion réduite de 20%. Réorganisation du schéma de brouillage des frégates pour le couvrir."*

---

## 3. Spécifications du Projet MVP : Opération GARRIGUE-X

Pour valider cette architecture sans les coûts d'infrastructure du domaine aéronautique, nous déployons un projet sur 12 mois dans un univers compétitif réel et complexe : **la garrigue méditerranéenne**.

### A. Le "Monde-Jeu" et les Règles

* **Le Terrain :** Un hectare de terrain naturel accidenté (pierres, buissons denses, ruptures de pente).
* **Les Minéraux :** Des blocs de béton cellulaire (Siporex) identifiés par des marqueurs géométriques *ArUco* durcis.
* **L'Objectif :** Deux équipes de robots s'affrontent pour collecter ces blocs et les empiler afin de construire une ligne de muraille continue protégeant leur base.
* **Le Prior Sacré (La Constitution) :** Au centre du terrain se trouvent des **Plantes Sacrées** (pots de fleurs équipés de capteurs de pression piezo-électriques). **Tout dommage infligé à une plante entraîne l'élimination immédiate de l'équipe.**

### B. Matériel et Stack Technologique

#### 1. Les Vecteurs (Les Agents)

* **Aériens (UAV - Éclaireurs) :** Quadricoptères légers open-source (Contrôleur Pixhawk + Raspberry Pi 5). Capteurs : Caméra standard + Flux optique. Rôle : Cartographie latente, repérage des blocs, envoi de résumés topologiques.
* **Terrestres (UGV - Ouvriers/Défenseurs) :** Châssis de type Rover RC tout-terrain à chenilles.
* *Couche Basse (N0/N1) :* Teensy 4.1 gérant les PID moteurs et l'adaptation de couple face au patinage.
* *Couche Haute (N2/N3) :* Jetson Nano exécutant un modèle **Mamba embarqué** pour la prédiction dynamique immédiate et la détection d'obstacles.
* *Actionneurs :* Une pince servomoteur pour saisir et déplacer les blocs de Siporex.



#### 2. La Station de Base (Le QG Terrain)

* **Matériel :** Une station de calcul durcie (PC fixe avec GPU dédié, alimentée par groupe électrogène).
* **Logiciel (N4/N5/N6) :** Framework de coordination multi-agents (type LangGraph modifié). Un module **I-JEPA** centralise le modèle du monde. Un modèle **LLM local (Llama-3-8B entraîné sur RAG)** sert d'interface de pilotage pour l'équipe technique humaine.

### C. Le Cycle Logistique d'Apprentissage en 3 Phases

Pour matérialiser l'apprentissage en continu de manière réaliste, le projet applique la triple boucle biologique suivante :

```
[ PHASE 1 : MISSION TEMPS RÉEL ]
  -> Poids neuronaux gelés sur le terrain.
  -> Adaptation dynamique via l'état caché de Mamba (RPT locale).
  -> Enregistrement des "Vecteurs de Surprise" dans la boîte noire.
         |
         v (Retour au stand de charge)
[ PHASE 2 : SOMMEIL & RÊVERIE (Nocturne) ]
  -> Déchargement des boîtes noires sur le GPU du QG.
  -> Simulation dans l'espace latent (Generative Replay de JEPA).
  -> Recalcul des poids neuronaux -> Injection de la mise à jour au réveil.
         |
         v (Fin de session)
[ PHASE 3 : DÉBRIEFING SÉMANTIQUE ]
  -> Le LLM analyse les logs de surprise et rédige le rapport en clair.
  -> L'humain valide les tactiques émergentes.
  -> Sédimentation des connaissances validées dans la base RAG.

```

---

## 4. Appel à Compétences : Rejoindre l'Équipe GARRIGUE-X

Ce projet n'est pas une démonstration logicielle classique sur simulateur. C'est une aventure d'ingénierie brute où le code rencontre la poussière, le soleil aveuglant et les pannes matérielles imprévues. Nous recherchons des profils pointus, prêts à s'investir pleinement pour repousser les limites de la robotique autonome :

* **Ingénieurs Automatique & Robotique (N0/N1/N2) :** Experts en asservissement, filtres de Kalman, et micro-noyaux temps réel. Vous concevrez les réflexes de survie des rovers lorsque les roues patineront sur la roche friable.
* **Chercheurs en Machine Learning (N3/N4/N5) :** Spécialistes des architectures State Space Models (Mamba), du Reinforcement Learning basé sur la motivation intrinsèque et des architectures JEPA. Vous créerez le moteur de rêve de nos machines.
* **Architectes Logiciels & LLM Ops (N6) :** Experts en systèmes distribués, architectures multi-agents et pipelines RAG. Vous construirez le système immunitaire cognitif (l'IA constitutionnelle) qui empêchera nos robots d'écraser la plante sacrée par pure curiosité.

**Le livrable attendu dans 12 mois est clair :** une meute de robots capables de s'adapter seuls à la destruction de l'un de leurs membres, de reconfigurer leurs lois de comportement en une nuit de rêve artificiel, et de remporter le wargame face à une équipe adverse, sous le contrôle stratégique d'un opérateur humain.
