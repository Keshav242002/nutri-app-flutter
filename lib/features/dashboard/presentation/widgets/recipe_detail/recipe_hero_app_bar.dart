import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/features/dashboard/domain/models/recipe_detail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// Expanding app bar with hero image for the recipe detail screen.
class RecipeHeroAppBar extends StatelessWidget {
  /// Creates a [RecipeHeroAppBar].
  const RecipeHeroAppBar({required this.recipe, super.key});

  /// Recipe data driving the title and image.
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
