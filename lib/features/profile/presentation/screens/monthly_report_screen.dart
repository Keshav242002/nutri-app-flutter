import 'package:ahara/core/network/api_exceptions.dart';
import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/core/widgets/app_scaffold.dart';
import 'package:ahara/core/widgets/error_state.dart';
import 'package:ahara/core/widgets/loading_state.dart';
import 'package:ahara/features/dashboard/domain/models/nutrition_summary.dart';
import 'package:ahara/features/onboarding/domain/models/dietary_profile.dart';
import 'package:ahara/features/profile/domain/models/monthly_report_state.dart';
import 'package:ahara/features/profile/presentation/controllers/monthly_report_controller.dart';
import 'package:ahara/features/profile/presentation/controllers/profile_controller.dart';
import 'package:ahara/features/profile/presentation/widgets/month_calorie_chart.dart';
import 'package:ahara/features/profile/presentation/widgets/month_picker_toggle.dart';
import 'package:ahara/features/week/presentation/widgets/macro_averages_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Monthly nutrition report — current vs previous month.
class MonthlyReportScreen extends ConsumerWidget {
  /// Creates the [MonthlyReportScreen].
  const MonthlyReportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(monthlyReportControllerProvider);
    final profile = ref.watch(profileControllerProvider).value;

    return AppScaffold(
      appBar: AppBar(
        backgroundColor: AppColors.cream,
        elevation: 0,
        title: Text(
          'Monthly report',
          style: AppTypography.headingLarge.copyWith(
            color: AppColors.navyDeep,
          ),
        ),
      ),
      padding: EdgeInsets.zero,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.screenHorizontal,
              AppSpacing.sm,
              AppSpacing.screenHorizontal,
              AppSpacing.sm,
            ),
            child: MonthPickerToggle(
              selection: async.value?.selection ?? MonthSelection.current,
              onChanged: (sel) => ref
                  .read(monthlyReportControllerProvider.notifier)
                  .select(sel),
            ),
          ),
          Expanded(
            child: async.when(
              loading: () => const LoadingState(),
              error: (e, _) => ErrorState(
                exception: e is AppException
                    ? e
                    : UnknownException(message: e.toString()),
                onRetry: () =>
                    ref.invalidate(monthlyReportControllerProvider),
              ),
              data: (state) => _Report(state: state, profile: profile),
            ),
          ),
        ],
      ),
    );
  }
}

class _Report extends StatelessWidget {
  const _Report({required this.state, required this.profile});

  final MonthlyReportState state;
  final DietaryProfile? profile;

  @override
  Widget build(BuildContext context) {
    final (from, to) = _rangeFor(state.selection);
    final trackedDays = state.nutrition.days.length;
    final totalDays = to.difference(from).inDays + 1;
    final averages = state.nutrition.averages ?? const NutritionSummary();
    final targets = profile == null
        ? null
        : NutritionSummary(
            calories: (profile!.targetCalories ?? 0).toDouble(),
            proteinG: profile!.targetProteinG ?? 0,
            carbsG: profile!.targetCarbsG ?? 0,
            fatG: profile!.targetFatG ?? 0,
            fiberG: profile!.targetFiberG ?? 0,
          );
    final calorieTarget = (profile?.targetCalories ?? 0).toDouble();

    if (trackedDays == 0) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Text(
            'No meals tracked this period yet.\n'
            'Log meals to see your monthly nutrition.',
            textAlign: TextAlign.center,
            style: AppTypography.bodyLarge.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
      );
    }

    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenHorizontal,
        vertical: AppSpacing.sm,
      ),
      children: [
        _CoverageCard(trackedDays: trackedDays, totalDays: totalDays),
        const SizedBox(height: AppSpacing.md),
        MonthCalorieChart(
          monthStart: from,
          monthEnd: to,
          days: state.nutrition.days,
          calorieTarget: calorieTarget,
        ),
        const SizedBox(height: AppSpacing.md),
        MacroAveragesCard(
          averages: averages,
          targets: targets,
          title: 'Monthly Macro Averages',
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Averages are across the $trackedDays day'
          '${trackedDays == 1 ? '' : 's'} you tracked, not all '
          '$totalDays calendar days.',
          style: AppTypography.caption.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: AppSpacing.xl),
      ],
    );
  }

  static (DateTime, DateTime) _rangeFor(MonthSelection selection) {
    final now = DateTime.now();
    switch (selection) {
      case MonthSelection.current:
        return (
          DateTime(now.year, now.month),
          DateTime(now.year, now.month, now.day),
        );
      case MonthSelection.previous:
        return (
          DateTime(now.year, now.month - 1),
          DateTime(now.year, now.month, 0),
        );
    }
  }
}

class _CoverageCard extends StatelessWidget {
  const _CoverageCard({required this.trackedDays, required this.totalDays});

  final int trackedDays;
  final int totalDays;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.creamBorder),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.event_available_outlined,
            color: AppColors.turmeric,
          ),
          const SizedBox(width: AppSpacing.sm),
          Text(
            '$trackedDays of $totalDays days tracked',
            style: AppTypography.bodyLarge.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
