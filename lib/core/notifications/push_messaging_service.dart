import 'dart:async';
import 'dart:developer' as dev;
import 'dart:io' show Platform;

import 'package:ahara/core/routing/app_router.dart';
import 'package:ahara/core/routing/route_paths.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'push_messaging_service.g.dart';

/// Android notification channel id — must match the
/// `com.google.firebase.messaging.default_notification_channel_id` meta-data
/// in `AndroidManifest.xml` so background/killed pushes land here too.
const String kDefaultChannelId = 'ahara_default_channel';

/// Wraps [FirebaseMessaging] + [FlutterLocalNotificationsPlugin] for FCM push.
///
/// Responsibilities are platform-only (permission, token, display, tap
/// navigation). Backend token registration lives in the notifications
/// repository/controller. iOS has no APNs in this project (no Apple Developer
/// account), so every call degrades to a safe no-op there.
class PushMessagingService {
  /// Creates a [PushMessagingService].
  PushMessagingService(this._ref);

  final Ref _ref;
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _local =
      FlutterLocalNotificationsPlugin();

  final StreamController<void> _changes = StreamController<void>.broadcast();
  bool _initialized = false;

  /// Fires whenever a push is received in the foreground or a notification is
  /// tapped — listeners (e.g. the unread badge) can refresh on this.
  Stream<void> get onNotificationChange => _changes.stream;

  /// FCM token refresh stream (re-register the device when this fires).
  Stream<String> get onTokenRefresh => _fcm.onTokenRefresh;

  /// One-time setup: local-notifications channel + FCM listeners.
  ///
  /// Safe to call more than once; subsequent calls are ignored.
  Future<void> init() async {
    if (_initialized) return;
    _initialized = true;

    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const initSettings = InitializationSettings(
      android: androidInit,
      iOS: DarwinInitializationSettings(),
    );
    await _local.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (response) =>
          _navigateFromPayload(response.payload),
    );

    // Create the Android channel referenced by the manifest meta-data.
    await _local
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(
          const AndroidNotificationChannel(
            kDefaultChannelId,
            'General',
            description: 'Meal plans, targets, streaks and reminders.',
            importance: Importance.high,
          ),
        );

    // Foreground messages are not shown by the OS — render a heads-up.
    FirebaseMessaging.onMessage.listen(_showForeground);

    // Tap while the app is backgrounded (warm start).
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) => _navigate(message.data),
    );

    // Cold start: app launched by tapping a notification.
    final initial = await _fcm.getInitialMessage();
    if (initial != null) _navigate(initial.data);
  }

  /// Requests notification permission (Android 13+ prompt). Returns whether
  /// notifications are authorized. No-ops to `false` on unexpected failures.
  Future<bool> requestPermission() async {
    try {
      final settings = await _fcm.requestPermission();
      return settings.authorizationStatus == AuthorizationStatus.authorized ||
          settings.authorizationStatus == AuthorizationStatus.provisional;
    } on Object catch (e) {
      dev.log('requestPermission failed: $e', name: 'Push');
      return false;
    }
  }

  /// Returns the current FCM token, or `null` (e.g. iOS without APNs).
  Future<String?> getToken() async {
    try {
      return await _fcm.getToken();
    } on Object catch (e) {
      dev.log('getToken failed: $e', name: 'Push');
      return null;
    }
  }

  /// Deletes the FCM token on this device (called on opt-out / sign-out).
  Future<void> deleteToken() async {
    try {
      await _fcm.deleteToken();
    } on Object catch (e) {
      dev.log('deleteToken failed: $e', name: 'Push');
    }
  }

  /// The platform string the backend expects for device registration.
  String get platform => Platform.isIOS ? 'ios' : 'android';

  Future<void> _showForeground(RemoteMessage message) async {
    _changes.add(null);
    final notification = message.notification;
    if (notification == null) return;
    await _local.show(
      notification.hashCode,
      notification.title,
      notification.body,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          kDefaultChannelId,
          'General',
          channelDescription: 'Meal plans, targets, streaks and reminders.',
          importance: Importance.high,
          priority: Priority.high,
        ),
      ),
      payload: message.data['route'] as String?,
    );
  }

  void _navigate(Map<String, dynamic> data) {
    _changes.add(null);
    _go(_pathFor(data['route'] as String?));
  }

  void _navigateFromPayload(String? route) {
    _changes.add(null);
    _go(_pathFor(route));
  }

  void _go(String path) {
    try {
      _ref.read(appRouterProvider).go(path);
    } on Object catch (e) {
      dev.log('navigation failed for $path: $e', name: 'Push');
    }
  }

  /// Maps a backend `data.route` to an in-app route. Unknown/empty routes
  /// open the notification list.
  String _pathFor(String? route) {
    final value = route ?? '';
    if (value.startsWith('profile')) return RoutePaths.profile;
    if (value.startsWith('tracker') || value.startsWith('mealplan')) {
      return RoutePaths.home;
    }
    return RoutePaths.notifications;
  }
}

/// Provides the app-wide [PushMessagingService].
@Riverpod(keepAlive: true)
PushMessagingService pushMessagingService(Ref ref) =>
    PushMessagingService(ref);
