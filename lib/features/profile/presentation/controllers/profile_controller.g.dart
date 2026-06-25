// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Loads the authenticated user's dietary profile for the Profile tab.
///
/// On build: fetches `GET /profiles/me`. Throws on failure so the screen's
/// `.when(error:)` branch renders an error state.

@ProviderFor(ProfileController)
final profileControllerProvider = ProfileControllerProvider._();

/// Loads the authenticated user's dietary profile for the Profile tab.
///
/// On build: fetches `GET /profiles/me`. Throws on failure so the screen's
/// `.when(error:)` branch renders an error state.
final class ProfileControllerProvider
    extends $AsyncNotifierProvider<ProfileController, DietaryProfile> {
  /// Loads the authenticated user's dietary profile for the Profile tab.
  ///
  /// On build: fetches `GET /profiles/me`. Throws on failure so the screen's
  /// `.when(error:)` branch renders an error state.
  ProfileControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileControllerHash();

  @$internal
  @override
  ProfileController create() => ProfileController();
}

String _$profileControllerHash() => r'5e0b821eca9a74ee9dc31760897891866fd62ddc';

/// Loads the authenticated user's dietary profile for the Profile tab.
///
/// On build: fetches `GET /profiles/me`. Throws on failure so the screen's
/// `.when(error:)` branch renders an error state.

abstract class _$ProfileController extends $AsyncNotifier<DietaryProfile> {
  FutureOr<DietaryProfile> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<DietaryProfile>, DietaryProfile>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<DietaryProfile>, DietaryProfile>,
              AsyncValue<DietaryProfile>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
