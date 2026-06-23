// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grocery_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GroceryItem _$GroceryItemFromJson(Map<String, dynamic> json) => _GroceryItem(
  ingredientAppId: json['ingredient_app_id'] as String,
  ingredientName: json['ingredient_name'] as String,
  totalGrams: (json['total_grams'] as num).toDouble(),
  displayQuantity: json['display_quantity'] as String,
  displayQuantityValue: (json['display_quantity_value'] as num).toDouble(),
  displayUnit: json['display_unit'] as String,
  recipeCount: (json['recipe_count'] as num).toInt(),
  pantryStaple: json['pantry_staple'] as bool,
  estimatedCostInr: (json['estimated_cost_inr'] as num?)?.toDouble(),
  notes: json['notes'] as String? ?? '',
);

Map<String, dynamic> _$GroceryItemToJson(_GroceryItem instance) =>
    <String, dynamic>{
      'ingredient_app_id': instance.ingredientAppId,
      'ingredient_name': instance.ingredientName,
      'total_grams': instance.totalGrams,
      'display_quantity': instance.displayQuantity,
      'display_quantity_value': instance.displayQuantityValue,
      'display_unit': instance.displayUnit,
      'recipe_count': instance.recipeCount,
      'pantry_staple': instance.pantryStaple,
      'estimated_cost_inr': instance.estimatedCostInr,
      'notes': instance.notes,
    };

_GroceryCategory _$GroceryCategoryFromJson(Map<String, dynamic> json) =>
    _GroceryCategory(
      category: json['category'] as String,
      categoryDisplay: json['category_display'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => GroceryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GroceryCategoryToJson(_GroceryCategory instance) =>
    <String, dynamic>{
      'category': instance.category,
      'category_display': instance.categoryDisplay,
      'items': instance.items,
    };

_GroceryList _$GroceryListFromJson(Map<String, dynamic> json) => _GroceryList(
  id: (json['id'] as num).toInt(),
  weekStartDate: json['week_start_date'] as String,
  generatedAt: json['generated_at'] as String,
  categories: (json['categories'] as List<dynamic>)
      .map((e) => GroceryCategory.fromJson(e as Map<String, dynamic>))
      .toList(),
  estimatedCostInr: json['estimated_cost_inr'] as String?,
);

Map<String, dynamic> _$GroceryListToJson(_GroceryList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'week_start_date': instance.weekStartDate,
      'generated_at': instance.generatedAt,
      'categories': instance.categories,
      'estimated_cost_inr': instance.estimatedCostInr,
    };
