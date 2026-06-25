import 'dart:async';

import 'package:ahara/core/notifications/push_messaging_service.dart';
import 'package:ahara/core/utils/result.dart';
import 'package:ahara/features/notifications/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'unread_count_controller.g.dart';

/// Unread-notification count for the home-appbar bell badge.
///
/// Refreshes itself whenever a push arrives or a notification is tapped
/// (via [PushMessagingService.onNotificationChange]). Kept alive so the badge
/// stays warm across navigation.
@Riverpod(keepAlive: true)
class UnreadCountController extends _$UnreadCountController {
  @override
  Future<int> build() async {
    final service = ref.read(pushMessagingServiceProvider);
    final sub = service.onNotificationChange.listen((_) => refresh());
    ref.onDispose(sub.cancel);
    return _fetch();
  }

  Future<int> _fetch() async {
    final result = await ref
        .read(notificationsRepositoryProvider)
        .getUnreadCount();
    return switch (result) {
      Success<int>(:final data) => data,
      Failure<int>() => 0,
    };
  }

  /// Refetches the unread count from the backend.
  Future<void> refresh() async => state = AsyncData(await _fetch());

  /// Locally decrements the badge (after marking one read).
  void decrement([int by = 1]) {
    final current = state.value ?? 0;
    final next = current - by;
    state = AsyncData(next < 0 ? 0 : next);
  }

  /// Locally clears the badge (after mark-all-read).
  void clear() => state = const AsyncData(0);
}
