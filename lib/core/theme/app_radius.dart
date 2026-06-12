import 'package:flutter/material.dart';

/// Corner radius tokens for the Ahara design system.
///
/// Separate from spacing tokens for semantic clarity.
abstract final class AppRadius {
  /// 4px — small tags, micro elements.
  static const double xs = 4;

  /// 8px — inline chips within text.
  static const double sm = 8;

  /// 12px — buttons, inputs, filter chips.
  static const double md = 12;

  /// 16px — cards, tiles, recipe thumbnails.
  static const double lg = 16;

  /// 24px — large cards, modal sheets.
  static const double xl = 24;

  /// 32px — hero feature cards.
  static const double xxl = 32;

  /// 999px — pill chips, progress bars, FAB.
  static const double full = 999;

  /// Bottom sheet: 28px top corners only, square bottom corners.
  static const BorderRadius bottomSheet = BorderRadius.only(
    topLeft: Radius.circular(28),
    topRight: Radius.circular(28),
  );

  /// Standard card border radius.
  static const BorderRadius card = BorderRadius.all(Radius.circular(lg));

  /// Button border radius.
  static const BorderRadius button = BorderRadius.all(Radius.circular(md));

  /// Pill / chip border radius.
  static const BorderRadius pill = BorderRadius.all(Radius.circular(full));
}
