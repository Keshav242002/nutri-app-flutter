import 'dart:async';

import 'package:ahara/core/network/api_exceptions.dart';
import 'package:ahara/core/providers/toast_provider.dart';
import 'package:ahara/core/utils/result.dart';
import 'package:ahara/features/chat/domain/models/chat_message.dart';
import 'package:ahara/features/chat/domain/models/chat_session.dart';
import 'package:ahara/features/chat/domain/models/chat_state.dart';
import 'package:ahara/features/chat/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_controller.g.dart';

/// Manages state for the Chat tab.
///
/// On build: loads the newest session (if any) and its messages. The session
/// is created lazily on the first send. Free chat streams via SSE; ingredient
/// mode is a single request returning inline recipes.
@riverpod
class ChatController extends _$ChatController {
  int _tempIdSeq = -1;
  String? _lastUserText;

  int _nextTempId() => _tempIdSeq--;

  @override
  Future<ChatState> build() async {
    final repo = ref.read(chatRepositoryProvider);
    final sessionsResult = await repo.getSessions();
    switch (sessionsResult) {
      case Failure(:final exception):
        ref.read(toastProvider.notifier).show(exception.message);
        return const ChatState();
      case Success(:final data):
        if (data.items.isEmpty) return const ChatState();
        final session = data.items.first;
        final msgResult = await repo.getMessages(session.id);
        final messages = switch (msgResult) {
          Success(:final data) => data.items,
          Failure() => <ChatMessage>[],
        };
        return ChatState(session: session, messages: messages);
    }
  }

  ChatState get _state => state.value ?? const ChatState();

  /// Sends a free-chat message and streams the reply.
  Future<void> sendChat(String content) async {
    final text = content.trim();
    if (text.isEmpty || _state.isSending) return;

    final session = await _ensureSession();
    if (session == null) return;

    final userMsg = ChatMessage(
      id: _nextTempId(),
      role: ChatRole.user,
      content: text,
    );
    state = AsyncData(
      _state.copyWith(
        session: session,
        messages: [..._state.messages, userMsg],
        rateLimited: false,
        sendFailed: false,
      ),
    );
    _lastUserText = text;
    await _streamReply(session.id, text);
  }

  /// Re-sends the last user message after a failure (no new user bubble).
  Future<void> retryLast() async {
    final text = _lastUserText;
    final session = _state.session;
    if (text == null || session == null || _state.isSending) return;
    state = AsyncData(_state.copyWith(sendFailed: false));
    await _streamReply(session.id, text);
  }

  Future<void> _streamReply(int sessionId, String text) async {
    final streamId = _nextTempId();
    final streaming = ChatMessage(
      id: streamId,
      role: ChatRole.assistant,
      content: '',
      isStreaming: true,
    );
    state = AsyncData(
      _state.copyWith(
        messages: [..._state.messages, streaming],
        isSending: true,
      ),
    );

    final buffer = StringBuffer();
    try {
      await for (final chunk
          in ref.read(chatRepositoryProvider).streamChat(sessionId, text)) {
        buffer.write(chunk);
        final text = buffer.toString();
        _replaceMessage(streamId, (m) => m.copyWith(content: text));
      }
      _replaceMessage(streamId, (m) => m.copyWith(isStreaming: false));
      state = AsyncData(_state.copyWith(isSending: false));
    } on RateLimitException {
      _removeMessage(streamId);
      state = AsyncData(_state.copyWith(isSending: false, rateLimited: true));
    } on AppException {
      _removeMessage(streamId);
      state = AsyncData(_state.copyWith(isSending: false, sendFailed: true));
    }
  }

  /// Sends an ingredient-mode message; the reply carries inline recipes.
  Future<void> sendIngredient(
    String content,
    List<String> ingredients,
  ) async {
    if (ingredients.isEmpty || _state.isSending) return;

    final session = await _ensureSession();
    if (session == null) return;

    final question = content.trim();
    // The backend requires non-empty `content` (min_length 1), so fall back to
    // a generated prompt when the user only supplied ingredients.
    final fallback = 'What can I make with ${ingredients.join(', ')}?';
    final sentContent = question.isEmpty ? fallback : question;
    final summary = question.isEmpty
        ? fallback
        : '$question\n(${ingredients.join(', ')})';
    final userMsg = ChatMessage(
      id: _nextTempId(),
      role: ChatRole.user,
      content: summary,
    );
    // A streaming placeholder renders the typing dots while the (non-streamed)
    // ingredient request is in flight.
    final thinkingId = _nextTempId();
    final thinking = ChatMessage(
      id: thinkingId,
      role: ChatRole.assistant,
      content: '',
      isStreaming: true,
    );
    state = AsyncData(
      _state.copyWith(
        session: session,
        messages: [..._state.messages, userMsg, thinking],
        isSending: true,
        rateLimited: false,
        sendFailed: false,
      ),
    );

    final result = await ref
        .read(chatRepositoryProvider)
        .sendIngredient(session.id, sentContent, ingredients);
    _removeMessage(thinkingId);
    result.when(
      success: (reply) {
        state = AsyncData(
          _state.copyWith(
            messages: [..._state.messages, reply],
            isSending: false,
          ),
        );
      },
      failure: (e) {
        if (e is RateLimitException) {
          state = AsyncData(
            _state.copyWith(isSending: false, rateLimited: true),
          );
        } else {
          state = AsyncData(_state.copyWith(isSending: false));
          ref.read(toastProvider.notifier).show(e.message);
        }
      },
    );
  }

  /// Loads an existing session into the thread.
  Future<void> openSession(ChatSession session) async {
    state = const AsyncLoading();
    final msgResult =
        await ref.read(chatRepositoryProvider).getMessages(session.id);
    final messages = msgResult.when(
      success: (m) => m.items,
      failure: (_) => <ChatMessage>[],
    );
    state = AsyncData(ChatState(session: session, messages: messages));
  }

  /// Starts a fresh, empty session.
  Future<void> startNewSession() async {
    final result = await ref.read(chatRepositoryProvider).createSession();
    result.when(
      success: (session) =>
          state = AsyncData(ChatState(session: session)),
      failure: (e) => ref.read(toastProvider.notifier).show(e.message),
    );
  }

  /// Returns the active session, creating one on first use.
  Future<ChatSession?> _ensureSession() async {
    final existing = _state.session;
    if (existing != null) return existing;
    final result = await ref.read(chatRepositoryProvider).createSession();
    return result.when(
      success: (session) => session,
      failure: (e) {
        ref.read(toastProvider.notifier).show(e.message);
        return null;
      },
    );
  }

  void _replaceMessage(int id, ChatMessage Function(ChatMessage) update) {
    final messages = [
      for (final m in _state.messages) m.id == id ? update(m) : m,
    ];
    state = AsyncData(_state.copyWith(messages: messages));
  }

  void _removeMessage(int id) {
    final messages = _state.messages.where((m) => m.id != id).toList();
    state = AsyncData(_state.copyWith(messages: messages));
  }
}
