import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_radius.dart';
import 'package:ahara/core/theme/app_shadows.dart';
import 'package:flutter/material.dart';

/// Ahara design-system card.
///
/// Cream Deep surface, 1px Cream Border, LG radius, optional shadow.
class AppCard extends StatelessWidget {
  /// Creates an [AppCard].
  const AppCard({
    required this.child,
    super.key,
    this.padding,
    this.hasShadow = false,
    this.onTap,
  });

  /// Card content.
  final Widget child;

  /// Internal padding. Defaults to 16px all sides.
  final EdgeInsetsGeometry? padding;

  /// Applies [AppShadows.card] when `true`.
  final bool hasShadow;

  /// Makes the card tappable when provided.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final content = Container(
      padding: padding ?? const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.creamDeep,
        borderRadius: AppRadius.card,
        border: Border.all(color: AppColors.creamBorder),
        boxShadow: hasShadow ? AppShadows.card : null,
      ),
      child: child,
    );

    if (onTap == null) return content;

    return GestureDetector(onTap: onTap, child: content);
  }
}
