/// A recipe embedded in an assistant message's `metadata.recipes[]`
/// (ingredient mode). Rendered as an inline recipe card in the chat thread.
///
/// Two shapes arrive on the same field (see docs/design/chat.md):
/// - **grounded** (`source: grounded`): every ingredient matched our library,
///   so the backend persisted a recipe. Carries [id]/[slug]/[caloriesPerServing]
///   and the card opens the full recipe-detail screen.
/// - **free-form** (`source: ai_freeform`): some ingredient was unknown, so the
///   recipe is generated but NOT persisted — no [id], no [slug], no nutrition.
///   The dish is carried inline ([ingredients] + [steps]) and rendered inline.
class ChatRecipe {
  /// Creates a [ChatRecipe].
  const ChatRecipe({
    required this.name,
    required this.mealType,
    required this.servings,
    this.id,
    this.caloriesPerServing = 0,
    this.slug = '',
    this.description = '',
    this.ingredients = const [],
    this.steps = const [],
    this.source = '',
  });

  /// Builds a [ChatRecipe] from a `metadata.recipes[]` entry.
  factory ChatRecipe.fromJson(Map<String, dynamic> json) => ChatRecipe(
        // Free-form recipes are not persisted, so `id` is absent.
        id: (json['id'] as num?)?.toInt(),
        name: json['name'] as String? ?? '',
        mealType: json['meal_type'] as String? ?? '',
        caloriesPerServing:
            (json['calories_per_serving'] as num?)?.toInt() ?? 0,
        servings: (json['servings'] as num?)?.toDouble() ?? 1,
        slug: json['slug'] as String? ?? '',
        description: json['description'] as String? ?? '',
        source: json['source'] as String? ?? '',
        ingredients: _parseIngredients(json['ingredients']),
        steps: [
          for (final s in (json['steps'] as List? ?? const []))
            if (s is String) s,
        ],
      );

  static List<ChatRecipeIngredient> _parseIngredients(Object? raw) => [
        for (final i in (raw as List? ?? const []))
          if (i is Map<String, dynamic>) ChatRecipeIngredient.fromJson(i),
      ];

  /// Recipe primary key, or `null` for a free-form (non-persisted) recipe.
  final int? id;

  /// Recipe slug for opening the detail screen (`''` for free-form recipes).
  final String slug;

  /// Short one-line description, when the backend provides one.
  final String description;

  /// Display name.
  final String name;

  /// Meal type — `breakfast` | `lunch` | `dinner`.
  final String mealType;

  /// Calories per serving (`0` for free-form recipes — no nutrition computed).
  final int caloriesPerServing;

  /// Number of servings the recipe yields.
  final double servings;

  /// `grounded` or `ai_freeform` — drives card rendering.
  final String source;

  /// Inline ingredients (free-form recipes only; empty for grounded).
  final List<ChatRecipeIngredient> ingredients;

  /// Inline preparation steps (free-form recipes only; empty for grounded).
  final List<String> steps;

  /// Whether this is a non-persisted, display-only recipe shown inline.
  bool get isFreeform => source == 'ai_freeform';
}

/// One inline ingredient line on a free-form recipe card.
class ChatRecipeIngredient {
  /// Creates a [ChatRecipeIngredient].
  const ChatRecipeIngredient({required this.name, this.quantityGrams});

  /// Builds a [ChatRecipeIngredient] from a `recipes[].ingredients[]` entry.
  factory ChatRecipeIngredient.fromJson(Map<String, dynamic> json) =>
      ChatRecipeIngredient(
        name: json['ingredient_name'] as String? ?? '',
        quantityGrams: (json['quantity_grams'] as num?)?.toDouble(),
      );

  /// Ingredient display name.
  final String name;

  /// Quantity in grams, when the backend provides it.
  final double? quantityGrams;
}
