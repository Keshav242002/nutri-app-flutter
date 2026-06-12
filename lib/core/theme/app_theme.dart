import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_radius.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:flutter/material.dart';

/// Builds [ThemeData] for the Ahara app from locked design tokens.
///
/// Material 3 with exact brand colors from [AppColors].
/// Dark mode is not in scope for v1 — light mode only.
abstract final class AppTheme {
  /// Light theme — the only theme shipped in v1.
  static ThemeData light() {
    final base = ColorScheme.fromSeed(seedColor: AppColors.navyDeep).copyWith(
      primary: AppColors.navyDeep,
      primaryContainer: AppColors.navyMid,
      onPrimary: AppColors.white,
      secondary: AppColors.turmeric,
      onSecondary: AppColors.navyDeep,
      surface: AppColors.cream,
      onSurface: AppColors.textPrimary,
      error: AppColors.error,
      onError: AppColors.white,
      outline: AppColors.creamBorder,
      surfaceContainerHighest: AppColors.creamDeep,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: base,
      scaffoldBackgroundColor: AppColors.cream,
      cardColor: AppColors.creamDeep,
      dividerColor: AppColors.creamBorder,
      textTheme: _textTheme(),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.cream,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      cardTheme: const CardThemeData(
        color: AppColors.creamDeep,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.card,
          side: BorderSide(color: AppColors.creamBorder),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.creamDeep,
        border: const OutlineInputBorder(
          borderRadius: AppRadius.button,
          borderSide: BorderSide(color: AppColors.creamBorder, width: 1.5),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: AppRadius.button,
          borderSide: BorderSide(color: AppColors.creamBorder, width: 1.5),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: AppRadius.button,
          borderSide: BorderSide(color: AppColors.navyDeep, width: 1.5),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: AppRadius.button,
          borderSide: BorderSide(color: AppColors.error, width: 1.5),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: AppRadius.button,
          borderSide: BorderSide(color: AppColors.error, width: 1.5),
        ),
        hintStyle: AppTypography.bodyMedium.copyWith(color: AppColors.textHint),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.turmeric,
          foregroundColor: AppColors.navyDeep,
          minimumSize: const Size(double.infinity, 52),
          shape: const RoundedRectangleBorder(borderRadius: AppRadius.button),
          textStyle: AppTypography.labelLarge,
          elevation: 0,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.textSecondary,
          textStyle: AppTypography.labelMedium,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.cream,
        selectedItemColor: AppColors.turmeric,
        unselectedItemColor: AppColors.textHint,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.creamBorder,
        selectedColor: AppColors.navySubtle,
        labelStyle: AppTypography.labelMedium,
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.pill),
        side: BorderSide.none,
      ),
    );
  }

  static TextTheme _textTheme() {
    return TextTheme(
      displayLarge: AppTypography.displayLarge.copyWith(
        color: AppColors.textPrimary,
      ),
      displayMedium: AppTypography.displayMedium.copyWith(
        color: AppColors.textPrimary,
      ),
      headlineLarge: AppTypography.headingLarge.copyWith(
        color: AppColors.textPrimary,
      ),
      headlineMedium: AppTypography.headingMedium.copyWith(
        color: AppColors.textPrimary,
      ),
      bodyLarge: AppTypography.bodyLarge.copyWith(color: AppColors.textPrimary),
      bodyMedium: AppTypography.bodyMedium.copyWith(
        color: AppColors.textPrimary,
      ),
      labelLarge: AppTypography.labelLarge.copyWith(
        color: AppColors.textPrimary,
      ),
      labelMedium: AppTypography.labelMedium.copyWith(
        color: AppColors.textSecondary,
      ),
      bodySmall: AppTypography.caption.copyWith(color: AppColors.textSecondary),
    );
  }
}
