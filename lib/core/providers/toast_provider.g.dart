// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toast_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Holds the currently visible [ToastMessage], or `null` when none is shown.
///
/// Call [show] to display a toast; it auto-dismisses after 2 seconds.

@ProviderFor(ToastNotifier)
final toastProvider = ToastNotifierProvider._();

/// Holds the currently visible [ToastMessage], or `null` when none is shown.
///
/// Call [show] to display a toast; it auto-dismisses after 2 seconds.
final class ToastNotifierProvider
    extends $NotifierProvider<ToastNotifier, ToastMessage?> {
  /// Holds the currently visible [ToastMessage], or `null` when none is shown.
  ///
  /// Call [show] to display a toast; it auto-dismisses after 2 seconds.
  ToastNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'toastProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$toastNotifierHash();

  @$internal
  @override
  ToastNotifier create() => ToastNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ToastMessage? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ToastMessage?>(value),
    );
  }
}

String _$toastNotifierHash() => r'a20aa4a05192f7bd07a4c6e7f32cb548b7361af8';

/// Holds the currently visible [ToastMessage], or `null` when none is shown.
///
/// Call [show] to display a toast; it auto-dismisses after 2 seconds.

abstract class _$ToastNotifier extends $Notifier<ToastMessage?> {
  ToastMessage? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ToastMessage?, ToastMessage?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ToastMessage?, ToastMessage?>,
              ToastMessage?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
