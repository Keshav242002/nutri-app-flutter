import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/core/widgets/app_chip.dart';
import 'package:ahara/features/onboarding/domain/models/onboarding_enums.dart';
import 'package:ahara/features/onboarding/domain/models/onboarding_form_data.dart';
import 'package:flutter/material.dart';

/// Step 3 — Cuisine region, secondary preferences, and spice tolerance.
class StepCuisine extends StatelessWidget {
  /// Creates [StepCuisine].
  const StepCuisine({required this.form, required this.onUpdate, super.key});

  /// Current form state.
  final OnboardingFormData form;

  /// Called whenever a field changes.
  final void Function(OnboardingFormData Function(OnboardingFormData)) onUpdate;

  static const _regions = [
    (CuisineRegion.northIndian, '🫓', 'North Indian', 'Roti, dal, sabzi'),
    (CuisineRegion.southIndian, '🍛', 'South Indian', 'Idli, dosa, sambar'),
    (CuisineRegion.eastIndian, '🍚', 'East Indian', 'Rice, fish, mustard'),
    (CuisineRegion.westIndian, '🌶️', 'West Indian', 'Thepla, vada pav'),
  ];

  static const _secondary = [
    'Punjabi',
    'Gujarati',
    'Rajasthani',
    'Bengali',
    'Tamil',
    'Kerala',
    'Maharashtrian',
    'Hyderabadi',
    'Awadhi',
    'Continental',
  ];

  static const _spice = [
    (SpiceTolerance.mild, '🌶️', 'Mild', Color(0xFFE0A53F)),
    (SpiceTolerance.medium, '🌶️🌶️', 'Medium', Color(0xFFE07A3F)),
    (SpiceTolerance.hot, '🌶️🌶️🌶️', 'Hot', Color(0xFFC2541E)),
    (SpiceTolerance.veryHot, '🌶️🌶️🌶️🌶️', 'Very Hot', Color(0xFF8B1A1A)),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenHorizontal,
        vertical: AppSpacing.lg,
      ),
      children: [
        _sectionLabel('Primary Cuisine Region'),
        const SizedBox(height: AppSpacing.sm),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: AppSpacing.sm,
          mainAxisSpacing: AppSpacing.sm,
          childAspectRatio: 1.6,
          children: _regions.map((r) {
            final selected = form.primaryCuisineRegion == r.$1;
            return GestureDetector(
              onTap: () =>
                  onUpdate((f) => f.copyWith(primaryCuisineRegion: r.$1)),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: selected
                      ? AppColors.turmeric.withValues(alpha: 0.08)
                      : AppColors.creamDeep,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: selected
                        ? AppColors.turmeric
                        : AppColors.creamBorder,
                    width: selected ? 2 : 1,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(r.$2, style: const TextStyle(fontSize: 28)),
                    const SizedBox(height: 4),
                    Text(
                      r.$3,
                      style: AppTypography.labelLarge.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      r.$4,
                      style: AppTypography.caption.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: AppSpacing.xl),
        _sectionLabel('Secondary Preferences'),
        Text(
          'Optional — select any that apply',
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: _secondary.map((name) {
            final val = name.toLowerCase().replaceAll(' ', '_');
            final selected = form.secondaryCuisinePreferences.contains(val);
            return AppChip(
              label: name,
              isSelected: selected,
              turmericSelected: true,
              onTap: () {
                final list = List<String>.from(
                  form.secondaryCuisinePreferences,
                );
                if (selected) {
                  list.remove(val);
                } else {
                  list.add(val);
                }
                onUpdate((f) => f.copyWith(secondaryCuisinePreferences: list));
              },
            );
          }).toList(),
        ),
        const SizedBox(height: AppSpacing.xl),
        _sectionLabel('Spice Tolerance'),
        const SizedBox(height: AppSpacing.sm),
        ...(_spice.map(
          (s) => Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: GestureDetector(
              onTap: () => onUpdate((f) => f.copyWith(spiceTolerance: s.$1)),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: form.spiceTolerance == s.$1
                      ? AppColors.turmeric.withValues(alpha: 0.08)
                      : AppColors.creamDeep,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: form.spiceTolerance == s.$1
                        ? AppColors.turmeric
                        : AppColors.creamBorder,
                    width: form.spiceTolerance == s.$1 ? 2 : 1,
                  ),
                ),
                child: Row(
                  children: [
                    Text(s.$2, style: const TextStyle(fontSize: 20)),
                    const SizedBox(width: 12),
                    Text(
                      s.$3,
                      style: AppTypography.labelLarge.copyWith(color: s.$4),
                    ),
                    if (form.spiceTolerance == s.$1) ...[
                      const Spacer(),
                      const Icon(
                        Icons.check_circle_rounded,
                        color: AppColors.turmeric,
                        size: 20,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        )),
        const SizedBox(height: AppSpacing.xxl),
      ],
    );
  }

  Widget _sectionLabel(String text) => Padding(
    padding: const EdgeInsets.only(bottom: 4),
    child: Text(
      text,
      style: AppTypography.headingMedium.copyWith(color: AppColors.textPrimary),
    ),
  );
}
