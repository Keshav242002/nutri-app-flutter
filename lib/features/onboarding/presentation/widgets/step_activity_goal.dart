import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/widgets/selectable_card.dart';
import 'package:ahara/features/onboarding/domain/models/onboarding_enums.dart';
import 'package:ahara/features/onboarding/domain/models/onboarding_form_data.dart';
import 'package:flutter/material.dart';

/// Step 2 — Activity level and dietary goal selection.
class StepActivityGoal extends StatelessWidget {
  /// Creates [StepActivityGoal].
  const StepActivityGoal({
    required this.form,
    required this.onUpdate,
    super.key,
  });

  /// Current form state.
  final OnboardingFormData form;

  /// Called whenever a field changes.
  final void Function(OnboardingFormData Function(OnboardingFormData)) onUpdate;

  static const _activities = [
    (
      ActivityLevel.sedentary,
      Icons.weekend_outlined,
      'Sedentary',
      'Desk job, little exercise',
    ),
    (ActivityLevel.light, Icons.directions_walk, 'Light', 'Walk 1–3 days/week'),
    (
      ActivityLevel.moderate,
      Icons.directions_bike_outlined,
      'Moderate',
      'Exercise 3–5 days/week',
    ),
    (
      ActivityLevel.very,
      Icons.fitness_center,
      'Very Active',
      'Exercise 6–7 days/week',
    ),
    (
      ActivityLevel.athlete,
      Icons.sports,
      'Athlete',
      'Physical job or 2× daily training',
    ),
  ];

  static const _goals = [
    (Goal.loseWeight, Icons.trending_down, 'Lose Weight', 'Reduce body fat'),
    (Goal.maintain, Icons.balance, 'Maintain', 'Keep current weight'),
    (
      Goal.gainMuscle,
      Icons.sports_gymnastics,
      'Gain Muscle',
      'Build lean muscle mass',
    ),
    (
      Goal.gainWeightHealthy,
      Icons.trending_up,
      'Gain Weight',
      'Healthy weight gain',
    ),
    (
      Goal.eatHealthier,
      Icons.eco_outlined,
      'Eat Healthier',
      'Improve overall diet quality',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenHorizontal,
        vertical: AppSpacing.lg,
      ),
      children: [
        _buildSection(
          'Activity Level',
          _activities,
          form.activityLevel,
          (v) => onUpdate((f) => f.copyWith(activityLevel: v)),
        ),
        const SizedBox(height: AppSpacing.xl),
        _buildSection(
          'Your Goal',
          _goals,
          form.goal,
          (v) => onUpdate((f) => f.copyWith(goal: v)),
        ),
        const SizedBox(height: AppSpacing.xxl),
      ],
    );
  }

  Widget _buildSection<T>(
    String title,
    List<(T, IconData, String, String)> items,
    T? selected,
    void Function(T) onSelect,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1E1B2E),
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        ...items.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: SelectableCard(
              icon: item.$2,
              title: item.$3,
              description: item.$4,
              isSelected: selected == item.$1,
              onTap: () => onSelect(item.$1),
            ),
          ),
        ),
      ],
    );
  }
}
