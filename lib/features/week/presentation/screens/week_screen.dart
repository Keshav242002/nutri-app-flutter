import 'package:ahara/core/network/api_exceptions.dart';
import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/widgets/error_state.dart';
import 'package:ahara/core/widgets/loading_state.dart';
import 'package:ahara/features/week/domain/models/week_state.dart';
import 'package:ahara/features/week/domain/models/weekly_nutrition.dart';
import 'package:ahara/features/week/presentation/controllers/week_controller.dart';
import 'package:ahara/features/week/presentation/widgets/day_selector_row.dart';
import 'package:ahara/features/week/presentation/widgets/section_jump_pills.dart';
import 'package:ahara/features/week/presentation/widgets/week_grocery_section.dart';
import 'package:ahara/features/week/presentation/widgets/week_meal_section.dart';
import 'package:ahara/features/week/presentation/widgets/week_navigator_header.dart';
import 'package:ahara/features/week/presentation/widgets/week_stats_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The Week tab — sticky header with week navigator, day selector,
/// section pills, and three scrollable content sections.
class WeekScreen extends ConsumerStatefulWidget {
  /// Creates a [WeekScreen].
  const WeekScreen({super.key});

  @override
  ConsumerState<WeekScreen> createState() => _WeekScreenState();
}

class _WeekScreenState extends ConsumerState<WeekScreen> {
  final _mealsKey = GlobalKey();
  final _statsKey = GlobalKey();
  final _groceryKey = GlobalKey();
  final _scrollViewKey = GlobalKey();
  final _scrollController = ScrollController();

  WeekSection _activeSection = WeekSection.meals;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  /// Scroll-spy: highlights the pill for whichever section currently sits at
  /// the top of the viewport, keeping the pills in sync with scrolling.
  void _onScroll() {
    final viewportBox =
        _scrollViewKey.currentContext?.findRenderObject() as RenderBox?;
    if (viewportBox == null) return;
    // Trigger line a little below the viewport top — a section becomes active
    // once its start scrolls past this line.
    final triggerY = viewportBox.localToGlobal(Offset.zero).dy + 80;

    var active = WeekSection.meals;
    for (final (section, key) in <(WeekSection, GlobalKey)>[
      (WeekSection.meals, _mealsKey),
      (WeekSection.stats, _statsKey),
      (WeekSection.grocery, _groceryKey),
    ]) {
      final box = key.currentContext?.findRenderObject() as RenderBox?;
      if (box == null) continue;
      if (box.localToGlobal(Offset.zero).dy <= triggerY) active = section;
    }

    // The last section is bottom-anchored: if its content is short it can
    // never scroll high enough for its top to cross the trigger line, so the
    // scroll-spy would otherwise never mark it active (reverting a manual
    // jump). At the end of the scroll extent, the last section owns the view.
    final position = _scrollController.position;
    if (position.pixels >= position.maxScrollExtent - 1) {
      active = WeekSection.grocery;
    }

    if (active != _activeSection) {
      setState(() => _activeSection = active);
    }
  }

  void _jumpTo(WeekSection section) {
    setState(() => _activeSection = section);
    final key = switch (section) {
      WeekSection.meals => _mealsKey,
      WeekSection.stats => _statsKey,
      WeekSection.grocery => _groceryKey,
    };
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final async = ref.watch(weekControllerProvider);

    return Scaffold(
      backgroundColor: AppColors.cream,
      body: SafeArea(
        child: Column(
          children: [
            // Empty app bar — keeps the week selector off the status-bar notch
            // and matches the home tab's top rhythm.
            Expanded(
              child: async.when(
                loading: () => const LoadingState(),
                error: (e, _) => ErrorState(
                  exception: e is AppException
                      ? e
                      : UnknownException(message: e.toString()),
                ),
                data: _buildContent,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(WeekState state) {
    return Column(
      children: [
        // Sticky header — kept outside the scroll view. A pinned
        // SliverPersistentHeader trips a framework semantics assertion
        // (!semantics.parentDataDirty) every frame; since the header never
        // shrinks, a fixed header above the scroll view gives identical UX
        // without the bug.
        _WeekHeader(
          weekStart: state.weekStart,
          selectedDay: state.selectedDay,
          weeklyNutrition: state.weeklyNutrition,
          activeSection: _activeSection,
          onPrev: () => ref.read(weekControllerProvider.notifier).prevWeek(),
          onNext: () => ref.read(weekControllerProvider.notifier).nextWeek(),
          onDayTap: (day) =>
              ref.read(weekControllerProvider.notifier).selectDay(day),
          onSectionTap: _jumpTo,
        ),
        Expanded(
          child: CustomScrollView(
            key: _scrollViewKey,
            controller: _scrollController,
            slivers: [
              // Meals section
              SliverToBoxAdapter(
                child: KeyedSubtree(
                  key: _mealsKey,
                  child: WeekMealSection(
                    selectedDay: state.selectedDay,
                    weekPlans: state.weekPlans,
                    dayLogs: state.selectedDayLogs,
                  ),
                ),
              ),

              // Stats section
              SliverToBoxAdapter(
                child: KeyedSubtree(
                  key: _statsKey,
                  child: WeekStatsSection(
                    weekStart: state.weekStart,
                    weeklyNutrition: state.weeklyNutrition,
                  ),
                ),
              ),

              // Grocery section
              SliverToBoxAdapter(
                child: KeyedSubtree(
                  key: _groceryKey,
                  child: WeekGrocerySection(
                    groceryList: state.groceryList,
                    isLoading: state.isGroceryLoading,
                    hasError: state.groceryError != null,
                    checkedItems: state.checkedItems,
                    onLoad: () =>
                        ref.read(weekControllerProvider.notifier).loadGrocery(),
                    onRefresh: () => ref
                        .read(weekControllerProvider.notifier)
                        .refreshGrocery(),
                    onToggleItem: (id) => ref
                        .read(weekControllerProvider.notifier)
                        .toggleGroceryItem(id),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Sticky header delegate
// ---------------------------------------------------------------------------

class _WeekHeader extends StatelessWidget {
  const _WeekHeader({
    required this.weekStart,
    required this.selectedDay,
    required this.weeklyNutrition,
    required this.activeSection,
    required this.onPrev,
    required this.onNext,
    required this.onDayTap,
    required this.onSectionTap,
  });

  final DateTime weekStart;
  final DateTime selectedDay;
  final WeeklyNutrition? weeklyNutrition;
  final WeekSection activeSection;
  final VoidCallback onPrev;
  final VoidCallback onNext;
  final void Function(DateTime) onDayTap;
  final void Function(WeekSection) onSectionTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.cream,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenHorizontal,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          WeekNavigatorHeader(
            weekStart: weekStart,
            onPrev: onPrev,
            onNext: onNext,
          ),
          const SizedBox(height: AppSpacing.xs),
          DaySelectorRow(
            weekStart: weekStart,
            selectedDay: selectedDay,
            weeklyNutrition: weeklyNutrition,
            onDayTap: onDayTap,
          ),
          const SizedBox(height: AppSpacing.sm),
          SectionJumpPills(active: activeSection, onTap: onSectionTap),
        ],
      ),
    );
  }
}
