import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tracker_sync_provider.g.dart';

/// A monotonically increasing revision counter, bumped after every successful
/// meal-log write (`POST /tracker/log/`) from any screen.
///
/// Screens that display tracker-derived data (the dashboard orbit, the week
/// tab's stats / day chips / per-meal statuses) listen to this and silently
/// refetch when it changes, so a log made on one page is reflected on the
/// other without a manual refresh. It decouples the dashboard and week
/// features — neither imports the other.
@riverpod
class TrackerLogRevision extends _$TrackerLogRevision {
  @override
  int build() => 0;

  /// Signals that a meal log was written; wakes up all listeners.
  void bump() => state = state + 1;
}
