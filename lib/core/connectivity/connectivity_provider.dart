import 'dart:developer' as dev;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Exposes the platform [Connectivity] instance for testing/overrides.
final connectivityProvider = Provider<Connectivity>((ref) => Connectivity());

/// Streams `true` when the device has at least one active network interface,
/// `false` when fully offline.
///
/// Note: this reflects interface availability, not reachability of our API —
/// the repositories still fall back to cache on any network error, so a
/// "connected but no real internet" state degrades gracefully.
final connectivityStatusProvider = StreamProvider<bool>((ref) async* {
  final connectivity = ref.watch(connectivityProvider);

  bool isOnline(List<ConnectivityResult> results) =>
      results.any((r) => r != ConnectivityResult.none);

  // Emit the current state first, then every subsequent change.
  yield isOnline(await connectivity.checkConnectivity());
  yield* connectivity.onConnectivityChanged.map(isOnline);
});

/// A monotonically increasing revision bumped each time connectivity is
/// restored (offline → online transition).
///
/// Controllers `ref.listen` this and silently refetch their data, so the app
/// refreshes from the network as soon as the connection comes back. Mirrors
/// the existing `trackerLogRevisionProvider` / `mealPlanRevisionProvider`
/// decoupling pattern.
class OnlineRefreshNotifier extends Notifier<int> {
  bool? _wasOnline;

  @override
  int build() {
    ref.listen<AsyncValue<bool>>(connectivityStatusProvider, (_, next) {
      final online = next.value;
      if (online == null) return;
      // Bump only on a genuine offline → online transition.
      if (_wasOnline == false && online) {
        dev.log('connectivity restored → bumping refresh revision',
            name: 'NET');
        state = state + 1;
      }
      _wasOnline = online;
    });
    return 0;
  }
}

/// Revision counter that increments when connectivity is restored.
final onlineRefreshProvider =
    NotifierProvider<OnlineRefreshNotifier, int>(OnlineRefreshNotifier.new);
