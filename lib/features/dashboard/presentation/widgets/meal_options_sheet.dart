import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/core/widgets/app_modal_sheet.dart';
import 'package:ahara/features/dashboard/domain/models/meal_card_state.dart';
import 'package:ahara/features/dashboard/domain/models/recipe_slim.dart';
import 'package:flutter/material.dart';

/// Options menu sheet — Swap / Log something else / Skip.
class MealOptionsSheet extends StatelessWidget {
  /// Creates a [MealOptionsSheet].
  const MealOptionsSheet({
    required this.recipe,
    required this.slot,
    required this.onSwap,
    required this.onLogElse,
    required this.onSkip,
    super.key,
  });

  /// The recipe currently planned for this slot.
  final RecipeSlim recipe;

  /// The meal slot.
  final MealSlot slot;

  /// Called when the user selects "Swap this meal".
  final VoidCallback onSwap;

  /// Called when the user selects "Log something else".
  final VoidCallback onLogElse;

  /// Called when the user selects "Skip this meal".
  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    return AppModalSheet(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            slot.name.toUpperCase(),
            style: AppTypography.eyebrow.copyWith(color: AppColors.turmeric),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            recipe.name,
            style: AppTypography.headingMedium.copyWith(
              color: AppColors.navyDeep,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: AppSpacing.lg),
          _OptRow(
            icon: Icons.shuffle_rounded,
            label: 'Swap this meal',
            onTap: () {
              Navigator.of(context).pop();
              onSwap();
            },
          ),
          const Divider(height: 1, color: AppColors.creamBorder),
          _OptRow(
            icon: Icons.edit_note_rounded,
            label: 'Log something else',
            onTap: () {
              Navigator.of(context).pop();
              onLogElse();
            },
          ),
          const Divider(height: 1, color: AppColors.creamBorder),
          _OptRow(
            icon: Icons.do_not_disturb_alt_rounded,
            label: 'Skip this meal',
            color: AppColors.error,
            onTap: () {
              Navigator.of(context).pop();
              onSkip();
            },
          ),
          const SizedBox(height: AppSpacing.sm),
        ],
      ),
    );
  }
}

class _OptRow extends StatelessWidget {
  const _OptRow({
    required this.icon,
    required this.label,
    required this.onTap,
    this.color,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final c = color ?? AppColors.navyDeep;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
        child: Row(
          children: [
            Icon(icon, size: 22, color: c),
            const SizedBox(width: AppSpacing.md),
            Text(
              label,
              style: AppTypography.bodyLarge.copyWith(color: c),
            ),
          ],
        ),
      ),
    );
  }
}
