import 'package:ahara/features/profile/domain/models/monthly_report_state.dart';
import 'package:ahara/features/week/domain/models/weekly_nutrition.dart';
import 'package:ahara/features/week/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'monthly_report_controller.g.dart';

/// Loads per-day nutrition for the current or previous calendar month.
///
/// Reuses the week feature's `GET /nutrition/weekly/?from=&to=` endpoint —
/// it accepts an arbitrary date range, so a month range works directly.
@riverpod
class MonthlyReportController extends _$MonthlyReportController {
  @override
  Future<MonthlyReportState> build() => _load(MonthSelection.current);

  /// Switches the displayed month and refetches.
  Future<void> select(MonthSelection selection) async {
    if (state.value?.selection == selection) return;
    state = const AsyncLoading<MonthlyReportState>();
    state = await AsyncValue.guard(() => _load(selection));
  }

  Future<MonthlyReportState> _load(MonthSelection selection) async {
    final (from, to) = _rangeFor(selection);
    final result = await ref
        .read(weekRepositoryProvider)
        .getWeeklyNutrition(from, to);
    final nutrition = result.when(
      success: (WeeklyNutrition n) => n,
      failure: (e) => throw e,
    );
    return MonthlyReportState(selection: selection, nutrition: nutrition);
  }

  /// Returns the `(from, to)` ISO date strings for [selection].
  static (String, String) _rangeFor(MonthSelection selection) {
    final now = DateTime.now();
    switch (selection) {
      case MonthSelection.current:
        return (_fmt(DateTime(now.year, now.month)), _fmt(now));
      case MonthSelection.previous:
        // Day 0 of this month = last day of the previous month.
        return (
          _fmt(DateTime(now.year, now.month - 1)),
          _fmt(DateTime(now.year, now.month, 0)),
        );
    }
  }

  static String _fmt(DateTime d) {
    final m = d.month.toString().padLeft(2, '0');
    final day = d.day.toString().padLeft(2, '0');
    return '${d.year}-$m-$day';
  }
}
