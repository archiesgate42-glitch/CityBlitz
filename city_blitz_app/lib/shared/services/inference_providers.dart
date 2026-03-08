import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/hotspot_analysis.dart';
import '../models/impact_prediction.dart';
import '../models/priority_roadmap.dart';
import '../models/vibe_check.dart';
import 'inference_repository.dart';

/// Provides the singleton [InferenceRepository] instance.
final inferenceRepositoryProvider = Provider<InferenceRepository>((ref) {
  return InferenceRepository();
});

/// Loads the Analyst's hotspot analysis from disk.
final hotspotAnalysisProvider = FutureProvider<HotspotAnalysis>((ref) {
  final repo = ref.watch(inferenceRepositoryProvider);
  return repo.loadHotspotAnalysis();
});

/// Loads the Observer's Urban Vitality Report from disk.
final vibeCheckProvider = FutureProvider<VibeCheck>((ref) {
  final repo = ref.watch(inferenceRepositoryProvider);
  return repo.loadVibeCheck();
});

/// Loads the Impact agent's prediction from disk.
final impactPredictionProvider = FutureProvider<ImpactPrediction>((ref) {
  final repo = ref.watch(inferenceRepositoryProvider);
  return repo.loadImpactPrediction();
});

/// Loads the Orchestrator's priority roadmap from disk.
final priorityRoadmapProvider = FutureProvider<PriorityRoadmap>((ref) {
  final repo = ref.watch(inferenceRepositoryProvider);
  return repo.loadPriorityRoadmap();
});
