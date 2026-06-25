// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tomorrow_plan_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Loads tomorrow's meal plan for the first-day "see tomorrow" read-only
/// preview. Backed by `GET /mealplans/day/<tomorrow>/`.

@ProviderFor(TomorrowPlanController)
final tomorrowPlanControllerProvider = TomorrowPlanControllerProvider._();

/// Loads tomorrow's meal plan for the first-day "see tomorrow" read-only
/// preview. Backed by `GET /mealplans/day/<tomorrow>/`.
final class TomorrowPlanControllerProvider
    extends $AsyncNotifierProvider<TomorrowPlanController, TodayMealPlan> {
  /// Loads tomorrow's meal plan for the first-day "see tomorrow" read-only
  /// preview. Backed by `GET /mealplans/day/<tomorrow>/`.
  TomorrowPlanControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tomorrowPlanControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tomorrowPlanControllerHash();

  @$internal
  @override
  TomorrowPlanController create() => TomorrowPlanController();
}

String _$tomorrowPlanControllerHash() =>
    r'30900c2896d1e1bd2b2ab1ba0e2618da8215d4fd';

/// Loads tomorrow's meal plan for the first-day "see tomorrow" read-only
/// preview. Backed by `GET /mealplans/day/<tomorrow>/`.

abstract class _$TomorrowPlanController extends $AsyncNotifier<TodayMealPlan> {
  FutureOr<TodayMealPlan> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<TodayMealPlan>, TodayMealPlan>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<TodayMealPlan>, TodayMealPlan>,
              AsyncValue<TodayMealPlan>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
