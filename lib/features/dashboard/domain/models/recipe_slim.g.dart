// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_slim.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecipeSlim _$RecipeSlimFromJson(Map<String, dynamic> json) => _RecipeSlim(
  id: (json['id'] as num?)?.toInt() ?? 0,
  name: json['name'] as String? ?? '',
  slug: json['slug'] as String? ?? '',
  mealType: json['meal_type'] as String? ?? '',
  cuisine: json['cuisine'] as String? ?? '',
  prepTimeMin: (json['prep_time_min'] as num?)?.toInt() ?? 0,
  cachedCaloriesPerServing:
      (json['cached_calories_per_serving'] as num?)?.toInt() ?? 0,
  imageUrl: json['image_url'] as String?,
  proteinSource: json['protein_source'] as String?,
);

Map<String, dynamic> _$RecipeSlimToJson(_RecipeSlim instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'meal_type': instance.mealType,
      'cuisine': instance.cuisine,
      'prep_time_min': instance.prepTimeMin,
      'cached_calories_per_serving': instance.cachedCaloriesPerServing,
      'image_url': instance.imageUrl,
      'protein_source': instance.proteinSource,
    };
