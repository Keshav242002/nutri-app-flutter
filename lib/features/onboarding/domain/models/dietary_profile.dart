import 'package:freezed_annotation/freezed_annotation.dart';

part 'dietary_profile.freezed.dart';
part 'dietary_profile.g.dart';

/// Full dietary profile returned by `POST /profiles/onboarding`.
///
/// Includes both submitted fields and backend-computed targets.
@freezed
abstract class DietaryProfile with _$DietaryProfile {
  /// Creates a [DietaryProfile].
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory DietaryProfile({
    // Required fields (submitted + echoed back)
    required String dateOfBirth,
    required String sex,
    required int heightCm,
    required String activityLevel,
    required String goal,
    required String primaryCuisineRegion,
    required String spiceTolerance,
    required String dietPattern,
    required String cookingFrequency,
    required String skillLevel,
    // Optional / defaulted submitted fields
    // ignore: invalid_annotation_target — freezed requires @JsonKey on factory params
    @JsonKey(fromJson: _doubleFromJsonRequired) @Default(0.0) double weightKg,
    @Default([]) List<String> secondaryCuisinePreferences,
    @Default(false) bool noOnionGarlic,
    @Default([]) List<String> allergies,
    @Default([]) List<String> dislikes,
    // ignore: invalid_annotation_target — freezed requires @JsonKey on factory params
    @JsonKey(fromJson: _doubleFromJson) double? dailyFoodBudgetInr,
    // ignore: invalid_annotation_target — freezed requires @JsonKey on factory params
    @JsonKey(fromJson: _doubleFromJson) double? weeklyFoodBudgetInr,
    @Default(1) int householdSize,
    @Default(30) int maxPrepTimeMin,
    String? timezone,
    // Read-only computed fields
    int? targetCalories,
    // ignore: invalid_annotation_target — freezed requires @JsonKey on factory params
    @JsonKey(fromJson: _doubleFromJson) double? targetProteinG,
    // ignore: invalid_annotation_target — freezed requires @JsonKey on factory params
    @JsonKey(fromJson: _doubleFromJson) double? targetCarbsG,
    // ignore: invalid_annotation_target — freezed requires @JsonKey on factory params
    @JsonKey(fromJson: _doubleFromJson) double? targetFatG,
    // ignore: invalid_annotation_target — freezed requires @JsonKey on factory params
    @JsonKey(fromJson: _doubleFromJson) double? targetFiberG,
    int? age,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _DietaryProfile;

  /// Deserialises from the API `data` field.
  factory DietaryProfile.fromJson(Map<String, dynamic> json) =>
      _$DietaryProfileFromJson(json);
}

/// Handles string-encoded decimals from the backend (e.g. `"110.0"` → 110.0).
double? _doubleFromJson(dynamic value) {
  if (value == null) return null;
  if (value is double) return value;
  if (value is int) return value.toDouble();
  if (value is String) return double.tryParse(value);
  return null;
}

/// Non-nullable variant of [_doubleFromJson] for required fields.
double _doubleFromJsonRequired(dynamic value) => _doubleFromJson(value) ?? 0.0;
