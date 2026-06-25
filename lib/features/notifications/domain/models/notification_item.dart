/// A single notification returned by `GET /notifications/`.
///
/// Plain immutable model (no freezed — codegen is unavailable on this machine).
/// Maps the backend `NotificationSerializer` shape.
class NotificationItem {
  /// Creates a [NotificationItem].
  const NotificationItem({
    required this.id,
    required this.category,
    required this.title,
    required this.body,
    required this.data,
    required this.createdAt,
    this.readAt,
  });

  /// Builds a [NotificationItem] from the backend JSON shape.
  factory NotificationItem.fromJson(Map<String, dynamic> json) {
    final readAtRaw = json['read_at'] as String?;
    return NotificationItem(
      id: json['id'] as int,
      category: json['category'] as String? ?? '',
      title: json['title'] as String? ?? '',
      body: json['body'] as String? ?? '',
      data: (json['data'] as Map?)?.cast<String, dynamic>() ?? const {},
      createdAt:
          DateTime.tryParse(json['created_at'] as String? ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0),
      readAt: readAtRaw == null ? null : DateTime.tryParse(readAtRaw),
    );
  }

  /// Server primary key.
  final int id;

  /// One of `daily_target` / `goal_updated` / `plan_ready` / `streak`.
  final String category;

  /// Notification headline.
  final String title;

  /// Notification body text.
  final String body;

  /// Free-form payload, including an optional deep-link `route`.
  final Map<String, dynamic> data;

  /// When the notification was created.
  final DateTime createdAt;

  /// When it was read, or `null` if still unread.
  final DateTime? readAt;

  /// Whether this notification has been read.
  bool get isRead => readAt != null;

  /// Optional deep-link route carried in [data].
  String? get route => data['route'] as String?;

  /// Returns a copy with [readAt] set (used for optimistic mark-read).
  NotificationItem copyWith({DateTime? readAt}) => NotificationItem(
    id: id,
    category: category,
    title: title,
    body: body,
    data: data,
    createdAt: createdAt,
    readAt: readAt ?? this.readAt,
  );
}
