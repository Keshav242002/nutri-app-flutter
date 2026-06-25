// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Drives the save side-effect for the edit-profile form.
///
/// State is the `isSubmitting` flag; the form's field values live in the
/// screen's local state. [save] sends only the changed fields via
/// `PATCH /profiles/me` and refreshes [ProfileController] on success.

@ProviderFor(EditProfileController)
final editProfileControllerProvider = EditProfileControllerProvider._();

/// Drives the save side-effect for the edit-profile form.
///
/// State is the `isSubmitting` flag; the form's field values live in the
/// screen's local state. [save] sends only the changed fields via
/// `PATCH /profiles/me` and refreshes [ProfileController] on success.
final class EditProfileControllerProvider
    extends $NotifierProvider<EditProfileController, bool> {
  /// Drives the save side-effect for the edit-profile form.
  ///
  /// State is the `isSubmitting` flag; the form's field values live in the
  /// screen's local state. [save] sends only the changed fields via
  /// `PATCH /profiles/me` and refreshes [ProfileController] on success.
  EditProfileControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'editProfileControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$editProfileControllerHash();

  @$internal
  @override
  EditProfileController create() => EditProfileController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$editProfileControllerHash() =>
    r'd6286f5d59d9ff140e6447cbb3bdaea2b7564794';

/// Drives the save side-effect for the edit-profile form.
///
/// State is the `isSubmitting` flag; the form's field values live in the
/// screen's local state. [save] sends only the changed fields via
/// `PATCH /profiles/me` and refreshes [ProfileController] on success.

abstract class _$EditProfileController extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
