import 'dart:developer' as dev;

import 'package:ahara/core/network/envelope.dart';
import 'package:ahara/features/dashboard/domain/models/log_meal_request.dart';
import 'package:ahara/features/dashboard/domain/models/meal_log.dart';
import 'package:ahara/features/dashboard/domain/models/recipe_slim.dart';
import 'package:ahara/features/week/domain/models/grocery_list.dart';
import 'package:ahara/features/week/domain/models/week_meal_day.dart';
import 'package:ahara/features/week/domain/models/weekly_nutrition.dart';
import 'package:dio/dio.dart';

/// Transport layer for the Week tab — wraps [Dio] for week plan,
/// nutrition, grocery, and tracker endpoints.
class WeekRemoteDatasource {
  /// Creates a [WeekRemoteDatasource].
  const WeekRemoteDatasource(this._dio);

  final Dio _dio;

  /// Calls `GET /api/v1/mealplans/week/?from=<YYYY-MM-DD>`.
  Future<List<WeekMealDay>> fetchWeekMealPlans(String from) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/mealplans/week/',
      queryParameters: {'from': from},
    );
    dev.log(
      'GET /mealplans/week/?from=$from → ${response.data}',
      name: 'API',
    );
    return EnvelopeParser.parseSuccessList(
      response.data!,
      WeekMealDay.fromJson,
    );
  }

  /// Calls `GET /api/v1/nutrition/weekly/?from=<from>&to=<to>`.
  Future<WeeklyNutrition> fetchWeeklyNutrition(String from, String to) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/nutrition/weekly/',
      queryParameters: {'from': from, 'to': to},
    );
    dev.log(
      'GET /nutrition/weekly/?from=$from&to=$to → ${response.data}',
      name: 'API',
    );
    return EnvelopeParser.parseSuccess(
      response.data!,
      WeeklyNutrition.fromJson,
    );
  }

  /// Calls `GET /api/v1/mealplans/week/:plan_date/grocery/`.
  Future<GroceryList> fetchGroceryList(String planDate) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/mealplans/week/$planDate/grocery/',
    );
    dev.log(
      'GET /mealplans/week/$planDate/grocery/ → ${response.data}',
      name: 'API',
    );
    return EnvelopeParser.parseSuccess(response.data!, GroceryList.fromJson);
  }

  /// Calls `POST /api/v1/mealplans/week/:plan_date/grocery/regenerate/`.
  Future<GroceryList> regenerateGroceryList(String planDate) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/mealplans/week/$planDate/grocery/regenerate/',
    );
    dev.log(
      'POST /mealplans/week/$planDate/grocery/regenerate/ → ${response.data}',
      name: 'API',
    );
    return EnvelopeParser.parseSuccess(response.data!, GroceryList.fromJson);
  }

  /// Calls `GET /api/v1/tracker/log/?date=<YYYY-MM-DD>`.
  Future<List<MealLog>> fetchLogsForDate(String date) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/tracker/log/',
      queryParameters: {'date': date},
    );
    dev.log('GET /tracker/log/?date=$date → ${response.data}', name: 'API');
    return EnvelopeParser.parseSuccessList(response.data!, MealLog.fromJson);
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
  ///
  /// Returns the regenerated recipe for [slot]. The endpoint responds with the
  /// full updated plan, so the slot's recipe is extracted from it.
  Future<RecipeSlim> regenerateSlot(String date, String slot) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/mealplans/regenerate-slot/',
      data: {'date': date, 'slot': slot},
    );
    dev.log('POST /mealplans/regenerate-slot/ → ${response.data}', name: 'API');
    return EnvelopeParser.parseSuccess(
      response.data!,
      (Map<String, dynamic> plan) =>
          RecipeSlim.fromJson(plan[slot] as Map<String, dynamic>),
    );
  }
}
