// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'week_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Manages state for the Week tab screen.
///
/// On build: loads week plans + weekly nutrition in parallel.
/// Day logs load lazily on day tap. Grocery loads lazily on pill tap.

@ProviderFor(WeekController)
final weekControllerProvider = WeekControllerProvider._();

/// Manages state for the Week tab screen.
///
/// On build: loads week plans + weekly nutrition in parallel.
/// Day logs load lazily on day tap. Grocery loads lazily on pill tap.
final class WeekControllerProvider
    extends $AsyncNotifierProvider<WeekController, WeekState> {
  /// Manages state for the Week tab screen.
  ///
  /// On build: loads week plans + weekly nutrition in parallel.
  /// Day logs load lazily on day tap. Grocery loads lazily on pill tap.
  WeekControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'weekControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$weekControllerHash();

  @$internal
  @override
  WeekController create() => WeekController();
}

String _$weekControllerHash() => r'77138bf00d803890baae2598e7069e02e5e12ce1';

/// Manages state for the Week tab screen.
///
/// On build: loads week plans + weekly nutrition in parallel.
/// Day logs load lazily on day tap. Grocery loads lazily on pill tap.

abstract class _$WeekController extends $AsyncNotifier<WeekState> {
  FutureOr<WeekState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<WeekState>, WeekState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<WeekState>, WeekState>,
              AsyncValue<WeekState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
