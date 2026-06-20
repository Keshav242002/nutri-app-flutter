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
    final result =
        await ref.watch(dashboardRepositoryProvider).getRecipeDetail(slug);
    return result.when(
      success: (RecipeDetail data) => data,
      failure: (AppException e) => throw e,
    );
  }
}
