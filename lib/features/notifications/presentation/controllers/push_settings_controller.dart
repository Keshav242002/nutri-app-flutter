import 'dart:async';

import 'package:ahara/core/notifications/push_messaging_service.dart';
import 'package:ahara/core/providers/toast_provider.dart';
import 'package:ahara/core/utils/result.dart';
import 'package:ahara/features/notifications/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'push_settings_controller.g.dart';

const String _kPushEnabled = 'notif_push_enabled';
const String _kPrompted = 'notif_permission_prompted';

/// Single source of truth for the "Push notifications" opt-in.
///
/// `true` means the device's FCM token is registered with the backend.
/// Kept alive so the token-refresh subscription survives navigation.
@Riverpod(keepAlive: true)
class PushSettingsController extends _$PushSettingsController {
  @override
  Future<bool> build() async {
    final prefs = await SharedPreferences.getInstance();
    final enabled = prefs.getBool(_kPushEnabled) ?? false;

    final service = ref.read(pushMessagingServiceProvider);
    // Re-register the token whenever FCM rotates it (only while opted in).
    final sub = service.onTokenRefresh.listen((token) async {
      if (state.value ?? false) {
        await ref
            .read(notificationsRepositoryProvider)
            .registerDevice(fcmToken: token, platform: service.platform);
      }
    });
    ref.onDispose(sub.cancel);

    if (enabled) await service.init();
    return enabled;
  }

  /// Turns push on or off, registering/unregistering the device token.
  Future<void> setEnabled({required bool enabled}) =>
      enabled ? _enable() : _disable();

  Future<void> _enable() async {
    final service = ref.read(pushMessagingServiceProvider);
    final toast = ref.read(toastProvider.notifier);

    final granted = await service.requestPermission();
    if (!granted) {
      toast.show('Enable notifications in system settings to receive push.');
      state = const AsyncData(false);
      return;
    }

    await service.init();
    final token = await service.getToken();
    if (token == null) {
      toast.show('Push notifications are not available on this device.');
      state = const AsyncData(false);
      return;
    }

    final result = await ref
        .read(notificationsRepositoryProvider)
        .registerDevice(fcmToken: token, platform: service.platform);
    switch (result) {
      case Success<void>():
        await _persist(enabled: true);
        state = const AsyncData(true);
        toast.show('Push notifications on', type: ToastType.success);
      case Failure<void>(:final exception):
        state = const AsyncData(false);
        toast.show(exception.message);
    }
  }

  Future<void> _disable() async {
    final service = ref.read(pushMessagingServiceProvider);
    final toast = ref.read(toastProvider.notifier);

    final token = await service.getToken();
    if (token != null) {
      await ref.read(notificationsRepositoryProvider).unregisterDevice(token);
    }
    await service.deleteToken();
    await _persist(enabled: false);
    state = const AsyncData(false);
    toast.show('Push notifications off', type: ToastType.success);
  }

  /// Called on every authenticated launch.
  ///
  /// On the **first** launch it auto-prompts for notification permission once:
  /// if granted, the flag is saved `true` and the token is registered; if
  /// denied, the flag stays `false`. On later launches it simply registers the
  /// token when the user is already opted in (respecting any manual toggle).
  Future<void> initOnLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    final prompted = prefs.getBool(_kPrompted) ?? false;
    if (prompted) {
      await registerIfEnabled();
      return;
    }
    await prefs.setBool(_kPrompted, true);

    final service = ref.read(pushMessagingServiceProvider);
    final granted = await service.requestPermission();
    if (!granted) {
      await _persist(enabled: false);
      state = const AsyncData(false);
      return;
    }

    await service.init();
    final token = await service.getToken();
    if (token == null) {
      await _persist(enabled: false);
      state = const AsyncData(false);
      return;
    }

    final result = await ref
        .read(notificationsRepositoryProvider)
        .registerDevice(fcmToken: token, platform: service.platform);
    switch (result) {
      case Success<void>():
        await _persist(enabled: true);
        state = const AsyncData(true);
      case Failure<void>():
        await _persist(enabled: false);
        state = const AsyncData(false);
    }
  }

  /// Registers the current token if the user has opted in. Called after login.
  Future<void> registerIfEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    if (!(prefs.getBool(_kPushEnabled) ?? false)) return;

    final service = ref.read(pushMessagingServiceProvider);
    await service.init();
    final token = await service.getToken();
    if (token == null) return;
    await ref
        .read(notificationsRepositoryProvider)
        .registerDevice(fcmToken: token, platform: service.platform);
  }

  /// Unregisters this device's token. Called on sign-out.
  Future<void> unregisterOnSignOut() async {
    final service = ref.read(pushMessagingServiceProvider);
    final token = await service.getToken();
    if (token != null) {
      await ref.read(notificationsRepositoryProvider).unregisterDevice(token);
    }
    await service.deleteToken();
  }

  Future<void> _persist({required bool enabled}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kPushEnabled, enabled);
  }
}
