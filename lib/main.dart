import 'dart:async';

import 'package:ahara/app.dart';
import 'package:ahara/core/cache/cache_service.dart';
import 'package:ahara/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// Handles FCM messages while the app is backgrounded or terminated.
///
/// Must be a top-level function. The OS auto-displays the `notification`
/// payload in the system tray, so no UI work is needed here.
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

Future<void> main() async {
  await runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();

    // Initialize Firebase before any FirebaseAuth/Crashlytics access.
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // Route Flutter framework + platform errors to Crashlytics.
    FlutterError.onError =
        FirebaseCrashlytics.instance.recordFlutterFatalError;
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };

    // Register the background push handler before the app runs.
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Open the offline read-cache box.
    await Hive.initFlutter();
    final cacheBox = await Hive.openBox<String>(kApiCacheBoxName);

    runApp(
      ProviderScope(
        overrides: [
          cacheServiceProvider.overrideWithValue(CacheService(cacheBox)),
        ],
        child: const AharaApp(),
      ),
    );
  }, (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  });
}
