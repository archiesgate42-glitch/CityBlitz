// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'priority_roadmap.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PriorityRoadmap _$PriorityRoadmapFromJson(Map<String, dynamic> json) =>
    _PriorityRoadmap(
      timestamp: json['timestamp'] as String,
      agent: json['agent'] as String,
      phase: json['phase'] as String,
      status: json['status'] as String,
      redZone:
          json['red_zone'] == null
              ? null
              : RedZone.fromJson(json['red_zone'] as Map<String, dynamic>),
      commandVerdict: json['command_verdict'] as String,
      aps:
          json['aps'] == null
              ? null
              : RoadmapAps.fromJson(json['aps'] as Map<String, dynamic>),
      consensus:
          json['consensus'] == null
              ? null
              : Consensus.fromJson(json['consensus'] as Map<String, dynamic>),
      explainability:
          json['explainability'] == null
              ? null
              : Explainability.fromJson(
                json['explainability'] as Map<String, dynamic>,
              ),
      sourceReports: (json['source_reports'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      cascadeFailure: json['cascade_failure'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$PriorityRoadmapToJson(_PriorityRoadmap instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp,
      'agent': instance.agent,
      'phase': instance.phase,
      'status': instance.status,
      'red_zone': instance.redZone,
      'command_verdict': instance.commandVerdict,
      'aps': instance.aps,
      'consensus': instance.consensus,
      'explainability': instance.explainability,
      'source_reports': instance.sourceReports,
      'cascade_failure': instance.cascadeFailure,
    };

_RedZone _$RedZoneFromJson(Map<String, dynamic> json) => _RedZone(
  location: json['location'] as String,
  vibeScore: (json['vibe_score'] as num?)?.toDouble(),
  frictionScore: (json['friction_score'] as num?)?.toDouble(),
  priority: json['priority'] as String,
);

Map<String, dynamic> _$RedZoneToJson(_RedZone instance) => <String, dynamic>{
  'location': instance.location,
  'vibe_score': instance.vibeScore,
  'friction_score': instance.frictionScore,
  'priority': instance.priority,
};

_RoadmapAps _$RoadmapApsFromJson(Map<String, dynamic> json) => _RoadmapAps(
  frictionVibeRatio: (json['friction_vibe_ratio'] as num?)?.toDouble(),
  temporalWeightApplied: json['temporal_weight_applied'] as bool?,
  temporalWeightRecentMultiplier:
      (json['temporal_weight_recent_multiplier'] as num?)?.toDouble(),
  safetyCallsUnweighted: (json['safety_calls_unweighted'] as num?)?.toInt(),
  safetyCallsWeighted: (json['safety_calls_weighted'] as num?)?.toInt(),
);

Map<String, dynamic> _$RoadmapApsToJson(
  _RoadmapAps instance,
) => <String, dynamic>{
  'friction_vibe_ratio': instance.frictionVibeRatio,
  'temporal_weight_applied': instance.temporalWeightApplied,
  'temporal_weight_recent_multiplier': instance.temporalWeightRecentMultiplier,
  'safety_calls_unweighted': instance.safetyCallsUnweighted,
  'safety_calls_weighted': instance.safetyCallsWeighted,
};

_Consensus _$ConsensusFromJson(Map<String, dynamic> json) => _Consensus(
  votes: (json['votes'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as bool),
  ),
  residentUrgent: json['resident_urgent'] as bool?,
  municipalUrgent: json['municipal_urgent'] as bool?,
  economyUrgent: json['economy_urgent'] as bool?,
  urgentCount: (json['urgent_count'] as num?)?.toInt(),
  promotedToPriorityAlpha: json['promoted_to_priority_alpha'] as bool?,
);

Map<String, dynamic> _$ConsensusToJson(_Consensus instance) =>
    <String, dynamic>{
      'votes': instance.votes,
      'resident_urgent': instance.residentUrgent,
      'municipal_urgent': instance.municipalUrgent,
      'economy_urgent': instance.economyUrgent,
      'urgent_count': instance.urgentCount,
      'promoted_to_priority_alpha': instance.promotedToPriorityAlpha,
    };

_Explainability _$ExplainabilityFromJson(Map<String, dynamic> json) =>
    _Explainability(logTrace: json['log_trace'] as String?);

Map<String, dynamic> _$ExplainabilityToJson(_Explainability instance) =>
    <String, dynamic>{'log_trace': instance.logTrace};
