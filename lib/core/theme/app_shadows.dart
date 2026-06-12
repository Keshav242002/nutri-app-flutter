import 'package:ahara/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

/// Elevation / shadow tokens for the Ahara design system.
///
/// All shadows use Navy Deep at low opacity (4–12%) — never pure black.
/// Depth is communicated through tonal layering first; shadows are rare.
abstract final class AppShadows {
  /// Soft card shadow — recipe cards, bottom sheets lifting from screen.
  static const List<BoxShadow> card = [
    BoxShadow(
      color: Color(0x0A1E1B2E), // navyDeep @ 4%
      blurRadius: 24,
      offset: Offset(0, 4),
    ),
  ];

  /// Button shadow — used on the Google sign-in button in State A.
  static const List<BoxShadow> button = [
    BoxShadow(
      color: Color(0x0F1E1B2E), // navyDeep @ 6%
      blurRadius: 8,
      offset: Offset(0, 2),
    ),
  ];

  /// Modal / bottom sheet shadow — lifts the sheet from the screen.
  static const List<BoxShadow> modal = [
    BoxShadow(
      color: Color(0x1F1E1B2E), // navyDeep @ 12%
      blurRadius: 32,
      offset: Offset(0, 8),
    ),
  ];

  /// Converts [AppColors.navyDeep] to a shadow-safe color at [opacity].
  static Color shadowColor(double opacity) =>
      AppColors.navyDeep.withValues(alpha: opacity);
}
