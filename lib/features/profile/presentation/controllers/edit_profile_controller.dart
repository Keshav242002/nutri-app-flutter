import 'package:ahara/core/network/api_exceptions.dart';
import 'package:ahara/core/providers/toast_provider.dart';
import 'package:ahara/features/onboarding/domain/models/dietary_profile.dart';
import 'package:ahara/features/profile/presentation/controllers/profile_controller.dart';
import 'package:ahara/features/profile/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_profile_controller.g.dart';

/// Drives the save side-effect for the edit-profile form.
///
/// State is the `isSubmitting` flag; the form's field values live in the
/// screen's local state. [save] sends only the changed fields via
/// `PATCH /profiles/me` and refreshes [ProfileController] on success.
@riverpod
class EditProfileController extends _$EditProfileController {
  @override
  bool build() => false;

  /// Sends [changes] (snake_case, changed fields only) to the backend.
  ///
  /// Returns `true` on success. Shows a toast for the no-changes case and
  /// for any failure.
  Future<bool> save(Map<String, dynamic> changes) async {
    if (changes.isEmpty) {
      ref.read(toastProvider.notifier).show('No changes to save');
      return false;
    }

    state = true;
    final result = await ref
        .read(profileRepositoryProvider)
        .updateProfile(changes);
    state = false;

    return result.when(
      success: (DietaryProfile _) {
        ref
            .read(toastProvider.notifier)
            .show('Profile updated', type: ToastType.success);
        ref.invalidate(profileControllerProvider);
        return true;
      },
      failure: (AppException e) {
        final msg = e is ValidationException && e.fieldErrors.isNotEmpty
            ? e.fieldErrors.values.first.first
            : e.message;
        ref.read(toastProvider.notifier).show(msg);
        return false;
      },
    );
  }
}
