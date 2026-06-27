// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecipeIngredient _$RecipeIngredientFromJson(Map<String, dynamic> json) =>
    _RecipeIngredient(
      ingredientName: json['ingredient_name'] as String,
      ingredientAppId: json['ingredient_app_id'] as String,
      displayQuantity: json['display_quantity'] as String?,
      order: (json['order'] as num).toInt(),
      displayUnitName: json['display_unit_name'] as String?,
      displayUnitGrams: (json['display_unit_grams'] as num?)?.toDouble(),
      quantityGrams: json['quantity_grams'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$RecipeIngredientToJson(_RecipeIngredient instance) =>
    <String, dynamic>{
      'ingredient_name': instance.ingredientName,
      'ingredient_app_id': instance.ingredientAppId,
      'display_quantity': instance.displayQuantity,
      'order': instance.order,
      'display_unit_name': instance.displayUnitName,
      'display_unit_grams': instance.displayUnitGrams,
      'quantity_grams': instance.quantityGrams,
      'notes': instance.notes,
    };

_RecipeDetail _$RecipeDetailFromJson(Map<String, dynamic> json) =>
    _RecipeDetail(
      slug: json['slug'] as String? ?? '',
      name: json['name'] as String? ?? '',
      cuisine: json['cuisine'] as String? ?? '',
      mealType: json['meal_type'] as String? ?? '',
      prepTimeMin: (json['prep_time_min'] as num?)?.toInt() ?? 0,
      cookTimeMin: (json['cook_time_min'] as num?)?.toInt() ?? 0,
      servings: (json['servings'] as num?)?.toInt() ?? 1,
      estimatedDifficulty: json['estimated_difficulty'] as String? ?? '',
      spiceLevel: json['spice_level'] as String? ?? '',
      nameAlt: json['name_alt'] as String?,
      imageUrl: json['image_url'] as String?,
      proteinSource: json['protein_source'] as String?,
      cachedNutritionSummary: json['cached_nutrition_summary'] == null
          ? null
          : NutritionSummary.fromJson(
              json['cached_nutrition_summary'] as Map<String, dynamic>,
            ),
      cachedCostPerServingInr: (json['cached_cost_per_serving_inr'] as num?)
          ?.toDouble(),
      costKnown: json['cost_known'] as bool?,
      dietTags:
          (json['diet_tags'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      allergenTags:
          (json['allergen_tags'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      ingredients:
          (json['ingredients'] as List<dynamic>?)
              ?.map((e) => RecipeIngredient.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      instructions:
          (json['instructions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$RecipeDetailToJson(_RecipeDetail instance) =>
    <String, dynamic>{
      'slug': instance.slug,
      'name': instance.name,
      'cuisine': instance.cuisine,
      'meal_type': instance.mealType,
      'prep_time_min': instance.prepTimeMin,
      'cook_time_min': instance.cookTimeMin,
      'servings': instance.servings,
      'estimated_difficulty': instance.estimatedDifficulty,
      'spice_level': instance.spiceLevel,
      'name_alt': instance.nameAlt,
      'image_url': instance.imageUrl,
      'protein_source': instance.proteinSource,
      'cached_nutrition_summary': instance.cachedNutritionSummary,
      'cached_cost_per_serving_inr': instance.cachedCostPerServingInr,
      'cost_known': instance.costKnown,
      'diet_tags': instance.dietTags,
      'allergen_tags': instance.allergenTags,
      'ingredients': instance.ingredients,
      'instructions': instance.instructions,
    };
