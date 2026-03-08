/// App-wide constants for the CityBlitz application.
class AppConstants {
  AppConstants._();

  // ── App Info ──
  static const String appName = 'CityBlitz';
  static const String appVersion = '0.1.0';
  static const String appDescription =
      'Montgomery Urban Operating System – Red-Zone monitoring & civic intelligence.';

  // ── API ──
  static const String baseApiUrl = 'https://api.cityblitz.dev';
  static const Duration apiTimeout = Duration(seconds: 30);

  // ── UI ──
  static const double borderRadius = 12.0;
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;

  // ── Map defaults (Montgomery, AL) ──
  static const double defaultLatitude = 32.3792;
  static const double defaultLongitude = -86.3077;
  static const double defaultZoom = 12.0;
}
