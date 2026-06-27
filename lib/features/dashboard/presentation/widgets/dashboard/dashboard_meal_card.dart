import 'package:ahara/core/config/env.dart';
import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/core/utils/formatters.dart';
import 'package:ahara/features/dashboard/domain/models/meal_card_state.dart';
import 'package:ahara/features/dashboard/domain/models/recipe_slim.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// Full-width meal card for the dashboard — renders all 5 visual states.
class DashboardMealCard extends StatefulWidget {
  /// Creates a [DashboardMealCard].
  const DashboardMealCard({
    required this.cardState,
    required this.isCurrentSlot,
    required this.onMarkEaten,
    required this.onOptions,
    required this.onTap,
    required this.onEdit,
    this.interactive = true,
    super.key,
  });

  /// Current visual state of this card.
  final MealCardState cardState;

  /// Whether this slot is the current meal time — shows NOW badge.
  final bool isCurrentSlot;

  /// Called when the user taps "Mark as eaten".
  final VoidCallback onMarkEaten;

  /// Called when the user taps the options (···) button.
  final VoidCallback onOptions;

  /// Called when the user taps the card body to view recipe detail.
  final VoidCallback onTap;

  /// Called when the user taps "Edit" on a skipped card.
  final VoidCallback onEdit;

  /// Whether the card shows action controls (Mark eaten / options / Edit).
  ///
  /// `false` renders a read-only card — used by the Week tab for past and
  /// future days, where only today's meals are actionable.
  final bool interactive;

  @override
  State<DashboardMealCard> createState() => _DashboardMealCardState();
}

class _DashboardMealCardState extends State<DashboardMealCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _nowPulse;

  @override
  void initState() {
    super.initState();
    _nowPulse = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _nowPulse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isSkipped = widget.cardState is SkippedMealCard;
    final isEaten = widget.cardState is EatenMealCard ||
        widget.cardState is SubstitutedMealCard ||
        widget.cardState is CustomMealCard;

    final borderColor = widget.isCurrentSlot && !isEaten
        ? AppColors.turmeric
        : AppColors.creamBorder;
    final borderWidth = widget.isCurrentSlot && !isEaten ? 2.0 : 1.0;

    return GestureDetector(
      onTap: widget.onTap,
      child: Opacity(
        opacity: isSkipped ? 0.5 : 1.0,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: borderColor, width: borderWidth),
            boxShadow: widget.isCurrentSlot && !isEaten
                ? [
                    BoxShadow(
                      color: AppColors.turmeric.withValues(alpha: 0.18),
                      blurRadius: 24,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _CardImage(
                cardState: widget.cardState,
                isCurrentSlot: widget.isCurrentSlot,
                nowPulse: _nowPulse,
              ),
              _CardBody(
                cardState: widget.cardState,
                isCurrentSlot: widget.isCurrentSlot,
                interactive: widget.interactive,
                onMarkEaten: widget.onMarkEaten,
                onOptions: widget.onOptions,
                onEdit: widget.onEdit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Card image section
// ---------------------------------------------------------------------------

class _CardImage extends StatelessWidget {
  const _CardImage({
    required this.cardState,
    required this.isCurrentSlot,
    required this.nowPulse,
  });

  final MealCardState cardState;
  final bool isCurrentSlot;
  final AnimationController nowPulse;

  String? get _imageUrl => cardState.when(
        planned: (recipe, _) => Env.resolveMediaUrl(recipe.imageUrl),
        eaten: (recipe, _, __) => Env.resolveMediaUrl(recipe.imageUrl),
        loggedSubstituted: (recipe, _) => Env.resolveMediaUrl(recipe.imageUrl),
        loggedCustom: (__, _, ___) => null,
        skipped: (recipe, _) => Env.resolveMediaUrl(recipe.imageUrl),
      );

  String get _slotLabel => cardState.when(
        planned: (_, slot) => slot.name,
        eaten: (_, slot, __) => slot.name,
        loggedSubstituted: (_, slot) => slot.name,
        loggedCustom: (_, __, slot) => slot.name,
        skipped: (_, slot) => slot.name,
      );

  int? get _kcal => cardState.when(
        planned: (recipe, _) => recipe.cachedCaloriesPerServing,
        eaten: (recipe, _, __) => recipe.cachedCaloriesPerServing,
        loggedSubstituted: (recipe, _) => recipe.cachedCaloriesPerServing,
        loggedCustom: (_, kcal, __) => kcal,
        skipped: (recipe, _) => recipe.cachedCaloriesPerServing,
      );

  @override
  Widget build(BuildContext context) {
    final url = _imageUrl;
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
      child: Stack(
        children: [
          SizedBox(
            height: 168,
            width: double.infinity,
            child: url != null && url.isNotEmpty
                ? CachedNetworkImage(
                    imageUrl: url,
                    fit: BoxFit.cover,
                    placeholder: (_, __) => const ColoredBox(
                      color: AppColors.navyDeep,
                    ),
                    errorWidget: (_, __, ___) => _FoodPlaceholder(),
                  )
                : _FoodPlaceholder(),
          ),
          // Gradient overlay
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    AppColors.navyDeep.withValues(alpha: 0.55),
                  ],
                ),
              ),
            ),
          ),
          // Top-left: NOW or Eaten badge
          Positioned(
            top: 10,
            left: 10,
            child: _topLeftBadge(),
          ),
          // Top-right: slot label
          Positioned(
            top: 10,
            right: 10,
            child: _SlotLabel(label: _slotLabel.toUpperCase()),
          ),
          // Bottom-right: kcal
          if (_kcal != null)
            Positioned(
              bottom: 10,
              right: 10,
              child: _KcalBadge(kcal: _kcal!),
            ),
        ],
      ),
    );
  }

  Widget _topLeftBadge() {
    final isEaten = cardState is EatenMealCard ||
        cardState is SubstitutedMealCard ||
        cardState is CustomMealCard;
    if (isEaten) return const _EatenBadge();
    if (isCurrentSlot) return _NowBadge(pulse: nowPulse);
    return const SizedBox.shrink();
  }
}

