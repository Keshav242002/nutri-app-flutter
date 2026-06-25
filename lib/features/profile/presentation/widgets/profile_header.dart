import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_radius.dart';
import 'package:ahara/core/theme/app_shadows.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/features/onboarding/domain/models/dietary_profile.dart';
import 'package:flutter/material.dart';

/// Read-only profile header: avatar + name/email and the computed plan
/// summary (daily calorie target + macro split).
class ProfileHeader extends StatelessWidget {
  /// Creates a [ProfileHeader].
  const ProfileHeader({
    required this.displayName,
    required this.email,
    required this.profile,
    super.key,
  });

  /// User's display name (from auth).
  final String displayName;

  /// User's email (from auth).
  final String email;

  /// Dietary profile holding the computed targets.
  final DietaryProfile profile;

  @override
  Widget build(BuildContext context) {
    final name = displayName.trim().isNotEmpty ? displayName.trim() : 'You';
    final initial = name.isNotEmpty ? name[0].toUpperCase() : 'A';

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
          Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: const BoxDecoration(
                  color: AppColors.navyDeep,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  initial,
                  style: AppTypography.headingLarge.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: AppTypography.headingMedium.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                    if (email.trim().isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Text(
                        email.trim(),
                        style: AppTypography.bodyMedium.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          const Divider(color: AppColors.creamBorder, height: 1),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              Text(
                profile.targetCalories != null
                    ? '${profile.targetCalories}'
                    : '—',
                style: AppTypography.numericLarge(
                  fontSize: 28,
                ).copyWith(color: AppColors.turmeric),
              ),
              const SizedBox(width: 4),
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  'kcal / day',
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _MacroPill(
                label: 'Protein',
                grams: profile.targetProteinG,
                color: AppColors.macroProtein,
              ),
              _MacroPill(
                label: 'Carbs',
                grams: profile.targetCarbsG,
                color: AppColors.macroCarbs,
              ),
              _MacroPill(
                label: 'Fat',
                grams: profile.targetFatG,
                color: AppColors.macroFat,
              ),
              _MacroPill(
                label: 'Fiber',
                grams: profile.targetFiberG,
                color: AppColors.macroFiber,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MacroPill extends StatelessWidget {
  const _MacroPill({
    required this.label,
    required this.grams,
    required this.color,
  });

  final String label;
  final double? grams;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          grams != null ? '${grams!.toStringAsFixed(0)}g' : '—',
          style: AppTypography.labelLarge.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: AppTypography.caption.copyWith(color: color),
        ),
      ],
    );
  }
}
