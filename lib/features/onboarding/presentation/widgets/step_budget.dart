import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/core/widgets/selectable_card.dart';
import 'package:ahara/features/onboarding/domain/models/onboarding_enums.dart';
import 'package:ahara/features/onboarding/domain/models/onboarding_form_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Step 5 — Budget, household size, and cooking frequency.
class StepBudget extends StatefulWidget {
  /// Creates [StepBudget].
  const StepBudget({required this.form, required this.onUpdate, super.key});

  /// Current form state.
  final OnboardingFormData form;

  /// Called whenever a field changes.
  final void Function(OnboardingFormData Function(OnboardingFormData)) onUpdate;

  @override
  State<StepBudget> createState() => _StepBudgetState();
}

class _StepBudgetState extends State<StepBudget> {
  bool _isPerDay = true;
  late final TextEditingController _budgetCtrl;

  static const _frequencies = [
    (
      CookingFrequency.daily,
      Icons.restaurant_outlined,
      'Daily',
      'Cook every day',
    ),
    (
      CookingFrequency.weekendsOnly,
      Icons.calendar_today_outlined,
      'Weekends Only',
      'Cook on weekends',
    ),
    (
      CookingFrequency.rarely,
      Icons.takeout_dining_outlined,
      'Rarely',
      'Mostly order in',
    ),
  ];

  @override
  void initState() {
    super.initState();
    final initial = _isPerDay
        ? widget.form.dailyFoodBudgetInr
        : widget.form.weeklyFoodBudgetInr;
    _budgetCtrl = TextEditingController(
      text: initial != null ? initial.toStringAsFixed(0) : '',
    );
  }

  @override
  void dispose() {
    _budgetCtrl.dispose();
    super.dispose();
  }

  void _onBudgetChanged(String value) {
    final parsed = double.tryParse(value);
    if (_isPerDay) {
      widget.onUpdate(
        (f) => f.copyWith(
          dailyFoodBudgetInr: parsed,
          weeklyFoodBudgetInr: parsed != null ? parsed * 7 : null,
        ),
      );
    } else {
      widget.onUpdate(
        (f) => f.copyWith(
          weeklyFoodBudgetInr: parsed,
          dailyFoodBudgetInr: parsed != null ? parsed / 7 : null,
        ),
      );
    }
  }

  void _togglePeriod(bool isDay) {
    setState(() {
      _isPerDay = isDay;
      final val = isDay
          ? widget.form.dailyFoodBudgetInr
          : widget.form.weeklyFoodBudgetInr;
      _budgetCtrl.text = val != null ? val.toStringAsFixed(0) : '';
    });
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
          'Food Budget',
          style: AppTypography.headingMedium.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        // Period toggle
        Container(
          decoration: BoxDecoration(
            color: AppColors.creamDeep,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.creamBorder),
          ),
          child: Row(
            children: [
              _PeriodTab(
                label: 'Per Day',
                isActive: _isPerDay,
                onTap: () => _togglePeriod(true),
              ),
              _PeriodTab(
                label: 'Per Week',
                isActive: !_isPerDay,
                onTap: () => _togglePeriod(false),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        TextField(
          controller: _budgetCtrl,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          onChanged: _onBudgetChanged,
          style: AppTypography.numericLarge(
            fontSize: 22,
          ).copyWith(color: AppColors.textPrimary),
          decoration: InputDecoration(
            prefixText: '₹ ',
            prefixStyle: AppTypography.numericLarge(
              fontSize: 22,
            ).copyWith(color: AppColors.textSecondary),
            hintText: _isPerDay ? '200' : '1400',
            hintStyle: AppTypography.numericLarge(
              fontSize: 22,
            ).copyWith(color: AppColors.textHint),
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
          ),
        ),
        if (_budgetValue != null)
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              _derivedHint,
              style: AppTypography.caption.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
        const SizedBox(height: AppSpacing.xl),
        Text(
          'Household Size',
          style: AppTypography.headingMedium.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        _HouseholdStepper(
          value: widget.form.householdSize,
          onChanged: (v) =>
              widget.onUpdate((f) => f.copyWith(householdSize: v)),
        ),
        const SizedBox(height: AppSpacing.xl),
        Text(
          'Cooking Frequency',
          style: AppTypography.headingMedium.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        ..._frequencies.map(
          (freq) => Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: SelectableCard(
              icon: freq.$2,
              title: freq.$3,
              description: freq.$4,
              isSelected: widget.form.cookingFrequency == freq.$1,
              onTap: () =>
                  widget.onUpdate((f) => f.copyWith(cookingFrequency: freq.$1)),
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.xxl),
      ],
    );
  }

  double? get _budgetValue => _isPerDay
      ? widget.form.dailyFoodBudgetInr
      : widget.form.weeklyFoodBudgetInr;

  String get _derivedHint {
    final v = _budgetValue!;
    if (_isPerDay) {
      return '≈ ₹${(v * 7).toStringAsFixed(0)} per week';
    } else {
      return '≈ ₹${(v / 7).toStringAsFixed(0)} per day';
    }
  }
}

class _PeriodTab extends StatelessWidget {
  const _PeriodTab({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.all(4),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isActive ? AppColors.navyDeep : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: AppTypography.labelLarge.copyWith(
              color: isActive ? AppColors.white : AppColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }
}

class _HouseholdStepper extends StatelessWidget {
  const _HouseholdStepper({required this.value, required this.onChanged});

  final int value;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _StepButton(
          icon: Icons.remove,
          onTap: value > 1 ? () => onChanged(value - 1) : null,
        ),
        const SizedBox(width: AppSpacing.lg),
        Text(
          '$value',
          style: AppTypography.numericLarge(
            fontSize: 40,
          ).copyWith(color: AppColors.textPrimary),
        ),
        const SizedBox(width: AppSpacing.lg),
        _StepButton(
          icon: Icons.add,
          onTap: value < 12 ? () => onChanged(value + 1) : null,
        ),
      ],
    );
  }
}

class _StepButton extends StatelessWidget {
  const _StepButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: onTap != null ? AppColors.navyDeep : AppColors.creamBorder,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: onTap != null ? AppColors.white : AppColors.textHint,
          size: 24,
        ),
      ),
    );
  }
}
