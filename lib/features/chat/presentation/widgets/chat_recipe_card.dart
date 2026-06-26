import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/core/utils/formatters.dart';
import 'package:ahara/features/chat/domain/models/chat_recipe.dart';
import 'package:flutter/material.dart';

/// Compact inline recipe card shown inside an assistant message.
///
/// The `metadata.recipes[]` summary is a purpose-built compact card (the
/// dashboard `DashboardMealCard` needs a full recipe). Tapping opens the full
/// recipe detail when the backend supplies a slug. Logging is intentionally
/// not offered here — the user logs from Home or Week (see docs/design/chat.md).
class ChatRecipeCard extends StatelessWidget {
  /// Creates a [ChatRecipeCard].
  const ChatRecipeCard({
    required this.recipe,
    required this.onOpen,
    super.key,
  });

  /// The recipe summary to render.
  final ChatRecipe recipe;

  /// Called when the user taps the card to view the full recipe.
  final VoidCallback onOpen;

  String get _meta {
    final type = formatTag(recipe.mealType);
    final servings = recipe.servings % 1 == 0
        ? recipe.servings.toInt().toString()
        : recipe.servings.toString();
    // Free-form recipes carry no nutrition, so the kcal segment is dropped.
    if (recipe.caloriesPerServing == 0) return '$type · serves $servings';
    return '$type · ${recipe.caloriesPerServing} kcal · serves $servings';
  }

  @override
  Widget build(BuildContext context) {
    final hasSlug = recipe.slug.isNotEmpty;
    return GestureDetector(
      onTap: hasSlug ? onOpen : null,
      child: Container(
        margin: const EdgeInsets.only(top: AppSpacing.sm),
        padding: const EdgeInsets.all(AppSpacing.sm),
        decoration: BoxDecoration(
          color: AppColors.creamDeep,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.creamBorder),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Thumb(),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recipe.name,
                        style: AppTypography.headingMedium.copyWith(
                          color: AppColors.navyDeep,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        _meta,
                        style: AppTypography.labelMedium.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                if (hasSlug)
                  const Icon(
                    Icons.chevron_right_rounded,
                    color: AppColors.textHint,
                  ),
              ],
            ),
            if (recipe.description.isNotEmpty) ...[
              const SizedBox(height: AppSpacing.sm),
              Text(
                recipe.description,
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                  height: 1.5,
                ),
                // Free-form cards are the only place to read the recipe, so the
                // description is shown in full; grounded cards clamp it.
                maxLines: recipe.isFreeform ? null : 2,
                overflow: recipe.isFreeform
                    ? TextOverflow.clip
                    : TextOverflow.ellipsis,
              ),
            ],
            if (recipe.isFreeform) _InlineRecipe(recipe: recipe),
            if (hasSlug) ...[
              const SizedBox(height: AppSpacing.xs),
              Text(
                'Tap to view full recipe',
                style: AppTypography.labelMedium.copyWith(
                  color: AppColors.textHint,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Inline ingredients + steps for a free-form (non-persisted) recipe — the
/// only place the user can read it, since there is no detail screen to open.
class _InlineRecipe extends StatelessWidget {
  const _InlineRecipe({required this.recipe});

  final ChatRecipe recipe;

  String _qty(ChatRecipeIngredient ing) {
    final grams = ing.quantityGrams;
    if (grams == null || grams <= 0) return ing.name;
    final amount = grams % 1 == 0 ? grams.toInt().toString() : grams.toString();
    return '${ing.name} · ${amount}g';
  }

  @override
  Widget build(BuildContext context) {
    final label = AppTypography.labelMedium.copyWith(
      color: AppColors.navyDeep,
      fontWeight: FontWeight.w700,
    );
    final body = AppTypography.bodyMedium.copyWith(
      color: AppColors.textSecondary,
      height: 1.5,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (recipe.ingredients.isNotEmpty) ...[
          const SizedBox(height: AppSpacing.sm),
          Text('Ingredients', style: label),
          const SizedBox(height: AppSpacing.xs),
          for (final ing in recipe.ingredients)
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('•  ', style: body),
                  Expanded(child: Text(_qty(ing), style: body)),
                ],
              ),
            ),
        ],
        if (recipe.steps.isNotEmpty) ...[
          const SizedBox(height: AppSpacing.sm),
          Text('Steps', style: label),
          const SizedBox(height: AppSpacing.xs),
          for (var i = 0; i < recipe.steps.length; i++)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${i + 1}.  ', style: body),
                  Expanded(child: Text(recipe.steps[i], style: body)),
                ],
              ),
            ),
        ],
      ],
    );
  }
}

class _Thumb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: AppColors.navyDeep,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(
        Icons.restaurant_rounded,
        color: AppColors.textOnDarkSecondary,
        size: 24,
      ),
    );
  }
}
