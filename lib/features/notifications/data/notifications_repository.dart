import 'package:ahara/core/network/api_exceptions.dart';
import 'package:ahara/core/utils/result.dart';
import 'package:ahara/features/notifications/data/notifications_remote_datasource.dart';
import 'package:ahara/features/notifications/domain/models/notification_item.dart';
import 'package:ahara/features/notifications/domain/models/notification_page.dart';
import 'package:dio/dio.dart';

/// Business-logic boundary for notifications.
///
/// All methods return [Result<T>] — no raw exceptions escape this layer.
class NotificationsRepository {
  /// Creates a [NotificationsRepository].
  const NotificationsRepository(this._ds);

  final NotificationsRemoteDataSource _ds;

  /// Registers the device's FCM token with the backend.
  Future<Result<void>> registerDevice({
    required String fcmToken,
    required String platform,
  }) => _wrap(() => _ds.registerDevice(fcmToken: fcmToken, platform: platform));

  /// Removes the device's FCM token from the backend.
  Future<Result<void>> unregisterDevice(String fcmToken) =>
      _wrap(() => _ds.unregisterDevice(fcmToken));

  /// Fetches a page of notifications.
  Future<Result<NotificationPage>> getNotifications({
    String? cursor,
    bool unreadOnly = false,
  }) => _wrap(
    () => _ds.fetchNotifications(cursor: cursor, unreadOnly: unreadOnly),
  );

  /// Fetches the unread count for the bell badge.
  Future<Result<int>> getUnreadCount() => _wrap(_ds.fetchUnreadCount);

  /// Marks a single notification read.
  Future<Result<NotificationItem>> markRead(int id) =>
      _wrap(() => _ds.markRead(id));

  /// Marks all notifications read.
  Future<Result<int>> markAllRead() => _wrap(_ds.markAllRead);

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
