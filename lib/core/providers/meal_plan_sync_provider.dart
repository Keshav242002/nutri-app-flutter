import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'meal_plan_sync_provider.g.dart';

/// A monotonically increasing revision counter, bumped after every successful
/// meal-plan mutation (e.g. a slot swap via `POST /mealplans/regenerate-slot/`)
/// from any screen.
///
/// Screens that display the planned meals (the dashboard meal cards, the week
/// tab's day plans) listen to this and silently refetch their plan when it
/// changes, so a swap made on one page is reflected on the other without a
/// manual refresh. It decouples the dashboard and week features — neither
/// imports the other.
@riverpod
class MealPlanRevision extends _$MealPlanRevision {
  @override
  int build() => 0;

  /// Signals that a meal plan was mutated; wakes up all listeners.
  void bump() => state = state + 1;
}
