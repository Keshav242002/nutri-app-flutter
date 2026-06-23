import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/core/widgets/empty_state.dart';
import 'package:ahara/core/widgets/loading_state.dart';
import 'package:ahara/features/week/domain/models/grocery_list.dart';
import 'package:ahara/features/week/presentation/widgets/grocery_category_card.dart';
import 'package:flutter/material.dart';

/// Grocery section of the week tab — accordion list with refresh button.
class WeekGrocerySection extends StatelessWidget {
  /// Creates a [WeekGrocerySection].
  const WeekGrocerySection({
    required this.groceryList,
    required this.isLoading,
    required this.hasError,
    required this.checkedItems,
    required this.onRefresh,
    required this.onLoad,
    required this.onToggleItem,
    super.key,
  });

  /// The current grocery list, or null if not loaded yet.
  final GroceryList? groceryList;

  /// Whether the grocery list is loading.
  final bool isLoading;

  /// Whether a load error occurred (no list available to show).
  final bool hasError;

  /// Map of ingredientAppId → checked state.
  final Map<String, bool> checkedItems;

  /// Called when the refresh button is tapped.
  final VoidCallback onRefresh;

  /// Called to lazily load the grocery list.
  final VoidCallback onLoad;

  /// Called when the user toggles a grocery item.
  final void Function(String id) onToggleItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenHorizontal,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppSpacing.lg),
          Row(
            children: [
              Text(
                'Grocery List',
                style: AppTypography.headingLarge.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
              const Spacer(),
              if (groceryList != null || isLoading)
                IconButton(
                  onPressed: isLoading ? null : onRefresh,
                  icon: isLoading
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(
                          Icons.refresh,
                          color: AppColors.textSecondary,
                        ),
                  tooltip: 'Refresh grocery list',
                ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          _body(),
          const SizedBox(height: AppSpacing.xl),
        ],
      ),
    );
  }

  Widget _body() {
    if (groceryList == null && !isLoading && !hasError) {
      // Not yet triggered — show a load button.
      return GestureDetector(
        onTap: onLoad,
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.lg),
          decoration: BoxDecoration(
            color: AppColors.creamDeep,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.creamBorder),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.shopping_basket_outlined,
                color: AppColors.textSecondary,
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                'Tap to load grocery list',
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (isLoading && groceryList == null) {
      return const LoadingState();
    }

    if (hasError && groceryList == null) {
      return const EmptyState(
        message: 'Generate a meal plan first to see your grocery list',
      );
    }

    final list = groceryList!;
    if (list.categories.isEmpty) {
      return const EmptyState(message: 'No items in your grocery list');
    }

    return Column(
      children: list.categories.map((GroceryCategory cat) {
        return GroceryCategoryCard(
          category: cat,
          checkedItems: checkedItems,
          onToggle: onToggleItem,
        );
      }).toList(),
    );
  }
}
