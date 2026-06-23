import 'package:ahara/core/providers/toast_provider.dart';
import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/core/widgets/app_modal_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Sheet that lets the user choose between logging from the app or custom.
class LogChooserSheet extends ConsumerWidget {
  /// Creates a [LogChooserSheet].
  const LogChooserSheet({required this.onCustom, super.key});

  /// Called when the user selects "Something else" (custom meal).
  final VoidCallback onCustom;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppModalSheet(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'What did you eat?',
            style: AppTypography.headingMedium.copyWith(
              color: AppColors.navyDeep,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          _ChoiceCard(
            icon: Icons.menu_book_rounded,
            title: 'From the app',
            subtitle: 'Pick a recipe from your plan',
            onTap: () {
              Navigator.of(context).pop();
              ref
                  .read(toastProvider.notifier)
                  .show('Recipe picker coming soon');
            },
          ),
          const SizedBox(height: AppSpacing.sm),
          _ChoiceCard(
            icon: Icons.edit_rounded,
            title: 'Something else',
            subtitle: 'Describe what you ate',
            onTap: () {
              Navigator.of(context).pop();
              onCustom();
            },
          ),
          const SizedBox(height: AppSpacing.sm),
        ],
      ),
    );
  }
}

class _ChoiceCard extends StatelessWidget {
  const _ChoiceCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.creamDeep,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.creamBorder),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.turmeric.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: AppColors.turmeric, size: 22),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTypography.labelLarge.copyWith(
                      color: AppColors.navyDeep,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: AppTypography.caption.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              color: AppColors.textHint,
            ),
          ],
        ),
      ),
    );
  }
}
