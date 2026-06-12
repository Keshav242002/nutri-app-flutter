import 'package:ahara/features/auth/presentation/controllers/splash_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('markOnboardingSeen', () {
    setUp(() => SharedPreferences.setMockInitialValues({}));

    test('sets hasSeenOnboarding=true in SharedPreferences', () async {
      await markOnboardingSeen();
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getBool('hasSeenOnboarding'), isTrue);
    });

    test('calling twice is idempotent', () async {
      await markOnboardingSeen();
      await markOnboardingSeen();
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getBool('hasSeenOnboarding'), isTrue);
    });
  });

  group('SplashResult enum', () {
    test('has four values', () {
      expect(SplashResult.values, hasLength(4));
    });

    test('contains expected routes', () {
      expect(
        SplashResult.values,
        containsAll([
          SplashResult.goToOnboarding,
          SplashResult.goToLogin,
          SplashResult.goToHome,
          SplashResult.goToOnboardingQuestionnaire,
        ]),
      );
    });
  });
}
