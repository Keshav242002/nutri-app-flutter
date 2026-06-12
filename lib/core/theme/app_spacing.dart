/// App spacing tokens for the Ahara design system.
///
/// Base unit is 4px. All spacing is a multiple of this unit.
/// No inline spacing values anywhere else in the codebase.
abstract final class AppSpacing {
  /// 4px — tight internal gaps (icon to label).
  static const double xs = 4;

  /// 8px — related element gaps.
  static const double sm = 8;

  /// 16px — standard component padding.
  static const double md = 16;

  /// 24px — section spacing.
  static const double lg = 24;

  /// 32px — large section separation.
  static const double xl = 32;

  /// 48px — screen-level breathing room.
  static const double xxl = 48;

  /// 20px — applied to all screen horizontal edges.
  static const double screenHorizontal = 20;

  /// 24px — top and bottom of screen sections.
  static const double screenVertical = 24;
}
