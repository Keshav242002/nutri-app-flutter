import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal_log.freezed.dart';
part 'meal_log.g.dart';

/// Status values matching the backend `STATUS_CHOICES` exactly.
enum MealLogStatus {
  /// Meal is planned but not yet logged.
  @JsonValue('planned')
  planned,

  /// User ate the planned recipe.
  @JsonValue('ate_planned')
  atePlanned,

  /// User ate a different recipe.
  @JsonValue('ate_substituted')
  ateSubstituted,

  /// User logged a custom meal description.
  @JsonValue('ate_custom')
  ateCustom,

  /// User skipped this meal.
  @JsonValue('skipped')
  skipped,
}

/// A reference to a recipe inside a meal log entry.
///
/// Maps to `SlimRecipeSerializer` in tracker serializers.
@freezed
abstract class MealLogRecipeRef with _$MealLogRecipeRef {
  /// Creates a [MealLogRecipeRef].
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MealLogRecipeRef({
    required int id,
    required String name,
    required String slug,
    required int cachedCaloriesPerServing,
  }) = _MealLogRecipeRef;

  /// Deserialises from JSON.
  factory MealLogRecipeRef.fromJson(Map<String, dynamic> json) =>
      _$MealLogRecipeRefFromJson(json);
}

/// A logged meal entry returned by `POST /tracker/log/` or
/// `GET /tracker/log/?date=YYYY-MM-DD`.
@freezed
abstract class MealLog with _$MealLog {
  /// Creates a [MealLog].
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MealLog({
    required int id,
    required String logDate,
    required String slot,
    required MealLogStatus status,
    // ignore: invalid_annotation_target — @JsonKey on factory param, freezed limitation
    @JsonKey(fromJson: _doubleFromString) double? servingsEaten,
    String? customDescription,
    int? customCalories,
    // ignore: invalid_annotation_target — @JsonKey on factory param, freezed limitation
    @JsonKey(fromJson: _doubleFromString) double? customProteinG,
    // ignore: invalid_annotation_target — @JsonKey on factory param, freezed limitation
    @JsonKey(fromJson: _doubleFromString) double? customCarbsG,
    // ignore: invalid_annotation_target — @JsonKey on factory param, freezed limitation
    @JsonKey(fromJson: _doubleFromString) double? customFatG,
    String? notes,
    MealLogRecipeRef? plannedRecipe,
    MealLogRecipeRef? actualRecipe,
  }) = _MealLog;

  /// Deserialises from JSON.
  factory MealLog.fromJson(Map<String, dynamic> json) =>
      _$MealLogFromJson(json);
}

double? _doubleFromString(dynamic value) {
  if (value == null) return null;
  if (value is double) return value;
  if (value is int) return value.toDouble();
  if (value is String) return double.tryParse(value);
  return null;
}
