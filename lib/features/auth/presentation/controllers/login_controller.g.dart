// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Manages the login screen state machine.
///
/// State transitions:
/// chooseMethod → emailPasswordEntry → emailPasswordSubmitting → success
/// chooseMethod → emailEntry → emailLinkSending → emailLinkSent
/// chooseMethod → googleSigningIn → success

@ProviderFor(LoginController)
final loginControllerProvider = LoginControllerProvider._();

/// Manages the login screen state machine.
///
/// State transitions:
/// chooseMethod → emailPasswordEntry → emailPasswordSubmitting → success
/// chooseMethod → emailEntry → emailLinkSending → emailLinkSent
/// chooseMethod → googleSigningIn → success
final class LoginControllerProvider
    extends $NotifierProvider<LoginController, LoginFormState> {
  /// Manages the login screen state machine.
  ///
  /// State transitions:
  /// chooseMethod → emailPasswordEntry → emailPasswordSubmitting → success
  /// chooseMethod → emailEntry → emailLinkSending → emailLinkSent
  /// chooseMethod → googleSigningIn → success
  LoginControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginControllerHash();

  @$internal
  @override
  LoginController create() => LoginController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoginFormState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoginFormState>(value),
    );
  }
}

String _$loginControllerHash() => r'a047d681c788e79332c6d19e97baf5a954945e33';

/// Manages the login screen state machine.
///
/// State transitions:
/// chooseMethod → emailPasswordEntry → emailPasswordSubmitting → success
/// chooseMethod → emailEntry → emailLinkSending → emailLinkSent
/// chooseMethod → googleSigningIn → success

abstract class _$LoginController extends $Notifier<LoginFormState> {
  LoginFormState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<LoginFormState, LoginFormState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<LoginFormState, LoginFormState>,
              LoginFormState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
