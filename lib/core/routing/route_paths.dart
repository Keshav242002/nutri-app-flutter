/// Centralized route path constants for the Ahara app.
///
/// All route strings are defined here — never use raw string literals
/// in navigation calls.
abstract final class RoutePaths {
  /// Brand entrance / auth-gate screen.
  static const splash = '/splash';

  /// Value-prop onboarding slides (first-time users).
  static const onboardingIntro = '/onboarding-intro';

  /// Combined login + signup screen.
  static const login = '/login';

  /// F2 dietary-profile questionnaire (new users post-auth).
  static const onboarding = '/onboarding';

  /// Main home / dashboard screen.
  static const home = '/home';

  /// Recipe browser (stubbed in v1, promoted in v1.1).
  static const recipes = '/recipes';

  /// Daily food tracker screen.
  static const tracker = '/tracker';

  /// User profile screen.
  static const profile = '/profile';

  /// F2 computed-targets summary after onboarding submit.
  static const yourPlan = '/your-plan';
}
