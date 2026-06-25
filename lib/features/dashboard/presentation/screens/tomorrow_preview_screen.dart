import 'package:ahara/core/network/api_exceptions.dart';
import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/core/widgets/app_scaffold.dart';
import 'package:ahara/core/widgets/error_state.dart';
import 'package:ahara/core/widgets/loading_state.dart';
import 'package:ahara/features/dashboard/domain/models/meal_card_state.dart';
import 'package:ahara/features/dashboard/domain/models/today_meal_plan.dart';
import 'package:ahara/features/dashboard/presentation/controllers/tomorrow_plan_controller.dart';
import 'package:ahara/features/dashboard/presentation/widgets/dashboard/dashboard_meal_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Read-only preview of tomorrow's meal plan, opened from the first-day
/// "day over" card. No logging — tomorrow's meals become actionable on Home
/// once tomorrow actually arrives.
class TomorrowPreviewScreen extends ConsumerWidget {
  /// Creates the [TomorrowPreviewScreen].
  const TomorrowPreviewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(tomorrowPlanControllerProvider);

    return AppScaffold(
      appBar: AppBar(
        backgroundColor: AppColors.cream,
        elevation: 0,
        title: Text(
          "Tomorrow's plan",
          style: AppTypography.headingLarge.copyWith(color: AppColors.navyDeep),
        ),
      ),
      body: async.when(
        loading: () => const LoadingState(),
        error: (error, _) => ErrorState(
          exception: error is AppException
              ? error
              : const UnknownException(
                  message: "Couldn't load tomorrow's plan.",
                ),
          onRetry: () => ref.invalidate(tomorrowPlanControllerProvider),
        ),
        data: (plan) => ListView(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.md),
              child: Text(
                "Here's what's coming tomorrow. You can start logging from "
                'breakfast once the day begins.',
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ),
            for (final entry in _slots(plan))
              Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.md),
                child: DashboardMealCard(
                  cardState: entry,
                  isCurrentSlot: false,
                  interactive: false,
                  onMarkEaten: () {},
                  onOptions: () {},
                  onTap: () {},
                  onEdit: () {},
                ),
              ),
          ],
        ),
      ),
    );
  }

  List<MealCardState> _slots(TodayMealPlan plan) => [
    MealCardState.planned(recipe: plan.breakfast, slot: MealSlot.breakfast),
    MealCardState.planned(recipe: plan.lunch, slot: MealSlot.lunch),
    MealCardState.planned(recipe: plan.dinner, slot: MealSlot.dinner),
  ];
}
