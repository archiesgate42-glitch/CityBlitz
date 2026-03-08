import 'package:freezed_annotation/freezed_annotation.dart';

part 'consensus_state.freezed.dart';

/// Represents the result of the multi-agent consensus vote.
///
/// Three internal logic-paths vote on urgency:
/// - **Resident Agent**: Vibe < 0.4 → urgent
/// - **Municipal Agent**: Friction >= 0.7 → urgent
/// - **Economy Agent**: Safety ROI >= $5,000 → urgent
///
/// Priority Alpha is granted when at least 2 out of 3 paths agree.
@freezed
abstract class ConsensusState with _$ConsensusState {
  const ConsensusState._();

  const factory ConsensusState({
    /// The location being evaluated.
    required String location,

    // ── Input scores ──
    required double vibeScore,
    required double frictionScore,
    required double estimatedRoi,

    // ── Individual agent votes ──
    required bool residentUrgent,
    required bool municipalUrgent,
    required bool economyUrgent,

    // ── Consensus result ──
    required int urgentCount,
    required bool promotedToPriorityAlpha,

    /// The final priority label: "Priority Alpha" or "Standard".
    required String priority,

    /// Command verdict for the dashboard.
    required String commandVerdict,
  }) = _ConsensusState;

  /// Friction-to-Vibe Ratio (APS metric). Higher = more urgency.
  double get frictionVibeRatio => frictionScore / (vibeScore + 0.01);

  /// Human-readable votes summary for UI display.
  Map<String, bool> get votes => {
        'Resident': residentUrgent,
        'Municipal': municipalUrgent,
        'Economy': economyUrgent,
      };
}
