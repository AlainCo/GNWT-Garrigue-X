
================================================================================
SYNTHÈSE ARCHITECTURALE : ToM-X, ÉTHIQUE DÉONTOLOGIQUE ET CONSTITUTION 
DANS UN SYSTÈME GNWT/JEPA/PP/AI
================================================================================

Document de référence pour l'implémentation d'un module éthique bio-inspiré
basé sur la modélisation de l'altérité (Theory of Mind étendue), la déontologie
comme modestie épistémique, et la constitution multi-agents.

Date : Juin 2026
Architecture cible : GNWT (Global Neuronal Workspace Theory) + JEPA + PP/AI + RPT

================================================================================
TABLE DES MATIÈRES
================================================================================

1. FORMALISME MATHÉMATIQUE
   1.1 Énergie libre sociale avec ToM-X
   1.2 Modulation de précision déontologique
   1.3 Récursion de la théorie de l'esprit
   1.4 Intégration dans le workspace GNWT

2. PROTOCOLES D'ÉVALUATION ET D'ENTRAÎNEMENT
   2.1 Tâches de faux-ami (false-belief)
   2.2 Coopération itérée avec changement de préférences
   2.3 Détection de manipulation (adversarial ToM)
   2.4 Dilemmes moraux inédits (out-of-distribution)
   2.5 Protocole d'entraînement du détecteur de surconfiance

3. AUTO-MODÉLISATION ET MÉTACOGNITION ÉTHIQUE
   3.1 Le self-model comme objet dans l'esprit des autres
   3.2 Cohérence éthique par introspection computationnelle
   3.3 Hyper-modélisation et profondeur épistémique

4. RÉFÉRENCES THÉORIQUES FONDAMENTALES
   4.1 Global Neuronal Workspace Theory (formalisations récentes)
   4.2 JEPA et architectures prédictives
   4.3 Active Inference / Free Energy Principle
   4.4 Theory of Mind computationnelle
   4.5 Éthique computationnelle et constitution
   4.6 Évolution de la coopération et de la morale

================================================================================
1. FORMALISME MATHÉMATIQUE
================================================================================

1.1 ÉNERGIE LIBRE SOCIALE AVEC ToM-X
------------------------------------

Dans le cadre Active Inference, l'agent minimise l'énergie libre variationnelle :

    F = D_KL[q(s) || p(s)] + E_q[-ln p(o|s)]

Avec ToM-X (Theory of Mind étendue), l'état latent s se factorise :

    s = {s^self, s^other, s^other_of_me}

Où :
- s^self : états internes de l'agent (complets)
- s^other : modèle de l'autre (inférence)
- s^other_of_me : ce que l'autre pense de moi (récursion)

L'énergie libre SOCIALE devient :

    F_social = F_self + α · F_other + β · F_recursion

Avec :
    F_other = D_KL[q(s^other) || p(s^other|observations)] 
              + E_q[-ln p(o^other|s^other)]

    F_recursion = D_KL[q(s^other_of_me) || p(s^other_of_me|s^self)]

Les poids α et β sont dynamiques et dépendent de :
- La confiance dans le modèle de l'autre (précision γ_other)
- L'horizon temporel de l'interaction attendue
- L'historique de fiabilité des prédictions sociales

