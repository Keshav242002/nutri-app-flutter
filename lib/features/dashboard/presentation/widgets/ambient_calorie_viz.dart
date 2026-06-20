import 'dart:math' as math;

import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/features/dashboard/domain/models/daily_nutrition.dart';
import 'package:flutter/material.dart';

/// Ambient calorie visualisation — pulsing blobs + orbiting macro dots.
///
/// Shows remaining kcal in the centre with three orbiting dots for
/// protein, carbs, and fat sourced from [DailyNutrition.totals].
class AmbientCalorieViz extends StatefulWidget {
  /// Creates an [AmbientCalorieViz].
  const AmbientCalorieViz({required this.nutrition, super.key});

  /// Daily nutrition data driving the display.
  final DailyNutrition nutrition;

  @override
  State<AmbientCalorieViz> createState() => _AmbientCalorieVizState();
}

class _AmbientCalorieVizState extends State<AmbientCalorieViz>
    with TickerProviderStateMixin {
  late final AnimationController _blob1;
  late final AnimationController _blob2;
  late final AnimationController _orbitP; // Protein — 15s
  late final AnimationController _orbitC; // Carbs — 20s
  late final AnimationController _orbitF; // Fat — 18s

  @override
  void initState() {
    super.initState();
    _blob1 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat(reverse: true);

    _blob2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )
      ..forward(from: 0.5)
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) _blob2.reverse();
        if (status == AnimationStatus.dismissed) _blob2.forward();
      });

    _orbitP = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
    )..repeat();

    _orbitC = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();

    _orbitF = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 18),
    )..repeat();
  }

  @override
  void dispose() {
    _blob1.dispose();
    _blob2.dispose();
    _orbitP.dispose();
    _orbitC.dispose();
    _orbitF.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final remaining =
        (widget.nutrition.targets.calories - widget.nutrition.totals.calories)
            .round()
            .clamp(0, 9999);

    return SizedBox(
      height: 260,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _Blob(controller: _blob1, color: AppColors.turmeric, size: 180),
          Positioned(
            left: 60,
            child: _Blob(
              controller: _blob2,
              color: AppColors.macroFiber,
              size: 150,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                remaining.toString(),
                style: AppTypography.displayLarge.copyWith(
                  color: AppColors.navyDeep,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'KCAL REMAINING',
                style: AppTypography.caption.copyWith(
                  color: AppColors.textSecondary,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
          _OrbitDot(
            controller: _orbitP,
            label: 'P',
            value: widget.nutrition.totals.proteinG.round(),
            color: AppColors.macroProtein,
            radius: 110,
            startAngle: 0,
          ),
          _OrbitDot(
            controller: _orbitC,
            label: 'C',
            value: widget.nutrition.totals.carbsG.round(),
            color: AppColors.macroCarbs,
            radius: 110,
            startAngle: 2 * math.pi / 3,
          ),
          _OrbitDot(
            controller: _orbitF,
            label: 'F',
            value: widget.nutrition.totals.fatG.round(),
            color: AppColors.macroFat,
            radius: 110,
            startAngle: 4 * math.pi / 3,
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Sub-widgets
// ---------------------------------------------------------------------------

class _Blob extends StatelessWidget {
  const _Blob({
    required this.controller,
    required this.color,
    required this.size,
  });

  final AnimationController controller;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) => Transform.scale(
        scale: 0.95 + controller.value * 0.1,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withValues(alpha: 0.12),
          ),
        ),
      ),
    );
  }
}

class _OrbitDot extends StatelessWidget {
  const _OrbitDot({
    required this.controller,
    required this.label,
    required this.value,
    required this.color,
    required this.radius,
    required this.startAngle,
  });

  final AnimationController controller;
  final String label;
  final int value;
  final Color color;
  final double radius;
  final double startAngle;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        final angle = startAngle + controller.value * 2 * math.pi;
        return Transform.translate(
          offset: Offset(
            radius * math.cos(angle),
            radius * math.sin(angle),
          ),
          child: _DotChip(label: label, value: value, color: color),
        );
      },
    );
  }
}

class _DotChip extends StatelessWidget {
  const _DotChip({
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final int value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          ),
          const SizedBox(width: 4),
          Text(
            '$label ${value}g',
            style: AppTypography.caption.copyWith(
              color: AppColors.navyDeep,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
