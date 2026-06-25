import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/features/profile/domain/models/monthly_report_state.dart';
import 'package:flutter/material.dart';

/// Segmented control toggling between the current and previous month.
class MonthPickerToggle extends StatelessWidget {
  /// Creates a [MonthPickerToggle].
  const MonthPickerToggle({
    required this.selection,
    required this.onChanged,
    super.key,
  });

  /// Currently selected month.
  final MonthSelection selection;

  /// Called when the user picks a different month.
  final ValueChanged<MonthSelection> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.creamDeep,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.creamBorder),
      ),
      child: Row(
        children: [
          _Segment(
            label: 'This month',
            isSelected: selection == MonthSelection.current,
            onTap: () => onChanged(MonthSelection.current),
          ),
          _Segment(
            label: 'Last month',
            isSelected: selection == MonthSelection.previous,
            onTap: () => onChanged(MonthSelection.previous),
          ),
        ],
      ),
    );
  }
}

class _Segment extends StatelessWidget {
  const _Segment({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.navyDeep : Colors.transparent,
            borderRadius: BorderRadius.circular(999),
          ),
          child: Text(
            label,
            style: AppTypography.labelLarge.copyWith(
              color: isSelected ? AppColors.white : AppColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }
}
