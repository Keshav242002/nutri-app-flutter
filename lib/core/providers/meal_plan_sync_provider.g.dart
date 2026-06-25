// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_plan_sync_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A monotonically increasing revision counter, bumped after every successful
/// meal-plan mutation (e.g. a slot swap via `POST /mealplans/regenerate-slot/`)
/// from any screen.
///
/// Screens that display the planned meals (the dashboard meal cards, the week
/// tab's day plans) listen to this and silently refetch their plan when it
/// changes, so a swap made on one page is reflected on the other without a
/// manual refresh. It decouples the dashboard and week features — neither
/// imports the other.

@ProviderFor(MealPlanRevision)
final mealPlanRevisionProvider = MealPlanRevisionProvider._();

/// A monotonically increasing revision counter, bumped after every successful
/// meal-plan mutation (e.g. a slot swap via `POST /mealplans/regenerate-slot/`)
/// from any screen.
///
/// Screens that display the planned meals (the dashboard meal cards, the week
/// tab's day plans) listen to this and silently refetch their plan when it
/// changes, so a swap made on one page is reflected on the other without a
/// manual refresh. It decouples the dashboard and week features — neither
/// imports the other.
final class MealPlanRevisionProvider
    extends $NotifierProvider<MealPlanRevision, int> {
  /// A monotonically increasing revision counter, bumped after every successful
  /// meal-plan mutation (e.g. a slot swap via `POST /mealplans/regenerate-slot/`)
  /// from any screen.
  ///
  /// Screens that display the planned meals (the dashboard meal cards, the week
  /// tab's day plans) listen to this and silently refetch their plan when it
  /// changes, so a swap made on one page is reflected on the other without a
  /// manual refresh. It decouples the dashboard and week features — neither
  /// imports the other.
  MealPlanRevisionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mealPlanRevisionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mealPlanRevisionHash();

  @$internal
  @override
  MealPlanRevision create() => MealPlanRevision();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$mealPlanRevisionHash() => r'588ecfd916a6501fd4da9f0b4f15f00fe76ce88f';

/// A monotonically increasing revision counter, bumped after every successful
/// meal-plan mutation (e.g. a slot swap via `POST /mealplans/regenerate-slot/`)
/// from any screen.
///
/// Screens that display the planned meals (the dashboard meal cards, the week
/// tab's day plans) listen to this and silently refetch their plan when it
/// changes, so a swap made on one page is reflected on the other without a
/// manual refresh. It decouples the dashboard and week features — neither
/// imports the other.

abstract class _$MealPlanRevision extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
