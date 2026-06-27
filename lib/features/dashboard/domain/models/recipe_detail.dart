import 'package:ahara/features/dashboard/domain/models/nutrition_summary.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_detail.freezed.dart';
part 'recipe_detail.g.dart';

/// A single ingredient row from `RecipeIngredientSerializer`.
@freezed
abstract class RecipeIngredient with _$RecipeIngredient {
  /// Creates a [RecipeIngredient].
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory RecipeIngredient({
    required String ingredientName,
    required String ingredientAppId,
    required int order,
    String? displayQuantity,
    String? displayUnitName,
    double? displayUnitGrams,
    String? quantityGrams,
    String? notes,
  }) = _RecipeIngredient;

  /// Deserialises from JSON.
  factory RecipeIngredient.fromJson(Map<String, dynamic> json) =>
      _$RecipeIngredientFromJson(json);
}

/// Full recipe detail returned by `GET /recipes/:slug/`.
///
/// `instructions` is a plain `List<String>` — step number = index + 1.
/// `cachedNutritionSummary` is nullable (not computed for all recipes).
@freezed
abstract class RecipeDetail with _$RecipeDetail {
  /// Creates a [RecipeDetail].
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory RecipeDetail({
    required String slug,
    required String name,
    required String cuisine,
    required String mealType,
    required int prepTimeMin,
    required int cookTimeMin,
    required int servings,
    required String estimatedDifficulty,
    required String spiceLevel,
    String? nameAlt,
    String? imageUrl,
    String? proteinSource,
    NutritionSummary? cachedNutritionSummary,
    double? cachedCostPerServingInr,
    bool? costKnown,
    @Default([]) List<String> dietTags,
    @Default([]) List<String> allergenTags,
    @Default([]) List<RecipeIngredient> ingredients,
    @Default([]) List<String> instructions,
  }) = _RecipeDetail;

  /// Deserialises from JSON.
  factory RecipeDetail.fromJson(Map<String, dynamic> json) =>
      _$RecipeDetailFromJson(json);
}
