import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/features/dashboard/domain/models/daily_nutrition.dart';
import 'package:flutter/material.dart';

/// Ambient calorie visualisation — pulsing blobs + orbiting macro dots.
///
/// Shows calories eaten over the daily target in the centre, with three dots
/// for protein, carbs, and fat (from [DailyNutrition.totals]) orbiting in
/// unison. The dots share a single rotation so they keep a fixed 120° spacing
/// and never cross or overlap each other.
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
  late final AnimationController _orbit; // Shared by all three macro dots.

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

    // A single controller drives all three dots so their relative 120°
    // spacing is constant — they orbit together and never collide.
    _orbit = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
  }

  @override
  void dispose() {
    _blob1.dispose();
    _blob2.dispose();
    _orbit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final eaten = widget.nutrition.totals.calories.round();
    final target = widget.nutrition.targets.calories.round();

    return SizedBox(
      height: 260,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Two concentric amber blobs, heavily blurred — together they read
          // as one soft ambient glow (matches docs/design/home.md: both
          // bg-secondary-container, inset-0 / inset-4, blur-3xl / blur-2xl).
          // Sizes + blur kept small enough that the glow's spread (~2.5×sigma)
          // stays inside the orbit ring (radius 110) and the 260px box — so it
          // never bleeds onto neighbouring UI or under the orbiting macro dots.
          _Blob(
            controller: _blob1,
            color: AppColors.turmeric,
            size: 130,
            alpha: 0.20,
            blurSigma: 16,
          ),
          _Blob(
            controller: _blob2,
            color: AppColors.turmeric,
            size: 95,
            alpha: 0.30,
            blurSigma: 12,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                eaten.toString(),
                style: AppTypography.displayLarge.copyWith(
                  color: AppColors.navyDeep,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Container(
                width: 64,
                height: 1.5,
                margin: const EdgeInsets.symmetric(vertical: 2),
                color: AppColors.textSecondary.withValues(alpha: 0.4),
              ),
              Text(
                '/ $target',
                style: AppTypography.headingMedium.copyWith(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'KCAL',
                style: AppTypography.caption.copyWith(
                  color: AppColors.textSecondary,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
          _OrbitDot(
            controller: _orbit,
            label: 'P',
            value: widget.nutrition.totals.proteinG.round(),
            color: AppColors.macroProtein,
            radius: 110,
            startAngle: 0,
          ),
          _OrbitDot(
            controller: _orbit,
            label: 'C',
            value: widget.nutrition.totals.carbsG.round(),
            color: AppColors.macroCarbs,
            radius: 110,
            startAngle: 2 * math.pi / 3,
          ),
          _OrbitDot(
            controller: _orbit,
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
    required this.alpha,
    required this.blurSigma,
  });

  final AnimationController controller;
  final Color color;
  final double size;
  final double alpha;
  final double blurSigma;

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ui.ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
      child: AnimatedBuilder(
        animation: controller,
        builder: (_, __) => Transform.scale(
          scale: 0.95 + controller.value * 0.1,
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withValues(alpha: alpha),
            ),
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
