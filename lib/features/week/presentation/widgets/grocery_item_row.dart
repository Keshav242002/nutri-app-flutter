import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/features/week/domain/models/grocery_list.dart';
import 'package:flutter/material.dart';

/// A single row in the grocery accordion — checkbox + name + quantity.
class GroceryItemRow extends StatelessWidget {
  /// Creates a [GroceryItemRow].
  const GroceryItemRow({
    required this.item,
    required this.isChecked,
    required this.onToggle,
    super.key,
  });

  /// The grocery item to display.
  final GroceryItem item;

  /// Whether the item is checked off.
  final bool isChecked;

  /// Called when the checkbox is toggled.
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onToggle,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.xs + 2,
          horizontal: AppSpacing.xs,
        ),
        child: Row(
          children: [
            Checkbox(
              value: isChecked,
              onChanged: (_) => onToggle(),
              activeColor: AppColors.success,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(width: AppSpacing.xs),
            Expanded(
              child: Text(
                item.ingredientName,
                style: AppTypography.bodyMedium.copyWith(
                  color: isChecked
                      ? AppColors.textHint
                      : AppColors.textPrimary,
                  decoration:
                      isChecked ? TextDecoration.lineThrough : null,
                ),
              ),
            ),
            Text(
              item.displayQuantity,
              style: AppTypography.caption.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
