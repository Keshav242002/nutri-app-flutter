// Formatting utilities for the Ahara app.
// TODO(F3): Add formatters for calories, macros, servings, currency (INR).
// Centralized so formatting is consistent across all screens.

/// Humanises a snake_case API tag for display.
///
/// e.g. `north_indian` → "North Indian", `dal_legume` → "Dal Legume".
/// Returns an empty string for null/empty input.
String formatTag(String? raw) {
  if (raw == null || raw.isEmpty) return '';
  return raw
      .split('_')
      .where((String w) => w.isNotEmpty)
      .map((String w) => '${w[0].toUpperCase()}${w.substring(1)}')
      .join(' ');
}
