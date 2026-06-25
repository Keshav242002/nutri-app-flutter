import 'package:ahara/core/network/api_exceptions.dart';
import 'package:ahara/core/routing/route_paths.dart';
import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_radius.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/core/widgets/app_button.dart';
import 'package:ahara/core/widgets/error_state.dart';
import 'package:ahara/core/widgets/loading_state.dart';
import 'package:ahara/features/auth/domain/models/auth_state.dart';
import 'package:ahara/features/auth/domain/models/user_model.dart';
import 'package:ahara/features/auth/presentation/controllers/auth_controller.dart';
import 'package:ahara/features/dashboard/domain/meal_timing.dart';
import 'package:ahara/features/dashboard/domain/models/daily_nutrition.dart';
import 'package:ahara/features/dashboard/domain/models/meal_card_state.dart';
import 'package:ahara/features/dashboard/domain/models/recipe_slim.dart';
import 'package:ahara/features/dashboard/presentation/controllers/dashboard_controller.dart';
import 'package:ahara/features/dashboard/presentation/widgets/dashboard/ambient_calorie_viz.dart';
import 'package:ahara/features/dashboard/presentation/widgets/dashboard/custom_meal_sheet.dart';
import 'package:ahara/features/dashboard/presentation/widgets/dashboard/dashboard_meal_card.dart';
import 'package:ahara/features/dashboard/presentation/widgets/dashboard/greeting_card.dart';
import 'package:ahara/features/dashboard/presentation/widgets/dashboard/log_chooser_sheet.dart';
import 'package:ahara/features/dashboard/presentation/widgets/dashboard/mark_as_eaten_sheet.dart';
import 'package:ahara/features/dashboard/presentation/widgets/dashboard/meal_options_sheet.dart';
import 'package:ahara/features/dashboard/presentation/widgets/dashboard/swap_sheet.dart';
import 'package:ahara/features/notifications/presentation/controllers/unread_count_controller.dart';
import 'package:ahara/features/profile/presentation/controllers/profile_controller.dart';
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
              ref.refresh(dashboardControllerProvider),
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

    // Non-blocking: the meal UI never waits on the profile fetch. Used only to
    // tailor a brand-new account's first day.
    final createdAt = ref.watch(profileControllerProvider).value?.createdAt;
    final isFirstDay = createdAt != null && _isSameLocalDay(createdAt, now);

    // On day one, only show meals whose window hadn't ended at signup; existing
    // users (and day 2+) always see the full day. Empty = signed up too late.
    final slots = isFirstDay
        ? firstDaySlots(createdAt.toLocal())
        : MealSlot.values;
    final dayOver = isFirstDay && slots.isEmpty;

    return RefreshIndicator(
      color: AppColors.navyDeep,
      onRefresh: () => ref.refresh(dashboardControllerProvider.future),
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
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
              if (dayOver) ...[
                const _DayOverCard(),
              ] else ...[
                if (_dayComplete(state, slots)) ...[
                  _DayCompleteBar(nutrition: state.nutrition),
                  const SizedBox(height: AppSpacing.md),
                ] else if (isFirstDay) ...[
                  _WelcomeBanner(firstName: firstName),
                  const SizedBox(height: AppSpacing.md),
                ] else if (_showNudge(now, state, slots)) ...[
                  _NudgeBar(slot: currentMealSlot(now)),
                  const SizedBox(height: AppSpacing.md),
                ],
                const _SectionHeader(),
                const SizedBox(height: AppSpacing.md),
                _MealCardList(state: state, slots: slots),
              ],
            ]),
          ),
        ),
        ],
      ),
    );
  }

  static String _firstName(String displayName) {
    if (displayName.isEmpty) return 'there';
    return displayName.trim().split(' ').first;
  }

  /// Nudge only about the *current* meal, while it's visible and un-logged.
  static bool _showNudge(
    DateTime now,
    DashboardState state,
    List<MealSlot> slots,
  ) {
    final current = currentMealSlot(now);
    return slots.contains(current) &&
        _slotState(state, current) is PlannedMealCard;
  }

  /// True once every *visible* slot is resolved (eaten/logged/skipped) and a
  /// calorie target exists — gates the end-of-day summary.
  static bool _dayComplete(DashboardState state, List<MealSlot> slots) {
    final allResolved =
        slots.every((slot) => _slotState(state, slot) is! PlannedMealCard);
    return allResolved && state.nutrition.targets.calories > 0;
  }

  static bool _isSameLocalDay(DateTime a, DateTime b) {
    final localA = a.toLocal();
    return localA.year == b.year &&
        localA.month == b.month &&
        localA.day == b.day;
  }
}

MealCardState _slotState(DashboardState s, MealSlot slot) => switch (slot) {
  MealSlot.breakfast => s.breakfastState,
  MealSlot.lunch => s.lunchState,
  MealSlot.dinner => s.dinnerState,
};

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
          builder: (context, ref, _) {
            final count = ref.watch(unreadCountControllerProvider).value ?? 0;
            final bell = IconButton(
              icon: const Icon(
                Icons.notifications_none_rounded,
                color: AppColors.navyDeep,
              ),
              onPressed: () => context.go(RoutePaths.notifications),
            );
            if (count == 0) return bell;
            return Badge(
              label: Text(count > 99 ? '99+' : '$count'),
              backgroundColor: AppColors.turmeric,
              offset: const Offset(-6, 6),
              child: bell,
            );
          },
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Nudge bar
// ---------------------------------------------------------------------------

class _NudgeBar extends StatelessWidget {
  const _NudgeBar({required this.slot});

