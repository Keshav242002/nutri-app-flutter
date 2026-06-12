import 'package:flutter/material.dart';

/// App color tokens for the Ahara design system.
///
/// Three anchors: Indigo Navy, Turmeric Gold, Warm Cream.
/// No hardcoded colors anywhere else in the codebase.
abstract final class AppColors {
  // --- Indigo Navy ---

  /// Deep warm navy — dark backgrounds, primary text, heavy UI.
  static const Color navyDeep = Color(0xFF1E1B2E);

  /// Mid navy — cards on dark surfaces.
  static const Color navyMid = Color(0xFF2A2640);

  /// Light navy — elevated elements on dark surfaces.
  static const Color navyLight = Color(0xFF3D3858);

  /// Very light navy tint — selected states, hover.
  static const Color navySubtle = Color(0xFFEEEDF4);

  // --- Turmeric Gold ---

  /// Primary accent — CTAs, active pills, logo sun.
  static const Color turmeric = Color(0xFFF5A623);

  /// Lighter turmeric — hover states.
  static const Color turmericLight = Color(0xFFFDC96A);

  /// Turmeric at 32% opacity — completed progress pills, soft tints.
  static const Color turmericDim = Color(0x52F5A623);

  // --- Warm Cream ---

  /// Page background — the canvas everything sits on.
  static const Color cream = Color(0xFFFDFAF4);

  /// Card surfaces, bottom sheets, input fill.
  static const Color creamDeep = Color(0xFFF2EFE4);

  /// Dividers, input borders, chip backgrounds.
  static const Color creamBorder = Color(0xFFE8E3D5);

  // --- Pure ---

  /// Pure white — text on navy only.
  static const Color white = Color(0xFFFFFFFF);

  // --- Text ---

  /// All body text on light backgrounds.
  static const Color textPrimary = Color(0xFF1E1B2E);

  /// Supporting text, captions, labels.
  static const Color textSecondary = Color(0xFF6B6578);

  /// Placeholders, disabled states.
  static const Color textHint = Color(0xFFADA8BA);

  /// Text on navy surfaces.
  static const Color textOnDark = Color(0xFFFDFAF4);

  /// Supporting text on navy surfaces.
  static const Color textOnDarkSecondary = Color(0xFFBDB8CC);

  // --- Semantic ---

  /// Eaten meals, logged states.
  static const Color success = Color(0xFF4A7C5E);

  /// Success surface/background.
  static const Color successLight = Color(0xFFE8F4ED);

  /// Validation errors.
  static const Color error = Color(0xFFBA1A1A);

  /// Error surface/background.
  static const Color errorLight = Color(0xFFFFDAD6);

  // --- Macro tracking ---

  /// Protein — deep terracotta.
  static const Color macroProtein = Color(0xFFC2541E);

  /// Carbs — warm amber.
  static const Color macroCarbs = Color(0xFFE0A53F);

  /// Fat — soft rose.
  static const Color macroFat = Color(0xFFD98A9E);

  /// Fiber — sage green.
  static const Color macroFiber = Color(0xFF7BA88E);
}
