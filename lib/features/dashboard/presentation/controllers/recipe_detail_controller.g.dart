// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Manages recipe detail screen state for a given recipe [slug].

@ProviderFor(RecipeDetailController)
final recipeDetailControllerProvider = RecipeDetailControllerFamily._();

/// Manages recipe detail screen state for a given recipe [slug].
final class RecipeDetailControllerProvider
    extends $AsyncNotifierProvider<RecipeDetailController, RecipeDetail> {
  /// Manages recipe detail screen state for a given recipe [slug].
  RecipeDetailControllerProvider._({
    required RecipeDetailControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'recipeDetailControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$recipeDetailControllerHash();

  @override
  String toString() {
    return r'recipeDetailControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  RecipeDetailController create() => RecipeDetailController();

  @override
  bool operator ==(Object other) {
    return other is RecipeDetailControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$recipeDetailControllerHash() =>
    r'bad40e9429c395dcece10e81b48f9420dc8ba12c';

/// Manages recipe detail screen state for a given recipe [slug].

final class RecipeDetailControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          RecipeDetailController,
          AsyncValue<RecipeDetail>,
          RecipeDetail,
          FutureOr<RecipeDetail>,
          String
        > {
  RecipeDetailControllerFamily._()
    : super(
        retry: null,
        name: r'recipeDetailControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Manages recipe detail screen state for a given recipe [slug].

  RecipeDetailControllerProvider call(String slug) =>
      RecipeDetailControllerProvider._(argument: slug, from: this);

  @override
  String toString() => r'recipeDetailControllerProvider';
}

/// Manages recipe detail screen state for a given recipe [slug].

abstract class _$RecipeDetailController extends $AsyncNotifier<RecipeDetail> {
  late final _$args = ref.$arg as String;
  String get slug => _$args;

  FutureOr<RecipeDetail> build(String slug);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<RecipeDetail>, RecipeDetail>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<RecipeDetail>, RecipeDetail>,
              AsyncValue<RecipeDetail>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
