import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/core/widgets/app_button.dart';
import 'package:ahara/core/widgets/app_text_field.dart';
import 'package:ahara/features/auth/domain/models/auth_state.dart';
import 'package:ahara/features/auth/domain/models/user_model.dart';
import 'package:ahara/features/auth/presentation/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Demo home screen — shows logged-in user's name, email, and profile status.
///
/// Prompts for a display name when the field is empty (email-based signups).
class HomeScreen extends ConsumerStatefulWidget {
  /// Creates the [HomeScreen].
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _nameCtrl = TextEditingController();
  bool _savingName = false;

  @override
  void dispose() {
    _nameCtrl.dispose();
    super.dispose();
  }

  Future<void> _saveName() async {
    final name = _nameCtrl.text.trim();
    if (name.isEmpty) return;
    setState(() => _savingName = true);
    await ref.read(authControllerProvider.notifier).updateDisplayName(name);
    if (mounted) setState(() => _savingName = false);
  }

  @override
  Widget build(BuildContext context) {
    final user = ref
        .watch(authControllerProvider)
        .value
        ?.maybeWhen(authenticated: (User u) => u, orElse: () => null);

    if (user == null) return const SizedBox.shrink();

    return Scaffold(
      backgroundColor: AppColors.cream,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.screenHorizontal,
            vertical: AppSpacing.lg,
          ),
          child: Column(
            children: [
              const SizedBox(height: AppSpacing.xl),
              _Avatar(displayName: user.displayName, email: user.email),
              const SizedBox(height: AppSpacing.lg),
              Text(
                user.displayName.isNotEmpty ? user.displayName : user.email,
                style: AppTypography.displayMedium.copyWith(
                  color: AppColors.navyDeep,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                user.email,
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              _ProfileBadge(hasProfile: user.hasProfile),
              if (user.displayName.isEmpty) ...[
                const SizedBox(height: AppSpacing.xl),
                _NameCard(
                  controller: _nameCtrl,
                  saving: _savingName,
                  onSave: _saveName,
                ),
              ],
              const SizedBox(height: AppSpacing.xxl),
              AppButton(
                label: 'Sign out',
                onPressed: () =>
                    ref.read(authControllerProvider.notifier).signOut(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Sub-widgets
// ---------------------------------------------------------------------------

class _Avatar extends StatelessWidget {
  const _Avatar({required this.displayName, required this.email});

  final String displayName;
  final String email;

  String get _initials {
    final src = displayName.isNotEmpty ? displayName : email;
    final parts = src.trim().split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return src.substring(0, src.length >= 2 ? 2 : 1).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 40,
      backgroundColor: AppColors.turmeric,
      child: Text(
        _initials,
        style: AppTypography.headingLarge.copyWith(color: AppColors.white),
      ),
    );
  }
}

class _ProfileBadge extends StatelessWidget {
  const _ProfileBadge({required this.hasProfile});

  final bool hasProfile;

  @override
  Widget build(BuildContext context) {
    final color = hasProfile ? AppColors.success : AppColors.turmeric;
    final icon = hasProfile
        ? Icons.check_circle_rounded
        : Icons.pending_rounded;
    final label = hasProfile ? 'Profile complete' : 'Profile pending';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 6),
          Text(label, style: AppTypography.labelMedium.copyWith(color: color)),
        ],
      ),
    );
  }
}

class _NameCard extends StatelessWidget {
  const _NameCard({
    required this.controller,
    required this.saving,
    required this.onSave,
  });

  final TextEditingController controller;
  final bool saving;
  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.navyDeep.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "What's your name?",
            style: AppTypography.labelLarge.copyWith(color: AppColors.navyDeep),
          ),
          const SizedBox(height: AppSpacing.sm),
          AppTextField(
            controller: controller,
            placeholder: 'Your name',
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => onSave(),
          ),
          const SizedBox(height: AppSpacing.sm),
          AppButton(label: 'Save', onPressed: onSave, isLoading: saving),
        ],
      ),
    );
  }
}