// ---------------------------------------------------------------------------
// Food placeholder — shown when a recipe has no image
// ---------------------------------------------------------------------------

class _FoodPlaceholder extends StatelessWidget {
  const _FoodPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1A2340),
            Color(0xFF0D1520),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.restaurant_rounded,
            color: Colors.white.withValues(alpha: 0.2),
            size: 48,
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Card body / action row
// ---------------------------------------------------------------------------

class _CardBody extends StatelessWidget {
  const _CardBody({
    required this.cardState,
    required this.isCurrentSlot,
    required this.interactive,
    required this.onMarkEaten,
    required this.onOptions,
    required this.onEdit,
  });

  final MealCardState cardState;
  final bool isCurrentSlot;
  final bool interactive;
  final VoidCallback onMarkEaten;
  final VoidCallback onOptions;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    final recipe = _recipe;
    final action = _actionRow();
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _title,
            style: AppTypography.headingMedium.copyWith(
              color: AppColors.navyDeep,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          if (recipe != null) ...[
            const SizedBox(height: AppSpacing.sm),
            _ChipRow(recipe: recipe),
          ],
          if (action != null) ...[
            const SizedBox(height: AppSpacing.md),
            action,
          ],
        ],
      ),
    );
  }

  static String _servingsLabel(double servings) {
    final n = servings % 1 == 0 ? '${servings.toInt()}' : '$servings';
    final suffix = servings == 1.0 ? 'serving' : 'servings';
    return '$n $suffix';
  }

  String get _title => cardState.when(
        planned: (recipe, _) => recipe.name,
        eaten: (recipe, _, __) => recipe.name,
        loggedSubstituted: (recipe, _) => recipe.name,
        loggedCustom: (desc, _, __) => desc.isEmpty ? 'Custom meal' : desc,
        skipped: (recipe, _) => recipe.name,
      );

  /// The recipe driving the chip row, or null for a custom-logged meal.
  RecipeSlim? get _recipe => cardState.when(
        planned: (recipe, _) => recipe,
        eaten: (recipe, _, __) => recipe,
        loggedSubstituted: (recipe, _) => recipe,
        loggedCustom: (_, __, ___) => null,
        skipped: (recipe, _) => recipe,
      );

  /// The action row, or null when there's nothing to show (read-only states).
  Widget? _actionRow() {
    return cardState.when(
      planned: (_, __) => interactive
          ? Row(
              children: [
                Expanded(
                  child: _ActionButton(
                    label: 'Mark as eaten',
                    onTap: onMarkEaten,
                    primary: true,
                  ),
                ),
                const SizedBox(width: 8),
                _OptionsButton(onTap: onOptions),
              ],
            )
          : null,
      eaten: (_, __, double servings) => Row(
        children: [
          _InfoChip(label: _servingsLabel(servings)),
          if (interactive) ...[
            const Spacer(),
            _TextLink(label: 'Edit', onTap: onMarkEaten),
          ],
        ],
      ),
      loggedSubstituted: (_, __) => const _InfoChip(label: 'Substituted'),
      loggedCustom: (_, __, ___) => const _InfoChip(label: 'Custom meal'),
      skipped: (_, __) =>
          interactive ? _TextLink(label: 'Edit', onTap: onEdit) : null,
    );
  }
}

