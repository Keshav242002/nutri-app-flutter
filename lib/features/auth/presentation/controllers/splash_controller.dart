import 'package:ahara/core/network/api_exceptions.dart';
import 'package:ahara/features/auth/data/auth_repository.dart';
import 'package:ahara/features/auth/domain/models/user_model.dart';
import 'package:ahara/features/auth/providers.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'splash_controller.g.dart';

/// Result of the splash auth-gate check.
enum SplashResult {
  /// No Firebase user — show onboarding intro (first time).
  goToOnboarding,

  /// No Firebase user — user has seen onboarding before.
  goToLogin,

  /// Authenticated, backend profile exists.
  goToHome,

  /// Authenticated, no backend profile yet.
  goToOnboardingQuestionnaire,
}

/// Determines where to navigate after the splash animation completes.
///
/// Checks Firebase auth state, SharedPreferences `hasSeenOnboarding`,
/// and the backend `has_profile` flag.
@riverpod
Future<SplashResult> splashController(Ref ref) async {
  final firebaseUser = await fb.FirebaseAuth.instance.authStateChanges().first;

  if (firebaseUser == null) {
    final prefs = await SharedPreferences.getInstance();
    final seen = prefs.getBool('hasSeenOnboarding') ?? false;
    return seen ? SplashResult.goToLogin : SplashResult.goToOnboarding;
  }

  final repo = ref.read<AuthRepository>(authRepositoryProvider);
  final result = await repo.getCurrentUser();

  return result.when<SplashResult>(
    success: (User user) => user.hasProfile
        ? SplashResult.goToHome
        : SplashResult.goToOnboardingQuestionnaire,
    failure: (AppException _) => SplashResult.goToLogin,
  );
}

/// Marks onboarding as seen in [SharedPreferences].
Future<void> markOnboardingSeen() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('hasSeenOnboarding', true);
}
