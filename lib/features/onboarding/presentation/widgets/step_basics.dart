import 'dart:io';

import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/features/onboarding/domain/models/onboarding_enums.dart';
import 'package:ahara/features/onboarding/domain/models/onboarding_form_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Step 1 — Basic Information: DOB, sex, height, weight.
class StepBasics extends StatefulWidget {
  /// Creates [StepBasics].
  const StepBasics({required this.form, required this.onUpdate, super.key});

  /// Current form state.
  final OnboardingFormData form;

  /// Called whenever a field changes.
  final void Function(OnboardingFormData Function(OnboardingFormData)) onUpdate;

  @override
  State<StepBasics> createState() => _StepBasicsState();
}

class _StepBasicsState extends State<StepBasics> {
  late final TextEditingController _dayCtrl;
  late final TextEditingController _monthCtrl;
  late final TextEditingController _yearCtrl;

  @override
  void initState() {
    super.initState();
    _dayCtrl = TextEditingController(
      text: widget.form.dobDay != null
          ? widget.form.dobDay!.toString().padLeft(2, '0')
          : '',
    );
    _monthCtrl = TextEditingController(
      text: widget.form.dobMonth != null
          ? widget.form.dobMonth!.toString().padLeft(2, '0')
          : '',
    );
    _yearCtrl = TextEditingController(
      text: widget.form.dobYear?.toString() ?? '',
    );
  }

  @override
  void dispose() {
    _dayCtrl.dispose();
    _monthCtrl.dispose();
    _yearCtrl.dispose();
    super.dispose();
  }

  /// Returns the date currently stored in the form, or a sensible default.
  DateTime get _currentPickerDate {
    final d = widget.form.dobDay;
    final m = widget.form.dobMonth;
    final y = widget.form.dobYear;
    if (d != null && m != null && y != null) {
      try {
        final date = DateTime(y, m, d);
        if (!date.isAfter(DateTime.now())) return date;
      } on Object catch (_) {}
    }
    // Default: 25 years ago
    return DateTime(DateTime.now().year - 25);
  }

  Future<void> _pickDate() async {
    final initial = _currentPickerDate;
    final last = DateTime.now();

    DateTime? picked;
    if (Platform.isIOS) {
      picked = await _showCupertinoPicker(initial, last);
    } else {
      if (!mounted) return;
      picked = await showDatePicker(
        context: context,
        initialDate: initial,
        firstDate: DateTime(1924),
        lastDate: last,
      );
    }

    if (picked == null) return;
    if (!mounted) return;

    _dayCtrl.text = picked.day.toString().padLeft(2, '0');
    _monthCtrl.text = picked.month.toString().padLeft(2, '0');
    _yearCtrl.text = picked.year.toString();
    widget.onUpdate(
      (f) => f.copyWith(
        dobDay: picked?.day,
        dobMonth: picked?.month,
        dobYear: picked?.year,
      ),
    );
  }

