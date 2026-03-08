// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vibe_check.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VibeCheck _$VibeCheckFromJson(Map<String, dynamic> json) => _VibeCheck(
  timestamp: json['timestamp'] as String,
  agent: json['agent'] as String,
  job: json['job'] as String,
  sourceFile: json['source_file'] as String,
  hotspotsConsidered: (json['hotspots_considered'] as num).toInt(),
  locations:
      (json['locations'] as List<dynamic>?)
          ?.map((e) => VibeLocation.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$VibeCheckToJson(_VibeCheck instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp,
      'agent': instance.agent,
      'job': instance.job,
      'source_file': instance.sourceFile,
      'hotspots_considered': instance.hotspotsConsidered,
      'locations': instance.locations,
    };

_VibeLocation _$VibeLocationFromJson(Map<String, dynamic> json) =>
    _VibeLocation(
      location: json['location'] as String,
      vibeScore: (json['vibe_score'] as num).toDouble(),
      frictionScore: (json['friction_score'] as num).toDouble(),
      priority: json['priority'] as String,
      rawHotspot: json['raw_hotspot'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$VibeLocationToJson(_VibeLocation instance) =>
    <String, dynamic>{
      'location': instance.location,
      'vibe_score': instance.vibeScore,
      'friction_score': instance.frictionScore,
      'priority': instance.priority,
      'raw_hotspot': instance.rawHotspot,
    };
