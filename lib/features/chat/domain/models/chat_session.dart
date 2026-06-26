/// A chat session — a single conversation thread.
class ChatSession {
  /// Creates a [ChatSession].
  const ChatSession({
    required this.id,
    required this.title,
    this.startedAt,
    this.lastMessageAt,
    this.messageCount = 0,
  });

  /// Builds a [ChatSession] from the API shape.
  factory ChatSession.fromJson(Map<String, dynamic> json) => ChatSession(
        id: (json['id'] as num).toInt(),
        title: json['title'] as String? ?? '',
        startedAt: DateTime.tryParse(json['started_at'] as String? ?? ''),
        lastMessageAt:
            DateTime.tryParse(json['last_message_at'] as String? ?? ''),
        messageCount: (json['message_count'] as num?)?.toInt() ?? 0,
      );

  /// Session primary key.
  final int id;

  /// User-set title (often empty — defaults to a date label in the UI).
  final String title;

  /// When the session was created.
  final DateTime? startedAt;

  /// When the last message was sent.
  final DateTime? lastMessageAt;

  /// Number of messages in the session.
  final int messageCount;
}
