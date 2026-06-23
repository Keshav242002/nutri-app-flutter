import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/features/week/domain/models/weekly_nutrition.dart';
import 'package:ahara/features/week/presentation/widgets/day_chip.dart';
import 'package:flutter/material.dart';

/// Horizontal row of 7 [DayChip] widgets for the week.
class DaySelectorRow extends StatelessWidget {
  /// Creates a [DaySelectorRow].
  const DaySelectorRow({
    required this.weekStart,
    required this.selectedDay,
    required this.weeklyNutrition,
    required this.onDayTap,
    super.key,
  });

  /// Monday of the displayed week.
  final DateTime weekStart;

  /// Currently selected day.
  final DateTime selectedDay;

  /// Weekly nutrition — used for calorie labels on chips.
  final WeeklyNutrition? weeklyNutrition;

  /// Called when the user taps a day chip.
  final void Function(DateTime day) onDayTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(7, (i) {
        final day = weekStart.add(Duration(days: i));
        final dayStr = _fmt(day);

        final entry = weeklyNutrition?.days
            .where((DayNutritionEntry d) => d.date == dayStr)
            .firstOrNull;

        final isLogged = (entry?.mealsEaten ?? 0) > 0;
        final kcalLabel = entry != null
            ? entry.totals.calories.toStringAsFixed(0)
            : '—';

        final now = DateTime.now();
        final isToday =
            day.year == now.year &&
            day.month == now.month &&
            day.day == now.day;
        final isSelected =
            day.year == selectedDay.year &&
            day.month == selectedDay.month &&
            day.day == selectedDay.day;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs / 2),
          child: DayChip(
            day: day,
            isSelected: isSelected,
            isToday: isToday,
            calorieLabel: kcalLabel,
            isLogged: isLogged,
            onTap: () => onDayTap(day),
          ),
        );
      }),
    );
  }

  static String _fmt(DateTime d) {
    final m = d.month.toString().padLeft(2, '0');
    final day = d.day.toString().padLeft(2, '0');
    return '${d.year}-$m-$day';
  }
}
