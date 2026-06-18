import 'package:ahara/core/providers/toast_provider.dart';
import 'package:ahara/core/routing/route_paths.dart';
import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/core/widgets/app_button.dart';
import 'package:ahara/core/widgets/loading_state.dart';
import 'package:ahara/features/onboarding/domain/models/onboarding_form_data.dart';
import 'package:ahara/features/onboarding/presentation/controllers/onboarding_controller.dart';
import 'package:ahara/features/onboarding/presentation/widgets/step_activity_goal.dart';
import 'package:ahara/features/onboarding/presentation/widgets/step_basics.dart';
import 'package:ahara/features/onboarding/presentation/widgets/step_budget.dart';
import 'package:ahara/features/onboarding/presentation/widgets/step_constraints.dart';
import 'package:ahara/features/onboarding/presentation/widgets/step_cuisine.dart';
import 'package:ahara/features/onboarding/presentation/widgets/step_dietary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// 6-step dietary profile builder for new users post-authentication.
class OnboardingScreen extends ConsumerStatefulWidget {
  /// Creates [OnboardingScreen].
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _pageController = PageController();

  static const _stepTitles = [
    'Tell us about you',
    'Activity & Goal',
    'Your Cuisine',
    'Dietary Pattern',
    'Budget & Household',
    'Almost there',
  ];

  static const _stepSubtitles = [
    'We need a few basics to build your nutrition plan.',
    'How active are you, and what do you want to achieve?',
    'What flavours feel like home to you?',
    'Help us understand what you eat and avoid.',
    'So we can plan meals that fit your life.',
    'Final details — then your plan is ready.',
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final asyncState = ref.watch(onboardingControllerProvider);

    return asyncState.when(
      loading: () => const Scaffold(
        backgroundColor: AppColors.cream,
        body: LoadingState(),
      ),
      error: (e, _) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            ref
                .read(toastProvider.notifier)
                .show('Could not load questionnaire. Please try again.');
          }
        });
        return const Scaffold(
          backgroundColor: AppColors.cream,
          body: LoadingState(),
        );
      },
      data: (state) {
        // Navigate to YourPlan when result is populated
        if (state.result != null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              context.go(RoutePaths.yourPlan, extra: state.result);
            }
          });
        }

        final step = state.currentStep;
        final canContinue = ref
            .read(onboardingControllerProvider.notifier)
            .canContinue(step);
        final isLastStep = step == 5;

        return Scaffold(
          backgroundColor: AppColors.cream,
          body: Stack(
            children: [
              Column(
                children: [
                  _TopBar(step: step),
                  _ProgressBar(step: step),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      AppSpacing.screenHorizontal,
                      AppSpacing.lg,
                      AppSpacing.screenHorizontal,
                      AppSpacing.sm,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _stepTitles[step],
                          style: AppTypography.displayMedium.copyWith(
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          _stepSubtitles[step],
                          style: AppTypography.bodyLarge.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: _buildSteps(state.formData),
                    ),
                  ),
                  _BottomNav(
                    step: step,
                    canContinue: canContinue,
                    isLastStep: isLastStep,
                    isSubmitting: state.isSubmitting,
                    onBack: _onBack,
                    onContinue: _onContinue,
                  ),
                ],
              ),
              if (state.isSubmitting)
                const ColoredBox(
                  color: AppColors.cream,
                  child: LoadingState(message: 'Building your plan…'),
                ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _buildSteps(OnboardingFormData form) {
    void update(OnboardingFormData Function(OnboardingFormData) fn) {
      ref.read(onboardingControllerProvider.notifier).updateForm(fn);
    }

    return [
      StepBasics(form: form, onUpdate: update),
      StepActivityGoal(form: form, onUpdate: update),
      StepCuisine(form: form, onUpdate: update),
      StepDietary(form: form, onUpdate: update),
      StepBudget(form: form, onUpdate: update),
      StepConstraints(form: form, onUpdate: update),
    ];
  }

  void _onBack() {
    final notifier = ref.read(onboardingControllerProvider.notifier);
    final step = ref.read(onboardingControllerProvider).value?.currentStep ?? 0;
    if (step == 0) return;
    notifier.previousStep();
    _pageController.animateToPage(
      step - 1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _onContinue() {
    final notifier = ref.read(onboardingControllerProvider.notifier);
    final state = ref.read(onboardingControllerProvider).value;
    if (state == null) return;

    if (state.currentStep == 5) {
      notifier.submitProfile();
    } else {
      notifier.nextStep();
      _pageController.animateToPage(
        state.currentStep + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}

// ---------------------------------------------------------------------------
// Sub-widgets
// ---------------------------------------------------------------------------

class _TopBar extends StatelessWidget {
  const _TopBar({required this.step});

  final int step;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SizedBox(
        height: 56,
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (step > 0)
              Positioned(
                left: AppSpacing.screenHorizontal,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: AppColors.navyDeep,
                    size: 20,
                  ),
                  onPressed: () {
                    // Handled via BottomNav back button; duplicate for gesture
                  },
                ),
              ),
            Text(
              'Ahara',
              style: AppTypography.headingLarge.copyWith(
                color: AppColors.navyDeep,
                letterSpacing: -0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProgressBar extends StatelessWidget {
  const _ProgressBar({required this.step});

  final int step;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenHorizontal,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Step ${step + 1} of 6',
            style: AppTypography.eyebrow.copyWith(color: AppColors.turmeric),
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: (step + 1) / 6),
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              builder: (_, value, __) => LinearProgressIndicator(
                value: value,
                minHeight: 4,
                backgroundColor: AppColors.creamBorder,
                color: AppColors.turmeric,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomNav extends StatelessWidget {
  const _BottomNav({
    required this.step,
    required this.canContinue,
    required this.isLastStep,
    required this.isSubmitting,
    required this.onBack,
    required this.onContinue,
  });

  final int step;
  final bool canContinue;
  final bool isLastStep;
  final bool isSubmitting;
  final VoidCallback onBack;
  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.screenHorizontal,
          AppSpacing.sm,
          AppSpacing.screenHorizontal,
          AppSpacing.md,
        ),
        child: Row(
          children: [
            if (step > 0) ...[
              SizedBox(
                width: 100,
                child: AppButton(
                  label: 'Back',
                  onPressed: onBack,
                  variant: AppButtonVariant.secondary,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
            ],
            Expanded(
              child: AppButton(
                label: isLastStep ? 'Complete Setup' : 'Continue',
                onPressed: canContinue && !isSubmitting ? onContinue : null,
                isLoading: isSubmitting,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
