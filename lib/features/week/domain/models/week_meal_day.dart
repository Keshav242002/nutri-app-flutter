import 'package:ahara/features/dashboard/domain/models/recipe_slim.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'week_meal_day.freezed.dart';
part 'week_meal_day.g.dart';

/// One day's meal plan entry from `GET /mealplans/week/`.
///
/// Sparse — a day may be absent if no plan was generated for it.
@freezed
abstract class WeekMealDay with _$WeekMealDay {
  /// Creates a [WeekMealDay].
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory WeekMealDay({
    required int id,
    required String planDate,
    required String generatedBy,
    required String generatedAt,
    @Default({}) Map<String, dynamic> regenerationCount,
    RecipeSlim? breakfast,
    RecipeSlim? lunch,
    RecipeSlim? dinner,
  }) = _WeekMealDay;

  /// Deserialises from JSON.
  factory WeekMealDay.fromJson(Map<String, dynamic> json) =>
      _$WeekMealDayFromJson(json);
}