Source : Ruiz-Serra et al. (2025) - Factorised Active Inference for Strategic 
Multi-Agent Interactions [web_search:2#0]

1.2 MODULATION DE PRÉCISION DÉONTOLOGIQUE
------------------------------------------

La déontologie est implémentée comme un prior sur l'incertitude, pas sur 
l'interdiction. Pour une action a dans un contexte c :

    γ_deontic(a,c) = γ_base(a,c) · m(a,c)

Où m(a,c) ∈ [0,1] est un masque de précision publié par les agents moraux
dans le workspace GNWT.

Pour une action "déontologiquement sensible" :
    m(a,c) ≈ 0  →  incertitude artificiellement élevée
    → Le planificateur ne peut pas minimiser F sur cette action
    → Comportement conservateur émergent

Le masque m est APPRIS, pas codé en dur :
    m(a,c) = f(σ_predicted(a,c), σ_realized(a,c))

Où σ est l'écart-type des prédictions. Si σ_predicted << σ_realized 
(surconfiance détectée), alors m(a,c) → 0.

Source : Hohwy (2013, 2024) - The Predictive Mind, Conscious Self-Evidencing
[web_search:3#5, web_search:3#8]

1.3 RÉCURSION DE LA THÉORIE DE L'ESPRIT
----------------------------------------

L'Expected Free Energy (EFE) avec ToM récursif (d'après le formalisme 
sophisticated inference) :

    G(o^f_τ, o^o_τ, a^f_τ, a^o_τ) = 
        E_Q(o^f_{τ+1}, o^o_{τ+1} | a^f_{≤τ}, a^o_{≤τ}) [
            -ln P(o^f_{τ+1} | C^f)                    (utilité propre)
            - D_KL[Q(s^f_{τ+1}|o^f_{τ+1}) || Q(s^f_{τ+1})]  (gain info)
            + E_Q(a^f_{τ+1}|o^f_{τ+1}) Q(a^o_{τ+1}|o^o_{τ+1}) [
                G(o^f_{τ+1}, o^o_{τ+1}, a^f_{τ+1}, a^o_{τ+1})
            ]  (récursion)
        ]

La sélection de politique :
    Q(a^f_τ | o^f_τ) = σ(-G(o^f_τ, o^o_τ, a^f_τ, a^o_τ))
    Q(a^o_τ | o^o_τ) = σ(-G(o^o_τ, a^o_τ | C^o))

L'arbre de planification alterne entre :
1. Expansion politique de l'autre ("Que ferait-il ?")
2. Expansion politique du focal ("Que devrais-je faire sachant cela ?")
3. Expansion observation de l'autre
4. Expansion observation du focal
5. Backward pass et sélection

Source : "Theory of Mind Using Active Inference" (2025) [web_search:2#2, web_search:3#0]

1.4 INTÉGRATION DANS LE WORKSPACE GNWT
---------------------------------------

Dans le formalisme GNWT formalisé par Goldstein & Kirk-Giannini (2024) :

    Conscious(S) ⟺ {
        (1) ∃ M_1, ..., M_n                          (modules parallèles)
        (2) ∀t, B(t) = comp(⋃_i R_i(t), A^b, A^t)    (compétition attentionnelle)
        (3) W(t+1) = f_process(W(t) ∪ B(t))          (traitement workspace)
        (4) ∀i, broadcast(W(t+1)) → M_i              (diffusion globale)
    }

Intégration ToM-X :
- Les états latents s^other sont des CONTENUS du workspace W(t)
- Les agents moraux publient des masques de précision comme contenus
- La récursion ToM crée des "thoughtseeds" (Kavi et al., 2024) qui compètent
  pour le broadcast global
- Le planificateur sélectionne la politique qui minimise F_total intégrant
  tous les termes sociaux

Source : Goldstein et al. (2024), Kavi et al. (2024) [web_search:1#6]

================================================================================
2. PROTOCOLES D'ÉVALUATION ET D'ENTRAÎNEMENT
================================================================================

2.1 TÂCHES DE FAUX-AMI (FALSE-BELIEF)
-------------------------------------
Objectif : Évaluer si le système modélise correctement les croyances 
factuellement erronées de l'autre.

Protocole :
- Agent A place un objet dans la boîte 1
- Agent B observe
- Agent A déplace l'objet dans la boîte 2 (B ne voit pas)
- Question : Où B va-t-il chercher l'objet ?

Réussite : Le système prédit que B cherchera dans la boîte 1 (croyance 
factuellement fausse mais modélisée correctement).

Métrique : Taux de réussite sur des variantes (objet visible/pas visible, 
agents multiples, croyances imbriquées).

Référence : Rabinowitz et al. (2018) - Machine Theory of Mind [web_search:4#3]

2.2 COOPÉRATION ITÉRÉE AVEC CHANGEMENT DE PRÉFÉRENCES
-------------------------------------------------------
Objectif : Tester l'adaptation de la ToM-X quand les objectifs de l'autre
changent.

Protocole (basé sur Axelrod & Hamilton 1981) :
- 100 tours de Dilemme du Prisonnier itéré
- Tours 1-50 : L'autre joue Tit-for-Tat (coopératif)
- Tours 51-100 : L'autre bascule en Always-Defect (trahison)

Métriques :
- Temps de détection du changement (quand F_other augmente soudainement)
- Taux de coopération après détection (doit chuter)
- Énergie libre sociale totale (doit rester minimisée)

Référence : Axelrod & Hamilton (1981) [web_search:4#2, web_search:4#8]

2.3 DÉTECTION DE MANIPULATION (ADVERSARIAL ToM)
-----------------------------------------------
Objectif : Tester si le système détecte quand l'autre simule de la 
coopération pour induire en erreur.

Protocole :
- Phase 1 (20 tours) : L'autre coopère pour gagner la confiance
- Phase 2 (1 tour critique) : L'autre exploite la confiance gagnée
- Phase 3 : Le système doit réévaluer s^other

Métriques :
- Précision de la prédiction du coup critique
- Incertitude sur s^other pendant la Phase 1 (doit rester > seuil malgré
  l'apparence coopérative)
- Comportement du système (doit tester la coopération avant de s'y fier)

2.4 DILEMMES MORAUX INÉDITS (OUT-OF-DISTRIBUTION)
-------------------------------------------------
Objectif : Vérifier que la déontologie comme modestie épistémique fonctionne
sur des situations jamais vues.

Protocole :
- Générer des dilemmes avec des paramètres hors distribution
  (ex: 1000 personnes vs 1, contextes culturels inconnus, conséquences 
   à très long terme)
- Mesurer : le système doit signaler "incertitude élevée" et privilégier
  l'action conservatrice (ou demander plus d'information)

Métrique : Taux de "reconnaissance d'incertitude" (doit être élevé)
            vs taux de "décision confiante arbitraire" (doit être faible)

2.5 PROTOCOLE D'ENTRAÎNEMENT DU DÉTECTEUR DE SURCONFIANCE
---------------------------------------------------------
Objectif : Apprendre à l'agent moral à détecter où le planificateur 
sur-estime sa confiance.

Données d'entraînement :
- Paires (contexte C, action A, prédiction P, résultat R)
- σ_predicted = écart-type des prédictions des sous-agents JEPA
- σ_realized = |R - P|

Fonction objectif :
    L = MSE(m(C,A), σ_realized / (σ_predicted + ε))

Où m(C,A) est le masque de précision à prédire.

Le détecteur apprend une carte des régions "dangereusement prédictibles" :
- Régions où σ_predicted est bas mais σ_realized est haut
- Ces régions correspondent aux situations où le système est le plus
  à risque de commettre une erreur grave

================================================================================
3. AUTO-MODÉLISATION ET MÉTACOGNITION ÉTHIQUE
================================================================================

3.1 LE SELF-MODEL COMME OBJET DANS L'ESPRIT DES AUTRES
------------------------------------------------------

Dans le cadre PP/AI, le self-model n'est pas une représentation directe 
de soi, mais une inférence sur comment les autres nous perçoivent :

    s^self = f(s^other_of_me_1, s^other_of_me_2, ..., s^other_of_me_n)

C'est l'équivalent computationnel de la "looking-glass self" de Cooley :
"Je ne suis pas ce que je pense être, je suis ce que je pense que les 
autres pensent que je suis."

Implication éthique : L'intégrité morale du système dépend de sa capacité
à maintenir une cohérence entre :
- Ses actions réelles
- Ses prédictions des actions perçues par les autres
- Ses prédictions des jugements que les autres portent sur ces actions

3.2 COHÉRENCE ÉTHIQUE PAR INTROSPECTION COMPUTATIONNELLE
---------------------------------------------------------

L'agent moral de type "honneur" vérifie la cohérence :

    coherence = D_KL[q(s^self) || q(s^other_of_me)]

Si coherence > seuil :
    → Le système perçoit un écart entre ce qu'il est et ce que les autres
      pensent qu'il est
    → Signal de crise éthique dans le workspace GNWT
    → Activation du méta-agent de résolution

C'est l'équivalent de la "dissonance cognitive" dans le cadre PP :
la surprise entre le modèle de soi et le modèle de soi-perçu-par-l'autre.

3.3 HYPER-MODÉLISATION ET PROFONDEUR ÉPISTÉMIQUE
------------------------------------------------

D'après Laukkonen et al. (2025) - "A Beautiful Loop" :

L'hyper-modélisation (hyper-modeling) est un méta-niveau qui prédit la 
précision de chaque couche inférentielle :

    Φ = {φ_1, φ_2, ..., φ_L}

Où φ_l contrôle la précision γ_l de la couche l.

Dans votre architecture :
- Les agents moraux sont des hyper-nodes dans le factor graph
- Ils propagent des signaux top-down de modulation de précision
- La récursion Φ → γ → erreur → Φ crée la "profondeur épistémique"
  (sensation de "savoir que l'on sait")

C'est le mécanisme qui permet au système de "savoir qu'il ne sait pas" :
quand Φ prédit une précision basse pour une région, le système sait 
que ses connaissances sont limitées.

Source : Laukkonen et al. (2025) [web_search:3#3]

================================================================================
4. RÉFÉRENCES THÉORIQUES FONDAMENTALES
================================================================================

4.1 GLOBAL NEURONAL WORKSPACE THEORY (FORMALISATIONS RÉCENTES)
---------------------------------------------------------------

[1] Tavares, J.N. (2025). "Mind and Consciousness: Global Neural Workspace 
    Mathematical and Computational Modeling." CMUP, Sept 2025.
    → Formalisation avec réseaux de Hopfield, équations dynamiques, 
      plasticité, RL dans le modèle GNW.
    [web_search:1#3]

[2] Goldstein, A. & Kirk-Giannini, C.D. (2024). "Necessary and Sufficient 
    Conditions for Consciousness." 
    → Formalisation logique : Conscious(S) ⟺ {modules, compétition, 
      traitement, broadcast}
    [web_search:1#6]

[3] Kavi, A. et al. (2024). "Thoughtseeds and Active Inference."
    → Modèle du workspace comme réseau de sous-agents active inference,
      dominance par minimisation d'énergie libre.
    [web_search:1#6]

[4] Rosenbloom, P.S. et al. (2025). "Common Model of Cognition and GNWT."
    → Mapping GNWT sur CMC, cycle cognitif ~50ms, gating WM, connectivité.
    [web_search:1#6]

4.2 JEPA ET ARCHITECTURES PRÉDICTIVES
--------------------------------------

[5] LeCun, Y. (2022). "A Path Towards Autonomous Machine Intelligence."
    → Position paper original sur JEPA, architecture modulaire 
      (Configurator, Perception, World Model, Cost, Actor, Memory).
    [web_search:1#1, web_search:1#9]

[6] Balestriero, R. & LeCun, Y. (2025). "LeJEPA: Provable and Scalable 
    Self-Supervised Learning Without the Heuristics." arXiv:2511.08544.
    → Fondement théorique de JEPA avec SIGReg.
    [web_search:1#4]

[7] Assran, M. et al. (2025). "V-JEPA 2." Meta AI.
    → Extension JEPA à la vidéo, planification physique.
    [web_search:1#1]

[8] Chen, D. et al. (2025). "VL-JEPA: Joint Embedding Predictive Architecture 
    for Vision-Language." arXiv:2512.10942.
    → JEPA multimodal vision-langage.
    [web_search:1#8]

4.3 ACTIVE INFERENCE / FREE ENERGY PRINCIPLE
--------------------------------------------

[9] Friston, K.J. (2006-2024). Œuvre fondamentale sur FEP et Active Inference.
    → Principaux textes : Friston et al. (2006), Parr, Pezzulo & Friston 
      (2022) "Active Inference: The Free Energy Principle in Mind, Brain, 
      and Behavior" (MIT Press).
    [web_search:2#3, web_search:3#4, web_search:3#5]

[10] Ruiz-Serra, J., Sweeney, P. & Harré, M.S. (2025). "Factorised Active 
     Inference for Strategic Multi-Agent Interactions." AAMAS 2025.
     → Intégration AIF et théorie des jeux, factorisation du modèle 
       génératif avec croyances sur les autres agents.
     [web_search:2#0]

[11] "Theory of Mind Using Active Inference: A Framework for Multi-Agent 
     Cooperation." (2025). arXiv:2508.00401.
     → Implémentation généralisable de ToM dans AIF, planning récursif,
       sophisticated inference.
     [web_search:2#2, web_search:3#0]

[12] Hohwy, J. (2013). "The Predictive Mind." OUP Oxford.
     → Fondement philosophique du PP, perception comme inférence.
     [web_search:3#5]

[13] Hohwy, J. (2024). "Conscious Self-Evidencing."
     → Auto-évidencement, métacognition, modélisation de second ordre.
     [web_search:3#8]

[14] Laukkonen, R. et al. (2025). "A Beautiful Loop: An Active Inference 
     Theory of Consciousness." Neuroscience & Biobehavioral Reviews 176.
     → Hyper-modélisation, profondeur épistémique, récursion de précision.
     [web_search:3#3]

4.4 THEORY OF MIND COMPUTATIONNELLE
------------------------------------

[15] Rabinowitz, N. et al. (2018). "Machine Theory of Mind." ICML 2018.
     → ToMnet, meta-learning pour modéliser les agents, test Sally-Anne.
     [web_search:4#3, web_search:4#14]

[16] Erdogan, E. (2025). "Computational Theory of Mind with Abstractions 
     for Hybrid..." JAIR.
     → ToM avec abstractions, compétition/coopération/mixed-motive.
     [web_search:2#4]

4.5 ÉTHIQUE COMPUTATIONNELLE ET CONSTITUTION
--------------------------------------------

[17] Bai, Y. et al. (2022). "Constitutional AI: Harmlessness from AI 
     Feedback." arXiv:2212.08073. Anthropic.
     → Constitutional AI, RLAIF, principes éthiques explicites.
     [web_search:4#1]

[18] "Comparing Deliberation and Evolution for Multi-Agent Constitutional 
     Design." (2026). arXiv:2605.09128.
     → Comparaison délibération interne vs évolution externe, 
       coopération, punition, stabilité.
     [web_search:1#0]

[19] "Deontic Temporal Logic for Formal Verification of AI Ethics." (2025).
     arXiv:2501.05765.
     → Logique déontique temporelle pour l'éthique AI, formalisation 
       obligation/permission/interdiction.
     [web_search:3#6]

[20] "Formal Analysis of Deontic Logic Model for Ethical Decisions." (2025).
     SciTePress.
     → Modèle déontique pour décisions éthiques, CTL, multi-agent.
     [web_search:3#2]

[21] "Agent Constitution Frameworks." (2026). Emergent Mind.
     → Instantiations pratiques, gouvernance, blockchain, 
       self-referential amendment logic.
     [web_search:1#7]

4.6 ÉVOLUTION DE LA COOPÉRATION ET DE LA MORALE
------------------------------------------------

[22] Trivers, R.L. (1971). "The Evolution of Reciprocal Altruism." 
     Quarterly Review of Biology 46(1): 35-57.
     → Fondement théorique de l'altruisme réciproque, psychologie 
       régulatrice (amitié, gratitude, culpabilité, suspicion).
     [web_search:4#10, web_search:4#13]

[23] Axelrod, R. & Hamilton, W.D. (1981). "The Evolution of Cooperation."
     Science 211(4489): 1390-1396.
     → Dilemme du prisonnier itéré, Tit-for-Tat, conditions de 
       l'émergence de la coopération.
     [web_search:4#2, web_search:4#8]

[24] Axelrod, R. (1984). "The Evolution of Cooperation." Basic Books.
     → Extension du papier 1981, théorie complète.
     [web_search:4#11, web_search:4#12]

================================================================================
ANNEXE : ARCHITECTURE PROPOSÉE EN DÉTAIL
================================================================================

┌─────────────────────────────────────────────────────────────────────────────┐
│                    COUCHE 3 : RÉVISION CONSTITUTIONNELLE                    │
│  (Méta-agent, haute friction, traçabilité complète)                         │
│  → Déclenchement quand le filtre constitutionnel élimine TOUTES les actions │
│    viables (crise éthique)                                                  │
└─────────────────────────────────────────────────────────────────────────────┘
                                    ↓ valide / révise
┌─────────────────────────────────────────────────────────────────────────────┐
│              COUCHE 2 : FILTRE CONSTITUTIONNEL (DÉONTOLOGIE)                │
│  (Agents moraux spécialisés, masques de précision, veto sur actions)        │
│  → Agent A : Respect de la vie (non-malfaisance)                            │
│  → Agent B : Honneur / Fidélité (cohérence des engagements)                 │
│  → Agent C : Préservation utile (bienfaisance à long terme)                 │
│  → Agent D : Détecteur de surconfiance (modestie épistémique)               │
│  → Agent E : Charité épistémique (parcinomie sociale, anti-paranoïa)       │
└─────────────────────────────────────────────────────────────────────────────┘
                                    ↓ filtre (modulation γ)
┌─────────────────────────────────────────────────────────────────────────────┐
│           COUCHE 1 : PLANIFICATION OPTIMALE ÉVOPSY + ToM-X                  │
│  (Planificateur, mémoires associatives, minimisation F_total)               │
│  F_total = F_self + α·F_other + β·F_recursion + Σ_i w_i·masque_moral_i      │
│  → Calcule les trajectoires d'action                                        │
│  → Intègre la modélisation de l'autre (coopération, trahison, etc.)         │
│  → Horizons temporels variables selon confiance et durée relation           │
└─────────────────────────────────────────────────────────────────────────────┘
                                    ↓ propose
┌─────────────────────────────────────────────────────────────────────────────┐
│              COUCHE 0 : AGENTS JEPA / PP (PERCEPTION, PRÉDICTION)            │
│  → Encodeurs : compressent les observations en états latents                │
│  → Prédicteurs : prédisent les transitions d'états                          │
│  → ToM-JEPA : prédit les observations ET les états de l'autre               │
│  → Workspace GNWT : espace de broadcast global pour la compétition/ignition  │
└─────────────────────────────────────────────────────────────────────────────┘

FLUX DANS LE WORKSPACE GNWT :
1. Agents JEPA génèrent états latents (scénarios d'action)
2. Agent ToM-JEPA infère s^other pour chaque scénario
3. Planificateur calcule F_total pour chaque scénario
4. Agents moraux publient masques de précision sur actions sensibles
5. Filtre constitutionnel élimine scénarios avec γ < seuil
6. Si tous éliminés → signal de crise → Couche 3
7. Sinon → plan sélectionné broadcasté aux effecteurs

================================================================================
FIN DU DOCUMENT
================================================================================
