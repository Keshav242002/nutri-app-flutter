import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_lifecycle_provider.g.dart';

/// Exposes a flag that is set true when the app resumes after ≥ 10 min
/// in background. The root widget observes lifecycle events and calls
/// [trigger] / [clearReset] — this provider only holds the flag.
@riverpod
class AppLifecycle extends _$AppLifecycle {
  @override
  bool build() => false;

  /// Called by the root widget when background duration exceeded the threshold.
  void trigger() => state = true;

  /// Called immediately after navigating to splash, to clear the flag.
  void clearReset() => state = false;
}
