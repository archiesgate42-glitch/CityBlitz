import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/services/inference_providers.dart';
import 'consensus_state.dart';

// ── Thresholds (matching Python backend) ──
const double _vibeThreshold = 0.4;
const double _frictionThreshold = 0.7;
const double _roiThreshold = 5000.0;

/// Consensus Notifier – implements the Taro-XI multi-agent democratic
/// decision model from the CityBlitz backend.
///
/// Logic:
/// 1. Load inference data (vibe check, priority roadmap, impact prediction).
/// 2. For the top Red-Zone, each agent votes:
///    - **Resident**: urgent if `vibe_score < 0.4`
///    - **Municipal**: urgent if `friction_score >= 0.7`
///    - **Economy**: urgent if `estimated_emergency_cost_savings >= $5,000`
/// 3. Priority Alpha is promoted when **at least 2 out of 3** agree.
class ConsensusNotifier extends AsyncNotifier<ConsensusState?> {
  @override
  FutureOr<ConsensusState?> build() async {
    return _evaluate();
  }

  /// Re-evaluate consensus (e.g. after data refresh).
  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _evaluate());
  }

  /// Core evaluation logic mirroring `orchestrator._agent_consensus()`.
  Future<ConsensusState?> _evaluate() async {
    // ── 1. Load the priority roadmap to find the Red-Zone ──
    final roadmapAsync = ref.read(priorityRoadmapProvider);
    final roadmap = roadmapAsync.whenOrNull(data: (d) => d);

    // If roadmap hasn't loaded yet, wait for it
    final resolvedRoadmap = roadmap ??
        await ref.read(priorityRoadmapProvider.future);

    final redZone = resolvedRoadmap?.redZone;
    if (redZone == null) {
      // No Red-Zone identified by the cascade — no consensus to compute.
      return null;
    }

    // ── 2. Extract scores from the roadmap's Red-Zone ──
    final vibeScore = redZone.vibeScore ?? 0.5;
    final frictionScore = redZone.frictionScore ?? 0.0;

    // ── 3. Load impact prediction for ROI data ──
    double estimatedRoi = 0.0;
    try {
      final impact = await ref.read(impactPredictionProvider.future);
      estimatedRoi = impact.projection.estimatedEmergencyCostSavings;
    } catch (_) {
      // Impact data may not always be available; default to 0.
    }

    // ── 4. Multi-Agent Voting ──
    final residentUrgent = vibeScore < _vibeThreshold;
    final municipalUrgent = frictionScore >= _frictionThreshold;
    final economyUrgent = estimatedRoi >= _roiThreshold;

    final urgentCount = [residentUrgent, municipalUrgent, economyUrgent]
        .where((v) => v)
        .length;
    final promoted = urgentCount >= 2;

    // ── 5. Determine verdict ──
    final priority = promoted ? 'Priority Alpha' : 'Standard';
    final commandVerdict = promoted
        ? 'Immediate Infrastructure Intervention Required'
        : 'Targeted Improvements Recommended (Monitor and phase interventions).';

    return ConsensusState(
      location: redZone.location,
      vibeScore: vibeScore,
      frictionScore: frictionScore,
      estimatedRoi: estimatedRoi,
      residentUrgent: residentUrgent,
      municipalUrgent: municipalUrgent,
      economyUrgent: economyUrgent,
      urgentCount: urgentCount,
      promotedToPriorityAlpha: promoted,
      priority: priority,
      commandVerdict: commandVerdict,
    );
  }
}

/// Provider for the consensus notifier.
final consensusProvider =
    AsyncNotifierProvider<ConsensusNotifier, ConsensusState?>(
  ConsensusNotifier.new,
);
