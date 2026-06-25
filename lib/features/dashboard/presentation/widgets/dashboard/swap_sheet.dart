import 'dart:async';

import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/core/widgets/app_modal_sheet.dart';
import 'package:ahara/features/dashboard/domain/models/recipe_slim.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// Sheet shown while regenerating a meal slot.
///
/// Fires the swap request on open (loading shimmer), then shows a confirmation
/// once the new recipe arrives. The swap is committed via [onApply] when the
/// sheet is dismissed — either manually or by the 2-second auto-close.
class SwapSheet extends StatefulWidget {
  /// Creates a [SwapSheet].
  const SwapSheet({
    required this.onLoad,
    required this.onApply,
    super.key,
  });

  /// Fires the regenerate-slot request. Returns the new recipe, or `null` on
  /// failure (the controller is responsible for surfacing the error).
  final Future<RecipeSlim?> Function() onLoad;

  /// Commits the swapped recipe once the user dismisses the confirmation.
  final void Function(RecipeSlim recipe) onApply;

  @override
  State<SwapSheet> createState() => _SwapSheetState();
}

class _SwapSheetState extends State<SwapSheet> {
  RecipeSlim? _result;
  bool _applied = false;
  Timer? _autoClose;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final recipe = await widget.onLoad();
    if (!mounted) return;
    if (recipe == null) {
      // Failure — the controller already showed an error toast. Just close.
      Navigator.of(context).pop();
      return;
    }
    setState(() => _result = recipe);
    _autoClose = Timer(const Duration(seconds: 2), () {
      if (mounted) Navigator.of(context).pop();
    });
  }

  @override
  void dispose() {
    _autoClose?.cancel();
    // Commit on any dismissal (manual or auto-close), exactly once.
    // Deferred off the dispose frame: modifying a provider during a widget
    // life-cycle (dispose runs inside the build/finalize phase) is illegal in
    // Riverpod and throws "Tried to modify a provider while the widget tree
    // was building", which corrupts the frame pipeline. Scheduling it in a
    // `Future` runs the commit after the tree is done building.
    final recipe = _result;
    if (recipe != null && !_applied) {
      _applied = true;
      final onApply = widget.onApply;
      Future(() => onApply(recipe));
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final result = _result;
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
          if (result == null) ...[
            _Shimmer(),
            const SizedBox(height: AppSpacing.md),
          ] else ...[
            _RecipeMiniCard(recipe: result),
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                const Icon(
                  Icons.check_circle_rounded,
                  color: AppColors.success,
                  size: 20,
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Text(
                    'Meal swapped!',
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.navyDeep,
                    ),
                  ),
                ),
              ],
            ),
          ],
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
