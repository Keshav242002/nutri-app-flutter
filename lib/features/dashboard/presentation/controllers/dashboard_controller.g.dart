// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Manages the dashboard screen state.
///
/// Fetches meal plan, nutrition, and today's logs in parallel on build.
/// Exposes action methods that call the repository and update card states.

@ProviderFor(DashboardController)
final dashboardControllerProvider = DashboardControllerProvider._();

/// Manages the dashboard screen state.
///
/// Fetches meal plan, nutrition, and today's logs in parallel on build.
/// Exposes action methods that call the repository and update card states.
final class DashboardControllerProvider
    extends $AsyncNotifierProvider<DashboardController, DashboardState> {
  /// Manages the dashboard screen state.
  ///
  /// Fetches meal plan, nutrition, and today's logs in parallel on build.
  /// Exposes action methods that call the repository and update card states.
  DashboardControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dashboardControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dashboardControllerHash();

  @$internal
  @override
  DashboardController create() => DashboardController();
}

String _$dashboardControllerHash() =>
    r'c01e05ad51e9ad33594739d6f044a1edaefc1129';

/// Manages the dashboard screen state.
///
/// Fetches meal plan, nutrition, and today's logs in parallel on build.
/// Exposes action methods that call the repository and update card states.

abstract class _$DashboardController extends $AsyncNotifier<DashboardState> {
  FutureOr<DashboardState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<DashboardState>, DashboardState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<DashboardState>, DashboardState>,
              AsyncValue<DashboardState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
