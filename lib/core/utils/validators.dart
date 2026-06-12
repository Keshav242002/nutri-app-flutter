/// Form validation utilities for the Ahara app.
///
/// Called from controllers or widget `onChanged` — never from DataSource.
abstract final class Validators {
  static final _emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+\-]+@[a-zA-Z0-9.\-]+\.[a-zA-Z]{2,}$',
  );

  /// Returns `true` when [email] matches a valid email format.
  static bool isValidEmail(String email) => _emailRegex.hasMatch(email.trim());

  /// Returns an error string if [value] is blank, otherwise `null`.
  static String? required(String? value, {String field = 'This field'}) {
    if (value == null || value.trim().isEmpty) {
      return '$field is required.';
    }
    return null;
  }

  /// Returns an error string if [value] exceeds [max] characters.
  static String? maxLength(String? value, int max) {
    if (value != null && value.length > max) {
      return 'Must be $max characters or fewer.';
    }
    return null;
  }
}
