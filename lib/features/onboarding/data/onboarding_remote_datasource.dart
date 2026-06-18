import 'dart:developer' as dev;

import 'package:ahara/core/network/envelope.dart';
import 'package:ahara/features/onboarding/domain/models/dietary_profile.dart';
import 'package:ahara/features/onboarding/domain/models/onboarding_enums.dart';
import 'package:ahara/features/onboarding/domain/models/onboarding_form_data.dart';
import 'package:ahara/features/onboarding/domain/models/questionnaire.dart';
import 'package:dio/dio.dart';
import 'package:flutter_timezone/flutter_timezone.dart';

/// Transport layer for onboarding — wraps [Dio] for questionnaire and
/// profile endpoints.
class OnboardingRemoteDataSource {
  /// Creates an [OnboardingRemoteDataSource].
  const OnboardingRemoteDataSource({required Dio dio}) : _dio = dio;

  final Dio _dio;

  /// Calls `GET /api/v1/profiles/onboarding/questions`.
  Future<Questionnaire> getQuestions() async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/profiles/onboarding/questions',
    );
    dev.log(
      'GET /profiles/onboarding/questions → ${response.data}',
      name: 'API',
    );
    return EnvelopeParser.parseSuccess(response.data!, Questionnaire.fromJson);
  }

  /// Calls `POST /api/v1/profiles/onboarding`.
  Future<DietaryProfile> submitProfile(OnboardingFormData form) async {
    final timezone = await _ianaTimezone();
    final body = _toRequestBody(form, timezone);
    final response = await _dio.post<Map<String, dynamic>>(
      '/profiles/onboarding',
      data: body,
    );
    dev.log('POST /profiles/onboarding → ${response.data}', name: 'API');
    return EnvelopeParser.parseSuccess(response.data!, DietaryProfile.fromJson);
  }

  Map<String, dynamic> _toRequestBody(
    OnboardingFormData form,
    String timezone,
  ) {
    final dob = _formatDob(form.dobYear, form.dobMonth, form.dobDay);
    return <String, dynamic>{
      'date_of_birth': dob,
      'sex': _enumJson(form.sex),
      'height_cm': form.heightCm,
      'weight_kg': form.weightKg,
      'activity_level': _enumJson(form.activityLevel),
      'goal': _enumJson(form.goal),
      'primary_cuisine_region': _enumJson(form.primaryCuisineRegion),
      if (form.secondaryCuisinePreferences.isNotEmpty)
        'secondary_cuisine_preferences': form.secondaryCuisinePreferences,
      'spice_tolerance': _enumJson(form.spiceTolerance),
      'diet_pattern': _enumJson(form.dietPattern),
      'no_onion_garlic': form.noOnionGarlic,
      if (form.allergies.isNotEmpty) 'allergies': form.allergies,
      if (form.dislikes.isNotEmpty) 'dislikes': form.dislikes,
      if (form.dailyFoodBudgetInr != null)
        'daily_food_budget_inr': form.dailyFoodBudgetInr,
      if (form.weeklyFoodBudgetInr != null)
        'weekly_food_budget_inr': form.weeklyFoodBudgetInr,
      'household_size': form.householdSize,
      'cooking_frequency': _enumJson(form.cookingFrequency),
      'max_prep_time_min': form.maxPrepTimeMin,
      'skill_level': _enumJson(form.skillLevel),
      'disclaimer_acknowledged': form.disclaimerAcknowledged,
      'timezone': timezone,
    };
  }

  String? _formatDob(int? year, int? month, int? day) {
    if (year == null || month == null || day == null) return null;
    final m = month.toString().padLeft(2, '0');
    final d = day.toString().padLeft(2, '0');
    return '$year-$m-$d';
  }

  /// Extracts the JSON value from a `@JsonValue`-annotated enum
  /// via its name mapping.
  String? _enumJson(Object? value) {
    if (value == null) return null;
    return switch (value) {
      Sex.male => 'male',
      Sex.female => 'female',
      Sex.other => 'other',
      Sex.preferNotToSay => 'prefer_not_to_say',
      ActivityLevel.sedentary => 'sedentary',
      ActivityLevel.light => 'light',
      ActivityLevel.moderate => 'moderate',
      ActivityLevel.very => 'very',
      ActivityLevel.athlete => 'athlete',
      Goal.loseWeight => 'lose_weight',
      Goal.maintain => 'maintain',
      Goal.gainMuscle => 'gain_muscle',
      Goal.gainWeightHealthy => 'gain_weight_healthy',
      Goal.eatHealthier => 'eat_healthier',
      CuisineRegion.northIndian => 'north_indian',
      CuisineRegion.southIndian => 'south_indian',
      CuisineRegion.eastIndian => 'east_indian',
      CuisineRegion.westIndian => 'west_indian',
      SpiceTolerance.mild => 'mild',
      SpiceTolerance.medium => 'medium',
      SpiceTolerance.hot => 'hot',
      SpiceTolerance.veryHot => 'very_hot',
      DietPattern.vegetarian => 'vegetarian',
      DietPattern.eggetarian => 'eggetarian',
      DietPattern.nonVegetarian => 'non_vegetarian',
      DietPattern.pescatarian => 'pescatarian',
      DietPattern.vegan => 'vegan',
      DietPattern.jain => 'jain',
      CookingFrequency.daily => 'daily',
      CookingFrequency.weekendsOnly => 'weekends_only',
      CookingFrequency.rarely => 'rarely',
      SkillLevel.beginner => 'beginner',
      SkillLevel.intermediate => 'intermediate',
      SkillLevel.advanced => 'advanced',
      _ => null,
    };
  }

  Future<String> _ianaTimezone() async {
    try {
      return await FlutterTimezone.getLocalTimezone();
    } on Object catch (_) {
      // Etc/GMT uses inverted sign convention (Etc/GMT-5 = UTC+5).
      final hours = DateTime.now().timeZoneOffset.inHours;
      final sign = hours <= 0 ? '+' : '-';
      return 'Etc/GMT$sign${hours.abs()}';
    }
  }
}
