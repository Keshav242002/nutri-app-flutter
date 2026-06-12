import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:flutter/material.dart';

/// Circular progress ring showing calorie data.
class CalorieRing extends StatelessWidget {
  /// Creates a [CalorieRing].
  const CalorieRing({
    required this.consumed,
    required this.total,
    super.key,
    this.size = 120,
    this.strokeWidth = 10,
  });

  /// Calories consumed.
  final int consumed;

  /// Daily calorie target.
  final int total;

  /// Outer diameter of the ring.
  final double size;

  /// Ring stroke width.
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    final progress = total > 0 ? (consumed / total).clamp(0.0, 1.0) : 0.0;
    final remaining = (total - consumed).clamp(0, total);

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              value: progress,
              strokeWidth: strokeWidth,
              backgroundColor: AppColors.creamBorder,
              valueColor: const AlwaysStoppedAnimation<Color>(
                AppColors.turmeric,
              ),
              strokeCap: StrokeCap.round,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$remaining',
                style: AppTypography.numericLarge(
                  fontSize: size * 0.2,
                ).copyWith(color: AppColors.textPrimary),
              ),
              Text(
                'kcal left',
                style: AppTypography.caption.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
