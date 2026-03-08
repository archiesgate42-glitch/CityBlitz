import 'package:freezed_annotation/freezed_annotation.dart';

part 'hotspot_analysis.freezed.dart';
part 'hotspot_analysis.g.dart';

/// Represents the output of the Analyst agent: `data/inference/hotspot_analysis.json`
@freezed
abstract class HotspotAnalysis with _$HotspotAnalysis {
  const factory HotspotAnalysis({
    required String timestamp,
    required String agent,
    @Default([]) List<Hotspot> hotspots,
  }) = _HotspotAnalysis;

  factory HotspotAnalysis.fromJson(Map<String, dynamic> json) =>
      _$HotspotAnalysisFromJson(json);
}

/// A single hotspot detected by the Analyst agent.
@freezed
abstract class Hotspot with _$Hotspot {
  const factory Hotspot({
    @JsonKey(name: 'zip_code') required String zipCode,
    @JsonKey(name: 'friction_score') required double frictionScore,
    HotspotMeta? meta,
  }) = _Hotspot;

  factory Hotspot.fromJson(Map<String, dynamic> json) =>
      _$HotspotFromJson(json);
}

/// Metadata attached to a hotspot entry.
@freezed
abstract class HotspotMeta with _$HotspotMeta {
  const factory HotspotMeta({
    @JsonKey(name: 'source_file') String? sourceFile,
  }) = _HotspotMeta;

  factory HotspotMeta.fromJson(Map<String, dynamic> json) =>
      _$HotspotMetaFromJson(json);
}
