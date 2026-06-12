import 'package:flutter/material.dart';

/// Builds [ThemeData] for the Ahara app.
///
/// Theme is set once in F1 and followed throughout.
// TODO(F1): Replace with locked design system from docs/designs/F1/.
abstract final class AppTheme {
  /// Returns a light theme placeholder.
  // TODO(F1): Build from AppColors / AppTypography / AppSpacing tokens.
  static ThemeData light() {
    return ThemeData(
      useMaterial3: true,
      // TODO(F1): Set colorSchemeSeed or full ColorScheme from AppColors.
      // TODO(F1): Set textTheme from AppTypography.
    );
  }

  /// Returns a dark theme placeholder (if needed).
  // TODO(F1): Decide whether to ship dark mode in v1.
  static ThemeData dark() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
    );
  }
}
