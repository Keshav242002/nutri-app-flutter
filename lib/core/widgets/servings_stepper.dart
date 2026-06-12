import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:flutter/material.dart';

/// ±0.25 increment stepper for serving sizes.
class ServingsStepper extends StatelessWidget {
  /// Creates a [ServingsStepper].
  const ServingsStepper({
    required this.value,
    required this.onChanged,
    super.key,
    this.min = 0.25,
    this.max = 10,
    this.step = 0.25,
  });

  /// Current servings value.
  final double value;

  /// Called when the value changes.
  final ValueChanged<double> onChanged;

  /// Minimum allowed value.
  final double min;

  /// Maximum allowed value.
  final double max;

  /// Increment/decrement step.
  final double step;

  @override
  Widget build(BuildContext context) {
    final canDecrement = value > min;
    final canIncrement = value < max;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _StepButton(
          icon: Icons.remove,
          onTap: canDecrement
              ? () => onChanged((value - step).clamp(min, max))
              : null,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            value == value.truncate()
                ? value.toStringAsFixed(0)
                : value.toStringAsFixed(2),
            style: AppTypography.labelLarge.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
        ),
        _StepButton(
          icon: Icons.add,
          onTap: canIncrement
              ? () => onChanged((value + step).clamp(min, max))
              : null,
        ),
      ],
    );
  }
}

class _StepButton extends StatelessWidget {
  const _StepButton({required this.icon, this.onTap});

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final enabled = onTap != null;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: enabled ? AppColors.navyDeep : AppColors.creamBorder,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 18,
          color: enabled ? AppColors.white : AppColors.textHint,
        ),
      ),
    );
  }
}
