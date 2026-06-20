import 'package:ahara/features/dashboard/domain/models/nutrition_summary.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_nutrition.freezed.dart';
part 'daily_nutrition.g.dart';

/// Daily nutrition totals + targets returned by `GET /nutrition/daily/`.
@freezed
abstract class DailyNutrition with _$DailyNutrition {
  /// Creates a [DailyNutrition].
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory DailyNutrition({
    required String date,
    required NutritionSummary totals,
    required NutritionSummary targets,
    required int mealsEaten,
    required int mealsSkipped,
  }) = _DailyNutrition;

  /// Deserialises from the `data` object.
  factory DailyNutrition.fromJson(Map<String, dynamic> json) =>
      _$DailyNutritionFromJson(json);
}
