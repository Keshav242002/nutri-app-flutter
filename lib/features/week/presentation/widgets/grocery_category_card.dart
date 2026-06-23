import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/features/week/domain/models/grocery_list.dart';
import 'package:ahara/features/week/presentation/widgets/grocery_item_row.dart';
import 'package:flutter/material.dart';

/// Collapsible accordion card for a single grocery category.
class GroceryCategoryCard extends StatefulWidget {
  /// Creates a [GroceryCategoryCard].
  const GroceryCategoryCard({
    required this.category,
    required this.checkedItems,
    required this.onToggle,
    super.key,
  });

  /// The grocery category to display.
  final GroceryCategory category;

  /// Map of ingredientAppId → checked state.
  final Map<String, bool> checkedItems;

  /// Called when the user toggles an item.
  final void Function(String ingredientAppId) onToggle;

  @override
  State<GroceryCategoryCard> createState() => _GroceryCategoryCardState();
}

class _GroceryCategoryCardState extends State<GroceryCategoryCard> {
  bool _expanded = true;

  @override
  Widget build(BuildContext context) {
    final cat = widget.category;
    final checkedCount = cat.items
        .where(
          (GroceryItem i) =>
              widget.checkedItems[i.ingredientAppId] ?? false,
        )
        .length;

    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.creamBorder),
      ),
      child: Column(
        children: [
          // Header row
          InkWell(
            onTap: () => setState(() => _expanded = !_expanded),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Row(
                children: [
                  Text(
                    cat.categoryDisplay,
                    style: AppTypography.labelMedium.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.xs),
                  Text(
                    '$checkedCount/${cat.items.length}',
                    style: AppTypography.caption.copyWith(
                      color: AppColors.textHint,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    _expanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: AppColors.textSecondary,
                  ),
                ],
              ),
            ),
          ),
          if (_expanded)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.sm,
              ).copyWith(bottom: AppSpacing.sm),
              child: Column(
                children: cat.items.map((GroceryItem item) {
                  return GroceryItemRow(
                    item: item,
                    isChecked:
                        widget.checkedItems[item.ingredientAppId] ?? false,
                    onToggle: () => widget.onToggle(item.ingredientAppId),
                  );
                }).toList(),
              ),
            ),
        ],
      ),
    );
  }
}
