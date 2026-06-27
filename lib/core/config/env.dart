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
  static const String apiBaseUrl = 'http://localhost:8000/api/v1';

  /// Resolves a media URL returned by the backend so it is reachable from the
  /// current runtime environment.
  ///
  /// During local development the Django server returns absolute URLs that
  /// contain `127.0.0.1`. On the iOS Simulator `127.0.0.1` resolves to the
  /// simulator itself — **not** the host Mac — so images fail to load.
  /// Replacing it with `localhost` fixes this because on the simulator
  /// `localhost` is forwarded to the host machine by the networking stack.
  ///
  /// When [url] is null or empty, null is returned so callers can fall back
  /// to a placeholder image gracefully.
  static String? resolveMediaUrl(String? url) {
    if (url == null || url.isEmpty) return null;
    return url.replaceFirst('http://127.0.0.1:', 'http://localhost:');
  }
}
