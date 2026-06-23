import 'package:freezed_annotation/freezed_annotation.dart';

part 'grocery_list.freezed.dart';
part 'grocery_list.g.dart';

/// A single grocery item inside a [GroceryCategory].
@freezed
abstract class GroceryItem with _$GroceryItem {
  /// Creates a [GroceryItem].
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory GroceryItem({
    required String ingredientAppId,
    required String ingredientName,
    required double totalGrams,
    required String displayQuantity,
    required double displayQuantityValue,
    required String displayUnit,
    required int recipeCount,
    required bool pantryStaple,
    double? estimatedCostInr,
    @Default('') String notes,
  }) = _GroceryItem;

  /// Deserialises from JSON.
  factory GroceryItem.fromJson(Map<String, dynamic> json) =>
      _$GroceryItemFromJson(json);
}

/// A grouped category of grocery items.
@freezed
abstract class GroceryCategory with _$GroceryCategory {
  /// Creates a [GroceryCategory].
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory GroceryCategory({
    required String category,
    required String categoryDisplay,
    required List<GroceryItem> items,
  }) = _GroceryCategory;

  /// Deserialises from JSON.
  factory GroceryCategory.fromJson(Map<String, dynamic> json) =>
      _$GroceryCategoryFromJson(json);
}

/// Grocery list for a week from `GET /mealplans/week/:plan_date/grocery/`.
@freezed
abstract class GroceryList with _$GroceryList {
  /// Creates a [GroceryList].
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory GroceryList({
    required int id,
    required String weekStartDate,
    required String generatedAt,
    required List<GroceryCategory> categories,
    String? estimatedCostInr,
  }) = _GroceryList;

  /// Deserialises from JSON.
  factory GroceryList.fromJson(Map<String, dynamic> json) =>
      _$GroceryListFromJson(json);
}
