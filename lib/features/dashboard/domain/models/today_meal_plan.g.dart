// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'today_meal_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TodayMealPlan _$TodayMealPlanFromJson(Map<String, dynamic> json) =>
    _TodayMealPlan(
      breakfast: json['breakfast'] == null
          ? RecipeSlim.fromJson(const {})
          : RecipeSlim.fromJson(json['breakfast'] as Map<String, dynamic>),
      lunch: json['lunch'] == null
          ? RecipeSlim.fromJson(const {})
          : RecipeSlim.fromJson(json['lunch'] as Map<String, dynamic>),
      dinner: json['dinner'] == null
          ? RecipeSlim.fromJson(const {})
          : RecipeSlim.fromJson(json['dinner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TodayMealPlanToJson(_TodayMealPlan instance) =>
    <String, dynamic>{
      'breakfast': instance.breakfast,
      'lunch': instance.lunch,
      'dinner': instance.dinner,
    };
