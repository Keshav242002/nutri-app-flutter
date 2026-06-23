import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/core/widgets/app_modal_sheet.dart';
import 'package:ahara/features/dashboard/domain/models/meal_card_state.dart';
import 'package:ahara/features/dashboard/domain/models/recipe_slim.dart';
import 'package:flutter/material.dart';

/// Options menu sheet for a meal slot.
///
/// Two layouts via named constructors:
/// - [MealOptionsSheet.planned]: Swap / Log something else / Skip (the ···
///   menu on a planned card).
/// - [MealOptionsSheet.skipped]: Mark as eaten / Log something else / Swap
///   (the "Edit" action on a skipped card — lets the user un-skip).
class MealOptionsSheet extends StatelessWidget {
  const MealOptionsSheet._({
    required this.recipe,
    required this.slot,
    required List<_Option> options,
  }) : _options = options;

  /// Options for a planned meal — swap, log something else, or skip.
  factory MealOptionsSheet.planned({
    required RecipeSlim recipe,
    required MealSlot slot,
    required VoidCallback onSwap,
    required VoidCallback onLogElse,
    required VoidCallback onSkip,
  }) {
    return MealOptionsSheet._(
      recipe: recipe,
      slot: slot,
      options: [
        _Option(Icons.shuffle_rounded, 'Swap this meal', onSwap),
        _Option(Icons.edit_note_rounded, 'Log something else', onLogElse),
        _Option(
          Icons.do_not_disturb_alt_rounded,
          'Skip this meal',
          onSkip,
          color: AppColors.error,
        ),
      ],
    );
  }

  /// Options for a skipped meal — mark eaten, log something else, or swap.
  factory MealOptionsSheet.skipped({
    required RecipeSlim recipe,
    required MealSlot slot,
    required VoidCallback onMarkEaten,
    required VoidCallback onLogElse,
    required VoidCallback onSwap,
  }) {
    return MealOptionsSheet._(
      recipe: recipe,
      slot: slot,
      options: [
        _Option(Icons.check_circle_outline_rounded, 'Mark as eaten',
            onMarkEaten),
        _Option(Icons.edit_note_rounded, 'Log something else', onLogElse),
        _Option(Icons.shuffle_rounded, 'Swap this meal', onSwap),
      ],
    );
  }

  /// The recipe associated with this slot.
  final RecipeSlim recipe;

  /// The meal slot.
  final MealSlot slot;

  /// The ordered options to render.
  final List<_Option> _options;

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
          for (var i = 0; i < _options.length; i++) ...[
            if (i > 0) const Divider(height: 1, color: AppColors.creamBorder),
            _OptRow(
              icon: _options[i].icon,
              label: _options[i].label,
              color: _options[i].color,
              onTap: () {
                Navigator.of(context).pop();
                _options[i].onTap();
              },
            ),
          ],
          const SizedBox(height: AppSpacing.sm),
        ],
      ),
    );
  }
}

/// One row in the options sheet.
class _Option {
  const _Option(this.icon, this.label, this.onTap, {this.color});

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? color;
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
