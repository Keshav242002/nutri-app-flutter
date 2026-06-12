import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_radius.dart';
import 'package:ahara/core/theme/app_shadows.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// Recipe summary card for the dashboard.
///
/// Shows image, name, calories, and macros.
class MealCard extends StatelessWidget {
  /// Creates a [MealCard].
  const MealCard({
    required this.name,
    required this.calories,
    super.key,
    this.imageUrl,
    this.protein,
    this.carbs,
    this.fat,
    this.onTap,
  });

  /// Recipe name.
  final String name;

  /// Calorie count.
  final int calories;

  /// Remote image URL.
  final String? imageUrl;

  /// Protein in grams.
  final double? protein;

  /// Carbs in grams.
  final double? carbs;

  /// Fat in grams.
  final double? fat;

  /// Callback on tap.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          color: AppColors.creamDeep,
          borderRadius: AppRadius.card,
          border: Border.all(color: AppColors.creamBorder),
          boxShadow: AppShadows.card,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(AppRadius.lg),
              ),
              child: _image(),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: AppTypography.labelLarge.copyWith(
                      color: AppColors.textPrimary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$calories kcal',
                    style: AppTypography.caption.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  if (protein != null || carbs != null || fat != null)
                    _macroRow(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _image() {
    if (imageUrl == null) {
      return Container(
        height: 120,
        color: AppColors.navyDeep,
        child: const Center(
          child: Icon(
            Icons.restaurant_menu_rounded,
            color: AppColors.textOnDarkSecondary,
            size: 32,
          ),
        ),
      );
    }
    return CachedNetworkImage(
      imageUrl: imageUrl!,
      height: 120,
      width: double.infinity,
      fit: BoxFit.cover,
      placeholder: (_, __) => Container(height: 120, color: AppColors.navyDeep),
      errorWidget: (_, __, ___) => Container(
        height: 120,
        color: AppColors.creamBorder,
        child: const Icon(
          Icons.broken_image_outlined,
          color: AppColors.textHint,
        ),
      ),
    );
  }

  Widget _macroRow() {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Row(
        children: [
          if (protein != null) _macroChip('P ${protein!.toStringAsFixed(0)}g'),
          if (carbs != null) _macroChip('C ${carbs!.toStringAsFixed(0)}g'),
          if (fat != null) _macroChip('F ${fat!.toStringAsFixed(0)}g'),
        ],
      ),
    );
  }

  Widget _macroChip(String text) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(
          color: AppColors.creamBorder,
          borderRadius: BorderRadius.circular(AppRadius.xs),
        ),
        child: Text(
          text,
          style: AppTypography.caption.copyWith(color: AppColors.textSecondary),
        ),
      ),
    );
  }
}
