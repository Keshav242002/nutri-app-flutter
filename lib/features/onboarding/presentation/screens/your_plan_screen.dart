import 'package:ahara/core/routing/route_paths.dart';
import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_radius.dart';
import 'package:ahara/core/theme/app_shadows.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/core/widgets/app_button.dart';
import 'package:ahara/features/onboarding/domain/models/dietary_profile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Post-onboarding screen displaying the computed nutrition targets.
class YourPlanScreen extends StatelessWidget {
  /// Creates [YourPlanScreen].
  const YourPlanScreen({required this.profile, super.key});

  /// The computed dietary profile returned by the onboarding POST.
  final DietaryProfile profile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      body: Stack(
        children: [
          // Decorative turmeric blob — upper-right corner
          Positioned(
            top: -80,
            right: -80,
            child: Container(
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.turmeric.withValues(alpha: 0.30),
                    AppColors.turmeric.withValues(alpha: 0),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.screenHorizontal,
                vertical: AppSpacing.xl,
              ),
              child: Column(
                children: [
                  const SizedBox(height: AppSpacing.xl),
                  // Hero check mark
                  Container(
                    width: 72,
                    height: 72,
                    decoration: const BoxDecoration(
                      color: AppColors.navyDeep,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check_rounded,
                      color: AppColors.white,
                      size: 36,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    'Your plan is ready.',
                    style: AppTypography.displayMedium.copyWith(
                      color: AppColors.navyDeep,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Here's what we've computed for you"
                    '\nbased on your answers.',
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  // Calories card
                  _CaloriesCard(calories: profile.targetCalories),
                  const SizedBox(height: AppSpacing.md),
                  // Macro 2×2 grid
                  _MacroGrid(profile: profile),
                  const SizedBox(height: AppSpacing.xl),
                  SizedBox(
                    width: double.infinity,
                    child: AppButton(
                      label: 'Start My Journey',
                      onPressed: () => context.go(RoutePaths.home),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    'These targets update as your profile evolves.',
                    style: AppTypography.caption.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSpacing.xl),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Calories card
// ---------------------------------------------------------------------------

class _CaloriesCard extends StatelessWidget {
  const _CaloriesCard({required this.calories});

  final int? calories;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.creamDeep,
        borderRadius: AppRadius.card,
        boxShadow: AppShadows.card,
        border: Border.all(color: AppColors.creamBorder),
      ),
      child: Column(
        children: [
          Text(
            'DAILY CALORIE TARGET',
            style: AppTypography.eyebrow.copyWith(color: AppColors.turmeric),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                calories != null ? '$calories' : '—',
                style: AppTypography.numericLarge(
                  fontSize: 52,
                ).copyWith(color: AppColors.turmeric),
              ),
              const SizedBox(width: 6),
              Text(
                'kcal',
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.navyDeep,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Macro 2×2 grid
// ---------------------------------------------------------------------------

class _MacroGrid extends StatelessWidget {
  const _MacroGrid({required this.profile});

  final DietaryProfile profile;

  @override
  Widget build(BuildContext context) {
    final macros = [
      _MacroData('PROTEIN', profile.targetProteinG, AppColors.macroProtein),
      _MacroData('CARBS', profile.targetCarbsG, AppColors.macroCarbs),
      _MacroData('FAT', profile.targetFatG, AppColors.macroFat),
      _MacroData('FIBER', profile.targetFiberG, AppColors.macroFiber),
    ];

    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: AppSpacing.md,
      mainAxisSpacing: AppSpacing.md,
      childAspectRatio: 1.5,
      children: macros.map((m) => _MacroCard(data: m)).toList(),
    );
  }
}

class _MacroData {
  const _MacroData(this.label, this.value, this.color);

  final String label;
  final double? value;
  final Color color;
}

class _MacroCard extends StatelessWidget {
  const _MacroCard({required this.data});

  final _MacroData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.creamDeep,
        borderRadius: AppRadius.card,
        boxShadow: AppShadows.card,
        border: Border.all(color: AppColors.creamBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            data.label,
            style: AppTypography.eyebrow.copyWith(color: data.color),
          ),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                data.value != null ? data.value!.toStringAsFixed(0) : '—',
                style: AppTypography.numericLarge(
                  fontSize: 28,
                ).copyWith(color: AppColors.textPrimary),
              ),
              const SizedBox(width: 4),
              Text(
                'g/day',
                style: AppTypography.caption.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
