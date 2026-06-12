import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// App typography tokens for the Ahara design system.
///
/// Two typefaces: DM Serif Display (headlines) and DM Sans (everything else).
/// No inline TextStyle with literal sizes — always pull from here.
abstract final class AppTypography {
  // --- Display (DM Serif Display) ---

  /// 32px — splash tagline, hero moments.
  static TextStyle get displayLarge => GoogleFonts.dmSerifDisplay(
    fontSize: 32,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.5,
    height: 1.2,
  );

  /// 26px — onboarding headlines.
  static TextStyle get displayMedium => GoogleFonts.dmSerifDisplay(
    fontSize: 26,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.3,
    height: 1.25,
  );

  // --- Heading (DM Sans) ---

  /// 22px Bold — screen titles.
  static TextStyle get headingLarge => GoogleFonts.dmSans(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    height: 1.3,
  );

  /// 18px Semibold — section headers, card titles.
  static TextStyle get headingMedium => GoogleFonts.dmSans(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.35,
  );

  // --- Body (DM Sans) ---

  /// 16px Regular — primary body text.
  static TextStyle get bodyLarge => GoogleFonts.dmSans(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.6,
  );

  /// 14px Regular — supporting body text, descriptions.
  static TextStyle get bodyMedium => GoogleFonts.dmSans(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.55,
  );

  // --- Label (DM Sans) ---

  /// 15px Semibold — button text, strong labels.
  static TextStyle get labelLarge => GoogleFonts.dmSans(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    height: 1.2,
  );

  /// 13px Medium — secondary labels, metadata.
  static TextStyle get labelMedium => GoogleFonts.dmSans(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    height: 1.3,
  );

  // --- Special ---

  /// 11px Semibold — always turmeric, uppercase, letter-spacing 1.5.
  static TextStyle get eyebrow => GoogleFonts.dmSans(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.5,
    height: 1.2,
  );

  /// 12px Regular — timestamps, helper text.
  static TextStyle get caption => GoogleFonts.dmSans(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.4,
  );

  /// Bold DM Sans with tabular figures for nutrition numbers.
  static TextStyle numericLarge({double fontSize = 24}) => GoogleFonts.dmSans(
    fontSize: fontSize,
    fontWeight: FontWeight.w700,
    fontFeatures: const [FontFeature.tabularFigures()],
    height: 1.1,
  );
}
