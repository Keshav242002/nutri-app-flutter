import 'package:ahara/core/network/api_exceptions.dart';
import 'package:ahara/core/utils/result.dart';
import 'package:ahara/features/chat/data/chat_remote_datasource.dart';
import 'package:ahara/features/chat/domain/models/chat_message.dart';
import 'package:ahara/features/chat/domain/models/chat_page.dart';
import 'package:ahara/features/chat/domain/models/chat_session.dart';
import 'package:dio/dio.dart';

/// Business-logic boundary for the chat feature.
///
/// All request/response methods return [Result<T>]. The SSE [streamChat] is
/// the one exception — it returns a [Stream] and surfaces only [AppException]s
/// (the datasource maps [DioException]s before they escape).
class ChatRepository {
  /// Creates a [ChatRepository].
  const ChatRepository(this._ds);

  final ChatRemoteDataSource _ds;

  /// Lists chat sessions (newest first). Pass [cursor] to page.
  Future<Result<ChatPage<ChatSession>>> getSessions({String? cursor}) =>
      _wrap(() => _ds.fetchSessions(cursor: cursor));

  /// Creates a new chat session.
  Future<Result<ChatSession>> createSession({String title = ''}) =>
      _wrap(() => _ds.createSession(title: title));

  /// Lists messages in [sessionId] (oldest first). Pass [cursor] to page.
  Future<Result<ChatPage<ChatMessage>>> getMessages(
    int sessionId, {
    String? cursor,
  }) =>
      _wrap(() => _ds.fetchMessages(sessionId, cursor: cursor));

  /// Sends a free-chat message without streaming (fallback path).
  Future<Result<ChatMessage>> sendChat(int sessionId, String content) =>
      _wrap(() => _ds.sendChat(sessionId, content));

  /// Sends an ingredient-mode message; the reply carries inline recipes.
  Future<Result<ChatMessage>> sendIngredient(
    int sessionId,
    String content,
    List<String> ingredients,
  ) =>
      _wrap(() => _ds.sendIngredient(sessionId, content, ingredients));

  /// Streams a free-chat reply. Throws only [AppException] on failure.
  Stream<String> streamChat(int sessionId, String content) =>
      _ds.streamChat(sessionId, content);

  Future<Result<T>> _wrap<T>(Future<T> Function() call) async {
    try {
      return Success(await call());
    } on AppException catch (e) {
      return Failure(e);
    } on DioException catch (e) {
      final err = e.error;
      return Failure(
        err is AppException ? err : UnknownException(message: e.message ?? ''),
      );
    } on Object catch (e) {
      return Failure(UnknownException(message: e.toString()));
    }
  }
}
