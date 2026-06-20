import 'package:ahara/core/network/api_exceptions.dart';
import 'package:ahara/core/providers/toast_provider.dart';
import 'package:ahara/core/routing/route_paths.dart';
import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/core/widgets/error_state.dart';
import 'package:ahara/core/widgets/loading_state.dart';
import 'package:ahara/features/auth/domain/models/auth_state.dart';
import 'package:ahara/features/auth/domain/models/user_model.dart';
import 'package:ahara/features/auth/presentation/controllers/auth_controller.dart';
import 'package:ahara/features/dashboard/domain/models/meal_card_state.dart';
import 'package:ahara/features/dashboard/domain/models/recipe_slim.dart';
import 'package:ahara/features/dashboard/presentation/controllers/dashboard_controller.dart';
import 'package:ahara/features/dashboard/presentation/widgets/ambient_calorie_viz.dart';
import 'package:ahara/features/dashboard/presentation/widgets/custom_meal_sheet.dart';
import 'package:ahara/features/dashboard/presentation/widgets/dashboard_meal_card.dart';
import 'package:ahara/features/dashboard/presentation/widgets/greeting_card.dart';
import 'package:ahara/features/dashboard/presentation/widgets/log_chooser_sheet.dart';
import 'package:ahara/features/dashboard/presentation/widgets/mark_as_eaten_sheet.dart';
import 'package:ahara/features/dashboard/presentation/widgets/meal_options_sheet.dart';
import 'package:ahara/features/dashboard/presentation/widgets/swap_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// The main dashboard screen — daily anchor with ambient kcal viz and
/// three meal cards.
class DashboardScreen extends ConsumerWidget {
  /// Creates a [DashboardScreen].
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashState = ref.watch(dashboardControllerProvider);

    return Scaffold(
      backgroundColor: AppColors.cream,
      body: dashState.when(
        loading: () => const LoadingState(),
        error: (Object e, __) => ErrorState(
          exception: e is AppException
              ? e
              : UnknownException(message: e.toString()),
          onRetry: () =>
              ref.invalidate(dashboardControllerProvider),
        ),
        data: (s) => _DashboardBody(state: s),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Body
// ---------------------------------------------------------------------------

class _DashboardBody extends ConsumerWidget {
  const _DashboardBody({required this.state});

  final DashboardState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authValue = ref.watch(authControllerProvider).value;
    final user = authValue?.when(
      authenticated: (User u) => u,
      unauthenticated: () => null,
      loading: () => null,
    );
    final firstName = _firstName(user?.displayName ?? '');
    final now = DateTime.now();

    return CustomScrollView(
      slivers: [
        _AppBar(firstName: firstName, user: user),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.screenHorizontal,
            AppSpacing.md,
            AppSpacing.screenHorizontal,
            96,
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              GreetingCard(
                firstName: firstName,
                nutrition: state.nutrition,
              ),
              const SizedBox(height: AppSpacing.lg),
              AmbientCalorieViz(nutrition: state.nutrition),
              const SizedBox(height: AppSpacing.lg),
              if (_showNudge(now, state)) ...[
                _NudgeBar(hour: now.hour, state: state),
                const SizedBox(height: AppSpacing.md),
              ],
              _SectionHeader(
                onTune: () => ref
                    .read(toastProvider.notifier)
                    .show('Filters coming soon'),
              ),
              const SizedBox(height: AppSpacing.md),
              _MealCardList(state: state),
            ]),
          ),
        ),
      ],
    );
  }

  static String _firstName(String displayName) {
    if (displayName.isEmpty) return 'there';
    return displayName.trim().split(' ').first;
  }

  static bool _showNudge(DateTime now, DashboardState state) {
    final hour = now.hour;
    final lunchPlanned = state.lunchState is PlannedMealCard;
    final dinnerPlanned = state.dinnerState is PlannedMealCard;
    return (hour > 13 && lunchPlanned) || (hour >= 18 && dinnerPlanned);
  }
}

// ---------------------------------------------------------------------------
// App bar
// ---------------------------------------------------------------------------

class _AppBar extends StatelessWidget {
  const _AppBar({required this.firstName, required this.user});

  final String firstName;
  final User? user;

