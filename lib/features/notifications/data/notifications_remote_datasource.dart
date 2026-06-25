import 'dart:developer' as dev;

import 'package:ahara/core/network/envelope.dart';
import 'package:ahara/features/notifications/domain/models/notification_item.dart';
import 'package:ahara/features/notifications/domain/models/notification_page.dart';
import 'package:dio/dio.dart';

/// Transport layer for notifications — wraps [Dio] for the notification list,
/// unread count, mark-read, and FCM device-token endpoints.
class NotificationsRemoteDataSource {
  /// Creates a [NotificationsRemoteDataSource].
  const NotificationsRemoteDataSource(this._dio);

  final Dio _dio;

  /// Registers an FCM device token. Calls `POST /notifications/devices/`.
  Future<void> registerDevice({
    required String fcmToken,
    required String platform,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/notifications/devices/',
      data: {'fcm_token': fcmToken, 'platform': platform},
    );
    dev.log('POST /notifications/devices/ → ${response.data}', name: 'API');
    EnvelopeParser.parseSuccess(response.data!, (data) => data);
  }

  /// Unregisters an FCM device token.
  /// Calls `DELETE /notifications/devices/{fcm_token}/`.
  Future<void> unregisterDevice(String fcmToken) async {
    final response = await _dio.delete<Map<String, dynamic>>(
      '/notifications/devices/$fcmToken/',
    );
    dev.log(
      'DELETE /notifications/devices/$fcmToken/ → ${response.data}',
      name: 'API',
    );
    EnvelopeParser.parseSuccess(response.data!, (data) => data);
  }

  /// Fetches a page of notifications. Calls `GET /notifications/`.
  ///
  /// Pass [cursor] (a full `next` URL from a prior page) to load more, or
  /// [unreadOnly] to filter to unread.
  Future<NotificationPage> fetchNotifications({
    String? cursor,
    bool unreadOnly = false,
  }) async {
    final response = cursor != null
        ? await _dio.getUri<Map<String, dynamic>>(Uri.parse(cursor))
        : await _dio.get<Map<String, dynamic>>(
            '/notifications/',
            queryParameters: unreadOnly ? const {'unread': 'true'} : null,
          );
    dev.log('GET /notifications/ → ${response.data}', name: 'API');
    // The list endpoint returns the raw DRF paginated object
    // ({results, next, previous}) — NOT the standard {status, data} envelope.
    // Tolerate both: unwrap `data` only if the envelope is present.
    final body = response.data!;
    final page = body.containsKey('results')
        ? body
        : (body['data'] as Map<String, dynamic>? ?? const {});
    return NotificationPage.fromJson(page);
  }

  /// Fetches the unread count. Calls `GET /notifications/unread-count/`.
  Future<int> fetchUnreadCount() async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/notifications/unread-count/',
    );
    dev.log('GET /notifications/unread-count/ → ${response.data}', name: 'API');
    return EnvelopeParser.parseSuccess(
      response.data!,
      (data) => (data['unread_count'] as num?)?.toInt() ?? 0,
    );
  }

  /// Marks a single notification read. Calls `POST /notifications/{id}/read/`.
  Future<NotificationItem> markRead(int id) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/notifications/$id/read/',
    );
    dev.log('POST /notifications/$id/read/ → ${response.data}', name: 'API');
    return EnvelopeParser.parseSuccess(
      response.data!,
      NotificationItem.fromJson,
    );
  }

  /// Marks all notifications read. Calls `POST /notifications/mark-all-read/`.
  Future<int> markAllRead() async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/notifications/mark-all-read/',
    );
    dev.log('POST /notifications/mark-all-read/ → ${response.data}',
        name: 'API');
    return EnvelopeParser.parseSuccess(
      response.data!,
      (data) => (data['updated'] as num?)?.toInt() ?? 0,
    );
  }
}
