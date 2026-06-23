import 'dart:developer' as dev;

import 'package:ahara/core/network/envelope.dart';
import 'package:ahara/features/dashboard/domain/models/daily_nutrition.dart';
import 'package:ahara/features/dashboard/domain/models/log_meal_request.dart';
import 'package:ahara/features/dashboard/domain/models/meal_log.dart';
import 'package:ahara/features/dashboard/domain/models/recipe_detail.dart';
import 'package:ahara/features/dashboard/domain/models/recipe_slim.dart';
import 'package:ahara/features/dashboard/domain/models/today_meal_plan.dart';
import 'package:dio/dio.dart';

/// Transport layer for dashboard — wraps [Dio] for meal plan, nutrition,
/// tracker, and recipe endpoints.
class DashboardRemoteDataSource {
  /// Creates a [DashboardRemoteDataSource].
  const DashboardRemoteDataSource(this._dio);

  final Dio _dio;

  /// Calls `GET /api/v1/mealplans/today/`.
  Future<TodayMealPlan> fetchTodayMealPlan() async {
    final response =
        await _dio.get<Map<String, dynamic>>('/mealplans/today/');
    dev.log('GET /mealplans/today/ → ${response.data}', name: 'API');
    return EnvelopeParser.parseSuccess(response.data!, TodayMealPlan.fromJson);
  }

  /// Calls `GET /api/v1/tracker/log/?date=YYYY-MM-DD`.
  ///
  /// Used on launch to restore card states from prior logs.
  Future<List<MealLog>> fetchTodayLogs(String date) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/tracker/log/',
      queryParameters: {'date': date},
    );
    dev.log('GET /tracker/log/?date=$date → ${response.data}', name: 'API');
    return EnvelopeParser.parseSuccessList(response.data!, MealLog.fromJson);
  }

  /// Calls `GET /api/v1/nutrition/daily/?date=YYYY-MM-DD`.
  Future<DailyNutrition> fetchDailyNutrition(String date) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/nutrition/daily/',
      queryParameters: {'date': date},
    );
    dev.log(
      'GET /nutrition/daily/?date=$date → ${response.data}',
      name: 'API',
    );
    return EnvelopeParser.parseSuccess(
      response.data!,
      DailyNutrition.fromJson,
    );
  }

  /// Calls `POST /api/v1/tracker/log/`.
  Future<MealLog> logMeal(LogMealRequest request) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/tracker/log/',
      data: request.toJson(),
    );
    dev.log('POST /tracker/log/ → ${response.data}', name: 'API');
    return EnvelopeParser.parseSuccess(response.data!, MealLog.fromJson);
  }

  /// Calls `POST /api/v1/mealplans/regenerate-slot/`.
  Future<RecipeSlim> regenerateSlot(String date, String slot) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/mealplans/regenerate-slot/',
      data: {'date': date, 'slot': slot},
    );
    dev.log(
      'POST /mealplans/regenerate-slot/ → ${response.data}',
      name: 'API',
    );
    // The endpoint returns the full updated meal plan, not a bare recipe.
    // Pull the regenerated slot's recipe out of the plan envelope.
    return EnvelopeParser.parseSuccess(
      response.data!,
      (Map<String, dynamic> plan) =>
          RecipeSlim.fromJson(plan[slot] as Map<String, dynamic>),
    );
  }

  /// Calls `GET /api/v1/recipes/:slug/`.
  Future<RecipeDetail> fetchRecipeDetail(String slug) async {
    final response =
        await _dio.get<Map<String, dynamic>>('/recipes/$slug/');
    dev.log('GET /recipes/$slug/ → ${response.data}', name: 'API');
    return EnvelopeParser.parseSuccess(response.data!, RecipeDetail.fromJson);
  }
}
