import 'package:ahara/features/dashboard/domain/models/nutrition_summary.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weekly_nutrition.freezed.dart';
part 'weekly_nutrition.g.dart';

/// Per-day nutrition entry from `GET /nutrition/weekly/`.
///
/// `days` is sparse — only dates with logged data are included.
@freezed
abstract class DayNutritionEntry with _$DayNutritionEntry {
  /// Creates a [DayNutritionEntry].
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory DayNutritionEntry({
    required String date,
    required NutritionSummary totals,
    NutritionSummary? targets,
    @Default({}) Map<String, double> percentageOfTarget,
    @Default(0) int mealsEaten,
    @Default(0) int mealsSkipped,
  }) = _DayNutritionEntry;

  /// Deserialises from JSON.
  factory DayNutritionEntry.fromJson(Map<String, dynamic> json) =>
      _$DayNutritionEntryFromJson(json);
}

/// Weekly nutrition summary from `GET /nutrition/weekly/`.
///
/// [averages] is null when [days] is empty — backend returns `{}` in that case.
@freezed
abstract class WeeklyNutrition with _$WeeklyNutrition {
  /// Creates a [WeeklyNutrition].
  const factory WeeklyNutrition({
    required List<DayNutritionEntry> days,
    NutritionSummary? averages,
  }) = _WeeklyNutrition;

  /// Deserialises from JSON, handling `averages: {}` as null.
  factory WeeklyNutrition.fromJson(Map<String, dynamic> json) {
    final days = (json['days'] as List<dynamic>? ?? [])
        .map((e) => DayNutritionEntry.fromJson(e as Map<String, dynamic>))
        .toList();

    final rawAverages = json['averages'];
    NutritionSummary? averages;
    if (rawAverages is Map<String, dynamic> && rawAverages.isNotEmpty) {
      averages = NutritionSummary.fromJson(rawAverages);
    }

    return WeeklyNutrition(days: days, averages: averages);
  }
}
