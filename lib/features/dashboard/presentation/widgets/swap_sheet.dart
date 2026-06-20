import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/core/widgets/app_button.dart';
import 'package:ahara/core/widgets/app_modal_sheet.dart';
import 'package:ahara/features/dashboard/domain/models/recipe_slim.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// Sheet shown while regenerating a meal slot — loading shimmer → result.
class SwapSheet extends StatelessWidget {
  /// Creates a [SwapSheet].
  const SwapSheet({
    required this.isLoading,
    required this.onAccept,
    required this.onKeep,
    super.key,
    this.swapResult,
    this.swapLimitReached = false,
  });

  /// Whether a swap request is in flight.
  final bool isLoading;

  /// The new recipe returned by regenerate-slot, if available.
  final RecipeSlim? swapResult;

  /// Whether the swap rate limit was exceeded.
  final bool swapLimitReached;

  /// Called when the user accepts the new recipe.
  final VoidCallback onAccept;

  /// Called when the user wants to keep the original recipe.
  final VoidCallback onKeep;

  @override
  Widget build(BuildContext context) {
    return AppModalSheet(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Swap meal',
            style: AppTypography.headingMedium.copyWith(
              color: AppColors.navyDeep,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          if (swapLimitReached) ...[
            _RateLimitMessage(),
            const SizedBox(height: AppSpacing.md),
            _KeepButton(onKeep: onKeep),
          ] else if (isLoading) ...[
            _Shimmer(),
            const SizedBox(height: AppSpacing.md),
          ] else if (swapResult != null) ...[
            _RecipeMiniCard(recipe: swapResult!),
            const SizedBox(height: AppSpacing.md),
            AppButton(label: 'Accept swap', onPressed: onAccept),
            const SizedBox(height: AppSpacing.sm),
            _KeepButton(onKeep: onKeep),
          ] else ...[
            _Shimmer(),
          ],
        ],
      ),
    );
  }
}

class _RateLimitMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.errorLight,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.info_outline_rounded,
            color: AppColors.error,
            size: 20,
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              "You've used your swaps for this slot "
              'this week — back next week!',
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.error,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Shimmer extends StatefulWidget {
  @override
  State<_Shimmer> createState() => _ShimmerState();
}

class _ShimmerState extends State<_Shimmer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
    _anim = _ctrl;
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _anim,
      builder: (_, __) {
        final shimmer = LinearGradient(
          begin: const Alignment(-1.5, 0),
          end: const Alignment(1.5, 0),
          colors: const [
            AppColors.creamBorder,
            AppColors.cream,
            AppColors.creamBorder,
          ],
          stops: [
            (_anim.value - 0.3).clamp(0.0, 1.0),
            _anim.value.clamp(0.0, 1.0),
            (_anim.value + 0.3).clamp(0.0, 1.0),
          ],
        );
        return Column(
          children: List.generate(
            3,
            (i) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: Container(
                height: i == 0 ? 120 : 20,
                decoration: BoxDecoration(
                  gradient: shimmer,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _RecipeMiniCard extends StatelessWidget {
  const _RecipeMiniCard({required this.recipe});
  final RecipeSlim recipe;

  @override
  Widget build(BuildContext context) {
    final url = recipe.imageUrl;
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: AppColors.navyDeep,
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (url != null && url.isNotEmpty)
            CachedNetworkImage(
              imageUrl: url,
              fit: BoxFit.cover,
              placeholder: (_, __) => const ColoredBox(
                color: AppColors.navyMid,
              ),
              errorWidget: (_, __, ___) => const Icon(
                Icons.image_not_supported_rounded,
                color: AppColors.textOnDarkSecondary,
              ),
            ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    AppColors.navyDeep.withValues(alpha: 0.7),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 12,
            right: 12,
            bottom: 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recipe.name,
                  style: AppTypography.labelLarge.copyWith(
                    color: AppColors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${recipe.cachedCaloriesPerServing} kcal',
                  style: AppTypography.caption.copyWith(
                    color: AppColors.textOnDarkSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _KeepButton extends StatelessWidget {
  const _KeepButton({required this.onKeep});
  final VoidCallback onKeep;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onKeep,
      child: Center(
        child: Text(
          'Keep original',
          style: AppTypography.labelMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}
