import 'package:ahara/core/network/api_exceptions.dart';
import 'package:ahara/features/dashboard/domain/models/recipe_detail.dart';
import 'package:ahara/features/dashboard/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_detail_controller.g.dart';

/// Manages recipe detail screen state for a given recipe [slug].
@riverpod
class RecipeDetailController extends _$RecipeDetailController {
  @override
  Future<RecipeDetail> build(String slug) async {
    // Use read, not watch: the repository is a stateless service. Watching it
    // re-runs build whenever the autoDispose repo provider churns (which it
    // does when the dashboard tab isn't mounted, e.g. opened from the chat
    // tab), causing an infinite refetch loop. Refresh is via invalidateSelf.
    final result =
        await ref.read(dashboardRepositoryProvider).getRecipeDetail(slug);
    return result.when(
      success: (RecipeDetail data) => data,
      failure: (AppException e) => throw e,
    );
  }
}
