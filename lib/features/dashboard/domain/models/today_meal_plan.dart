import 'package:ahara/features/dashboard/domain/models/recipe_slim.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'today_meal_plan.freezed.dart';
part 'today_meal_plan.g.dart';

/// The three meals planned for today, returned by `GET /mealplans/today/`.
@freezed
abstract class TodayMealPlan with _$TodayMealPlan {
  /// Creates a [TodayMealPlan].
  const factory TodayMealPlan({
    required RecipeSlim breakfast,
    required RecipeSlim lunch,
    required RecipeSlim dinner,
  }) = _TodayMealPlan;

  /// Deserialises from the `data` object of the today endpoint.
  factory TodayMealPlan.fromJson(Map<String, dynamic> json) =>
      _$TodayMealPlanFromJson(json);
}
