import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Example provider for the Settings feature.
/// Tracks the selected theme mode.
final themeModeProvider = StateProvider<int>((ref) => 0); // 0=system, 1=light, 2=dark
