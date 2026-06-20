import 'package:ahara/core/providers/toast_provider.dart';
import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/core/widgets/app_button.dart';
import 'package:ahara/core/widgets/app_modal_sheet.dart';
import 'package:ahara/core/widgets/app_text_field.dart';
import 'package:ahara/features/dashboard/domain/models/meal_card_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Sheet for logging a custom meal with description and calorie count.
class CustomMealSheet extends ConsumerStatefulWidget {
  /// Creates a [CustomMealSheet].
  const CustomMealSheet({
    required this.slot,
    required this.onLog,
    super.key,
  });

  /// The meal slot being logged.
  final MealSlot slot;

  /// Called with description and kcal (and optionally macros) on confirm.
  final void Function(
    String description,
    int kcal, {
    double? protein,
    double? carbs,
    double? fat,
  }) onLog;

  @override
  ConsumerState<CustomMealSheet> createState() => _CustomMealSheetState();
}

class _CustomMealSheetState extends ConsumerState<CustomMealSheet> {
  final _descCtrl = TextEditingController();
  final _kcalCtrl = TextEditingController();

  @override
  void dispose() {
    _descCtrl.dispose();
    _kcalCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    final desc = _descCtrl.text.trim();
    final kcalStr = _kcalCtrl.text.trim();

    if (desc.isEmpty) {
      ref.read(toastProvider.notifier).show('Please enter a dish name.');
      return;
    }
    final kcal = int.tryParse(kcalStr);
    if (kcal == null || kcal <= 0) {
      ref
          .read(toastProvider.notifier)
          .show('Please enter a valid calorie count.');
      return;
    }

    Navigator.of(context).pop();
    widget.onLog(desc, kcal);
  }

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
            'What did you eat?',
            style: AppTypography.headingMedium.copyWith(
              color: AppColors.navyDeep,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          AppTextField(
            controller: _descCtrl,
            placeholder: 'Dish name',
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: AppSpacing.sm),
          AppTextField(
            controller: _kcalCtrl,
            placeholder: 'Calories (kcal)',
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => _submit(),
          ),
          const SizedBox(height: AppSpacing.lg),
          AppButton(label: 'Log this meal', onPressed: _submit),
        ],
      ),
    );
  }
}
