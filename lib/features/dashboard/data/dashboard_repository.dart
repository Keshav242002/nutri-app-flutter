import 'package:ahara/core/cache/cache_service.dart';
import 'package:ahara/core/cache/cached_fetch.dart';
import 'package:ahara/core/network/api_exceptions.dart';
import 'package:ahara/core/utils/result.dart';
import 'package:ahara/features/dashboard/data/dashboard_remote_datasource.dart';
import 'package:ahara/features/dashboard/domain/models/daily_nutrition.dart';
import 'package:ahara/features/dashboard/domain/models/log_meal_request.dart';
import 'package:ahara/features/dashboard/domain/models/meal_log.dart';
import 'package:ahara/features/dashboard/domain/models/recipe_detail.dart';
import 'package:ahara/features/dashboard/domain/models/recipe_slim.dart';
import 'package:ahara/features/dashboard/domain/models/today_meal_plan.dart';
import 'package:dio/dio.dart';

/// Business-logic boundary for the dashboard feature.
///
/// All methods return [Result<T>] — no raw exceptions escape this layer.
class DashboardRepository {
  /// Creates a [DashboardRepository].
  const DashboardRepository(this._ds, this._cache);

  final DashboardRemoteDataSource _ds;
  final CacheService _cache;

  /// Fetches the three planned meals for today. Cached for offline use.
  Future<Result<TodayMealPlan>> getTodayMealPlan() => cachedFetch(
        cache: _cache,
        key: 'dashboard:today_plan',
        fetch: _ds.fetchTodayMealPlan,
        toJson: (v) => v.toJson(),
        fromJson: TodayMealPlan.fromJson,
      );

  /// Fetches the planned meals for a specific date (e.g. tomorrow's preview).
  Future<Result<TodayMealPlan>> getDayMealPlan(String dateIso) => cachedFetch(
        cache: _cache,
        key: 'dashboard:plan:$dateIso',
        fetch: () => _ds.fetchDayMealPlan(dateIso),
        toJson: (v) => v.toJson(),
        fromJson: TodayMealPlan.fromJson,
      );

  /// Fetches today's meal logs to restore card states on launch. Cached.
  Future<Result<List<MealLog>>> getTodayLogs(String date) => cachedFetchList(
        cache: _cache,
        key: 'dashboard:logs:$date',
        fetch: () => _ds.fetchTodayLogs(date),
        toJson: (v) => v.toJson(),
        fromJson: MealLog.fromJson,
      );

  /// Fetches daily nutrition totals + targets for [date]. Cached.
  Future<Result<DailyNutrition>> getDailyNutrition(String date) => cachedFetch(
        cache: _cache,
        key: 'dashboard:nutrition:$date',
        fetch: () => _ds.fetchDailyNutrition(date),
        toJson: (v) => v.toJson(),
        fromJson: DailyNutrition.fromJson,
      );

  /// Posts a meal log entry.
  Future<Result<MealLog>> logMeal(LogMealRequest request) =>
      _wrap(() => _ds.logMeal(request));

  /// Requests a new recipe for a given [slot] on [date].
  Future<Result<RecipeSlim>> regenerateSlot(String date, String slot) =>
      _wrap(() => _ds.regenerateSlot(date, slot));

  /// Fetches the full recipe detail for [slug]. Cached for offline use.
  Future<Result<RecipeDetail>> getRecipeDetail(String slug) => cachedFetch(
        cache: _cache,
        key: 'recipe:$slug',
        fetch: () => _ds.fetchRecipeDetail(slug),
        toJson: (v) => v.toJson(),
        fromJson: RecipeDetail.fromJson,
      );

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
