import 'package:freezed_annotation/freezed_annotation.dart';

part 'nutrition_summary.freezed.dart';
part 'nutrition_summary.g.dart';

/// Shared nutrition breakdown — used by both `DailyNutrition` and
/// `RecipeDetail.cachedNutritionSummary`.
///
/// JSON keys: `calories`, `protein_g`, `carbs_g`, `fat_g`, `fiber_g`.
@freezed
abstract class NutritionSummary with _$NutritionSummary {
  /// Creates a [NutritionSummary].
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory NutritionSummary({
    @Default(0.0) double calories,
    @Default(0.0) double proteinG,
    @Default(0.0) double carbsG,
    @Default(0.0) double fatG,
    @Default(0.0) double fiberG,
  }) = _NutritionSummary;

  /// Deserialises from JSON.
  factory NutritionSummary.fromJson(Map<String, dynamic> json) =>
      _$NutritionSummaryFromJson(json);
}
