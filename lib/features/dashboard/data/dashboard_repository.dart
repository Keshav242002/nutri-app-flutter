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
  const DashboardRepository(this._ds);

  final DashboardRemoteDataSource _ds;

  /// Fetches the three planned meals for today.
  Future<Result<TodayMealPlan>> getTodayMealPlan() =>
      _wrap(_ds.fetchTodayMealPlan);

  /// Fetches today's meal logs to restore card states on launch.
  Future<Result<List<MealLog>>> getTodayLogs(String date) =>
      _wrap(() => _ds.fetchTodayLogs(date));

  /// Fetches daily nutrition totals + targets for [date].
  Future<Result<DailyNutrition>> getDailyNutrition(String date) =>
      _wrap(() => _ds.fetchDailyNutrition(date));

  /// Posts a meal log entry.
  Future<Result<MealLog>> logMeal(LogMealRequest request) =>
      _wrap(() => _ds.logMeal(request));

  /// Requests a new recipe for a given [slot] on [date].
  Future<Result<RecipeSlim>> regenerateSlot(String date, String slot) =>
      _wrap(() => _ds.regenerateSlot(date, slot));

  /// Fetches the full recipe detail for [slug].
  Future<Result<RecipeDetail>> getRecipeDetail(String slug) =>
      _wrap(() => _ds.fetchRecipeDetail(slug));

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
