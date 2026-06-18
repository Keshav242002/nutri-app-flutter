// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dietary_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DietaryProfile _$DietaryProfileFromJson(
  Map<String, dynamic> json,
) => _DietaryProfile(
  dateOfBirth: json['date_of_birth'] as String,
  sex: json['sex'] as String,
  heightCm: (json['height_cm'] as num).toInt(),
  activityLevel: json['activity_level'] as String,
  goal: json['goal'] as String,
  primaryCuisineRegion: json['primary_cuisine_region'] as String,
  spiceTolerance: json['spice_tolerance'] as String,
  dietPattern: json['diet_pattern'] as String,
  cookingFrequency: json['cooking_frequency'] as String,
  skillLevel: json['skill_level'] as String,
  weightKg: _doubleFromJsonRequired(json['weight_kg']),
  secondaryCuisinePreferences:
      (json['secondary_cuisine_preferences'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  noOnionGarlic: json['no_onion_garlic'] as bool? ?? false,
  allergies:
      (json['allergies'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  dislikes:
      (json['dislikes'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  dailyFoodBudgetInr: _doubleFromJson(json['daily_food_budget_inr']),
  weeklyFoodBudgetInr: _doubleFromJson(json['weekly_food_budget_inr']),
  householdSize: (json['household_size'] as num?)?.toInt() ?? 1,
  maxPrepTimeMin: (json['max_prep_time_min'] as num?)?.toInt() ?? 30,
  timezone: json['timezone'] as String?,
  targetCalories: (json['target_calories'] as num?)?.toInt(),
  targetProteinG: _doubleFromJson(json['target_protein_g']),
  targetCarbsG: _doubleFromJson(json['target_carbs_g']),
  targetFatG: _doubleFromJson(json['target_fat_g']),
  targetFiberG: _doubleFromJson(json['target_fiber_g']),
  age: (json['age'] as num?)?.toInt(),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$DietaryProfileToJson(_DietaryProfile instance) =>
    <String, dynamic>{
      'date_of_birth': instance.dateOfBirth,
      'sex': instance.sex,
      'height_cm': instance.heightCm,
      'activity_level': instance.activityLevel,
      'goal': instance.goal,
      'primary_cuisine_region': instance.primaryCuisineRegion,
      'spice_tolerance': instance.spiceTolerance,
      'diet_pattern': instance.dietPattern,
      'cooking_frequency': instance.cookingFrequency,
      'skill_level': instance.skillLevel,
      'weight_kg': instance.weightKg,
      'secondary_cuisine_preferences': instance.secondaryCuisinePreferences,
      'no_onion_garlic': instance.noOnionGarlic,
      'allergies': instance.allergies,
      'dislikes': instance.dislikes,
      'daily_food_budget_inr': instance.dailyFoodBudgetInr,
      'weekly_food_budget_inr': instance.weeklyFoodBudgetInr,
      'household_size': instance.householdSize,
      'max_prep_time_min': instance.maxPrepTimeMin,
      'timezone': instance.timezone,
      'target_calories': instance.targetCalories,
      'target_protein_g': instance.targetProteinG,
      'target_carbs_g': instance.targetCarbsG,
      'target_fat_g': instance.targetFatG,
      'target_fiber_g': instance.targetFiberG,
      'age': instance.age,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
