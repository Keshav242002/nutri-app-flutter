// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monthly_report_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Loads per-day nutrition for the current or previous calendar month.
///
/// Reuses the week feature's `GET /nutrition/weekly/?from=&to=` endpoint —
/// it accepts an arbitrary date range, so a month range works directly.

@ProviderFor(MonthlyReportController)
final monthlyReportControllerProvider = MonthlyReportControllerProvider._();

/// Loads per-day nutrition for the current or previous calendar month.
///
/// Reuses the week feature's `GET /nutrition/weekly/?from=&to=` endpoint —
/// it accepts an arbitrary date range, so a month range works directly.
final class MonthlyReportControllerProvider
    extends
        $AsyncNotifierProvider<MonthlyReportController, MonthlyReportState> {
  /// Loads per-day nutrition for the current or previous calendar month.
  ///
  /// Reuses the week feature's `GET /nutrition/weekly/?from=&to=` endpoint —
  /// it accepts an arbitrary date range, so a month range works directly.
  MonthlyReportControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'monthlyReportControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$monthlyReportControllerHash();

  @$internal
  @override
  MonthlyReportController create() => MonthlyReportController();
}

String _$monthlyReportControllerHash() =>
    r'4e9c9a5ab71a5b66a621c2a2cdaf7d1d40988273';

/// Loads per-day nutrition for the current or previous calendar month.
///
/// Reuses the week feature's `GET /nutrition/weekly/?from=&to=` endpoint —
/// it accepts an arbitrary date range, so a month range works directly.

abstract class _$MonthlyReportController
    extends $AsyncNotifier<MonthlyReportState> {
  FutureOr<MonthlyReportState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<MonthlyReportState>, MonthlyReportState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<MonthlyReportState>, MonthlyReportState>,
              AsyncValue<MonthlyReportState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
