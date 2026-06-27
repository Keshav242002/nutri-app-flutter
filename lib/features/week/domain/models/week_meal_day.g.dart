// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'week_meal_day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WeekMealDay _$WeekMealDayFromJson(Map<String, dynamic> json) => _WeekMealDay(
  id: (json['id'] as num).toInt(),
  planDate: json['plan_date'] as String? ?? '',
  generatedBy: json['generated_by'] as String? ?? '',
  generatedAt: json['generated_at'] as String? ?? '',
  regenerationCount: (json['regeneration_count'] as Map<String, dynamic>?) ?? const {},
  breakfast: json['breakfast'] == null
      ? null
      : RecipeSlim.fromJson(json['breakfast'] as Map<String, dynamic>),
  lunch: json['lunch'] == null
      ? null
      : RecipeSlim.fromJson(json['lunch'] as Map<String, dynamic>),
  dinner: json['dinner'] == null
      ? null
      : RecipeSlim.fromJson(json['dinner'] as Map<String, dynamic>),
);

Map<String, dynamic> _$WeekMealDayToJson(_WeekMealDay instance) =>
    <String, dynamic>{
      'id': instance.id,
      'plan_date': instance.planDate,
      'generated_by': instance.generatedBy,
      'generated_at': instance.generatedAt,
      'regeneration_count': instance.regenerationCount,
      'breakfast': instance.breakfast,
      'lunch': instance.lunch,
      'dinner': instance.dinner,
    };
