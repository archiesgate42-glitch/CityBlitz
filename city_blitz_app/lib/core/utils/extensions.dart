import 'package:flutter/material.dart';

/// Useful extension methods for BuildContext.
extension BuildContextX on BuildContext {
  /// Shortcut for `Theme.of(context)`.
  ThemeData get theme => Theme.of(this);

  /// Shortcut for `Theme.of(context).colorScheme`.
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Shortcut for `Theme.of(context).textTheme`.
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Shortcut for `MediaQuery.sizeOf(context)`.
  Size get screenSize => MediaQuery.sizeOf(this);

  /// Whether the current screen width is considered "mobile".
  bool get isMobile => screenSize.width < 600;

  /// Whether the current screen width is considered "tablet".
  bool get isTablet => screenSize.width >= 600 && screenSize.width < 1200;

  /// Whether the current screen width is considered "desktop".
  bool get isDesktop => screenSize.width >= 1200;
}

/// String extensions for common formatting tasks.
extension StringX on String {
  /// Capitalize the first letter of the string.
  String get capitalize =>
      isEmpty ? this : '${this[0].toUpperCase()}${substring(1)}';
}
