import 'package:ahara/features/chat/domain/models/chat_message.dart';
import 'package:ahara/features/chat/domain/models/chat_session.dart';

/// Immutable state for the Chat tab.
class ChatState {
  /// Creates a [ChatState].
  const ChatState({
    this.session,
    this.messages = const [],
    this.isSending = false,
    this.rateLimited = false,
    this.sendFailed = false,
  });

  /// The active session, or `null` before the first message is sent.
  final ChatSession? session;

  /// Messages in the active session, oldest-first.
  final List<ChatMessage> messages;

  /// Whether a reply is currently in flight (streaming or awaiting).
  final bool isSending;

  /// Whether the hourly chat limit (429) has been hit.
  final bool rateLimited;

  /// Whether the last send failed (non-rate-limit) — drives inline retry.
  final bool sendFailed;

  /// Returns a copy with the given fields replaced.
  ChatState copyWith({
    ChatSession? session,
    List<ChatMessage>? messages,
    bool? isSending,
    bool? rateLimited,
    bool? sendFailed,
  }) =>
      ChatState(
        session: session ?? this.session,
        messages: messages ?? this.messages,
        isSending: isSending ?? this.isSending,
        rateLimited: rateLimited ?? this.rateLimited,
        sendFailed: sendFailed ?? this.sendFailed,
      );
}
