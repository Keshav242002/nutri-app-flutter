/// Environment configuration.
///
/// Single source of truth for the API base URL. To point the app at a
/// different backend (local IP change, staging, production), change
/// [apiBaseUrl] here — it is the only place the URL is defined.
class Env {
  const Env._();

  /// Base URL for all API calls.
  ///
  /// Currently the local dev backend, addressed by the host machine's LAN IP
  /// so it is reachable from emulators, simulators, and physical devices on
  /// the same network. Swap this for the deployed HTTPS URL when shipping.
  static const String apiBaseUrl = 'http://192.168.0.100:8000/api/v1';
}
