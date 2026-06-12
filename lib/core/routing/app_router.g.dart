// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provides the [GoRouter] instance for the app.
///
/// F0: Single placeholder route at [RoutePaths.home].
/// TODO(F1): Add splash, login, signup routes + redirect guards.
/// TODO(F1): Wrap tab routes in ShellRoute with AppBottomNav.

@ProviderFor(router)
final routerProvider = RouterProvider._();

/// Provides the [GoRouter] instance for the app.
///
/// F0: Single placeholder route at [RoutePaths.home].
/// TODO(F1): Add splash, login, signup routes + redirect guards.
/// TODO(F1): Wrap tab routes in ShellRoute with AppBottomNav.

final class RouterProvider
    extends $FunctionalProvider<GoRouter, GoRouter, GoRouter>
    with $Provider<GoRouter> {
  /// Provides the [GoRouter] instance for the app.
  ///
  /// F0: Single placeholder route at [RoutePaths.home].
  /// TODO(F1): Add splash, login, signup routes + redirect guards.
  /// TODO(F1): Wrap tab routes in ShellRoute with AppBottomNav.
  RouterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'routerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$routerHash();

  @$internal
  @override
  $ProviderElement<GoRouter> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GoRouter create(Ref ref) {
    return router(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoRouter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GoRouter>(value),
    );
  }
}

String _$routerHash() => r'72f701718d54ac6ec97d8fb9952b86b200b075d6';
