import 'package:ahara/features/dashboard/domain/models/today_meal_plan.dart';
import 'package:ahara/features/dashboard/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tomorrow_plan_controller.g.dart';

/// Loads tomorrow's meal plan for the first-day "see tomorrow" read-only
/// preview. Backed by `GET /mealplans/day/<tomorrow>/`.
@riverpod
class TomorrowPlanController extends _$TomorrowPlanController {
  @override
  Future<TodayMealPlan> build() async {
    final result = await ref
        .read(dashboardRepositoryProvider)
        .getDayMealPlan(_tomorrowIso());
    return result.when(
      success: (TodayMealPlan plan) => plan,
      failure: (e) => throw e,
    );
  }

  static String _tomorrowIso() {
    final t = DateTime.now().add(const Duration(days: 1));
    final m = t.month.toString().padLeft(2, '0');
    final d = t.day.toString().padLeft(2, '0');
    return '${t.year}-$m-$d';
  }
}
