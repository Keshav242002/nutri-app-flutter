import 'package:ahara/features/dashboard/domain/models/meal_card_state.dart';

/// Local hour after which a brand-new first-day signup is treated as having
/// missed the whole day (dinner window is over) — they're offered tomorrow.
const int kDayOverHour = 22;

/// The meal slot active at [now], using device-local time.
///
/// Windows: breakfast `< 11:00`, lunch `< 16:00`, dinner otherwise. The single
/// source of truth for the home screen's slot highlight + nudge.
MealSlot currentMealSlot(DateTime now) {
  final h = now.hour;
  if (h < 11) return MealSlot.breakfast;
  if (h < 16) return MealSlot.lunch;
  return MealSlot.dinner;
}

/// Meal slots still worth showing to a user who signed up at [signupLocal] on
/// their first day. Slots whose window had already ended at signup are dropped.
/// An empty list means the day is over (signed up after [kDayOverHour]) — the
/// caller should offer tomorrow's plan instead.
List<MealSlot> firstDaySlots(DateTime signupLocal) {
  final h = signupLocal.hour;
  if (h < 11) return MealSlot.values;
  if (h < 16) return const [MealSlot.lunch, MealSlot.dinner];
  if (h < kDayOverHour) return const [MealSlot.dinner];
  return const [];
}
