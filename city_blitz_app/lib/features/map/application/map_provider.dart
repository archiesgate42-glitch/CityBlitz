import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Example provider for the Map feature.
/// Tracks the currently selected Red-Zone index.
final selectedRedZoneProvider = StateProvider<int?>((ref) => null);
