import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:flutter/material.dart';

/// A single row in a settings-style list.
///
/// Leading icon in a navy-tinted circle, a title (+ optional subtitle), and a
/// trailing widget. When [onTap] is set and no [trailing] is given, a chevron
/// is shown. Use [trailing] to pass a [Switch], a value label, etc.
class SettingsListItem extends StatelessWidget {
  /// Creates a [SettingsListItem].
  const SettingsListItem({
    required this.icon,
    required this.title,
    super.key,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.iconColor,
  });

  /// Leading icon.
  final IconData icon;

  /// Row title.
  final String title;

  /// Optional supporting line below the title.
  final String? subtitle;

  /// Optional trailing widget. Defaults to a chevron when [onTap] is set.
  final Widget? trailing;

  /// Tap handler for the whole row.
  final VoidCallback? onTap;

  /// Optional override for the leading icon colour (e.g. destructive red).
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final resolvedTrailing =
        trailing ??
        (onTap != null
            ? const Icon(
                Icons.chevron_right_rounded,
                color: AppColors.textHint,
              )
            : null);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm + 2,
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: (iconColor ?? AppColors.navyDeep).withValues(
                    alpha: 0.08,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: 20,
                  color: iconColor ?? AppColors.navyDeep,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTypography.bodyLarge.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        subtitle!,
                        style: AppTypography.caption.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              if (resolvedTrailing != null) ...[
                const SizedBox(width: AppSpacing.sm),
                resolvedTrailing,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
