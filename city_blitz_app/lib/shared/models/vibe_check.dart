import 'package:freezed_annotation/freezed_annotation.dart';

part 'vibe_check.freezed.dart';
part 'vibe_check.g.dart';

/// Represents the output of the Observer agent: `data/inference/final_vibe_check.json`
@freezed
abstract class VibeCheck with _$VibeCheck {
  const factory VibeCheck({
    required String timestamp,
    required String agent,
    required String job,
    @JsonKey(name: 'source_file') required String sourceFile,
    @JsonKey(name: 'hotspots_considered') required int hotspotsConsidered,
    @Default([]) List<VibeLocation> locations,
  }) = _VibeCheck;

  factory VibeCheck.fromJson(Map<String, dynamic> json) =>
      _$VibeCheckFromJson(json);
}

/// A location entry within the Urban Vitality Report.
@freezed
abstract class VibeLocation with _$VibeLocation {
  const factory VibeLocation({
    required String location,
    @JsonKey(name: 'vibe_score') required double vibeScore,
    @JsonKey(name: 'friction_score') required double frictionScore,
    required String priority,
    @JsonKey(name: 'raw_hotspot') Map<String, dynamic>? rawHotspot,
  }) = _VibeLocation;

  factory VibeLocation.fromJson(Map<String, dynamic> json) =>
      _$VibeLocationFromJson(json);
}