  final MealSlot slot;

  @override
  Widget build(BuildContext context) {
    final name = switch (slot) {
      MealSlot.breakfast => 'Breakfast',
      MealSlot.lunch => 'Lunch',
      MealSlot.dinner => 'Dinner',
    };

    return Row(
      children: [
        const Icon(
          Icons.info_outline_rounded,
          size: 16,
          color: AppColors.textSecondary,
        ),
        const SizedBox(width: AppSpacing.xs),
        Text(
          '$name time — have you eaten yet?',
          style: AppTypography.caption.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// First-day welcome banner
// ---------------------------------------------------------------------------

/// Shown on the account's first day to frame the plan for a late joiner:
/// the full day is on display, but logging starts from the current meal.
class _WelcomeBanner extends StatelessWidget {
  const _WelcomeBanner({required this.firstName});

  final String firstName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.turmeric.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.turmeric.withValues(alpha: 0.30)),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.celebration_rounded,
            size: 20,
            color: AppColors.turmeric,
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              "Welcome, $firstName! Your plan's ready — start logging from "
              'your next meal. Earlier meals are optional today.',
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// First-day "day over" card — shown when a new account signs up after dinner
// ---------------------------------------------------------------------------

class _DayOverCard extends StatelessWidget {
  const _DayOverCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.creamDeep,
        borderRadius: AppRadius.card,
        border: Border.all(color: AppColors.creamBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.bedtime_outlined,
            size: 28,
            color: AppColors.turmeric,
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            "Today's meals are done",
            style: AppTypography.headingMedium.copyWith(
              color: AppColors.navyDeep,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            "You've joined after today's meal times — your plan picks up "
            'fresh tomorrow.',
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          SizedBox(
            width: double.infinity,
            child: AppButton(
              label: "See tomorrow's plan",
              onPressed: () => context.push(RoutePaths.tomorrowPreview),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Day-complete summary bar
// ---------------------------------------------------------------------------

/// End-of-day calorie summary shown once every slot is resolved.
///
/// Compares consumed vs target calories with a ±10% tolerance band:
/// within the band reads as "on target", otherwise surfaces the exact
/// kcal over or under.
class _DayCompleteBar extends StatelessWidget {
  const _DayCompleteBar({required this.nutrition});

  final DailyNutrition nutrition;

  @override
  Widget build(BuildContext context) {
    final target = nutrition.targets.calories;
    final consumed = nutrition.totals.calories;
    final diff = consumed - target;
    final band = target * 0.10;

    final (IconData icon, Color bg, Color fg, String msg) = switch (diff) {
      _ when diff.abs() <= band => (
        Icons.check_circle_rounded,
        AppColors.successLight,
        AppColors.success,
        'Right on target — nicely balanced today.',
      ),
      _ when diff > 0 => (
        Icons.local_fire_department_rounded,
        AppColors.turmericDim,
        AppColors.navyDeep,
        "You're ${diff.round()} kcal over today's target.",
      ),
      _ => (
        Icons.trending_down_rounded,
        AppColors.navySubtle,
        AppColors.navyDeep,
        "You're ${diff.abs().round()} kcal under today's target.",
      ),
    };

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: fg),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              msg,
              style: AppTypography.bodyMedium.copyWith(color: fg),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Section header
// ---------------------------------------------------------------------------

class _SectionHeader extends StatelessWidget {
  const _SectionHeader();

  @override
  Widget build(BuildContext context) {
    return Text(
      "Today's Canvas",
      style: AppTypography.headingMedium.copyWith(
        color: AppColors.navyDeep,
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Meal card list
// ---------------------------------------------------------------------------

class _MealCardList extends ConsumerStatefulWidget {
  const _MealCardList({required this.state, required this.slots});

  final DashboardState state;

  /// The meal slots to render (first-day filtering may show a subset).
  final List<MealSlot> slots;

  @override
  ConsumerState<_MealCardList> createState() => _MealCardListState();
}

class _MealCardListState extends ConsumerState<_MealCardList> {

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
      builder: (_) => MealOptionsSheet.planned(
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

  /// Opens the edit sheet for a skipped meal — lets the user un-skip by
  /// marking eaten, logging something else, or swapping.
  void _onEditSkipped(MealSlot slot) {
    final recipe = _plannedRecipe(slot);
    if (recipe == null) return;
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => MealOptionsSheet.skipped(
        recipe: recipe,
        slot: slot,
        onMarkEaten: () => _onMarkEaten(slot),
        onLogElse: () => _onLogElse(slot),
        onSwap: () => _onSwap(slot),
      ),
    );
  }

  void _onSwap(MealSlot slot) {
    final notifier = ref.read(dashboardControllerProvider.notifier);
    // The sheet fires the API on open, shows a shimmer while in flight, then a
    // confirmation. The swap is committed to the plan only when the sheet is
    // dismissed (manually or via the 2s auto-close).
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => SwapSheet(
        onLoad: () => notifier.fetchSwap(slot),
        onApply: (recipe) => notifier.applySwap(slot, recipe),
      ),
    );
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
    final current = currentMealSlot(DateTime.now());
    return Column(
      children: widget.slots.map((slot) {
        return Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.md),
          child: DashboardMealCard(
            cardState: _cardState(slot),
            isCurrentSlot: current == slot,
            onMarkEaten: () => _onMarkEaten(slot),
            onOptions: () => _onOptions(slot),
            onTap: () => _onTap(slot),
            onEdit: () => _onEditSkipped(slot),
          ),
        );
      }).toList(),
    );
  }
}
