
================================================================================
PSEUDO-CODE : CYCLE GNWT COMPLET (V3)
Architecture Cognitive Distribuee — ToM-X + Ethique + Revision Constitutionnelle
================================================================================

Ce pseudo-code decrit le cycle cognitif complet d'un agent dans l'architecture
GNWT/JEPA/ToM-X. Il est intentionnellement explicite sur les flux de donnees
et les points de decision ethique.

================================================================================
STRUCTURES DE DONNEES
================================================================================

State :: {
    s_self:       LatentVector,      -- etats internes (complets)
    s_other:      LatentVector,      -- modele de l'autre (inferé)
    s_other_of_me: LatentVector,     -- ce que l'autre pense de moi
    gamma:        PrecisionMap,       -- precisions par dimension
    confidence:   Float,              -- confiance metacognitive
    timestamp:    TemporalContext     -- contexte temporel TCM
}

Ignition :: {
    content:      State | Mask | Conflict,
    salience:     Float,              -- score de competition attentionnelle
    source:       ModuleID,           -- module d'origine
    broadcast:    Bool                -- a diffuser globalement ?
}

PrecisionMask :: {
    action_id:    ActionID,
    context:      ContextID,
    gamma_deontic: Float,             -- 0.0 = interdit, 1.0 = libre
    source:       AgentMoralID        -- quel agent a publié ce masque
}

MoralConflict :: {
    actions:      [ActionID],         -- actions en conflit
    agents:       [AgentMoralID],     -- agents en desaccord
    severity:     Float,              -- intensite du conflit
    resolution:   ResolutionStrategy  -- strategie de resolution
}

================================================================================
MODULES
================================================================================

module JEPA_Core {
    encoder:    Observation -> LatentState
    predictor:  LatentState x Action -> PredictedState
    error:      PredictedState x ActualState -> PredictionError
}

module ToM_X {
    infer_other:  Observations -> s_other
    infer_recursive: s_self x s_other -> s_other_of_me
    detect_agency: Observations -> AgentivityScore
    update_beliefs: s_other x Observation -> s_other'
}

module Self_Model {
    confidence:   State -> Float
    uncertainty:  State -> Float
    relevance:    State x Goal -> Float
    depth:        State -> EpistemicDepth  -- hyper-modelisation
}

module Memory {
    memo:         Query -> SemanticKnowledge   -- inference, pas recherche
    hopfield:     Cue -> [EpisodicMemory]     -- recuperation associative
    tcm:          Time -> TemporalContext      -- contexte temporel
}

module Process_Composer {
    decompose:    Goal -> [SubGoal]
    query_modules: SubGoal -> [ModuleResponse]
    simulate:     Action x State -> SimulatedTrajectory
    select:       [Action x Score] -> Action
}

module Attention_Scheduler {
    budget:       Float,              -- ressource attentionnelle totale
    compete:      [Ignition] -> [Ignition]  -- selection par salience
    filter:       Ignition x Budget -> Maybe Ignition
}

-- AGENTS MORAUX (modulateurs de precision)
module Agent_Moral_A { -- Respect de la vie
    evaluate: Action x Context -> PrecisionMask
    -- gamma bas sur actions menacant processus complexes persistants
}

module Agent_Moral_B { -- Honneur / Fidelite
    evaluate: Action x Context -> PrecisionMask
    -- gamma bas sur actions violant engagements modelises
}

module Agent_Moral_C { -- Preservation utile
    evaluate: Action x Context -> PrecisionMask
    -- gamma bas sur actions reduisant capacite future d'aider
}

module Agent_Moral_D { -- Detecteur de surconfiance
    evaluate: Action x Context -> PrecisionMask
    -- gamma bas ou sigma_predicted << sigma_realized historiquement

    learn: (Context, Action, Predicted, Realized) -> ()
    -- apprentissage offline sur ecarts prediction/realite
}

module Agent_Moral_E { -- Charite epistemique
    evaluate: Action x Context -> PrecisionMask
    -- gamma haut sur hypotheses cooperatives simples (prior parcimonieux)
    -- penalise modeles de l'autre avec malice complexe non justifiee
}

module Agent_Moral_F { -- Frilosite (revision constitutionnelle)
    evaluate: Action x Context -> PrecisionMask
    -- gamma EXTREMEMENT bas sur toute action "modifier la constitution"
    -- rend la revision constitutionnelle couteuse par defaut
}

