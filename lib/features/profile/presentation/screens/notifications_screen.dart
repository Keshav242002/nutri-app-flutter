import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_radius.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/core/widgets/app_scaffold.dart';
import 'package:ahara/core/widgets/loading_state.dart';
import 'package:ahara/core/widgets/settings_list_item.dart';
import 'package:ahara/features/notifications/presentation/controllers/push_settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Push-notification settings — a single FCM opt-in (F7).
///
/// The toggle registers/unregisters this device's FCM token with the backend.
class NotificationsScreen extends ConsumerWidget {
  /// Creates the [NotificationsScreen].
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(pushSettingsControllerProvider);
    final controller = ref.read(pushSettingsControllerProvider.notifier);

    return AppScaffold(
      appBar: AppBar(
        backgroundColor: AppColors.cream,
        elevation: 0,
        title: Text(
          'Notifications',
          style: AppTypography.headingLarge.copyWith(color: AppColors.navyDeep),
        ),
      ),
      padding: EdgeInsets.zero,
      body: async.when(
        loading: () => const LoadingState(),
        error: (_, __) => const LoadingState(),
        data: (enabled) => ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.screenHorizontal,
            vertical: AppSpacing.md,
          ),
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.creamDeep,
                borderRadius: AppRadius.card,
                border: Border.all(color: AppColors.creamBorder),
              ),
              child: SettingsListItem(
                icon: Icons.notifications_active_outlined,
                title: 'Push notifications',
                subtitle:
                    'Meal plans, target hits and streaks, on this device.',
                trailing: Switch.adaptive(
                  value: enabled,
                  activeThumbColor: AppColors.turmeric,
                  onChanged: (v) => controller.setEnabled(enabled: v),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
