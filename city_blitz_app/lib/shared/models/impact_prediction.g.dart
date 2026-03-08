// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'impact_prediction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ImpactPrediction _$ImpactPredictionFromJson(Map<String, dynamic> json) =>
    _ImpactPrediction(
      timestamp: json['timestamp'] as String,
      agent: json['agent'] as String,
      job: json['job'] as String,
      targetLocation: json['target_location'] as String,
      priority: json['priority'] as String,
      frictionScore: (json['friction_score'] as num).toDouble(),
      vibeScore: (json['vibe_score'] as num).toDouble(),
      aps: ImpactAps.fromJson(json['aps'] as Map<String, dynamic>),
      roiAssumptions: RoiAssumptions.fromJson(
        json['roi_assumptions'] as Map<String, dynamic>,
      ),
      baseline: ImpactBaseline.fromJson(
        json['baseline'] as Map<String, dynamic>,
      ),
      projection: ImpactProjection.fromJson(
        json['projection'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$ImpactPredictionToJson(_ImpactPrediction instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp,
      'agent': instance.agent,
      'job': instance.job,
      'target_location': instance.targetLocation,
      'priority': instance.priority,
      'friction_score': instance.frictionScore,
      'vibe_score': instance.vibeScore,
      'aps': instance.aps,
      'roi_assumptions': instance.roiAssumptions,
      'baseline': instance.baseline,
      'projection': instance.projection,
    };

_ImpactAps _$ImpactApsFromJson(Map<String, dynamic> json) => _ImpactAps(
  frictionVibeRatio: (json['friction_vibe_ratio'] as num).toDouble(),
  temporalWeightApplied: json['temporal_weight_applied'] as bool,
  temporalWeightRecentMultiplier:
      (json['temporal_weight_recent_multiplier'] as num).toDouble(),
  safetyCallsUnweighted: (json['safety_calls_unweighted'] as num).toInt(),
  safetyCallsWeighted: (json['safety_calls_weighted'] as num).toInt(),
);

Map<String, dynamic> _$ImpactApsToJson(
  _ImpactAps instance,
) => <String, dynamic>{
  'friction_vibe_ratio': instance.frictionVibeRatio,
  'temporal_weight_applied': instance.temporalWeightApplied,
  'temporal_weight_recent_multiplier': instance.temporalWeightRecentMultiplier,
  'safety_calls_unweighted': instance.safetyCallsUnweighted,
  'safety_calls_weighted': instance.safetyCallsWeighted,
};

_RoiAssumptions _$RoiAssumptionsFromJson(Map<String, dynamic> json) =>
    _RoiAssumptions(
      reductionRange:
          (json['reduction_range'] as List<dynamic>)
              .map((e) => (e as num).toDouble())
              .toList(),
      costPerCall: (json['cost_per_call'] as num).toDouble(),
      theory: json['theory'] as String,
    );

Map<String, dynamic> _$RoiAssumptionsToJson(_RoiAssumptions instance) =>
    <String, dynamic>{
      'reduction_range': instance.reductionRange,
      'cost_per_call': instance.costPerCall,
      'theory': instance.theory,
    };

_ImpactBaseline _$ImpactBaselineFromJson(Map<String, dynamic> json) =>
    _ImpactBaseline(
      total911Calls: (json['total_911_calls'] as num).toInt(),
      zone911Calls: (json['zone_911_calls'] as num).toInt(),
      safety911CallsInZone: (json['safety_911_calls_in_zone'] as num).toInt(),
      zoneShareOfCityCalls:
          (json['zone_share_of_city_calls'] as num).toDouble(),
    );

Map<String, dynamic> _$ImpactBaselineToJson(_ImpactBaseline instance) =>
    <String, dynamic>{
      'total_911_calls': instance.total911Calls,
      'zone_911_calls': instance.zone911Calls,
      'safety_911_calls_in_zone': instance.safety911CallsInZone,
      'zone_share_of_city_calls': instance.zoneShareOfCityCalls,
    };

_ImpactProjection _$ImpactProjectionFromJson(Map<String, dynamic> json) =>
    _ImpactProjection(
      projectedCallsAvoidedLow:
          (json['projected_calls_avoided_low'] as num).toInt(),
      projectedCallsAvoidedMid:
          (json['projected_calls_avoided_mid'] as num).toInt(),
      projectedCallsAvoidedHigh:
          (json['projected_calls_avoided_high'] as num).toInt(),
      projectedLivesImpacted: (json['projected_lives_impacted'] as num).toInt(),
      estimatedEmergencyCostSavings:
          (json['estimated_emergency_cost_savings'] as num).toDouble(),
      vitalityRecoveryPercent:
          (json['vitality_recovery_percent'] as num).toDouble(),
    );

Map<String, dynamic> _$ImpactProjectionToJson(
  _ImpactProjection instance,
) => <String, dynamic>{
  'projected_calls_avoided_low': instance.projectedCallsAvoidedLow,
  'projected_calls_avoided_mid': instance.projectedCallsAvoidedMid,
  'projected_calls_avoided_high': instance.projectedCallsAvoidedHigh,
  'projected_lives_impacted': instance.projectedLivesImpacted,
  'estimated_emergency_cost_savings': instance.estimatedEmergencyCostSavings,
  'vitality_recovery_percent': instance.vitalityRecoveryPercent,
};
