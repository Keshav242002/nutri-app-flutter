import 'package:json_annotation/json_annotation.dart';

/// Biological sex / gender identity options for dietary profiling.
enum Sex {
  /// Male.
  @JsonValue('male')
  male,

  /// Female.
  @JsonValue('female')
  female,

  /// Other.
  @JsonValue('other')
  other,

  /// Prefer not to say.
  @JsonValue('prefer_not_to_say')
  preferNotToSay,
}

/// Physical activity level for TDEE computation.
enum ActivityLevel {
  /// Desk job, little or no exercise.
  @JsonValue('sedentary')
  sedentary,

  /// Light exercise 1–3 days/week.
  @JsonValue('light')
  light,

  /// Moderate exercise 3–5 days/week.
  @JsonValue('moderate')
  moderate,

  /// Hard exercise 6–7 days/week.
  @JsonValue('very')
  very,

  /// Physical job or 2× daily training.
  @JsonValue('athlete')
  athlete,
}

/// Primary dietary / wellness goal.
enum Goal {
  /// Reduce body weight.
  @JsonValue('lose_weight')
  loseWeight,

  /// Maintain current weight.
  @JsonValue('maintain')
  maintain,

  /// Build lean muscle mass.
  @JsonValue('gain_muscle')
  gainMuscle,

  /// Gain weight in a healthy way.
  @JsonValue('gain_weight_healthy')
  gainWeightHealthy,

  /// Improve overall diet quality.
  @JsonValue('eat_healthier')
  eatHealthier,
}

/// Primary Indian cuisine region preference.
enum CuisineRegion {
  /// North Indian cuisine.
  @JsonValue('north_indian')
  northIndian,

  /// South Indian cuisine.
  @JsonValue('south_indian')
  southIndian,

  /// East Indian cuisine.
  @JsonValue('east_indian')
  eastIndian,

  /// West Indian cuisine.
  @JsonValue('west_indian')
  westIndian,
}

/// Preferred heat level in food.
enum SpiceTolerance {
  /// Minimal spice.
  @JsonValue('mild')
  mild,

  /// Moderate spice.
  @JsonValue('medium')
  medium,

  /// High heat.
  @JsonValue('hot')
  hot,

  /// Extreme heat.
  @JsonValue('very_hot')
  veryHot,
}

/// Dietary pattern / food restriction type.
enum DietPattern {
  /// No meat or eggs; dairy allowed.
  @JsonValue('vegetarian')
  vegetarian,

  /// Vegetarian but includes eggs.
  @JsonValue('eggetarian')
  eggetarian,

  /// No restrictions.
  @JsonValue('non_vegetarian')
  nonVegetarian,

  /// Fish and seafood allowed; no other meat.
  @JsonValue('pescatarian')
  pescatarian,

  /// No animal products at all.
  @JsonValue('vegan')
  vegan,

  /// Strict Jain — no root vegetables, no onion/garlic.
  @JsonValue('jain')
  jain,
}

/// How often the user cooks at home.
enum CookingFrequency {
  /// Cooks every day.
  @JsonValue('daily')
  daily,

  /// Cooks on weekends only.
  @JsonValue('weekends_only')
  weekendsOnly,

  /// Rarely cooks at home.
  @JsonValue('rarely')
  rarely,
}

/// Self-assessed cooking skill level.
enum SkillLevel {
  /// Just starting out.
  @JsonValue('beginner')
  beginner,

  /// Comfortable with common techniques.
  @JsonValue('intermediate')
  intermediate,

  /// Confident with complex recipes.
  @JsonValue('advanced')
  advanced,
}
