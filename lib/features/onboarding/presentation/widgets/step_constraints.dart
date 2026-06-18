import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/core/widgets/selectable_card.dart';
import 'package:ahara/features/onboarding/domain/models/onboarding_enums.dart';
import 'package:ahara/features/onboarding/domain/models/onboarding_form_data.dart';
import 'package:flutter/material.dart';

/// Step 6 — Prep time, skill level, and disclaimer.
class StepConstraints extends StatelessWidget {
  /// Creates [StepConstraints].
  const StepConstraints({
    required this.form,
    required this.onUpdate,
    super.key,
  });

  /// Current form state.
  final OnboardingFormData form;

  /// Called whenever a field changes.
  final void Function(OnboardingFormData Function(OnboardingFormData)) onUpdate;

  static const _skills = [
    (
      SkillLevel.beginner,
      Icons.school_outlined,
      'Beginner',
      'Simple recipes, basic techniques',
    ),
    (
      SkillLevel.intermediate,
      Icons.local_fire_department_outlined,
      'Intermediate',
      'Comfortable in the kitchen',
    ),
    (
      SkillLevel.advanced,
      Icons.star_outline,
      'Advanced',
      'Confident with complex recipes',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenHorizontal,
        vertical: AppSpacing.lg,
      ),
      children: [
        Text(
          'Max Prep Time',
          style: AppTypography.headingMedium.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Center(
          child: Text(
            '${form.maxPrepTimeMin} min',
            style: AppTypography.numericLarge(
              fontSize: 36,
            ).copyWith(color: AppColors.turmeric),
          ),
        ),
        SliderTheme(
          data: SliderThemeData(
            activeTrackColor: AppColors.turmeric,
            inactiveTrackColor: AppColors.creamBorder,
            thumbColor: AppColors.turmeric,
            overlayColor: AppColors.turmeric.withValues(alpha: 0.15),
            thumbShape: const RoundSliderThumbShape(),
            trackHeight: 4,
          ),
          child: Slider(
            value: form.maxPrepTimeMin.toDouble(),
            min: 10,
            max: 120,
            divisions: 22,
            onChanged: (v) =>
                onUpdate((f) => f.copyWith(maxPrepTimeMin: v.round())),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '10 min',
              style: AppTypography.caption.copyWith(color: AppColors.textHint),
            ),
            Text(
              '120 min',
              style: AppTypography.caption.copyWith(color: AppColors.textHint),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.xl),
        Text(
          'Cooking Skill Level',
          style: AppTypography.headingMedium.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        ..._skills.map(
          (s) => Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: SelectableCard(
              icon: s.$2,
              title: s.$3,
              description: s.$4,
              isSelected: form.skillLevel == s.$1,
              onTap: () => onUpdate((f) => f.copyWith(skillLevel: s.$1)),
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.xl),
        _DisclaimerCard(
          acknowledged: form.disclaimerAcknowledged,
          onChanged: (v) =>
              onUpdate((f) => f.copyWith(disclaimerAcknowledged: v)),
        ),
        const SizedBox(height: AppSpacing.xxl),
      ],
    );
  }
}

class _DisclaimerCard extends StatelessWidget {
  const _DisclaimerCard({required this.acknowledged, required this.onChanged});

  final bool acknowledged;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.creamDeep,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: acknowledged ? AppColors.turmeric : AppColors.creamBorder,
          width: acknowledged ? 2 : 1,
        ),
        boxShadow: acknowledged
            ? [
                BoxShadow(
                  color: AppColors.turmeric.withValues(alpha: 0.10),
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: AppColors.navySubtle,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.shield_outlined,
                  color: AppColors.navyDeep,
                  size: 22,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Our Commitment to You',
                  style: AppTypography.headingMedium.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Ahara provides personalised nutrition guidance '
            'based on your profile. '
            'Our recommendations are not a substitute for '
            'medical advice. Consult a healthcare professional '
            'for medical or dietary concerns.',
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () => onChanged(!acknowledged),
            child: Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: acknowledged
                        ? AppColors.turmeric
                        : AppColors.creamBorder,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: acknowledged
                          ? AppColors.turmeric
                          : AppColors.textHint,
                    ),
                  ),
                  child: acknowledged
                      ? const Icon(
                          Icons.check,
                          size: 16,
                          color: AppColors.navyDeep,
                        )
                      : null,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'I understand and agree to proceed',
                    style: AppTypography.labelLarge.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