/// Meta chips below the title — cuisine, prep time, protein source.
class _ChipRow extends StatelessWidget {
  const _ChipRow({required this.recipe});

  final RecipeSlim recipe;

  @override
  Widget build(BuildContext context) {
    final protein = recipe.proteinSource;
    final chips = <Widget>[
      if (recipe.cuisine.isNotEmpty)
        _MetaChip(label: formatTag(recipe.cuisine)),
      if (recipe.prepTimeMin > 0)
        _MetaChip(
          label: '${recipe.prepTimeMin} min',
          icon: Icons.schedule_rounded,
        ),
      if (protein != null && protein.isNotEmpty && protein != 'none')
        _MetaChip(label: formatTag(protein)),
    ];
    if (chips.isEmpty) return const SizedBox.shrink();
    return Wrap(
      spacing: AppSpacing.xs,
      runSpacing: AppSpacing.xs,
      children: chips,
    );
  }
}

class _MetaChip extends StatelessWidget {
  const _MetaChip({required this.label, this.icon});

  final String label;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.creamDeep,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 12, color: AppColors.textSecondary),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: AppTypography.caption.copyWith(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Badge widgets
// ---------------------------------------------------------------------------

class _SlotLabel extends StatelessWidget {
  const _SlotLabel({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ColorFilter.mode(
          Colors.black.withValues(alpha: 0),
          BlendMode.multiply,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            label,
            style: AppTypography.caption.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.8,
            ),
          ),
        ),
      ),
    );
  }
}

class _KcalBadge extends StatelessWidget {
  const _KcalBadge({required this.kcal});
  final int kcal;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.navyDeep.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.local_fire_department_rounded,
              size: 12, color: AppColors.turmeric),
          const SizedBox(width: 3),
          Text(
            '$kcal kcal',
            style: AppTypography.caption.copyWith(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}

class _NowBadge extends StatelessWidget {
  const _NowBadge({required this.pulse});
  final AnimationController pulse;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedBuilder(
          animation: pulse,
          builder: (_, __) => Opacity(
            opacity: 0.55 + pulse.value * 0.45,
            child: Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.turmeric,
              ),
            ),
          ),
        ),
        const SizedBox(width: 5),
        Text(
          'NOW',
          style: AppTypography.caption.copyWith(
            color: AppColors.turmeric,
            fontWeight: FontWeight.w700,
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }
}

class _EatenBadge extends StatelessWidget {
  const _EatenBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.success.withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check_rounded, size: 12, color: AppColors.white),
          const SizedBox(width: 4),
          Text(
            'Eaten',
            style: AppTypography.caption.copyWith(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Action widgets
// ---------------------------------------------------------------------------

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.label,
    required this.onTap,
    required this.primary,
  });

  final String label;
  final VoidCallback onTap;
  final bool primary;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: primary ? AppColors.turmeric : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: primary
              ? null
              : Border.all(color: AppColors.creamBorder),
        ),
        child: Text(
          label,
          style: AppTypography.labelMedium.copyWith(
            color: primary ? AppColors.navyDeep : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}

class _OptionsButton extends StatelessWidget {
  const _OptionsButton({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.creamBorder),
        ),
        child: const Icon(
          Icons.more_horiz_rounded,
          color: AppColors.textSecondary,
          size: 20,
        ),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.successLight,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: AppTypography.caption.copyWith(color: AppColors.success),
      ),
    );
  }
}

class _TextLink extends StatelessWidget {
  const _TextLink({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        label,
        style: AppTypography.labelMedium.copyWith(color: AppColors.turmeric),
      ),
    );
  }
}
