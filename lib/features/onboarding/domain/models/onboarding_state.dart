import 'package:ahara/features/onboarding/domain/models/dietary_profile.dart';
import 'package:ahara/features/onboarding/domain/models/onboarding_form_data.dart';
import 'package:ahara/features/onboarding/domain/models/questionnaire.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_state.freezed.dart';

/// UI state managed by `OnboardingController`.
@freezed
abstract class OnboardingState with _$OnboardingState {
  /// Creates an [OnboardingState].
  const factory OnboardingState({
    /// Zero-based PageView index (0–5).
    @Default(0) int currentStep,

    /// Accumulated form answers across all steps.
    @Default(OnboardingFormData()) OnboardingFormData formData,

    /// Questionnaire metadata loaded from the API.
    Questionnaire? questionnaire,

    /// Whether a submission is in-flight.
    @Default(false) bool isSubmitting,

    /// Non-null when the last submit attempt failed.
    String? submitError,

    /// Populated after a successful submit.
    DietaryProfile? result,
  }) = _OnboardingState;
}
