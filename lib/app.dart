import 'dart:async';

import 'package:ahara/core/routing/app_router.dart';
import 'package:ahara/core/theme/app_theme.dart';
import 'package:ahara/core/widgets/app_toast.dart';
import 'package:ahara/features/auth/presentation/controllers/login_controller.dart';
import 'package:app_links/app_links.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Root widget of the Ahara app.
///
/// Uses [MaterialApp.router] with the router from [appRouterProvider].
/// Theme is applied from [AppTheme].
class AharaApp extends ConsumerStatefulWidget {
  /// Creates the root app widget.
  const AharaApp({super.key});

  @override
  ConsumerState<AharaApp> createState() => _AharaAppState();
}

class _AharaAppState extends ConsumerState<AharaApp> {
  late final AppLinks _appLinks;
  StreamSubscription<Uri>? _linkSub;

  @override
  void initState() {
    super.initState();
    _appLinks = AppLinks();
    _initDeepLinks();
  }

  Future<void> _initDeepLinks() async {
    // Cold-start: app opened by tapping an email link.
    final initialUri = await _appLinks.getInitialLink();
    if (initialUri != null) await _handleUri(initialUri);

    // Warm-start: link tapped while app is already running.
    _linkSub = _appLinks.uriLinkStream.listen(_handleUri);
  }

  Future<void> _handleUri(Uri uri) async {
    final link = uri.toString();
    if (!fb.FirebaseAuth.instance.isSignInWithEmailLink(link)) return;

    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('pendingEmailForLink');
    if (email == null) return;

    await ref
        .read(loginControllerProvider.notifier)
        .completeEmailLinkSignIn(email: email, emailLink: link);

    await prefs.remove('pendingEmailForLink');
  }

  @override
  void dispose() {
    _linkSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch<GoRouter>(appRouterProvider);

    return MaterialApp.router(
      title: 'Ahara',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      routerConfig: router,
      builder: (context, child) =>
          ToastOverlay(child: child ?? const SizedBox.shrink()),
    );
  }
}
