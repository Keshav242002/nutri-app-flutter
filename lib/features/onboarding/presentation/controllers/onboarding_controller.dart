import 'dart:async';

import 'package:ahara/core/network/api_exceptions.dart';
import 'package:ahara/core/providers/toast_provider.dart';
import 'package:ahara/features/auth/presentation/controllers/auth_controller.dart';
import 'package:ahara/features/onboarding/domain/models/dietary_profile.dart';
import 'package:ahara/features/onboarding/domain/models/onboarding_enums.dart';
import 'package:ahara/features/onboarding/domain/models/onboarding_form_data.dart';
import 'package:ahara/features/onboarding/domain/models/onboarding_state.dart';
import 'package:ahara/features/onboarding/domain/models/questionnaire.dart';
import 'package:ahara/features/onboarding/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_controller.g.dart';

/// Manages the 6-step onboarding form state.
///
/// Loads the questionnaire on init, tracks per-step form data,
/// validates before advancing, and submits the completed profile.
@riverpod
class OnboardingController extends _$OnboardingController {
  @override
  Future<OnboardingState> build() async {
    final result = await ref.read(onboardingRepositoryProvider).getQuestions();
    return result.when(
      success: (Questionnaire q) => OnboardingState(questionnaire: q),
      failure: (_) => const OnboardingState(),
    );
  }

  // ---------- Navigation ----------

  /// Validates the current step and advances if valid.
  void nextStep() {
    final s = state.value;
    if (s == null) return;
    if (!canContinue(s.currentStep)) return;
    state = AsyncData(s.copyWith(currentStep: s.currentStep + 1));
  }

  /// Decrements the step index.
  void previousStep() {
    final s = state.value;
    if (s == null || s.currentStep == 0) return;
    state = AsyncData(s.copyWith(currentStep: s.currentStep - 1));
  }

  // ---------- Validation ----------

  /// Returns true when all required fields for [step] (0-based) are filled.
  bool canContinue(int step) {
    final form = state.value?.formData;
    if (form == null) return false;
    return switch (step) {
      0 => _step1Valid(form),
      1 => _step2Valid(form),
      2 => _step3Valid(form),
      3 => _step4Valid(form),
      4 => _step5Valid(form),
      5 => _step6Valid(form),
      _ => false,
    };
  }

  bool _step1Valid(OnboardingFormData f) =>
      f.dobDay != null &&
      f.dobMonth != null &&
      f.dobYear != null &&
      f.sex != null &&
      _ageInRange(f.dobYear!, f.dobMonth!, f.dobDay!);

  bool _step2Valid(OnboardingFormData f) =>
      f.activityLevel != null && f.goal != null;

  bool _step3Valid(OnboardingFormData f) =>
      f.primaryCuisineRegion != null && f.spiceTolerance != null;

  bool _step4Valid(OnboardingFormData f) => f.dietPattern != null;

  bool _step5Valid(OnboardingFormData f) =>
      f.cookingFrequency != null &&
      (f.dailyFoodBudgetInr != null || f.weeklyFoodBudgetInr != null);

  bool _step6Valid(OnboardingFormData f) =>
      f.skillLevel != null && f.disclaimerAcknowledged;

  bool _ageInRange(int year, int month, int day) {
    final dob = DateTime(year, month, day);
    final now = DateTime.now();
    final age =
        now.year -
        dob.year -
        (now.month < dob.month || (now.month == dob.month && now.day < dob.day)
            ? 1
            : 0);
    return age >= 13 && age <= 100;
  }

  // ---------- Field updates ----------

  /// Updates one or more form fields via [OnboardingFormData.copyWith].
  void updateForm(OnboardingFormData Function(OnboardingFormData) update) {
    final s = state.value;
    if (s == null) return;
    var form = update(s.formData);
    // Business rule: Jain diet → auto-enable no_onion_garlic
    if (form.dietPattern == DietPattern.jain && !form.noOnionGarlic) {
      form = form.copyWith(noOnionGarlic: true);
    }
    state = AsyncData(s.copyWith(formData: form, submitError: null));
  }

  // ---------- Submission ----------

  /// Submits the completed profile to `POST /profiles/onboarding`.
  ///
  /// On success: refreshes auth state and stores the result so the
  /// router / caller can navigate to `/your-plan`.
  Future<void> submitProfile() async {
    final s = state.value;
    if (s == null) return;
    state = AsyncData(s.copyWith(isSubmitting: true, submitError: null));

    final result = await ref
        .read(onboardingRepositoryProvider)
        .submitProfile(s.formData);

    await result.when(
      success: (DietaryProfile profile) async {
        // Set result first so the screen navigates to /your-plan before
        // auth.refresh() triggers a router rebuild (resets to splash).
        state = AsyncData(
          s.copyWith(isSubmitting: false, result: profile),
        );
        if (ref.mounted) {
          unawaited(ref.read(authControllerProvider.notifier).refresh());
        }
      },
      failure: (AppException e) {
        final msg = e is ValidationException && e.fieldErrors.isNotEmpty
            ? e.fieldErrors.values.first.first
            : e.message;
        ref.read(toastProvider.notifier).show(msg);
        state = AsyncData(s.copyWith(isSubmitting: false));
      },
    );
  }
}
