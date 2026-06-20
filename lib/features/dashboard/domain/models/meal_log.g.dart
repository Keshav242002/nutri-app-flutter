// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MealLogRecipeRef _$MealLogRecipeRefFromJson(Map<String, dynamic> json) =>
    _MealLogRecipeRef(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      slug: json['slug'] as String,
      cachedCaloriesPerServing: (json['cached_calories_per_serving'] as num)
          .toInt(),
    );

Map<String, dynamic> _$MealLogRecipeRefToJson(_MealLogRecipeRef instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'cached_calories_per_serving': instance.cachedCaloriesPerServing,
    };

_MealLog _$MealLogFromJson(Map<String, dynamic> json) => _MealLog(
  id: (json['id'] as num).toInt(),
  logDate: json['log_date'] as String,
  slot: json['slot'] as String,
  status: $enumDecode(_$MealLogStatusEnumMap, json['status']),
  servingsEaten: _doubleFromString(json['servings_eaten']),
  customDescription: json['custom_description'] as String?,
  customCalories: (json['custom_calories'] as num?)?.toInt(),
  customProteinG: _doubleFromString(json['custom_protein_g']),
  customCarbsG: _doubleFromString(json['custom_carbs_g']),
  customFatG: _doubleFromString(json['custom_fat_g']),
  notes: json['notes'] as String?,
  plannedRecipe: json['planned_recipe'] == null
      ? null
      : MealLogRecipeRef.fromJson(
          json['planned_recipe'] as Map<String, dynamic>,
        ),
  actualRecipe: json['actual_recipe'] == null
      ? null
      : MealLogRecipeRef.fromJson(
          json['actual_recipe'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$MealLogToJson(_MealLog instance) => <String, dynamic>{
  'id': instance.id,
  'log_date': instance.logDate,
  'slot': instance.slot,
  'status': _$MealLogStatusEnumMap[instance.status]!,
  'servings_eaten': instance.servingsEaten,
  'custom_description': instance.customDescription,
  'custom_calories': instance.customCalories,
  'custom_protein_g': instance.customProteinG,
  'custom_carbs_g': instance.customCarbsG,
  'custom_fat_g': instance.customFatG,
  'notes': instance.notes,
  'planned_recipe': instance.plannedRecipe,
  'actual_recipe': instance.actualRecipe,
};

const _$MealLogStatusEnumMap = {
  MealLogStatus.planned: 'planned',
  MealLogStatus.atePlanned: 'ate_planned',
  MealLogStatus.ateSubstituted: 'ate_substituted',
  MealLogStatus.ateCustom: 'ate_custom',
  MealLogStatus.skipped: 'skipped',
};