  Future<DateTime?> _showCupertinoPicker(
    DateTime initial,
    DateTime last,
  ) async {
    var selected = initial;
    var confirmed = false;

    await showCupertinoModalPopup<void>(
      context: context,
      builder: (ctx) => Container(
        height: 320,
        color: CupertinoColors.systemBackground.resolveFrom(ctx),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CupertinoButton(
                  child: const Text('Cancel'),
                  onPressed: () => Navigator.of(ctx).pop(),
                ),
                CupertinoButton(
                  child: const Text('Done'),
                  onPressed: () {
                    confirmed = true;
                    Navigator.of(ctx).pop();
                  },
                ),
              ],
            ),
            Expanded(
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: initial,
                minimumDate: DateTime(1924),
                maximumDate: last,
                onDateTimeChanged: (d) => selected = d,
              ),
            ),
          ],
        ),
      ),
    );

    return confirmed ? selected : null;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenHorizontal,
        vertical: AppSpacing.lg,
      ),
      children: [
        const _SectionLabel('Date of Birth'),
        const SizedBox(height: AppSpacing.sm),
        Row(
          children: [
            Expanded(
              child: _DobField(
                controller: _dayCtrl,
                hint: 'DD',
                onTap: _pickDate,
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: _DobField(
                controller: _monthCtrl,
                hint: 'MM',
                onTap: _pickDate,
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              flex: 2,
              child: _DobField(
                controller: _yearCtrl,
                hint: 'YYYY',
                onTap: _pickDate,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.xl),
        const _SectionLabel('Sex'),
        const SizedBox(height: AppSpacing.sm),
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: Sex.values.map((sex) {
            final selected = widget.form.sex == sex;
            return GestureDetector(
              onTap: () => widget.onUpdate((f) => f.copyWith(sex: sex)),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: selected
                      ? AppColors.turmeric.withValues(alpha: 0.08)
                      : AppColors.creamDeep,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: selected
                        ? AppColors.turmeric
                        : AppColors.creamBorder,
                    width: selected ? 2 : 1,
                  ),
                ),
                child: Text(
                  _sexLabel(sex),
                  style: AppTypography.labelLarge.copyWith(
                    color: selected
                        ? AppColors.textPrimary
                        : AppColors.textSecondary,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: AppSpacing.xl),
        const _SectionLabel('Height'),
        const SizedBox(height: AppSpacing.sm),
        _ValueDisplay(
          value: '${widget.form.heightCm} cm',
          color: AppColors.turmeric,
        ),
        SliderTheme(
          data: _sliderTheme(context),
          child: Slider(
            value: widget.form.heightCm.toDouble(),
            min: 100,
            max: 250,
            divisions: 150,
            onChanged: (v) =>
                widget.onUpdate((f) => f.copyWith(heightCm: v.round())),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '100 cm',
              style: AppTypography.caption.copyWith(color: AppColors.textHint),
            ),
            Text(
              '250 cm',
              style: AppTypography.caption.copyWith(color: AppColors.textHint),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.xl),
        const _SectionLabel('Weight'),
        const SizedBox(height: AppSpacing.sm),
        _ValueDisplay(
          value: '${widget.form.weightKg.toStringAsFixed(1)} kg',
          color: AppColors.turmeric,
        ),
        SliderTheme(
          data: _sliderTheme(context),
          child: Slider(
            value: widget.form.weightKg,
            min: 30,
            max: 200,
            divisions: 340,
            onChanged: (v) => widget.onUpdate(
              (f) => f.copyWith(weightKg: double.parse(v.toStringAsFixed(1))),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '30 kg',
              style: AppTypography.caption.copyWith(color: AppColors.textHint),
            ),
            Text(
              '200 kg',
              style: AppTypography.caption.copyWith(color: AppColors.textHint),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.xxl),
      ],
    );
  }

  SliderThemeData _sliderTheme(BuildContext context) {
    return SliderTheme.of(context).copyWith(
      activeTrackColor: AppColors.turmeric,
      inactiveTrackColor: AppColors.creamBorder,
      thumbColor: AppColors.turmeric,
      overlayColor: AppColors.turmeric.withValues(alpha: 0.15),
      thumbShape: const RoundSliderThumbShape(),
      trackHeight: 4,
    );
  }

  String _sexLabel(Sex sex) => switch (sex) {
    Sex.male => 'Male',
    Sex.female => 'Female',
    Sex.other => 'Other',
    Sex.preferNotToSay => 'Prefer not to say',
  };
}

// ---------------------------------------------------------------------------
// Private widgets
// ---------------------------------------------------------------------------

/// Read-only DOB segment field. Tapping opens the platform date picker.
///
/// Using GestureDetector + IgnorePointer prevents the keyboard from
/// flashing open before the picker modal appears.
class _DobField extends StatelessWidget {
  const _DobField({
    required this.controller,
    required this.hint,
    required this.onTap,
  });

  final TextEditingController controller;
  final String hint;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: IgnorePointer(
        child: TextField(
          controller: controller,
          readOnly: true,
          textAlign: TextAlign.center,
          style: AppTypography.bodyLarge.copyWith(color: AppColors.textPrimary),
          decoration: InputDecoration(
            hintText: hint,
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
              borderSide:
                  const BorderSide(color: AppColors.navyDeep, width: 1.5),
            ),
          ),
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTypography.headingMedium.copyWith(color: AppColors.textPrimary),
    );
  }
}

class _ValueDisplay extends StatelessWidget {
  const _ValueDisplay({required this.value, required this.color});

  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        value,
        style: AppTypography.numericLarge(fontSize: 32).copyWith(color: color),
      ),
    );
  }
}
