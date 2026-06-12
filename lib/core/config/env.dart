import 'dart:io' show Platform;

import 'package:ahara/core/config/flavors.dart';

/// Environment configuration resolved from `--dart-define` values.
///
/// Reads `FLAVOR` and `API_BASE_URL` from compile-time defines.
/// Falls back to sensible dev defaults when defines are absent.
class Env {
  const Env._({required this.flavor, required this.apiBaseUrl});

  /// The active build flavor.
  final Flavor flavor;

  /// The base URL for all API calls.
  final String apiBaseUrl;

  /// Singleton instance resolved from `--dart-define` values.
  static late final Env instance;

  /// Initializes [Env.instance] from compile-time dart-define values.
  ///
  /// Must be called once in `main()` before any providers access it.
  static void initialize() {
    const flavorValue = String.fromEnvironment('FLAVOR');
    const apiBaseUrlValue = String.fromEnvironment('API_BASE_URL');

    final flavor = Flavor.fromString(flavorValue.isEmpty ? null : flavorValue);

    final apiBaseUrl = apiBaseUrlValue.isNotEmpty
        ? apiBaseUrlValue
        : _defaultBaseUrl(flavor);

    instance = Env._(flavor: flavor, apiBaseUrl: apiBaseUrl);
  }

  /// Returns the default API base URL for the given [flavor].
  ///
  /// Per FLUTTER_SPEC.json#api_integration.base_url_config:
  /// - dev (Android emulator): http://10.0.2.2:8000/api/v1
  /// - dev (iOS simulator): http://localhost:8000/api/v1
  /// - staging: TBD
  /// - prod: https://api.nutriplan.app/api/v1
  static String _defaultBaseUrl(Flavor flavor) {
    switch (flavor) {
      case Flavor.dev:
        // Android emulator uses 10.0.2.2 to reach host; iOS uses localhost.
        return Platform.isAndroid
            ? 'http://10.0.2.2:8000/api/v1'
            : 'http://localhost:8000/api/v1';
      case Flavor.staging:
        // TODO(staging): Replace with staging URL when available.
        return 'http://localhost:8000/api/v1';
      case Flavor.prod:
        // TODO(domain): Update when Ahara domain is set up.
        return 'https://api.nutriplan.app/api/v1';
    }
  }
}
