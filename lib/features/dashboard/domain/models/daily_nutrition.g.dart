// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_nutrition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DailyNutrition _$DailyNutritionFromJson(Map<String, dynamic> json) =>
    _DailyNutrition(
      date: json['date'] as String,
      totals: NutritionSummary.fromJson(json['totals'] as Map<String, dynamic>),
      targets: NutritionSummary.fromJson(
        json['targets'] as Map<String, dynamic>,
      ),
      mealsEaten: (json['meals_eaten'] as num).toInt(),
      mealsSkipped: (json['meals_skipped'] as num).toInt(),
    );

Map<String, dynamic> _$DailyNutritionToJson(_DailyNutrition instance) =>
    <String, dynamic>{
      'date': instance.date,
      'totals': instance.totals,
      'targets': instance.targets,
      'meals_eaten': instance.mealsEaten,
      'meals_skipped': instance.mealsSkipped,
    };
