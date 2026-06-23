import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/core/widgets/app_button.dart';
import 'package:ahara/core/widgets/app_modal_sheet.dart';
import 'package:ahara/features/dashboard/domain/models/meal_card_state.dart';
import 'package:ahara/features/dashboard/domain/models/recipe_slim.dart';
import 'package:flutter/material.dart';

/// Bottom sheet for marking a meal as eaten — fraction-button servings picker.
class MarkAsEatenSheet extends StatefulWidget {
  /// Creates a [MarkAsEatenSheet].
  const MarkAsEatenSheet({
    required this.recipe,
    required this.slot,
    required this.onConfirm,
    super.key,
  });

  /// The planned recipe for this slot.
  final RecipeSlim recipe;

  /// The meal slot being logged.
  final MealSlot slot;

  /// Called with the selected serving count when the user confirms.
  final void Function(double servings) onConfirm;

  @override
  State<MarkAsEatenSheet> createState() => _MarkAsEatenSheetState();
}

class _MarkAsEatenSheetState extends State<MarkAsEatenSheet> {
  static const _options = [0.5, 0.75, 1.0, 1.25, 1.5, 2.0];
  double _selected = 1;

  int get _kcal =>
      (widget.recipe.cachedCaloriesPerServing * _selected).round();

  @override
  Widget build(BuildContext context) {
    return AppModalSheet(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.slot.name.toUpperCase(),
            style: AppTypography.eyebrow.copyWith(color: AppColors.turmeric),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            'How much did you eat?',
            style: AppTypography.headingMedium.copyWith(
              color: AppColors.navyDeep,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          _ServingsPicker(
            options: _options,
            selected: _selected,
            onSelect: (v) => setState(() => _selected = v),
          ),
          const SizedBox(height: AppSpacing.md),
          Center(
            child: Text(
              '$_kcal kcal',
              style: AppTypography.headingLarge.copyWith(
                color: AppColors.turmeric,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          AppButton(
            label: 'Done — log it',
            onPressed: () {
              Navigator.of(context).pop();
              widget.onConfirm(_selected);
            },
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Servings fraction-button picker
// ---------------------------------------------------------------------------

class _ServingsPicker extends StatelessWidget {
  const _ServingsPicker({
    required this.options,
    required this.selected,
    required this.onSelect,
  });

  final List<double> options;
  final double selected;
  final void Function(double) onSelect;

  String _label(double v) {
    if (v == 0.5) return '½';
    if (v == 0.75) return '¾';
    if (v == 1.25) return '1¼';
    if (v == 1.5) return '1½';
    return v == v.truncateToDouble() ? '${v.toInt()}' : '$v';
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      alignment: WrapAlignment.center,
      children: options
          .map(
            (v) => GestureDetector(
              onTap: () => onSelect(v),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                width: 52,
                height: 44,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: selected == v
                      ? AppColors.turmeric
                      : AppColors.creamDeep,
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(
                    color: selected == v
                        ? AppColors.turmeric
                        : AppColors.creamBorder,
                  ),
                ),
                child: Text(
                  _label(v),
                  style: AppTypography.labelLarge.copyWith(
                    color: selected == v
                        ? AppColors.navyDeep
                        : AppColors.textSecondary,
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
