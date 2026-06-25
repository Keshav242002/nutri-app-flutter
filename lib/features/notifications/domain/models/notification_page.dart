import 'package:ahara/features/notifications/domain/models/notification_item.dart';

/// A page of notifications from the cursor-paginated `GET /notifications/`.
class NotificationPage {
  /// Creates a [NotificationPage].
  const NotificationPage({required this.items, this.next, this.previous});

  /// Builds a page from the envelope `data` object.
  factory NotificationPage.fromJson(Map<String, dynamic> data) {
    final results = (data['results'] as List? ?? const [])
        .cast<Map<String, dynamic>>()
        .map(NotificationItem.fromJson)
        .toList();
    return NotificationPage(
      items: results,
      next: data['next'] as String?,
      previous: data['previous'] as String?,
    );
  }

  /// Notifications in this page (newest first).
  final List<NotificationItem> items;

  /// Cursor URL for the next (older) page, or `null` if none.
  final String? next;

  /// Cursor URL for the previous page, or `null` if none.
  final String? previous;
}
