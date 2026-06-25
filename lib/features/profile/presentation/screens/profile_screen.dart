import 'package:ahara/core/network/api_exceptions.dart';
import 'package:ahara/core/routing/route_paths.dart';
import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_radius.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/core/widgets/app_button.dart';
import 'package:ahara/core/widgets/app_scaffold.dart';
import 'package:ahara/core/widgets/error_state.dart';
import 'package:ahara/core/widgets/loading_state.dart';
import 'package:ahara/core/widgets/settings_list_item.dart';
import 'package:ahara/features/auth/presentation/controllers/auth_controller.dart';
import 'package:ahara/features/profile/presentation/controllers/profile_controller.dart';
import 'package:ahara/features/profile/presentation/widgets/profile_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// Profile / Settings tab.
class ProfileScreen extends ConsumerWidget {
  /// Creates the [ProfileScreen].
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(profileControllerProvider);
    final user = ref.watch(authControllerProvider.notifier).currentUser;

    return AppScaffold(
      appBar: AppBar(
        backgroundColor: AppColors.cream,
        elevation: 0,
        title: Text(
          'Profile',
          style: AppTypography.headingLarge.copyWith(
            color: AppColors.navyDeep,
          ),
        ),
      ),
      padding: EdgeInsets.zero,
      body: profileAsync.when(
        loading: () => const LoadingState(),
        error: (e, _) => ErrorState(
          exception: e is AppException
              ? e
              : UnknownException(message: e.toString()),
          onRetry: () => ref.invalidate(profileControllerProvider),
        ),
        data: (profile) => ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.screenHorizontal,
            vertical: AppSpacing.md,
          ),
          children: [
            ProfileHeader(
              displayName: user?.displayName ?? '',
              email: user?.email ?? '',
              profile: profile,
            ),
            const SizedBox(height: AppSpacing.lg),
            _ListCard(
              children: [
                SettingsListItem(
                  icon: Icons.edit_outlined,
                  title: 'Edit profile',
                  subtitle: 'Weight, goal and activity level',
                  onTap: () => context.push(RoutePaths.profileEdit),
                ),
                const _Divider(),
                SettingsListItem(
                  icon: Icons.bar_chart_rounded,
                  title: 'Monthly report',
                  subtitle: 'Your nutrition this month and last',
                  onTap: () => context.push(RoutePaths.profileReport),
                ),
                const _Divider(),
                SettingsListItem(
                  icon: Icons.notifications_none_rounded,
                  title: 'Notifications',
                  subtitle: '',
                  onTap: () => context.push(RoutePaths.profileNotifications),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xl),
            AppButton(
              label: 'Sign out',
              variant: AppButtonVariant.destructive,
              onPressed: () =>
                  ref.read(authControllerProvider.notifier).signOut(),
            ),
            const SizedBox(height: AppSpacing.lg),
            const _AppVersionFooter(),
            const SizedBox(height: AppSpacing.xl),
          ],
        ),
      ),
    );
  }
}

/// Bottom footer: app build version + copyright line.
class _AppVersionFooter extends StatelessWidget {
  const _AppVersionFooter();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PackageInfo>(
      future: PackageInfo.fromPlatform(),
      builder: (context, snapshot) {
        final version = snapshot.data?.version ?? '';
        return Column(
          children: [
            Text(
              'Build V$version',
              style: AppTypography.caption.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              'All rights reserved Ahara',
              style: AppTypography.caption.copyWith(
                color: AppColors.textHint,
              ),
            ),
          ],
        );
      },
    );
  }
}

/// Rounded card wrapping a group of [SettingsListItem]s.
class _ListCard extends StatelessWidget {
  const _ListCard({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.creamDeep,
        borderRadius: AppRadius.card,
        border: Border.all(color: AppColors.creamBorder),
      ),
      child: Column(children: children),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 68),
      child: Divider(color: AppColors.creamBorder, height: 1),
    );
  }
}
