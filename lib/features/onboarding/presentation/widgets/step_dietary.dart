import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/core/widgets/app_chip.dart';
import 'package:ahara/core/widgets/selectable_card.dart';
import 'package:ahara/features/onboarding/domain/models/onboarding_enums.dart';
import 'package:ahara/features/onboarding/domain/models/onboarding_form_data.dart';
import 'package:flutter/material.dart';

/// Step 4 — Diet pattern, no-onion/garlic toggle, allergies, dislikes.
class StepDietary extends StatefulWidget {
  /// Creates [StepDietary].
  const StepDietary({required this.form, required this.onUpdate, super.key});

  /// Current form state.
  final OnboardingFormData form;

  /// Called whenever a field changes.
  final void Function(OnboardingFormData Function(OnboardingFormData)) onUpdate;

  @override
  State<StepDietary> createState() => _StepDietaryState();
}

class _StepDietaryState extends State<StepDietary> {
  final _dislikesCtrl = TextEditingController();

  static const _patterns = [
    (
      DietPattern.vegetarian,
      Icons.eco,
      'Vegetarian',
      'No meat or eggs; dairy allowed',
    ),
    (
      DietPattern.eggetarian,
      Icons.egg_outlined,
      'Eggetarian',
      'Vegetarian + eggs',
    ),
    (
      DietPattern.nonVegetarian,
      Icons.restaurant,
      'Non Vegetarian',
      'No restrictions',
    ),
    (
      DietPattern.pescatarian,
      Icons.set_meal,
      'Pescatarian',
      'Fish allowed; no other meat',
    ),
    (DietPattern.vegan, Icons.park_outlined, 'Vegan', 'No animal products'),
    (
      DietPattern.jain,
      Icons.spa_outlined,
      'Jain',
      'No root vegetables, no onion/garlic',
    ),
  ];

  static const _allergyOptions = [
    'Dairy',
    'Gluten',
    'Nuts',
    'Peanuts',
    'Soy',
    'Shellfish',
    'Eggs',
    'Sesame',
  ];

  @override
  void dispose() {
    _dislikesCtrl.dispose();
    super.dispose();
  }

  void _addDislike(String text) {
    final trimmed = text.trim().toLowerCase();
    if (trimmed.isEmpty) return;
    if (widget.form.dislikes.contains(trimmed)) {
      _dislikesCtrl.clear();
      return;
    }
    if (widget.form.dislikes.length >= 30) return;
    widget.onUpdate((f) => f.copyWith(dislikes: [...f.dislikes, trimmed]));
    _dislikesCtrl.clear();
  }

  void _removeDislike(String item) {
    widget.onUpdate(
      (f) => f.copyWith(dislikes: f.dislikes.where((d) => d != item).toList()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenHorizontal,
        vertical: AppSpacing.lg,
      ),
      children: [
        Text(
          'Diet Pattern',
          style: AppTypography.headingMedium.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        ..._patterns.map(
          (p) => Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: SelectableCard(
              icon: p.$2,
              title: p.$3,
              description: p.$4,
              isSelected: widget.form.dietPattern == p.$1,
              onTap: () =>
                  widget.onUpdate((f) => f.copyWith(dietPattern: p.$1)),
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        _NoOnionGarlicToggle(
          value: widget.form.noOnionGarlic,
          locked: widget.form.dietPattern == DietPattern.jain,
          onChanged: (v) =>
              widget.onUpdate((f) => f.copyWith(noOnionGarlic: v)),
        ),
        const SizedBox(height: AppSpacing.xl),
        Text(
          'Allergies',
          style: AppTypography.headingMedium.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        Text(
          'Optional — select any that apply',
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: _allergyOptions.map((name) {
            final val = name.toLowerCase();
            final selected = widget.form.allergies.contains(val);
            return AppChip(
              label: name,
              isSelected: selected,
              turmericSelected: true,
              onTap: () {
                final list = List<String>.from(widget.form.allergies);
                if (selected) {
                  list.remove(val);
                } else {
                  list.add(val);
                }
                widget.onUpdate((f) => f.copyWith(allergies: list));
              },
            );
          }).toList(),
        ),
        const SizedBox(height: AppSpacing.xl),
        Text(
          'Food Dislikes',
          style: AppTypography.headingMedium.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        Text(
          'Optional — type and press Enter (max 30)',
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        TextField(
          controller: _dislikesCtrl,
          textInputAction: TextInputAction.done,
          onSubmitted: _addDislike,
          style: AppTypography.bodyLarge.copyWith(color: AppColors.textPrimary),
          decoration: InputDecoration(
            hintText: 'e.g. bitter gourd, methi...',
            hintStyle: AppTypography.bodyLarge.copyWith(
              color: AppColors.textHint,
            ),
            filled: true,
            fillColor: AppColors.creamDeep,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.creamBorder),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.creamBorder),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.navyDeep,
                width: 1.5,
              ),
            ),
            suffixIcon: IconButton(
              icon: const Icon(Icons.add, color: AppColors.navyDeep),
              onPressed: () => _addDislike(_dislikesCtrl.text),
            ),
          ),
        ),
        if (widget.form.dislikes.isNotEmpty) ...[
          const SizedBox(height: AppSpacing.sm),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: widget.form.dislikes
                .map(
                  (d) =>
                      _DislikeChip(label: d, onRemove: () => _removeDislike(d)),
                )
                .toList(),
          ),
        ],
        const SizedBox(height: AppSpacing.xxl),
      ],
    );
  }
}

class _NoOnionGarlicToggle extends StatelessWidget {
  const _NoOnionGarlicToggle({
    required this.value,
    required this.locked,
    required this.onChanged,
  });

  final bool value;
  final bool locked;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.creamDeep,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.creamBorder),
      ),
      child: Row(
        children: [
          const Icon(Icons.no_meals_outlined, color: AppColors.navyDeep),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'No Onion & Garlic',
                  style: AppTypography.labelLarge.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
                if (locked)
                  Text(
                    'Auto-enabled for Jain diet',
                    style: AppTypography.caption.copyWith(
                      color: AppColors.turmeric,
                    ),
                  ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: locked ? null : onChanged,
            activeThumbColor: AppColors.turmeric,
          ),
        ],
      ),
    );
  }
}

class _DislikeChip extends StatelessWidget {
  const _DislikeChip({required this.label, required this.onRemove});

  final String label;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.navySubtle,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: AppTypography.labelMedium.copyWith(
              color: AppColors.navyDeep,
            ),
          ),
          const SizedBox(width: 4),
          GestureDetector(
            onTap: onRemove,
            child: const Icon(Icons.close, size: 14, color: AppColors.navyDeep),
          ),
        ],
      ),
    );
  }
}
