import 'package:ahara/features/onboarding/domain/models/onboarding_enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_form_data.freezed.dart';

/// Mutable form state accumulating answers across all 6 onboarding steps.
///
/// Not serialised to JSON — submitted via `OnboardingRepository` which
/// converts it to the backend request shape.
@freezed
abstract class OnboardingFormData with _$OnboardingFormData {
  /// Creates an [OnboardingFormData] with sensible defaults.
  const factory OnboardingFormData({
    // Step 1 — Basic Information
    int? dobDay,
    int? dobMonth,
    int? dobYear,
    Sex? sex,
    @Default(165) int heightCm,
    @Default(68.0) double weightKg,
    // Step 2 — Activity & Goal
    ActivityLevel? activityLevel,
    Goal? goal,
    // Step 3 — Cuisine & Region
    CuisineRegion? primaryCuisineRegion,
    @Default([]) List<String> secondaryCuisinePreferences,
    SpiceTolerance? spiceTolerance,
    // Step 4 — Dietary Pattern
    DietPattern? dietPattern,
    @Default(false) bool noOnionGarlic,
    @Default([]) List<String> allergies,
    @Default([]) List<String> dislikes,
    // Step 5 — Budget & Household
    double? dailyFoodBudgetInr,
    double? weeklyFoodBudgetInr,
    @Default(1) int householdSize,
    CookingFrequency? cookingFrequency,
    // Step 6 — Cooking Constraints
    @Default(30) int maxPrepTimeMin,
    SkillLevel? skillLevel,
    @Default(false) bool disclaimerAcknowledged,
  }) = _OnboardingFormData;
}
