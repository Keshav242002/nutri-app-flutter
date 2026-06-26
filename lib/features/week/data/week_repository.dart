import 'package:ahara/core/cache/cache_service.dart';
import 'package:ahara/core/cache/cached_fetch.dart';
import 'package:ahara/core/network/api_exceptions.dart';
import 'package:ahara/core/utils/result.dart';
import 'package:ahara/features/dashboard/domain/models/log_meal_request.dart';
import 'package:ahara/features/dashboard/domain/models/meal_log.dart';
import 'package:ahara/features/dashboard/domain/models/recipe_slim.dart';
import 'package:ahara/features/week/data/week_remote_datasource.dart';
import 'package:ahara/features/week/domain/models/grocery_list.dart';
import 'package:ahara/features/week/domain/models/week_meal_day.dart';
import 'package:ahara/features/week/domain/models/weekly_nutrition.dart';
import 'package:dio/dio.dart';

/// Business-logic boundary for the week feature.
///
/// All methods return [Result<T>] — no raw exceptions escape this layer.
class WeekRepository {
  /// Creates a [WeekRepository].
  const WeekRepository(this._ds, this._cache);

  final WeekRemoteDatasource _ds;
  final CacheService _cache;

  /// Fetches meal plans for the ISO week starting at [from]. Cached.
  Future<Result<List<WeekMealDay>>> getWeekMealPlans(String from) =>
      cachedFetchList(
        cache: _cache,
        key: 'week:plans:$from',
        fetch: () => _ds.fetchWeekMealPlans(from),
        toJson: (v) => v.toJson(),
        fromJson: WeekMealDay.fromJson,
      );

  /// Fetches per-day nutrition summaries for [from]–[to]. Cached.
  Future<Result<WeeklyNutrition>> getWeeklyNutrition(
    String from,
    String to,
  ) =>
      cachedFetch(
        cache: _cache,
        key: 'week:nutrition:$from:$to',
        fetch: () => _ds.fetchWeeklyNutrition(from, to),
        // WeeklyNutrition has a custom fromJson (no generated toJson) — encode
        // it in the same shape WeeklyNutrition.fromJson expects.
        toJson: (v) => {
          'days': v.days.map((d) => d.toJson()).toList(),
          'averages': v.averages?.toJson() ?? <String, dynamic>{},
        },
        fromJson: WeeklyNutrition.fromJson,
      );

  /// Fetches the grocery list for the week containing [planDate]. Cached.
  Future<Result<GroceryList>> getGroceryList(String planDate) => cachedFetch(
        cache: _cache,
        key: 'week:grocery:$planDate',
        fetch: () => _ds.fetchGroceryList(planDate),
        toJson: (v) => v.toJson(),
        fromJson: GroceryList.fromJson,
      );

  /// Force-recomputes and returns the grocery list for [planDate].
  Future<Result<GroceryList>> refreshGroceryList(String planDate) =>
      _wrap(() => _ds.regenerateGroceryList(planDate));

  /// Fetches meal logs for a specific [date]. Cached.
  Future<Result<List<MealLog>>> getLogsForDate(String date) =>
      cachedFetchList(
        cache: _cache,
        key: 'week:logs:$date',
        fetch: () => _ds.fetchLogsForDate(date),
        toJson: (v) => v.toJson(),
        fromJson: MealLog.fromJson,
      );

  /// Posts a meal log entry.
  Future<Result<MealLog>> logMeal(LogMealRequest request) =>
      _wrap(() => _ds.logMeal(request));

  /// Regenerates [slot] for [date], returning the new recipe.
  Future<Result<RecipeSlim>> regenerateSlot(String date, String slot) =>
      _wrap(() => _ds.regenerateSlot(date, slot));

  Future<Result<T>> _wrap<T>(Future<T> Function() call) async {
    try {
      return Success(await call());
    } on AppException catch (e) {
      return Failure(e);
    } on DioException catch (e) {
      final err = e.error;
      return Failure(
        err is AppException ? err : UnknownException(message: e.message ?? ''),
      );
    } on Object catch (e) {
      return Failure(UnknownException(message: e.toString()));
    }
  }
}
