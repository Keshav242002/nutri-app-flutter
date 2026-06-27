import 'package:ahara/core/network/api_exceptions.dart';
import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/core/widgets/error_state.dart';
import 'package:ahara/core/widgets/loading_state.dart';
import 'package:ahara/features/dashboard/domain/models/recipe_detail.dart';
import 'package:ahara/features/dashboard/presentation/controllers/recipe_detail_controller.dart';
import 'package:ahara/features/dashboard/presentation/widgets/recipe_detail/recipe_hero_app_bar.dart';
import 'package:ahara/features/dashboard/presentation/widgets/recipe_detail/recipe_ingredient_list.dart';
import 'package:ahara/features/dashboard/presentation/widgets/recipe_detail/recipe_instruction_list.dart';
import 'package:ahara/features/dashboard/presentation/widgets/recipe_detail/recipe_meta_row.dart';
import 'package:ahara/features/dashboard/presentation/widgets/recipe_detail/recipe_nutrition_card.dart';
import 'package:ahara/features/dashboard/presentation/widgets/recipe_detail/recipe_section_title.dart';
import 'package:ahara/features/dashboard/presentation/widgets/recipe_detail/recipe_tag_row.dart';
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

class _RecipeBody extends StatelessWidget {
  const _RecipeBody({required this.recipe});

  final RecipeDetail recipe;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        RecipeHeroAppBar(recipe: recipe),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.screenHorizontal,
            AppSpacing.md,
            AppSpacing.screenHorizontal,
            AppSpacing.xxl,
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              // Recipe name lives here — always readable on cream, never
              // fighting with a photo background.
              Text(
                recipe.name,
                style: AppTypography.displayMedium.copyWith(
                  color: AppColors.navyDeep,
                ),
              ),
              if (recipe.nameAlt != null && recipe.nameAlt!.isNotEmpty) ...[
                const SizedBox(height: 4),
                Text(
                  recipe.nameAlt!,
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
              const SizedBox(height: AppSpacing.md),
              RecipeMetaRow(recipe: recipe),
              const SizedBox(height: AppSpacing.lg),
              if (recipe.cachedNutritionSummary != null) ...[
                RecipeNutritionCard(nutrition: recipe.cachedNutritionSummary!),
                const SizedBox(height: AppSpacing.lg),
              ],
              if (recipe.ingredients.isNotEmpty) ...[
                const RecipeSectionTitle(title: 'Ingredients'),
                const SizedBox(height: AppSpacing.sm),
                RecipeIngredientList(ingredients: recipe.ingredients),
                const SizedBox(height: AppSpacing.lg),
              ],
              if (recipe.instructions.isNotEmpty) ...[
                const RecipeSectionTitle(title: 'Instructions'),
                const SizedBox(height: AppSpacing.sm),
                RecipeInstructionList(steps: recipe.instructions),
              ],
              if (recipe.dietTags.isNotEmpty) ...[
                const SizedBox(height: AppSpacing.lg),
                RecipeTagRow(label: 'Diet', tags: recipe.dietTags),
              ],
              if (recipe.allergenTags.isNotEmpty) ...[
                const SizedBox(height: AppSpacing.sm),
                RecipeTagRow(label: 'Allergens', tags: recipe.allergenTags),
              ],
            ]),
          ),
        ),
      ],
    );
  }
}
