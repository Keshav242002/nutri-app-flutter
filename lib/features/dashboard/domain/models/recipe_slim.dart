import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_slim.freezed.dart';
part 'recipe_slim.g.dart';

/// Slim recipe shape returned by `GET /mealplans/today/`.
///
/// Maps to `MealPlanRecipeSlimSerializer`. Does NOT include
/// `cached_nutrition_summary` — macro data comes from `DailyNutrition.totals`.
@freezed
abstract class RecipeSlim with _$RecipeSlim {
  /// Creates a [RecipeSlim].
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory RecipeSlim({
    required int id,
    required String name,
    required String slug,
    required String mealType,
    required String cuisine,
    required int prepTimeMin,
    required int cachedCaloriesPerServing,
    String? imageUrl,
    String? proteinSource,
  }) = _RecipeSlim;

  /// Deserialises from JSON.
  ///
  /// Calories are extracted from the nested `cached_nutrition_summary` object
  /// that the API returns — the flat `cached_calories_per_serving` field does
  /// not exist on the mealplan endpoint.
  factory RecipeSlim.fromJson(Map<String, dynamic> json) {
    final nutrition =
        json['cached_nutrition_summary'] as Map<String, dynamic>?;
    return RecipeSlim(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String,
      slug: json['slug'] as String,
      mealType: json['meal_type'] as String,
      cuisine: json['cuisine'] as String,
      prepTimeMin: (json['prep_time_min'] as num).toInt(),
      cachedCaloriesPerServing:
          (nutrition?['calories'] as num?)?.toInt() ??
          (json['cached_calories_per_serving'] as num?)?.toInt() ??
          0,
      imageUrl: json['image_url'] as String?,
      proteinSource: json['protein_source'] as String?,
    );
  }
}
