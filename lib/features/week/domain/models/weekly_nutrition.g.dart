// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weekly_nutrition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DayNutritionEntry _$DayNutritionEntryFromJson(Map<String, dynamic> json) =>
    _DayNutritionEntry(
      date: json['date'] as String,
      totals: NutritionSummary.fromJson(json['totals'] as Map<String, dynamic>),
      targets: json['targets'] == null
          ? null
          : NutritionSummary.fromJson(json['targets'] as Map<String, dynamic>),
      percentageOfTarget:
          (json['percentage_of_target'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, (e as num).toDouble()),
          ) ??
          const {},
      mealsEaten: (json['meals_eaten'] as num?)?.toInt() ?? 0,
      mealsSkipped: (json['meals_skipped'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$DayNutritionEntryToJson(_DayNutritionEntry instance) =>
    <String, dynamic>{
      'date': instance.date,
      'totals': instance.totals,
      'targets': instance.targets,
      'percentage_of_target': instance.percentageOfTarget,
      'meals_eaten': instance.mealsEaten,
      'meals_skipped': instance.mealsSkipped,
    };
