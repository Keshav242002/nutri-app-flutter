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
  factory RecipeSlim.fromJson(Map<String, dynamic> json) =>
      _$RecipeSlimFromJson(json);
}
