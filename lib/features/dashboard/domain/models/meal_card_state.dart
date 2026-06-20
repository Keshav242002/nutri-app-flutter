import 'package:ahara/features/dashboard/domain/models/recipe_slim.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal_card_state.freezed.dart';

/// The three meal slots on the dashboard.
enum MealSlot {
  /// Morning meal.
  breakfast,

  /// Midday meal.
  lunch,

  /// Evening meal.
  dinner,
}

/// UI-only sealed union representing the visual state of one meal card.
///
/// Not serialised — derived from `MealLog` status at runtime.
@freezed
abstract class MealCardState with _$MealCardState {
  /// The meal has been planned but not yet logged.
  const factory MealCardState.planned({
    required RecipeSlim recipe,
    required MealSlot slot,
  }) = PlannedMealCard;

  /// The user ate the planned recipe.
  const factory MealCardState.eaten({
    required RecipeSlim recipe,
    required MealSlot slot,
    required double servingsEaten,
  }) = EatenMealCard;

  /// The user ate a different recipe.
  const factory MealCardState.loggedSubstituted({
    required RecipeSlim actualRecipe,
    required MealSlot slot,
  }) = SubstitutedMealCard;

  /// The user logged a custom meal.
  const factory MealCardState.loggedCustom({
    required String description,
    required int calories,
    required MealSlot slot,
  }) = CustomMealCard;

  /// The user skipped this meal.
  const factory MealCardState.skipped({
    required RecipeSlim recipe,
    required MealSlot slot,
  }) = SkippedMealCard;
}
