import 'dart:async';

import 'package:ahara/core/utils/result.dart';
import 'package:ahara/features/notifications/domain/models/notification_item.dart';
import 'package:ahara/features/notifications/presentation/controllers/unread_count_controller.dart';
import 'package:ahara/features/notifications/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notifications_list_controller.g.dart';

/// Loads and mutates the notification feed shown from the home bell.
@riverpod
class NotificationsListController extends _$NotificationsListController {
  String? _next;

  @override
  Future<List<NotificationItem>> build() async {
    // Opening the list is a good moment to sync the badge.
    unawaited(ref.read(unreadCountControllerProvider.notifier).refresh());
    return _loadFirst();
  }

  Future<List<NotificationItem>> _loadFirst() async {
    final result = await ref
        .read(notificationsRepositoryProvider)
        .getNotifications();
    switch (result) {
      case Success(:final data):
        _next = data.next;
        return data.items;
      case Failure(:final exception):
        throw exception;
    }
  }

  /// Loads the next (older) page and appends it.
  Future<void> loadMore() async {
    final cursor = _next;
    if (cursor == null) return;
    final result = await ref
        .read(notificationsRepositoryProvider)
        .getNotifications(cursor: cursor);
    if (result case Success(:final data)) {
      _next = data.next;
      state = AsyncData([...?state.value, ...data.items]);
    }
  }

  /// Marks one notification read (optimistic) and syncs the badge.
  Future<void> markRead(int id) async {
    final result = await ref
        .read(notificationsRepositoryProvider)
        .markRead(id);
    if (result.isSuccess) {
      final now = DateTime.now();
      state = AsyncData([
        for (final n in state.value ?? <NotificationItem>[])
          if (n.id == id && !n.isRead) n.copyWith(readAt: now) else n,
      ]);
      ref.read(unreadCountControllerProvider.notifier).decrement();
    }
  }

  /// Marks every notification read (optimistic) and clears the badge.
  Future<void> markAllRead() async {
    final result = await ref
        .read(notificationsRepositoryProvider)
        .markAllRead();
    if (result.isSuccess) {
      final now = DateTime.now();
      state = AsyncData([
        for (final n in state.value ?? <NotificationItem>[])
          if (n.isRead) n else n.copyWith(readAt: now),
      ]);
      ref.read(unreadCountControllerProvider.notifier).clear();
    }
  }
}
