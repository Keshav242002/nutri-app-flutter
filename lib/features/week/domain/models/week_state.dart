import 'package:ahara/core/network/api_exceptions.dart';
import 'package:ahara/features/dashboard/domain/models/meal_log.dart';
import 'package:ahara/features/week/domain/models/grocery_list.dart';
import 'package:ahara/features/week/domain/models/week_meal_day.dart';
import 'package:ahara/features/week/domain/models/weekly_nutrition.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'week_state.freezed.dart';

/// Controller state for the Week tab.
@freezed
abstract class WeekState with _$WeekState {
  /// Creates a [WeekState].
  const factory WeekState({
    required DateTime weekStart,
    required DateTime selectedDay,
    @Default([]) List<WeekMealDay> weekPlans,
    WeeklyNutrition? weeklyNutrition,
    @Default([]) List<MealLog> selectedDayLogs,
    @Default(false) bool isLoadingSelectedDayLogs,
    GroceryList? groceryList,
    @Default(false) bool isGroceryLoading,
    @Default(null) AppException? groceryError,
    @Default({}) Map<String, bool> checkedItems,
  }) = _WeekState;
}
