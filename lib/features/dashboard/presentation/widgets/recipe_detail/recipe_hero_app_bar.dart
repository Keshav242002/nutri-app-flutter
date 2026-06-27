import 'package:ahara/core/config/env.dart';
import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/features/dashboard/domain/models/recipe_detail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// Expanding app bar with a full-bleed hero image.
///
/// The recipe name is deliberately NOT placed on top of the image — it lives
/// in the scroll body below so it is always legible on the cream background.
/// The collapsed (pinned) state shows only the back icon on solid navy,
/// eliminating any title/appbar overlap.
class RecipeHeroAppBar extends StatelessWidget {
  /// Creates a [RecipeHeroAppBar].
  const RecipeHeroAppBar({required this.recipe, super.key});

  /// Recipe data driving the image.
  final RecipeDetail recipe;

  @override
  Widget build(BuildContext context) {
    final url = Env.resolveMediaUrl(recipe.imageUrl);
    return SliverAppBar(
      expandedHeight: 280,
      pinned: true,
      // Collapsed: solid navy + back icon only. No title — no overlap.
      backgroundColor: AppColors.navyDeep,
      surfaceTintColor: AppColors.navyDeep,
      iconTheme: const IconThemeData(color: AppColors.white),
      flexibleSpace: FlexibleSpaceBar(
        // No title on the image at all.
        titlePadding: EdgeInsets.zero,
        background: Stack(
          fit: StackFit.expand,
          children: [
            // Full-bleed hero image.
            if (url != null && url.isNotEmpty)
              CachedNetworkImage(
                imageUrl: url,
                fit: BoxFit.cover,
                placeholder: (_, __) =>
                    const ColoredBox(color: AppColors.navyMid),
                errorWidget: (_, __, ___) => _heroPlaceholder(),
              )
            else
              _heroPlaceholder(),
            // Cream scrim at the bottom so the image fades into the
            // content area without a jarring hard edge.
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 80,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      const Color(0xFFF5F0E8).withValues(alpha: 0.95),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _heroPlaceholder() {
  return Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF1A2340), Color(0xFF0D1520)],
      ),
    ),
    child: Center(
      child: Icon(
        Icons.restaurant_rounded,
        color: Colors.white.withValues(alpha: 0.18),
        size: 64,
      ),
    ),
  );
}
