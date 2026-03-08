import 'package:freezed_annotation/freezed_annotation.dart';

part 'impact_prediction.freezed.dart';
part 'impact_prediction.g.dart';

/// Represents the output of the Impact agent: `data/inference/impact_prediction.json`
@freezed
abstract class ImpactPrediction with _$ImpactPrediction {
  const factory ImpactPrediction({
    required String timestamp,
    required String agent,
    required String job,
    @JsonKey(name: 'target_location') required String targetLocation,
    required String priority,
    @JsonKey(name: 'friction_score') required double frictionScore,
    @JsonKey(name: 'vibe_score') required double vibeScore,
    required ImpactAps aps,
    @JsonKey(name: 'roi_assumptions') required RoiAssumptions roiAssumptions,
    required ImpactBaseline baseline,
    required ImpactProjection projection,
  }) = _ImpactPrediction;

  factory ImpactPrediction.fromJson(Map<String, dynamic> json) =>
      _$ImpactPredictionFromJson(json);
}

/// Adaptive Priority System metrics.
@freezed
abstract class ImpactAps with _$ImpactAps {
  const factory ImpactAps({
    @JsonKey(name: 'friction_vibe_ratio') required double frictionVibeRatio,
    @JsonKey(name: 'temporal_weight_applied') required bool temporalWeightApplied,
    @JsonKey(name: 'temporal_weight_recent_multiplier') required double temporalWeightRecentMultiplier,
    @JsonKey(name: 'safety_calls_unweighted') required int safetyCallsUnweighted,
    @JsonKey(name: 'safety_calls_weighted') required int safetyCallsWeighted,
  }) = _ImpactAps;

  factory ImpactAps.fromJson(Map<String, dynamic> json) =>
      _$ImpactApsFromJson(json);
}

/// ROI assumptions used by the Impact agent.
@freezed
abstract class RoiAssumptions with _$RoiAssumptions {
  const factory RoiAssumptions({
    @JsonKey(name: 'reduction_range') required List<double> reductionRange,
    @JsonKey(name: 'cost_per_call') required double costPerCall,
    required String theory,
  }) = _RoiAssumptions;

  factory RoiAssumptions.fromJson(Map<String, dynamic> json) =>
      _$RoiAssumptionsFromJson(json);
}

/// Baseline emergency call data for the target zone.
@freezed
abstract class ImpactBaseline with _$ImpactBaseline {
  const factory ImpactBaseline({
    @JsonKey(name: 'total_911_calls') required int total911Calls,
    @JsonKey(name: 'zone_911_calls') required int zone911Calls,
    @JsonKey(name: 'safety_911_calls_in_zone') required int safety911CallsInZone,
    @JsonKey(name: 'zone_share_of_city_calls') required double zoneShareOfCityCalls,
  }) = _ImpactBaseline;

  factory ImpactBaseline.fromJson(Map<String, dynamic> json) =>
      _$ImpactBaselineFromJson(json);
}

/// Projected impact of intervention.
@freezed
abstract class ImpactProjection with _$ImpactProjection {
  const factory ImpactProjection({
    @JsonKey(name: 'projected_calls_avoided_low') required int projectedCallsAvoidedLow,
    @JsonKey(name: 'projected_calls_avoided_mid') required int projectedCallsAvoidedMid,
    @JsonKey(name: 'projected_calls_avoided_high') required int projectedCallsAvoidedHigh,
    @JsonKey(name: 'projected_lives_impacted') required int projectedLivesImpacted,
    @JsonKey(name: 'estimated_emergency_cost_savings') required double estimatedEmergencyCostSavings,
    @JsonKey(name: 'vitality_recovery_percent') required double vitalityRecoveryPercent,
  }) = _ImpactProjection;

  factory ImpactProjection.fromJson(Map<String, dynamic> json) =>
      _$ImpactProjectionFromJson(json);
}
