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

  /// Edit dietary profile — sub-route of the profile branch.
  static const profileEdit = '/profile/edit';

  /// Monthly nutrition report — sub-route of the profile branch.
  static const profileReport = '/profile/report';

  /// Notification settings — sub-route of the profile branch.
  static const profileNotifications = '/profile/notifications';

  /// F2 computed-targets summary after onboarding submit.
  static const yourPlan = '/your-plan';

  /// Recipe detail screen — sub-route of home branch.
  static const recipeDetail = '/home/recipe/:slug';

  /// In-app notification list — opened from the home-appbar bell (F7).
  static const notifications = '/home/notifications';

  /// Read-only preview of tomorrow's plan — for a first-day late signup.
  static const tomorrowPreview = '/home/tomorrow';
}
