import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Example provider for the Home feature.
/// Tracks whether the dashboard data has been loaded.
final homeDataLoadedProvider = StateProvider<bool>((ref) => false);
