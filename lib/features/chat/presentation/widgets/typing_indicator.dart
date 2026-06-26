import 'package:ahara/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

/// Three softly-pulsing dots shown while an assistant reply is in flight.
class TypingIndicator extends StatefulWidget {
  /// Creates a [TypingIndicator].
  const TypingIndicator({super.key});

  @override
  State<TypingIndicator> createState() => _TypingIndicatorState();
}

class _TypingIndicatorState extends State<TypingIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 16,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(3, (i) {
              final phase = (_controller.value + i * 0.2) % 1.0;
              final opacity = 0.3 + (1 - (phase - 0.5).abs() * 2) * 0.7;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Opacity(
                  opacity: opacity.clamp(0.3, 1.0),
                  child: Container(
                    width: 7,
                    height: 7,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
