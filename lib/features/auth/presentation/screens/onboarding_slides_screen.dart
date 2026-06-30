import 'package:ahara/core/routing/route_paths.dart';
import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_radius.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/core/widgets/app_button.dart';
import 'package:ahara/features/auth/presentation/controllers/splash_controller.dart';
import 'package:ahara/features/auth/presentation/widgets/onboarding_slide.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Three value-prop slides shown to first-time users.
///
/// Same two-zone layout as the login screen: image panel (top 58%) +
/// cream content sheet (bottom 42%) with progress pills.
class OnboardingSlidesScreen extends StatefulWidget {
  /// Creates the [OnboardingSlidesScreen].
  const OnboardingSlidesScreen({super.key});

  @override
  State<OnboardingSlidesScreen> createState() => _OnboardingSlidesScreenState();
}

class _OnboardingSlidesScreenState extends State<OnboardingSlidesScreen> {
  int _index = 0;

  static const _slides = [
    OnboardingSlideData(
      eyebrow: 'Made for India',
      headline: 'Dal, sabzi, paratha —\nnot "grilled chicken"',
      body:
          'Real Indian recipes with katori and roti portions. '
          'Cuisine-aware plans from north to south.',
      imagePath: 'assets/onboarding_1.png',
    ),
    OnboardingSlideData(
      eyebrow: 'Know your numbers',
      headline: 'Macros that actually\nmake sense to you',
      body:
          'Calories and nutrients tracked automatically as you mark '
          'meals eaten. No manual counting.',
      imagePath: 'assets/Onboarding_2.png',
    ),
    OnboardingSlideData(
      eyebrow: 'Budget-aware',
      headline: 'A ₹100/day plan\nis a real plan',
      body:
          'Set your daily food budget. Every recipe is filtered by '
          'per-serving cost in rupees.',
      imagePath: 'assets/Onboarding_3.png',
    ),
  ];

  void _next() {
    if (_index < 2) {
      setState(() => _index++);
    } else {
      _goToLogin();
    }
  }

  void _skip() => setState(() => _index = 2);

  void _goToLogin() {
    markOnboardingSeen();
    context.go(RoutePaths.login);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final statusBarHeight = MediaQuery.paddingOf(context).top;
    final availableHeight = size.height - statusBarHeight;
    final imageHeight = availableHeight * 0.58;
    final sheetHeight = availableHeight * 0.42 + 16; // +16 overlap

    return Scaffold(
      backgroundColor: AppColors.navyDeep,
      body: SafeArea(
        bottom: false,
        child: Stack(
        children: [
          // Full-bleed filler so the Stack fills the screen; otherwise it
          // collapses to the image height and the sheet floats up the screen.
          const SizedBox.expand(child: ColoredBox(color: AppColors.navyDeep)),

          // Image panel — full bleed top zone.
          //
          // Carousel "push": the outgoing image exits LEFT exactly as the
          // incoming one enters from the RIGHT, so their edges stay touching
          // and the navy background is never revealed mid-transition.
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 450),
            // Stack children to fill the box so both slides overlap the panel.
            layoutBuilder: (currentChild, previousChildren) => Stack(
              fit: StackFit.expand,
              children: [
                ...previousChildren,
                if (currentChild != null) currentChild,
              ],
            ),
            transitionBuilder: (child, anim) =>
                _imagePush(child, anim, ValueKey(_index)),
            child: SizedBox(
              key: ValueKey(_index),
              width: double.infinity,
              height: imageHeight,
              child: Image.asset(_slides[_index].imagePath, fit: BoxFit.cover),
            ),
          ),

          // Content sheet — overlaps image by 16px.
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: sheetHeight,
              decoration: const BoxDecoration(
                color: AppColors.cream,
                borderRadius: AppRadius.bottomSheet,
              ),
              padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ProgressPills(current: _index),
                  const SizedBox(height: 28),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 450),
                    // Mirror the image's push direction (with a fade) so the
                    // text and image read as one moving unit.
                    transitionBuilder: (child, anim) =>
                        _textPush(child, anim, ValueKey(_index)),
                    child: OnboardingSlide(
                      key: ValueKey(_index),
                      data: _slides[_index],
                    ),
                  ),
                  const Spacer(),
                  if (_index < 2) _buildNavRow() else _buildFinalRow(),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
  }

  /// Carousel push for the image panel.
  ///
  /// Incoming child (matches the active [activeKey]) rides in from the right
  /// (+1 → 0); the outgoing child travels the same way, exiting to the left
  /// (0 → -1, since [AnimatedSwitcher] runs its animation in reverse). Both
  /// stay edge-to-edge, so the navy backdrop is never exposed. [ClipRect]
  /// keeps either slide from bleeding past the panel during travel.
  Widget _imagePush(Widget child, Animation<double> anim, Key activeKey) {
    final isIncoming = child.key == activeKey;
    final offset = Tween<Offset>(
      begin: Offset(isIncoming ? 1 : -1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: anim, curve: Curves.easeInOut));
    return ClipRect(child: SlideTransition(position: offset, child: child));
  }

  /// Same directional push as [_imagePush] but gentler (smaller travel) and
  /// cross-faded, so the text sheet reads as part of the same motion.
  Widget _textPush(Widget child, Animation<double> anim, Key activeKey) {
    final isIncoming = child.key == activeKey;
    final curved = CurvedAnimation(parent: anim, curve: Curves.easeOut);
    final offset = Tween<Offset>(
      begin: Offset(isIncoming ? 0.25 : -0.25, 0),
      end: Offset.zero,
    ).animate(curved);
    return FadeTransition(
      opacity: curved,
      child: SlideTransition(position: offset, child: child),
    );
  }

  Widget _buildNavRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: _skip,
          child: Text(
            'Skip intro',
            style: AppTypography.labelMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
        _NavNextButton(onPressed: _next),
      ],
    );
  }

  Widget _buildFinalRow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppButton(label: 'Get started →', onPressed: _goToLogin),
        const SizedBox(height: 14),
        GestureDetector(
          onTap: _goToLogin,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
              children: [
                const TextSpan(text: 'Already have an account? '),
                TextSpan(
                  text: 'Sign in',
                  style: AppTypography.labelMedium.copyWith(
                    color: AppColors.turmeric,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ProgressPills extends StatelessWidget {
  const _ProgressPills({required this.current});

  final int current;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(3, (i) {
        Color color;
        if (i == current) {
          color = AppColors.turmeric;
        } else if (i < current) {
          color = AppColors.turmericDim;
        } else {
          color = AppColors.creamBorder;
        }
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: i < 2 ? 6 : 0),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 3,
              decoration: BoxDecoration(
                color: color,
                borderRadius: AppRadius.pill,
              ),
            ),
          ),
        );
      }),
    );
  }
}

class _NavNextButton extends StatelessWidget {
  const _NavNextButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.navyDeep,
        foregroundColor: AppColors.cream,
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.button),
        // Override the theme's full-width minimumSize: this button sits in a
        // spaceBetween Row and must size to its content.
        minimumSize: const Size(0, 52),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.xl,
          vertical: 14,
        ),
        elevation: 0,
      ),
      child: Text(
        'Next →',
        style: AppTypography.labelLarge.copyWith(color: AppColors.cream),
      ),
    );
  }
}
