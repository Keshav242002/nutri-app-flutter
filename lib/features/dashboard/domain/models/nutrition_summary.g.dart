// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrition_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NutritionSummary _$NutritionSummaryFromJson(Map<String, dynamic> json) =>
    _NutritionSummary(
      calories: (json['calories'] as num?)?.toDouble() ?? 0.0,
      proteinG: (json['protein_g'] as num?)?.toDouble() ?? 0.0,
      carbsG: (json['carbs_g'] as num?)?.toDouble() ?? 0.0,
      fatG: (json['fat_g'] as num?)?.toDouble() ?? 0.0,
      fiberG: (json['fiber_g'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$NutritionSummaryToJson(_NutritionSummary instance) =>
    <String, dynamic>{
      'calories': instance.calories,
      'protein_g': instance.proteinG,
      'carbs_g': instance.carbsG,
      'fat_g': instance.fatG,
      'fiber_g': instance.fiberG,
    };
