// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Determines where to navigate after the splash animation completes.
///
/// Checks Firebase auth state, SharedPreferences `hasSeenOnboarding`,
/// and the backend `has_profile` flag.

@ProviderFor(splashController)
final splashControllerProvider = SplashControllerProvider._();

/// Determines where to navigate after the splash animation completes.
///
/// Checks Firebase auth state, SharedPreferences `hasSeenOnboarding`,
/// and the backend `has_profile` flag.

final class SplashControllerProvider
    extends
        $FunctionalProvider<
          AsyncValue<SplashResult>,
          SplashResult,
          FutureOr<SplashResult>
        >
    with $FutureModifier<SplashResult>, $FutureProvider<SplashResult> {
  /// Determines where to navigate after the splash animation completes.
  ///
  /// Checks Firebase auth state, SharedPreferences `hasSeenOnboarding`,
  /// and the backend `has_profile` flag.
  SplashControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'splashControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$splashControllerHash();

  @$internal
  @override
  $FutureProviderElement<SplashResult> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<SplashResult> create(Ref ref) {
    return splashController(ref);
  }
}

String _$splashControllerHash() => r'bec4b41c39be49d22fe748b99f369fb98069a7e2';
