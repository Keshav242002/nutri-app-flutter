import 'package:ahara/core/network/api_exceptions.dart';
import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/core/widgets/error_state.dart';
import 'package:ahara/core/widgets/loading_state.dart';
import 'package:ahara/features/dashboard/domain/models/nutrition_summary.dart';
import 'package:ahara/features/dashboard/domain/models/recipe_detail.dart';
import 'package:ahara/features/dashboard/presentation/controllers/recipe_detail_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Full-page recipe detail screen.
class RecipeDetailScreen extends ConsumerWidget {
  /// Creates a [RecipeDetailScreen].
  const RecipeDetailScreen({required this.slug, super.key});

  /// The recipe slug used to fetch details.
  final String slug;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(recipeDetailControllerProvider(slug));

    return Scaffold(
      backgroundColor: AppColors.cream,
      body: state.when(
        loading: () => const LoadingState(),
        error: (Object e, __) => Scaffold(
          appBar: AppBar(backgroundColor: AppColors.cream, elevation: 0),
          backgroundColor: AppColors.cream,
          body: ErrorState(
            exception: e is AppException
                ? e
                : UnknownException(message: e.toString()),
            onRetry: () =>
                ref.invalidate(recipeDetailControllerProvider(slug)),
          ),
        ),
        data: (recipe) => _RecipeBody(recipe: recipe),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Body
// ---------------------------------------------------------------------------

class _RecipeBody extends StatelessWidget {
  const _RecipeBody({required this.recipe});

  final RecipeDetail recipe;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _HeroAppBar(recipe: recipe),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.screenHorizontal,
            AppSpacing.lg,
            AppSpacing.screenHorizontal,
            AppSpacing.xxl,
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              _MetaRow(recipe: recipe),
              const SizedBox(height: AppSpacing.lg),
              if (recipe.cachedNutritionSummary != null) ...[
                _NutritionCard(nutrition: recipe.cachedNutritionSummary!),
                const SizedBox(height: AppSpacing.lg),
              ],
              if (recipe.ingredients.isNotEmpty) ...[
                const _SectionTitle(title: 'Ingredients'),
                const SizedBox(height: AppSpacing.sm),
                _IngredientList(ingredients: recipe.ingredients),
                const SizedBox(height: AppSpacing.lg),
              ],
              if (recipe.instructions.isNotEmpty) ...[
                const _SectionTitle(title: 'Instructions'),
                const SizedBox(height: AppSpacing.sm),
                _InstructionList(steps: recipe.instructions),
              ],
              if (recipe.dietTags.isNotEmpty) ...[
                const SizedBox(height: AppSpacing.lg),
                _TagRow(label: 'Diet', tags: recipe.dietTags),
              ],
              if (recipe.allergenTags.isNotEmpty) ...[
                const SizedBox(height: AppSpacing.sm),
                _TagRow(label: 'Allergens', tags: recipe.allergenTags),
              ],
            ]),
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Hero app bar
// ---------------------------------------------------------------------------

class _HeroAppBar extends StatelessWidget {
  const _HeroAppBar({required this.recipe});

  final RecipeDetail recipe;

  @override
  Widget build(BuildContext context) {
    final url = recipe.imageUrl;
    return SliverAppBar(
      expandedHeight: 260,
      pinned: true,
      backgroundColor: AppColors.navyDeep,
      surfaceTintColor: AppColors.navyDeep,
      iconTheme: const IconThemeData(color: AppColors.white),
      flexibleSpace: FlexibleSpaceBar(
        background: url != null && url.isNotEmpty
            ? CachedNetworkImage(
                imageUrl: url,
                fit: BoxFit.cover,
                placeholder: (_, __) =>
                    const ColoredBox(color: AppColors.navyMid),
                errorWidget: (_, __, ___) => const ColoredBox(
                  color: AppColors.navyMid,
                  child: Icon(
                    Icons.image_not_supported_rounded,
                    color: AppColors.textOnDarkSecondary,
                    size: 48,
                  ),
                ),
              )
            : const ColoredBox(
                color: AppColors.navyMid,
                child: Icon(
                  Icons.image_not_supported_rounded,
                  color: AppColors.textOnDarkSecondary,
                  size: 48,
                ),
              ),
        title: Text(
          recipe.name,
          style: AppTypography.headingMedium.copyWith(color: AppColors.white),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        titlePadding: const EdgeInsetsDirectional.fromSTEB(16, 0, 72, 16),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Meta row — prep time, servings, difficulty
// ---------------------------------------------------------------------------

class _MetaRow extends StatelessWidget {
  const _MetaRow({required this.recipe});

  final RecipeDetail recipe;

  @override
  Widget build(BuildContext context) {
    final totalMin = recipe.prepTimeMin + recipe.cookTimeMin;
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.xs,
      children: [
        _Chip(
          icon: Icons.timer_outlined,
          label: '$totalMin min',
        ),
        _Chip(
          icon: Icons.people_outline_rounded,
          label: '${recipe.servings} servings',
        ),
        _Chip(
          icon: Icons.bar_chart_rounded,
          label: recipe.estimatedDifficulty,
        ),
        _Chip(
          icon: Icons.local_fire_department_outlined,
          label: recipe.spiceLevel,
        ),
      ],
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.creamBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: AppColors.textSecondary),
          const SizedBox(width: 4),
          Text(
            label,
            style: AppTypography.caption.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Nutrition summary card
// ---------------------------------------------------------------------------

class _NutritionCard extends StatelessWidget {
  const _NutritionCard({required this.nutrition});

  final NutritionSummary nutrition;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.creamBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nutrition per serving',
            style: AppTypography.labelMedium.copyWith(
              color: AppColors.navyDeep,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _MacroCell(
                label: 'Calories',
                value: nutrition.calories.round().toString(),
                unit: 'kcal',
                color: AppColors.turmeric,
              ),
              _MacroCell(
                label: 'Protein',
                value: nutrition.proteinG.toStringAsFixed(1),
                unit: 'g',
                color: AppColors.macroProtein,
              ),
              _MacroCell(
                label: 'Carbs',
                value: nutrition.carbsG.toStringAsFixed(1),
                unit: 'g',
                color: AppColors.macroCarbs,
              ),
              _MacroCell(
                label: 'Fat',
                value: nutrition.fatG.toStringAsFixed(1),
                unit: 'g',
                color: AppColors.macroFat,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MacroCell extends StatelessWidget {
  const _MacroCell({
    required this.label,
    required this.value,
    required this.unit,
    required this.color,
  });

  final String label;
  final String value;
  final String unit;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: AppTypography.headingMedium.copyWith(color: color),
        ),
        Text(
          unit,
          style: AppTypography.caption.copyWith(color: color),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: AppTypography.caption.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Section title
// ---------------------------------------------------------------------------

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTypography.headingMedium.copyWith(color: AppColors.navyDeep),
    );
  }
}

// ---------------------------------------------------------------------------
// Ingredient list
// ---------------------------------------------------------------------------

class _IngredientList extends StatelessWidget {
  const _IngredientList({required this.ingredients});

  final List<RecipeIngredient> ingredients;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: ingredients
          .map((ing) => _IngredientRow(ingredient: ing))
          .toList(),
    );
  }
}

class _IngredientRow extends StatelessWidget {
  const _IngredientRow({required this.ingredient});

  final RecipeIngredient ingredient;

  @override
  Widget build(BuildContext context) {
    final qty = ingredient.displayQuantity;
    final unit = ingredient.displayUnitName ?? '';
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 6,
            margin: const EdgeInsets.only(right: AppSpacing.sm, top: 2),
            decoration: const BoxDecoration(
              color: AppColors.turmeric,
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Text(
              ingredient.ingredientName,
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.navyDeep,
              ),
            ),
          ),
          Text(
            unit.isEmpty ? qty : '$qty $unit',
            style: AppTypography.caption.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Instruction list
// ---------------------------------------------------------------------------

class _InstructionList extends StatelessWidget {
  const _InstructionList({required this.steps});

  final List<String> steps;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: steps.asMap().entries.map((entry) {
        return _InstructionStep(number: entry.key + 1, text: entry.value);
      }).toList(),
    );
  }
}

class _InstructionStep extends StatelessWidget {
  const _InstructionStep({required this.number, required this.text});

  final int number;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 28,
            height: 28,
            margin: const EdgeInsets.only(right: AppSpacing.sm),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.turmeric.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: Text(
              '$number',
              style: AppTypography.caption.copyWith(
                color: AppColors.turmeric,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.navyDeep,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Tag row
// ---------------------------------------------------------------------------

class _TagRow extends StatelessWidget {
  const _TagRow({required this.label, required this.tags});

  final String label;
  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 4, right: AppSpacing.sm),
          child: Text(
            '$label:',
            style: AppTypography.caption.copyWith(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(
          child: Wrap(
            spacing: AppSpacing.xs,
            runSpacing: AppSpacing.xs,
            children: tags.map((t) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: 3,
                ),
                decoration: BoxDecoration(
                  color: AppColors.turmeric.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  t,
                  style: AppTypography.caption.copyWith(
                    color: AppColors.turmeric,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
