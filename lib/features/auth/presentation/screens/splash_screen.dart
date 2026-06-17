import 'package:ahara/core/routing/route_paths.dart';
import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/features/auth/presentation/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Brand entrance screen (~2s animation, then auth-gate navigation).
///
/// Four-phase animation: mark springs in → wordmark rises →
/// tagline breathes in → hold → fade to Cream → navigate.
class SplashScreen extends ConsumerStatefulWidget {
  /// Creates the [SplashScreen].
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _markScale;
  late final Animation<double> _markOpacity;
  late final Animation<double> _wordmarkOpacity;
  late final Animation<Offset> _wordmarkSlide;
  late final Animation<double> _taglineOpacity;
  late final Animation<double> _screenFade;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2350),
    );

    // Phase 1 — mark springs in (0–600ms)
    _markScale = Tween<double>(begin: 0.6, end: 1).animate(
      CurvedAnimation(
        parent: _ctrl,
        curve: const Interval(0, 0.255, curve: Curves.elasticOut),
      ),
    );
    _markOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _ctrl,
        curve: const Interval(0, 0.15, curve: Curves.easeOut),
      ),
    );

    // Phase 2 — wordmark rises (600–1000ms)
    _wordmarkOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _ctrl,
        curve: const Interval(0.255, 0.425, curve: Curves.easeOut),
      ),
    );
    _wordmarkSlide =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _ctrl,
            curve: const Interval(0.255, 0.425, curve: Curves.easeOut),
          ),
        );

    // Phase 3 — tagline breathes in (1000–1350ms)
    _taglineOpacity = Tween<double>(begin: 0, end: 0.55).animate(
      CurvedAnimation(
        parent: _ctrl,
        curve: const Interval(0.425, 0.575, curve: Curves.easeOut),
      ),
    );

    // Phase 4 — fade content out after 800ms hold (1550–1750ms).
    // Fades to navy (not cream) so the router's crossfade into the next screen
    // is navy→navy with no colour bleed-through.
    _screenFade = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: _ctrl,
        curve: const Interval(0.66, 0.745, curve: Curves.easeIn),
      ),
    );

    _ctrl
      ..addStatusListener(_onAnimationDone)
      ..forward();
  }

  Future<void> _onAnimationDone(AnimationStatus status) async {
    if (status != AnimationStatus.completed) return;
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    if (!mounted) return;
    final result = await ref.read(splashControllerProvider.future);

    if (!mounted) return;
    switch (result) {
      case SplashResult.goToOnboarding:
        context.go(RoutePaths.onboardingIntro);
      case SplashResult.goToLogin:
        context.go(RoutePaths.login);
      case SplashResult.goToHome:
        context.go(RoutePaths.home);
      case SplashResult.goToOnboardingQuestionnaire:
        context.go(RoutePaths.onboarding);
    }
  }

  @override
  void dispose() {
    _ctrl
      ..removeStatusListener(_onAnimationDone)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.navyDeep,
      body: AnimatedBuilder(
        animation: _ctrl,
        builder: (context, _) => Opacity(
          opacity: _screenFade.value,
          child: SizedBox.expand(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 9),
                _buildMark(),
                const SizedBox(height: 20),
                _buildWordmark(),
                const SizedBox(height: 10),
                _buildTagline(),
                const Spacer(flex: 11),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMark() => FadeTransition(
    opacity: _markOpacity,
    child: ScaleTransition(
      scale: _markScale,
      child: Image.asset('assets/logo_mark_dark.png', width: 88, height: 88),
    ),
  );

  Widget _buildWordmark() => FadeTransition(
    opacity: _wordmarkOpacity,
    child: SlideTransition(
      position: _wordmarkSlide,
      child: Image.asset('assets/logo_dark.png', width: 160),
    ),
  );

  Widget _buildTagline() => FadeTransition(
    opacity: _taglineOpacity,
    child: Text(
      'NOURISH. PLAN. THRIVE.',
      style: AppTypography.eyebrow.copyWith(
        color: AppColors.textOnDark,
        letterSpacing: 2.5,
        fontSize: 12,
      ),
    ),
  );
}
