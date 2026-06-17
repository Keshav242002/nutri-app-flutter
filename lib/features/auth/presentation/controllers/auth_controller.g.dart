// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Manages the global auth state of the app.
///
/// Listens to Firebase auth changes and keeps the backend user record
/// in sync. Kept alive so auth state survives navigation.

@ProviderFor(AuthController)
final authControllerProvider = AuthControllerProvider._();

/// Manages the global auth state of the app.
///
/// Listens to Firebase auth changes and keeps the backend user record
/// in sync. Kept alive so auth state survives navigation.
final class AuthControllerProvider
    extends $AsyncNotifierProvider<AuthController, AuthState> {
  /// Manages the global auth state of the app.
  ///
  /// Listens to Firebase auth changes and keeps the backend user record
  /// in sync. Kept alive so auth state survives navigation.
  AuthControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authControllerHash();

  @$internal
  @override
  AuthController create() => AuthController();
}

String _$authControllerHash() => r'28023c2e63805ab920160aa037e421d23c9a2ee0';

/// Manages the global auth state of the app.
///
/// Listens to Firebase auth changes and keeps the backend user record
/// in sync. Kept alive so auth state survives navigation.

abstract class _$AuthController extends $AsyncNotifier<AuthState> {
  FutureOr<AuthState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<AuthState>, AuthState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AuthState>, AuthState>,
              AsyncValue<AuthState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
