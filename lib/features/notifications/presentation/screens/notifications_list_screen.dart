import 'package:ahara/core/network/api_exceptions.dart';
import 'package:ahara/core/routing/route_paths.dart';
import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_radius.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/core/widgets/app_scaffold.dart';
import 'package:ahara/core/widgets/empty_state.dart';
import 'package:ahara/core/widgets/error_state.dart';
import 'package:ahara/core/widgets/loading_state.dart';
import 'package:ahara/features/notifications/domain/models/notification_item.dart';
import 'package:ahara/features/notifications/presentation/controllers/notifications_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// In-app notification list, opened from the home-appbar bell.
class NotificationsListScreen extends ConsumerWidget {
  /// Creates the [NotificationsListScreen].
  const NotificationsListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(notificationsListControllerProvider);
    final controller = ref.read(notificationsListControllerProvider.notifier);
    final hasUnread = async.value?.any((n) => !n.isRead) ?? false;

    return AppScaffold(
      appBar: AppBar(
        backgroundColor: AppColors.cream,
        elevation: 0,
        title: Text(
          'Notifications',
          style: AppTypography.headingLarge.copyWith(color: AppColors.navyDeep),
        ),
        actions: [
          if (hasUnread)
            TextButton(
              onPressed: controller.markAllRead,
              child: Text(
                'Mark all read',
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.turmeric,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
      padding: EdgeInsets.zero,
      body: async.when(
        loading: () => const LoadingState(),
        error: (error, _) => ErrorState(
          exception: error is AppException
              ? error
              : const UnknownException(
                  message: 'Failed to load notifications.',
                ),
          onRetry: () => ref.invalidate(notificationsListControllerProvider),
        ),
        data: (items) {
          if (items.isEmpty) {
            return const EmptyState(
              message: "You're all caught up.\nNotifications will appear here.",
              illustration: Icon(
                Icons.notifications_none_rounded,
                size: 56,
                color: AppColors.textHint,
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: () =>
                ref.refresh(notificationsListControllerProvider.future),
            child: ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.screenHorizontal,
                vertical: AppSpacing.md,
              ),
              itemCount: items.length,
              separatorBuilder: (_, __) =>
                  const SizedBox(height: AppSpacing.sm),
              itemBuilder: (context, index) {
                final item = items[index];
                return _NotificationCard(
                  item: item,
                  onTap: () {
                    controller.markRead(item.id);
                    final target = _routeFor(item.route);
                    if (target != null) context.go(target);
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}

/// Maps a backend `data.route` to an in-app route, or `null` to stay put.
String? _routeFor(String? route) {
  final value = route ?? '';
  if (value.isEmpty) return null;
  if (value.startsWith('profile')) return RoutePaths.profile;
  if (value.startsWith('tracker') || value.startsWith('mealplan')) {
    return RoutePaths.home;
  }
  return null;
}

class _NotificationCard extends StatelessWidget {
  const _NotificationCard({required this.item, required this.onTap});

  final NotificationItem item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final unread = !item.isRead;
    return Material(
      color: unread
          ? AppColors.turmeric.withValues(alpha: 0.08)
          : AppColors.creamDeep,
      borderRadius: AppRadius.card,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadius.card,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: AppRadius.card,
            border: Border.all(color: AppColors.creamBorder),
          ),
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.navyDeep.withValues(alpha: 0.08),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  _iconFor(item.category),
                  size: 20,
                  color: AppColors.navyDeep,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: AppTypography.bodyLarge.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      item.body,
                      style: AppTypography.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _relativeTime(item.createdAt),
                      style: AppTypography.caption.copyWith(
                        color: AppColors.textHint,
                      ),
                    ),
                  ],
                ),
              ),
              if (unread)
                Container(
                  margin: const EdgeInsets.only(left: AppSpacing.sm, top: 4),
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: AppColors.turmeric,
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

IconData _iconFor(String category) => switch (category) {
  'daily_target' => Icons.check_circle_outline_rounded,
  'goal_updated' => Icons.flag_outlined,
  'plan_ready' => Icons.restaurant_menu_rounded,
  'streak' => Icons.local_fire_department_outlined,
  _ => Icons.notifications_none_rounded,
};

String _relativeTime(DateTime time) {
  final diff = DateTime.now().difference(time);
  if (diff.inMinutes < 1) return 'Just now';
  if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
  if (diff.inHours < 24) return '${diff.inHours}h ago';
  if (diff.inDays < 7) return '${diff.inDays}d ago';
  return '${time.day}/${time.month}/${time.year}';
}