  String _initials(String name, String email) {
    final src = name.isNotEmpty ? name : email;
    final parts = src.trim().split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return src.substring(0, src.length >= 2 ? 2 : 1).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final initials =
        _initials(user?.displayName ?? '', user?.email ?? firstName);
    return SliverAppBar(
      pinned: true,
      backgroundColor: AppColors.cream.withValues(alpha: 0.95),
      elevation: 0,
      scrolledUnderElevation: 1,
      surfaceTintColor: AppColors.cream,
      leading: Padding(
        padding: const EdgeInsets.all(8),
        child: CircleAvatar(
          radius: 18,
          backgroundColor: AppColors.turmeric,
          child: Text(
            initials,
            style: AppTypography.caption.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      title: Text(
        'Ahara',
        style: AppTypography.headingLarge.copyWith(color: AppColors.navyDeep),
      ),
      centerTitle: true,
      actions: [
        Consumer(
          builder: (context, ref, _) => IconButton(
            icon: const Icon(
              Icons.notifications_none_rounded,
              color: AppColors.navyDeep,
            ),
            onPressed: () => ref
                .read(toastProvider.notifier)
                .show('Notifications coming soon'),
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Nudge bar
// ---------------------------------------------------------------------------

class _NudgeBar extends StatelessWidget {
  const _NudgeBar({required this.hour, required this.state});

  final int hour;
  final DashboardState state;

  @override
  Widget build(BuildContext context) {
    final lunchPlanned = state.lunchState is PlannedMealCard;
    final msg = lunchPlanned && hour > 13
        ? 'Lunch time — have you eaten yet?'
        : 'Dinner time — have you eaten yet?';

    return Row(
      children: [
        const Icon(
          Icons.info_outline_rounded,
          size: 16,
          color: AppColors.textSecondary,
        ),
        const SizedBox(width: AppSpacing.xs),
        Text(
          msg,
          style: AppTypography.caption.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Section header
// ---------------------------------------------------------------------------

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.onTune});

  final VoidCallback onTune;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Today's Canvas",
          style: AppTypography.headingMedium.copyWith(
            color: AppColors.navyDeep,
          ),
        ),
        IconButton(
          icon: const Icon(
            Icons.tune_rounded,
            color: AppColors.textSecondary,
          ),
          onPressed: onTune,
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Meal card list
// ---------------------------------------------------------------------------

class _MealCardList extends ConsumerStatefulWidget {
  const _MealCardList({required this.state});

  final DashboardState state;

  @override
  ConsumerState<_MealCardList> createState() => _MealCardListState();
}

class _MealCardListState extends ConsumerState<_MealCardList> {
  // Swap loading state per slot.
  final Map<MealSlot, bool> _swapping = {};

  MealSlot? _currentSlot() {
    final h = DateTime.now().hour;
    if (h < 11) return MealSlot.breakfast;
    if (h < 16) return MealSlot.lunch;
    return MealSlot.dinner;
  }

  RecipeSlim? _plannedRecipe(MealSlot slot) {
    return switch (slot) {
      MealSlot.breakfast => widget.state.mealPlan.breakfast,
      MealSlot.lunch => widget.state.mealPlan.lunch,
      MealSlot.dinner => widget.state.mealPlan.dinner,
    };
  }

  MealCardState _cardState(MealSlot slot) => switch (slot) {
        MealSlot.breakfast => widget.state.breakfastState,
        MealSlot.lunch => widget.state.lunchState,
        MealSlot.dinner => widget.state.dinnerState,
      };

  void _onMarkEaten(MealSlot slot) {
    final recipe = _plannedRecipe(slot);
    if (recipe == null) return;
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => MarkAsEatenSheet(
        recipe: recipe,
        slot: slot,
        onConfirm: (servings) => ref
            .read(dashboardControllerProvider.notifier)
            .markEaten(slot, servings),
      ),
    );
  }

  void _onOptions(MealSlot slot) {
    final recipe = _plannedRecipe(slot);
    if (recipe == null) return;
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => MealOptionsSheet(
        recipe: recipe,
        slot: slot,
        onSwap: () => _onSwap(slot),
        onLogElse: () => _onLogElse(slot),
        onSkip: () => ref
            .read(dashboardControllerProvider.notifier)
            .skipMeal(slot),
      ),
    );
  }

  Future<void> _onSwap(MealSlot slot) async {
    setState(() => _swapping[slot] = true);
    // Show the swap sheet in loading state.
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => SwapSheet(
        isLoading: true,
        onAccept: () {},
        onKeep: () => Navigator.of(context).pop(),
      ),
    );
    if (!mounted) return;
    await ref
        .read(dashboardControllerProvider.notifier)
        .swapMeal(slot);
    setState(() => _swapping.remove(slot));
  }

  void _onLogElse(MealSlot slot) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => LogChooserSheet(
        onCustom: () => _onCustom(slot),
      ),
    );
  }

  void _onCustom(MealSlot slot) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => CustomMealSheet(
        slot: slot,
        onLog: (desc, kcal, {double? protein, double? carbs, double? fat}) =>
            ref.read(dashboardControllerProvider.notifier).logCustom(
                  slot,
                  desc,
                  kcal,
                  protein: protein,
                  carbs: carbs,
                  fat: fat,
                ),
      ),
    );
  }

  void _onTap(MealSlot slot) {
    final recipe = _plannedRecipe(slot);
    if (recipe == null) return;
    context.push(
      RoutePaths.recipeDetail.replaceFirst(':slug', recipe.slug),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: MealSlot.values.map((slot) {
        return Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.md),
          child: DashboardMealCard(
            cardState: _cardState(slot),
            isCurrentSlot: _currentSlot() == slot,
            onMarkEaten: () => _onMarkEaten(slot),
            onOptions: () => _onOptions(slot),
            onTap: () => _onTap(slot),
            onLogInstead: () => _onLogElse(slot),
          ),
        );
      }).toList(),
    );
  }
}