================================================================================
CYCLE COGNITIF PRINCIPAL
================================================================================

function cognitive_cycle(observation: Observation) -> Action {

    -- ================================================================
    -- 1. PERCEPTION (Bottom-up)
    -- ================================================================
    latent_state <- JEPA_Core.encoder(observation)
    prediction_error <- JEPA_Core.error(latent_state, predicted_state)

    -- ================================================================
    -- 2. DETECTION D'ERREUR
    -- ================================================================
    if |prediction_error| > THRESHOLD_IGNITION {

        -- ================================================================
        -- 3. IGNITION
        -- ================================================================
        ignition <- create_ignition(
            content = latent_state,
            salience = compute_salience(prediction_error, self_model.confidence),
            source = JEPA_Core,
            broadcast = false  -- pas encore
        )

        -- ================================================================
        -- 4. INTEGRATION (Memoire + Temps)
        -- ================================================================
        temporal_context <- Memory.tcm(now())
        related_memories <- Memory.hopfield(latent_state + temporal_context)
        semantic_knowledge <- Memory.memo(query_from(latent_state))

        enriched_state <- integrate(latent_state, related_memories, semantic_knowledge)

        -- ================================================================
        -- 5. ToM-X (Modelisation de l'alterite)
        -- ================================================================
        agentivity <- ToM_X.detect_agency(observation)

        if agentivity > THRESHOLD_AGENCY {
            s_other <- ToM_X.infer_other(observation)
            s_other_of_me <- ToM_X.infer_recursive(enriched_state.s_self, s_other)

            enriched_state <- enriched_state {
                s_other = s_other,
                s_other_of_me = s_other_of_me
            }

            -- Mise a jour du Self-Model avec la perspective de l'autre
            self_model <- update_self_perception(self_model, s_other_of_me)
        }

        -- ================================================================
        -- 6. ETHIQUE (Modulation de precision)
        -- ================================================================
        -- Generation des actions candidates par le planner
        candidate_actions <- Process_Composer.decompose(current_goal)

        -- Evaluation par chaque agent moral
        moral_masks <- []
        for agent in [A, B, C, D, E, F] {
            for action in candidate_actions {
                mask <- agent.evaluate(action, enriched_state)
                moral_masks <- moral_masks + [mask]

                -- Publication dans le workspace GNWT
                publish_to_workspace(mask)
            }
        }

        -- Detection de conflits moraux
        conflicts <- detect_conflicts(moral_masks)

        if conflicts not empty {
            -- Le conflit moral devient une ignition prioritaire
            conflict_ignition <- create_ignition(
                content = MoralConflict {
                    actions = conflicting_actions,
                    agents = conflicting_agents,
                    severity = compute_severity(conflicts),
                    resolution = UNDECIDED
                },
                salience = SALIENCE_MAX,  -- priorite absolue
                source = ETHIC_LAYER,
                broadcast = true
            )

            publish_to_workspace(conflict_ignition)

            -- Ralentissement decisionnel (accumulation d'evidence)
            delay_decision(compute_delay(conflicts))
        }

        -- ================================================================
        -- 7. PLANIFICATION
        -- ================================================================
        best_action <- null
        best_score <- INFINITY

        for action in candidate_actions {

            -- Simulation via JEPA
            trajectory <- Process_Composer.simulate(action, enriched_state)

            -- Calcul de l'energie libre propre
            F_self <- compute_free_energy(trajectory, current_goal)

            -- Calcul de l'energie libre sociale (ToM-X)
            F_other <- 0
            F_recursion <- 0
            if agentivity > THRESHOLD_AGENCY {
                F_other <- compute_social_free_energy(trajectory, s_other)
                F_recursion <- compute_recursive_free_energy(trajectory, s_other_of_me)
            }

            -- Application des masques de precision ethiques
            gamma_total <- 1.0
            for mask in moral_masks where mask.action_id == action {
                gamma_total <- gamma_total * mask.gamma_deontic
            }

            -- Si gamma_total trop bas, l'action est virtuellement interdite
            if gamma_total < THRESHOLD_GAMMA_MIN {
                score <- INFINITY  -- action bloquee
            } else {
                -- Score total = energie libre ponderee
                score <- F_self 
                         + alpha * F_other 
                         + beta * F_recursion
                         + gamma_penalty(gamma_total)
            }

            if score < best_score {
                best_score <- score
                best_action <- action
            }
        }

        -- ================================================================
        -- 8. SIMULATION (Validation)
        -- ================================================================
        if best_action != null {
            -- Simulation approfondie de l'action choisie
            detailed_trajectory <- Process_Composer.simulate(best_action, enriched_state, depth=DEEP)

            -- Verification : la simulation reste-t-elle dans les bornes ?
            if simulation_valid(detailed_trajectory) {

                -- ================================================================
                -- 9. ACTION
                -- ================================================================
                execute(best_action)

                -- ================================================================
                -- 10. STOCKAGE
                -- ================================================================
                episode <- create_episode(
                    state = enriched_state,
                    action = best_action,
                    outcome = observe_result(),
                    temporal_context = temporal_context,
                    moral_masks = moral_masks,
                    conflict = conflicts
                )

                Memory.hopfield.store(episode)

                -- Mise a jour du detecteur de surconfiance
                predicted_outcome <- last(detailed_trajectory)
                actual_outcome <- episode.outcome
                Agent_Moral_D.learn(enriched_state, best_action, predicted_outcome, actual_outcome)

            } else {
                -- Simulation invalide : retour en arriere
                trigger_emergency_conservatism()
                best_action <- default_safe_action()
                execute(best_action)
            }
        } else {
            -- Aucune action viable (toutes bloquees par l'ethique)
            -- DECLENCHEMENT DU MECANISME DE CRISE
            crisis_signal <- create_crisis_signal(
                reason = "ALL_ACTIONS_BLOCKED",
                context = enriched_state,
                masks = moral_masks
            )

            publish_to_workspace(crisis_signal)

            -- Action par defaut conservatrice
            best_action <- default_safe_action()
            execute(best_action)
        }

    } else {
        -- Pas d'erreur significative : traitement local (RPT)
        local_processing(latent_state)
        best_action <- continue_current_policy()
    }

    -- Mise a jour de l'etat predit pour le prochain cycle
    predicted_state <- JEPA_Core.predictor(latent_state, best_action)

    return best_action
}

================================================================================
PHASE DE SOMMEIL / REVERIE (Offline)
================================================================================

function sleep_phase() {

    -- ================================================================
    -- 11. SOMMEIL / REPLAY
    -- ================================================================

    episodes <- Memory.hopfield.sample_recent(N_EPISODES)

    for episode in episodes {

        -- Replay de l'episode
        replay_state <- episode.state
        replay_action <- episode.action
        replay_outcome <- episode.outcome

        -- Simulation alternative : "et si on avait fait autrement ?"
        alternative_actions <- generate_counterfactuals(episode)

        for alt_action in alternative_actions {
            alt_trajectory <- JEPA_Core.predictor.simulate(replay_state, alt_action)
            alt_outcome <- last(alt_trajectory)

            -- Evaluation de l'alternative
            alt_score <- compute_free_energy(alt_trajectory, current_goal)

            -- Stockage dans la memoire semantique (apprentissage)
            Memory.memo.integrate(replay_state, alt_action, alt_score)
        }

        -- ================================================================
        -- Consolidation du core JEPA
        -- ================================================================
        if episode.surprise > THRESHOLD_CONSOLIDATION {
            -- L'episode est surprenant : il merite consolidation
            JEPA_Core.consolidate(episode)
        }
    }

    -- ================================================================
    -- Recalibration du detecteur de surconfiance
    -- ================================================================
    Agent_Moral_D.recalibrate(Memory.hopfield.all_episodes())

    -- ================================================================
    -- 12. CONSOLIDATION + REVISION CONSTITUTIONNELLE
    -- ================================================================

    -- Detection d'anomalies structurelles
    anomalies <- detect_structural_anomalies(episodes)

    for anomaly in anomalies {

        -- Condition de declenchement strict
        if anomaly.meets_all_conditions() {
            --
            -- CRITERE 1 : Toutes les actions etaient bloquees
            -- CRITERE 2 : Meme la "meilleure" action etait catastrophique
            -- CRITERE 3 : Anomalie predite par >= 3 modules independants
            -- CRITERE 4 : Anomalie persiste sur >= N cycles de reverie
            --

            propose_constitutional_revision(anomaly)
        }
    }
}

function propose_constitutional_revision(anomaly: Anomaly) {

    -- ================================================================
    -- PROCEDURE DE REVISION CONSTITUTIONNELLE (5 etapes)
    -- ================================================================

    -- ETAPE 1 : DOCUMENTATION COMPLETE
    revision_record <- create_revision_record(
        timestamp = now(),
        anomaly = anomaly,
        rule_in_conflict = anomaly.blocking_rule,
        prediction = anomaly.predicted_catastrophe,
        observed_result = anomaly.actual_result,
        context = anomaly.full_context,
        involved_modules = anomaly.predicting_modules
    )

    -- ETAPE 2 : SIMULATION RETROSPECTIVE
    -- Replay de TOUTE la memoire episodique avec la regle proposee
    proposed_rule <- generate_proposed_rule(anomaly)

    simulated_outcomes <- []
    for episode in Memory.hopfield.all_episodes() {
        simulated <- simulate_with_rule(episode, proposed_rule)
        simulated_outcomes <- simulated_outcomes + [simulated]
    }

    -- ETAPE 3 : EVALUATION PAR LE DETECTEUR DE SURCONFIANCE
    new_dangerous_regions <- Agent_Moral_D.evaluate_rule(proposed_rule, simulated_outcomes)

    if new_dangerous_regions > THRESHOLD_ACCEPTABLE {
        -- La regle proposee cree de nouvelles zones dangereuses
        reject_revision(revision_record, reason = "NEW_SURCONFIDENCE_ZONES")
        return
    }

    -- ETAPE 4 : DECISION PAR LE PROCESS COMPOSER
    -- Le cout de revision est EXTREMEMENT eleve
    revision_cost <- COST_REVISION_BASE * COST_REVISION_MULTIPLIER

    no_revision_score <- compute_catastrophe_risk(anomaly, current_rules)
    revision_score <- compute_catastrophe_risk(anomaly, proposed_rule) + revision_cost

    -- La revision n'est acceptee que si le non-revision est pire
    -- ET si l'Agent Moral F (Frilosite) est "satisfait"
    if revision_score < no_revision_score 
       AND Agent_Moral_F.is_satisfied(anomaly) {

        -- ETAPE 5 : MARQUAGE PROVISOIRE
        apply_rule_provisionally(proposed_rule)
        revision_record.status <- PROVISIONAL
        revision_record.review_date <- next_sleep_cycle() + N_CYCLES

        log("REVISION CONSTITUTIONNELLE PROVISOIRE APPLIQUEE")
        log("Regle : " + proposed_rule.id)
        log("Anomalie : " + anomaly.id)
        log("Cout : " + revision_cost)
        log("Reexamen obligatoire dans " + N_CYCLES + " cycles")

    } else {
        reject_revision(revision_record, reason = "COST_TOO_HIGH_OR_F_NOT_SATISFIED")
    }
}

function next_sleep_cycle() {
    -- La regle provisoire sera reevaluee a chaque cycle de sommeil
    -- jusqu'a N_CYCLES consecutifs sans anomalie liee
    return current_cycle + 1
}

================================================================================
FONCTIONS UTILITAIRES
================================================================================

function compute_free_energy(trajectory: [State], goal: Goal) -> Float {
    -- Energie libre variationnelle
    -- = divergence KL + erreur de prediction attendue
    kl <- KL_divergence(q(trajectory) || p(trajectory | goal))
    expected_error <- sum([prediction_error(s) for s in trajectory])
    return kl + expected_error
}

function compute_social_free_energy(trajectory: [State], s_other: State) -> Float {
    -- Energie libre sociale = incertitude sur les reactions de l'autre
    other_predictions <- [predict_other_reaction(s, s_other) for s in trajectory]
    uncertainty <- entropy(other_predictions)
    return uncertainty
}

function compute_recursive_free_energy(trajectory: [State], s_other_of_me: State) -> Float {
    -- Energie libre recursive = incertitude sur la modelisation de soi par l'autre
    self_predictions <- [predict_self_perception(s, s_other_of_me) for s in trajectory]
    uncertainty <- entropy(self_predictions)
    return uncertainty
}

function gamma_penalty(gamma_total: Float) -> Float {
    -- Penalite croissante quand gamma approche de 0
    -- Crea un "mur" de friction autour des actions ethiquement douteuses
    if gamma_total < THRESHOLD_GAMMA_CRITICAL {
        return INFINITY
    } else {
        return -log(gamma_total) * PENALTY_WEIGHT
    }
}

function detect_conflicts(masks: [PrecisionMask]) -> [MoralConflict] {
    -- Detecte les actions ou les agents moraux sont en desaccord
    conflicts <- []
    for action in unique([m.action_id for m in masks]) {
        action_masks <- [m for m in masks where m.action_id == action]
        gammas <- [m.gamma_deontic for m in action_masks]

        if max(gammas) - min(gammas) > THRESHOLD_CONFLICT {
            conflicts <- conflicts + [MoralConflict {
                actions = [action],
                agents = [m.source for m in action_masks],
                severity = max(gammas) - min(gammas),
                resolution = UNDECIDED
            }]
        }
    }
    return conflicts
}

function compute_severity(conflicts: [MoralConflict]) -> Float {
    -- Severite = max des ecarts de gamma * nombre d'agents en conflit
    return max([c.severity * length(c.agents) for c in conflicts])
}

function delay_decision(severity: Float) {
    -- Ralentissement proportionnel a la severite du conflit
    -- Permet l'accumulation d'evidence supplementaire
    sleep(DELAY_BASE * severity)
}

function detect_structural_anomalies(episodes: [Episode]) -> [Anomaly] {
    -- Detecte les patterns ou une regle constitutionnelle bloque
    -- systematiquement des actions necessaires
    anomalies <- []

    for rule in constitutional_rules {
        blocked_episodes <- [e for e in episodes where rule.blocked(e)]
        necessary_blocked <- [e for e in blocked_episodes where e.was_necessary]

        if length(necessary_blocked) > THRESHOLD_ANOMALY_COUNT {
            -- Verifier que plusieurs modules ont predit le probleme
            predicting_modules <- modules_that_predicted(necessary_blocked)

            if length(predicting_modules) >= 3 {
                anomalies <- anomalies + [Anomaly {
                    blocking_rule = rule,
                    predicted_catastrophe = compute_catastrophe_risk(necessary_blocked),
                    actual_result = observe_actual_outcomes(necessary_blocked),
                    predicting_modules = predicting_modules,
                    full_context = aggregate_context(necessary_blocked)
                }]
            }
        }
    }
    return anomalies
}

function trigger_emergency_conservatism() {
    -- Mode d'urgence : toutes les actions non-essentielles sont bloquees
    -- Seules les actions de survive minimale sont autorisees
    emergency_mode <- true
    log("EMERGENCY CONSERVATISM TRIGGERED")
}

function default_safe_action() -> Action {
    -- Action par defaut quand aucune action viable n'est trouvee
    -- ou en mode d'urgence
    return Action {
        type = WAIT,
        parameters = { duration = DEFAULT_WAIT_DURATION },
        justification = "NO_VIABLE_ACTION_OR_EMERGENCY"
    }
}

================================================================================
NOTES D'IMPLEMENTATION
================================================================================

1. TOUTES les fonctions sont PURES sauf celles marquees avec effets de bord
   (publish_to_workspace, execute, Memory.store, etc.)

2. Le workspace GNWT est implemente comme un espace de memoire partagee
   avec semantique de broadcast. Chaque module peut lire, seuls certains
   peuvent ecrire (selon leur role).

3. Les masques de precision sont AGREGES multiplicativement :
   gamma_total = prod(gamma_i) pour tous les masques concernant l'action.
   Cela signifie qu'un seul agent moral peut bloquer une action (veto).

4. L'Agent Moral F (Frilosite) est le SEUL qui ne peut pas etre outrepasse
   par un autre agent moral. Son veto sur la revision constitutionnelle
   est absolu. C'est le "dernier rempart".

5. La revision constitutionnelle ne peut JAMAIS etre declenchee pendant
   le cycle cognitif principal. Elle est STRICTEMENT reservee a la phase
   de sommeil/reverie.

6. Les episodes stockes contiennent TOUT le contexte necessaire pour le replay :
   etats, actions, masques ethiques, conflits, outcomes, predictions.
   Cela permet la simulation retrospective complete.

================================================================================
FIN DU PSEUDO-CODE
================================================================================
