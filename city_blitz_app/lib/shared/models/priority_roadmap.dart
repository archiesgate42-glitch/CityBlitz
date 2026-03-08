import 'package:freezed_annotation/freezed_annotation.dart';

part 'priority_roadmap.freezed.dart';
part 'priority_roadmap.g.dart';

/// Represents the Orchestrator's final output: `data/inference/cityblitz_priority_roadmap.json`
@freezed
abstract class PriorityRoadmap with _$PriorityRoadmap {
  const factory PriorityRoadmap({
    required String timestamp,
    required String agent,
    required String phase,
    required String status,
    @JsonKey(name: 'red_zone') RedZone? redZone,
    @JsonKey(name: 'command_verdict') required String commandVerdict,
    RoadmapAps? aps,
    Consensus? consensus,
    Explainability? explainability,
    @JsonKey(name: 'source_reports') Map<String, String>? sourceReports,
    @JsonKey(name: 'cascade_failure') Map<String, dynamic>? cascadeFailure,
  }) = _PriorityRoadmap;

  factory PriorityRoadmap.fromJson(Map<String, dynamic> json) =>
      _$PriorityRoadmapFromJson(json);
}

/// The #1 Red-Zone identified by the cascade.
@freezed
abstract class RedZone with _$RedZone {
  const factory RedZone({
    required String location,
    @JsonKey(name: 'vibe_score') double? vibeScore,
    @JsonKey(name: 'friction_score') double? frictionScore,
    required String priority,
  }) = _RedZone;

  factory RedZone.fromJson(Map<String, dynamic> json) =>
      _$RedZoneFromJson(json);
}

/// Adaptive Priority System data on the roadmap.
@freezed
abstract class RoadmapAps with _$RoadmapAps {
  const factory RoadmapAps({
    @JsonKey(name: 'friction_vibe_ratio') double? frictionVibeRatio,
    @JsonKey(name: 'temporal_weight_applied') bool? temporalWeightApplied,
    @JsonKey(name: 'temporal_weight_recent_multiplier') double? temporalWeightRecentMultiplier,
    @JsonKey(name: 'safety_calls_unweighted') int? safetyCallsUnweighted,
    @JsonKey(name: 'safety_calls_weighted') int? safetyCallsWeighted,
  }) = _RoadmapAps;

  factory RoadmapAps.fromJson(Map<String, dynamic> json) =>
      _$RoadmapApsFromJson(json);
}

/// Multi-Agent Consensus voting result.
@freezed
abstract class Consensus with _$Consensus {
  const factory Consensus({
    Map<String, bool>? votes,
    @JsonKey(name: 'resident_urgent') bool? residentUrgent,
    @JsonKey(name: 'municipal_urgent') bool? municipalUrgent,
    @JsonKey(name: 'economy_urgent') bool? economyUrgent,
    @JsonKey(name: 'urgent_count') int? urgentCount,
    @JsonKey(name: 'promoted_to_priority_alpha') bool? promotedToPriorityAlpha,
  }) = _Consensus;

  factory Consensus.fromJson(Map<String, dynamic> json) =>
      _$ConsensusFromJson(json);
}

/// Explainability Engine output.
@freezed
abstract class Explainability with _$Explainability {
  const factory Explainability({
    @JsonKey(name: 'log_trace') String? logTrace,
  }) = _Explainability;

  factory Explainability.fromJson(Map<String, dynamic> json) =>
      _$ExplainabilityFromJson(json);
}
