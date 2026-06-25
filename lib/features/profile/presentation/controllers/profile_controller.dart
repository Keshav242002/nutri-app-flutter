import 'package:ahara/features/onboarding/domain/models/dietary_profile.dart';
import 'package:ahara/features/profile/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_controller.g.dart';

/// Loads the authenticated user's dietary profile for the Profile tab.
///
/// On build: fetches `GET /profiles/me`. Throws on failure so the screen's
/// `.when(error:)` branch renders an error state.
@riverpod
class ProfileController extends _$ProfileController {
  @override
  Future<DietaryProfile> build() async {
    final result = await ref.read(profileRepositoryProvider).getMe();
    return result.when(
      success: (DietaryProfile p) => p,
      failure: (e) => throw e,
    );
  }
}
