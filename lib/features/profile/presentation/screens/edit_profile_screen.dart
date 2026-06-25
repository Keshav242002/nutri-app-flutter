import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/core/widgets/app_button.dart';
import 'package:ahara/core/widgets/app_scaffold.dart';
import 'package:ahara/core/widgets/loading_state.dart';
import 'package:ahara/core/widgets/selectable_card.dart';
import 'package:ahara/features/onboarding/domain/models/dietary_profile.dart';
import 'package:ahara/features/profile/presentation/controllers/edit_profile_controller.dart';
import 'package:ahara/features/profile/presentation/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Core profile editing: weight, goal, activity level.
///
/// Sends only changed fields via `PATCH /profiles/me`; the backend recomputes
/// macro targets.
class EditProfileScreen extends ConsumerStatefulWidget {
  /// Creates the [EditProfileScreen].
  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  static const _activities = <(String, IconData, String, String)>[
    (
      'sedentary',
      Icons.weekend_outlined,
      'Sedentary',
      'Desk job, little exercise',
    ),
    ('light', Icons.directions_walk, 'Light', 'Walk 1–3 days/week'),
    (
      'moderate',
      Icons.directions_bike_outlined,
      'Moderate',
      'Exercise 3–5 days/week',
    ),
    ('very', Icons.fitness_center, 'Very Active', 'Exercise 6–7 days/week'),
    ('athlete', Icons.sports, 'Athlete', 'Physical job or 2× daily training'),
  ];

  static const _goals = <(String, IconData, String, String)>[
    ('lose_weight', Icons.trending_down, 'Lose Weight', 'Reduce body fat'),
    ('maintain', Icons.balance, 'Maintain', 'Keep current weight'),
    (
      'gain_muscle',
      Icons.sports_gymnastics,
      'Gain Muscle',
      'Build lean muscle',
    ),
    ('gain_weight_healthy', Icons.trending_up, 'Gain Weight', 'Healthy gain'),
    (
      'eat_healthier',
      Icons.eco_outlined,
      'Eat Healthier',
      'Improve diet quality',
    ),
  ];

  DietaryProfile? _original;
  late double _weight;
  late String _goal;
  late String _activity;

  @override
  void initState() {
    super.initState();
    final profile = ref.read(profileControllerProvider).value;
    if (profile != null) {
      _seed(profile);
    }
  }

  void _seed(DietaryProfile p) {
    _original = p;
    _weight = p.weightKg > 0 ? p.weightKg : 68;
    _goal = p.goal;
    _activity = p.activityLevel;
  }

  Map<String, dynamic> _buildDiff() {
    final original = _original!;
    final changes = <String, dynamic>{};
    if (_weight != original.weightKg) changes['weight_kg'] = _weight;
    if (_goal != original.goal) changes['goal'] = _goal;
    if (_activity != original.activityLevel) {
      changes['activity_level'] = _activity;
    }
    return changes;
  }

  Future<void> _save() async {
    final ok = await ref
        .read(editProfileControllerProvider.notifier)
        .save(_buildDiff());
    if (ok && mounted) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    // Seed lazily if the profile finished loading after initState.
    final profile = ref.watch(profileControllerProvider).value;
    if (_original == null && profile != null) {
      _seed(profile);
    }

    final isSubmitting = ref.watch(editProfileControllerProvider);

    return AppScaffold(
      appBar: AppBar(
        backgroundColor: AppColors.cream,
        elevation: 0,
        title: Text(
          'Edit profile',
          style: AppTypography.headingLarge.copyWith(
            color: AppColors.navyDeep,
          ),
        ),
      ),
      padding: EdgeInsets.zero,
      body: _original == null
          ? const LoadingState()
          : Stack(
              children: [
                ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.screenHorizontal,
                    vertical: AppSpacing.md,
                  ),
                  children: [
                    _WeightField(
                      weight: _weight,
                      onChanged: (v) => setState(() => _weight = v),
                    ),
                    const SizedBox(height: AppSpacing.xl),
                    const _SectionTitle('Your Goal'),
                    const SizedBox(height: AppSpacing.sm),
                    ..._goals.map(
                      (item) => Padding(
                        padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                        child: SelectableCard(
                          icon: item.$2,
                          title: item.$3,
                          description: item.$4,
                          isSelected: _goal == item.$1,
                          onTap: () => setState(() => _goal = item.$1),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    const _SectionTitle('Activity Level'),
                    const SizedBox(height: AppSpacing.sm),
                    ..._activities.map(
                      (item) => Padding(
                        padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                        child: SelectableCard(
                          icon: item.$2,
                          title: item.$3,
                          description: item.$4,
                          isSelected: _activity == item.$1,
                          onTap: () => setState(() => _activity = item.$1),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xl),
                    AppButton(
                      label: 'Save changes',
                      isLoading: isSubmitting,
                      onPressed: _save,
                    ),
                    const SizedBox(height: AppSpacing.xl),
                  ],
                ),
                if (isSubmitting)
                  const ColoredBox(
                    color: Color(0x33000000),
                    child: SizedBox.expand(),
                  ),
              ],
            ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTypography.headingMedium.copyWith(color: AppColors.textPrimary),
    );
  }
}

class _WeightField extends StatelessWidget {
  const _WeightField({required this.weight, required this.onChanged});

  final double weight;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Weight',
              style: AppTypography.headingMedium.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            Text(
              '${weight.toStringAsFixed(1)} kg',
              style: AppTypography.numericLarge(
                fontSize: 22,
              ).copyWith(color: AppColors.turmeric),
            ),
          ],
        ),
        Slider(
          value: weight.clamp(30, 200),
          min: 30,
          max: 200,
          divisions: 340,
          activeColor: AppColors.turmeric,
          onChanged: (v) => onChanged(double.parse(v.toStringAsFixed(1))),
        ),
      ],
    );
  }
}
