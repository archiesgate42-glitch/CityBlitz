import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';

import '../models/hotspot_analysis.dart';
import '../models/impact_prediction.dart';
import '../models/priority_roadmap.dart';
import '../models/vibe_check.dart';

/// Read-only repository that loads inference JSON files produced by the
/// Python backend from the `data/inference/` silo.
///
/// This mirrors the Clean-Room architecture: the Flutter app **only reads**
/// from the inference directory and never writes back. On Web, it returns the 
/// demo inference snapshot.
class InferenceRepository {
  InferenceRepository({String? basePath})
      : _basePath = basePath ?? _resolveDefaultBasePath();

  final String _basePath;

  static String _resolveDefaultBasePath() {
    final candidates = [
      '../data/inference', 
      'data/inference', 
      '../../data/inference', 
    ];
    for (final path in candidates) {
      if (kIsWeb) break; // skip directory checks on web
      if (Directory(path).existsSync()) {
        return path;
      }
    }
    return '../data/inference'; 
  }

  Future<Map<String, dynamic>> _readJsonFile(String filename) async {
    if (kIsWeb) {
      if (filename == 'hotspot_analysis.json') {
        return Map<String, dynamic>.from(json.decode(_mockHotspotAnalysis) as Map);
      } else if (filename == 'final_vibe_check.json') {
        return Map<String, dynamic>.from(json.decode(_mockVibeCheck) as Map);
      } else if (filename == 'impact_prediction.json') {
        return Map<String, dynamic>.from(json.decode(_mockImpactPrediction) as Map);
      } else if (filename == 'cityblitz_priority_roadmap.json') {
        return Map<String, dynamic>.from(json.decode(_mockPriorityRoadmap) as Map);
      }
      throw Exception('Mock file not found');
    }

    final file = File('$_basePath/$filename');
    if (!await file.exists()) {
      throw FileSystemException(
        'Inference file not found: $filename',
        file.path,
      );
    }
    final content = await file.readAsString();
    return json.decode(content) as Map<String, dynamic>;
  }

  Future<HotspotAnalysis> loadHotspotAnalysis() async {
    final jsonMap = await _readJsonFile('hotspot_analysis.json');
    return HotspotAnalysis.fromJson(jsonMap);
  }

  Future<VibeCheck> loadVibeCheck() async {
    final jsonMap = await _readJsonFile('final_vibe_check.json');
    return VibeCheck.fromJson(jsonMap);
  }

  Future<ImpactPrediction> loadImpactPrediction() async {
    final jsonMap = await _readJsonFile('impact_prediction.json');
    return ImpactPrediction.fromJson(jsonMap);
  }

  Future<PriorityRoadmap> loadPriorityRoadmap() async {
    final jsonMap = await _readJsonFile('cityblitz_priority_roadmap.json');
    return PriorityRoadmap.fromJson(jsonMap);
  }

  // --- Web Demo Mocks ---
  static const _mockHotspotAnalysis = '''{
    "timestamp": "2026-03-08T01:01:36.601132+00:00",
    "agent": "Analyst",
    "hotspots": [
      { "zip_code": "911_Calls", "friction_score": 0.97, "meta": { "source_file": "911_Calls.csv" } },
      { "zip_code": "Received_311_Service_Request", "friction_score": 1.0, "meta": { "source_file": "Received_311_Service_Request.csv" } },
      { "zip_code": "Business_License", "friction_score": 1.0, "meta": { "source_file": "Business_License.csv" } },
      { "zip_code": "City of Montgomery - Open Data Portal", "friction_score": 1.0, "meta": { "source_file": "City of Montgomery - Open Data Portal.csv" } }
    ]
  }''';

  static const _mockVibeCheck = '''{
    "timestamp": "2026-03-08T01:05:28.122517+00:00",
    "agent": "Observer",
    "job": "Urban Vitality Report",
    "source_file": "hotspot_analysis.json",
    "hotspots_considered": 4,
    "locations": []
  }''';

  static const _mockImpactPrediction = '''{
    "timestamp": "2026-03-08T00:24:46.239684+00:00",
    "agent": "Impact",
    "job": "Phase 3: IMPROVE – Impact Projection",
    "target_location": "911_Calls",
    "priority": "Priority Alpha",
    "friction_score": 0.97,
    "vibe_score": 0.25,
    "aps": { "friction_vibe_ratio": 3.731, "temporal_weight_applied": true, "temporal_weight_recent_multiplier": 2.5, "safety_calls_unweighted": 85, "safety_calls_weighted": 104 },
    "roi_assumptions": { "reduction_range": [0.15, 0.2], "cost_per_call": 800.0, "theory": "Broken Windows – resolving visible disorder reduces 911 non-medical calls." },
    "baseline": { "total_911_calls": 85, "zone_911_calls": 85, "safety_911_calls_in_zone": 104, "zone_share_of_city_calls": 1.2235 },
    "projection": { "projected_calls_avoided_low": 16, "projected_calls_avoided_mid": 18, "projected_calls_avoided_high": 21, "projected_lives_impacted": 18, "estimated_emergency_cost_savings": 14400.0, "vitality_recovery_percent": 42.8 }
  }''';

  static const _mockPriorityRoadmap = '''{
    "timestamp": "2026-03-08T00:20:08.930326+00:00",
    "agent": "Orchestrator",
    "phase": "FINAL",
    "status": "Roadmap successfully generated and promoted.",
    "red_zone": { "location": "911_Calls", "vibe_score": 0.25, "friction_score": 0.97, "priority": "Priority Alpha" },
    "command_verdict": "Priority Alpha triggered by Taro-XI consensus.",
    "explainability": { "log_trace": "Orchestrator validated friction (0.97) against vibe (0.25)." }
  }''';
}
