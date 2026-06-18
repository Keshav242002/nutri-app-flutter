import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_radius.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:flutter/material.dart';

/// A tappable selection card used in onboarding steps.
///
/// Shows an icon, title and optional description. Selected state uses a
/// turmeric border, warm inner glow, and a check indicator in the top-right.
class SelectableCard extends StatelessWidget {
  /// Creates a [SelectableCard].
  const SelectableCard({
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.onTap,
    super.key,
    this.description,
  });

  /// Icon displayed in a navy-tinted circle.
  final IconData icon;

  /// Card headline.
  final String title;

  /// Optional supporting description below the title.
  final String? description;

  /// Whether this card is in the selected state.
  final bool isSelected;

  /// Callback on tap.
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.turmeric.withValues(alpha: 0.05)
              : AppColors.creamDeep,
          borderRadius: AppRadius.card,
          border: Border.all(
            color: isSelected ? AppColors.turmeric : AppColors.creamBorder,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.turmeric.withValues(alpha: 0.12),
                    blurRadius: 12,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Stack(
          children: [
            Row(
              children: [
                _IconCircle(icon: icon, isSelected: isSelected),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppTypography.headingMedium.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                      if (description != null) ...[
                        const SizedBox(height: 2),
                        Text(
                          description!,
                          style: AppTypography.bodyMedium.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(width: 28),
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              child: AnimatedOpacity(
                opacity: isSelected ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 200),
                child: const Icon(
                  Icons.check_circle_rounded,
                  color: AppColors.turmeric,
                  size: 22,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _IconCircle extends StatelessWidget {
  const _IconCircle({required this.icon, required this.isSelected});

  final IconData icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.turmeric.withValues(alpha: 0.15)
            : AppColors.navySubtle,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        size: 24,
        color: isSelected ? AppColors.turmeric : AppColors.navyDeep,
      ),
    );
  }
}
