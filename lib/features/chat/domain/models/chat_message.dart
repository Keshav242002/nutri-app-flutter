import 'package:ahara/features/chat/domain/models/chat_recipe.dart';

/// Author of a chat message.
enum ChatRole {
  /// The signed-in user.
  user,

  /// The AI assistant.
  assistant,

  /// System message (rare).
  system;

  /// Parses the backend `role` string, defaulting to [assistant].
  static ChatRole fromString(String? raw) => switch (raw) {
        'user' => ChatRole.user,
        'system' => ChatRole.system,
        _ => ChatRole.assistant,
      };
}

/// A single chat message in a session.
///
/// `metadata.recipes[]` (ingredient mode) is surfaced as [recipes]; the
/// in-flight streaming bubble is represented with [isStreaming].
class ChatMessage {
  /// Creates a [ChatMessage].
  const ChatMessage({
    required this.id,
    required this.role,
    required this.content,
    this.recipes = const [],
    this.createdAt,
    this.isStreaming = false,
  });

  /// Builds a [ChatMessage] from the API message shape.
  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    final metadata = json['metadata'];
    final recipes = <ChatRecipe>[];
    if (metadata is Map<String, dynamic>) {
      final raw = metadata['recipes'];
      if (raw is List) {
        for (final r in raw) {
          if (r is Map<String, dynamic>) recipes.add(ChatRecipe.fromJson(r));
        }
      }
    }
    return ChatMessage(
      id: (json['id'] as num).toInt(),
      role: ChatRole.fromString(json['role'] as String?),
      content: json['content'] as String? ?? '',
      recipes: recipes,
      createdAt: DateTime.tryParse(json['created_at'] as String? ?? ''),
    );
  }

  /// Server id, or a transient negative id for an optimistic/streaming bubble.
  final int id;

  /// Message author.
  final ChatRole role;

  /// Message text (markdown-lite for assistant replies).
  final String content;

  /// Inline recipe cards parsed from `metadata.recipes[]`.
  final List<ChatRecipe> recipes;

  /// Creation timestamp, if known.
  final DateTime? createdAt;

  /// Whether this bubble is the live, growing SSE reply.
  final bool isStreaming;

  /// Returns a copy with the given fields replaced.
  ChatMessage copyWith({
    String? content,
    List<ChatRecipe>? recipes,
    bool? isStreaming,
  }) =>
      ChatMessage(
        id: id,
        role: role,
        content: content ?? this.content,
        recipes: recipes ?? this.recipes,
        createdAt: createdAt,
        isStreaming: isStreaming ?? this.isStreaming,
      );
}
