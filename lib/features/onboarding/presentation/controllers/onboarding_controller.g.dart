// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Manages the 6-step onboarding form state.
///
/// Loads the questionnaire on init, tracks per-step form data,
/// validates before advancing, and submits the completed profile.

@ProviderFor(OnboardingController)
final onboardingControllerProvider = OnboardingControllerProvider._();

/// Manages the 6-step onboarding form state.
///
/// Loads the questionnaire on init, tracks per-step form data,
/// validates before advancing, and submits the completed profile.
final class OnboardingControllerProvider
    extends $AsyncNotifierProvider<OnboardingController, OnboardingState> {
  /// Manages the 6-step onboarding form state.
  ///
  /// Loads the questionnaire on init, tracks per-step form data,
  /// validates before advancing, and submits the completed profile.
  OnboardingControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'onboardingControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$onboardingControllerHash();

  @$internal
  @override
  OnboardingController create() => OnboardingController();
}

String _$onboardingControllerHash() =>
    r'417476dc97ce9eb49f448d93b681d916c1fa1061';

/// Manages the 6-step onboarding form state.
///
/// Loads the questionnaire on init, tracks per-step form data,
/// validates before advancing, and submits the completed profile.

abstract class _$OnboardingController extends $AsyncNotifier<OnboardingState> {
  FutureOr<OnboardingState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<OnboardingState>, OnboardingState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<OnboardingState>, OnboardingState>,
              AsyncValue<OnboardingState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
