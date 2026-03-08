// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotspot_analysis.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HotspotAnalysis _$HotspotAnalysisFromJson(Map<String, dynamic> json) =>
    _HotspotAnalysis(
      timestamp: json['timestamp'] as String,
      agent: json['agent'] as String,
      hotspots:
          (json['hotspots'] as List<dynamic>?)
              ?.map((e) => Hotspot.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$HotspotAnalysisToJson(_HotspotAnalysis instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp,
      'agent': instance.agent,
      'hotspots': instance.hotspots,
    };

_Hotspot _$HotspotFromJson(Map<String, dynamic> json) => _Hotspot(
  zipCode: json['zip_code'] as String,
  frictionScore: (json['friction_score'] as num).toDouble(),
  meta:
      json['meta'] == null
          ? null
          : HotspotMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$HotspotToJson(_Hotspot instance) => <String, dynamic>{
  'zip_code': instance.zipCode,
  'friction_score': instance.frictionScore,
  'meta': instance.meta,
};

_HotspotMeta _$HotspotMetaFromJson(Map<String, dynamic> json) =>
    _HotspotMeta(sourceFile: json['source_file'] as String?);

Map<String, dynamic> _$HotspotMetaToJson(_HotspotMeta instance) =>
    <String, dynamic>{'source_file': instance.sourceFile};
