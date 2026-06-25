// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_settings_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Single source of truth for the "Push notifications" opt-in.
///
/// `true` means the device's FCM token is registered with the backend.
/// Kept alive so the token-refresh subscription survives navigation.

@ProviderFor(PushSettingsController)
final pushSettingsControllerProvider = PushSettingsControllerProvider._();

/// Single source of truth for the "Push notifications" opt-in.
///
/// `true` means the device's FCM token is registered with the backend.
/// Kept alive so the token-refresh subscription survives navigation.
final class PushSettingsControllerProvider
    extends $AsyncNotifierProvider<PushSettingsController, bool> {
  /// Single source of truth for the "Push notifications" opt-in.
  ///
  /// `true` means the device's FCM token is registered with the backend.
  /// Kept alive so the token-refresh subscription survives navigation.
  PushSettingsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pushSettingsControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pushSettingsControllerHash();

  @$internal
  @override
  PushSettingsController create() => PushSettingsController();
}

String _$pushSettingsControllerHash() =>
    r'f9e39c7a25d10d2964de44c7f7a9d527612bbe79';

/// Single source of truth for the "Push notifications" opt-in.
///
/// `true` means the device's FCM token is registered with the backend.
/// Kept alive so the token-refresh subscription survives navigation.

abstract class _$PushSettingsController extends $AsyncNotifier<bool> {
  FutureOr<bool> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<bool>, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<bool>, bool>,
              AsyncValue<bool>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
