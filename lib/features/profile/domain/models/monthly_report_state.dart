import 'package:ahara/features/week/domain/models/weekly_nutrition.dart';

/// Which month the monthly report is showing.
enum MonthSelection {
  /// The current calendar month (1st → today).
  current,

  /// The previous calendar month (1st → last day).
  previous,
}

/// State for the monthly report screen.
///
/// Plain immutable class (no freezed) — purely UI state.
class MonthlyReportState {
  /// Creates a [MonthlyReportState].
  const MonthlyReportState({required this.selection, required this.nutrition});

  /// The month currently being shown.
  final MonthSelection selection;

  /// Per-day nutrition + averages for the selected month range.
  final WeeklyNutrition nutrition;

  /// Returns a copy with the given fields replaced.
  MonthlyReportState copyWith({
    MonthSelection? selection,
    WeeklyNutrition? nutrition,
  }) {
    return MonthlyReportState(
      selection: selection ?? this.selection,
      nutrition: nutrition ?? this.nutrition,
    );
  }
}
