// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_meal_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LogMealRequest _$LogMealRequestFromJson(Map<String, dynamic> json) =>
    _LogMealRequest(
      logDate: json['log_date'] as String,
      slot: json['slot'] as String,
      status: json['status'] as String,
      plannedRecipeId: (json['planned_recipe_id'] as num?)?.toInt(),
      actualRecipeId: (json['actual_recipe_id'] as num?)?.toInt(),
      servingsEaten: json['servings_eaten'] as String?,
      customDescription: json['custom_description'] as String?,
      customCalories: (json['custom_calories'] as num?)?.toInt(),
      customProteinG: json['custom_protein_g'] as String?,
      customCarbsG: json['custom_carbs_g'] as String?,
      customFatG: json['custom_fat_g'] as String?,
    );

Map<String, dynamic> _$LogMealRequestToJson(_LogMealRequest instance) =>
    <String, dynamic>{
      'log_date': instance.logDate,
      'slot': instance.slot,
      'status': instance.status,
      'planned_recipe_id': instance.plannedRecipeId,
      'actual_recipe_id': instance.actualRecipeId,
      'servings_eaten': instance.servingsEaten,
      'custom_description': instance.customDescription,
      'custom_calories': instance.customCalories,
      'custom_protein_g': instance.customProteinG,
      'custom_carbs_g': instance.customCarbsG,
      'custom_fat_g': instance.customFatG,
    };
