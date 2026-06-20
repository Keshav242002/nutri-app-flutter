// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecipeIngredient {

 String get ingredientName; String get ingredientAppId; String get displayQuantity; int get order; String? get displayUnitName; double? get displayUnitGrams; String? get quantityGrams; String? get notes;
/// Create a copy of RecipeIngredient
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeIngredientCopyWith<RecipeIngredient> get copyWith => _$RecipeIngredientCopyWithImpl<RecipeIngredient>(this as RecipeIngredient, _$identity);

  /// Serializes this RecipeIngredient to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipeIngredient&&(identical(other.ingredientName, ingredientName) || other.ingredientName == ingredientName)&&(identical(other.ingredientAppId, ingredientAppId) || other.ingredientAppId == ingredientAppId)&&(identical(other.displayQuantity, displayQuantity) || other.displayQuantity == displayQuantity)&&(identical(other.order, order) || other.order == order)&&(identical(other.displayUnitName, displayUnitName) || other.displayUnitName == displayUnitName)&&(identical(other.displayUnitGrams, displayUnitGrams) || other.displayUnitGrams == displayUnitGrams)&&(identical(other.quantityGrams, quantityGrams) || other.quantityGrams == quantityGrams)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ingredientName,ingredientAppId,displayQuantity,order,displayUnitName,displayUnitGrams,quantityGrams,notes);

@override
String toString() {
  return 'RecipeIngredient(ingredientName: $ingredientName, ingredientAppId: $ingredientAppId, displayQuantity: $displayQuantity, order: $order, displayUnitName: $displayUnitName, displayUnitGrams: $displayUnitGrams, quantityGrams: $quantityGrams, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $RecipeIngredientCopyWith<$Res>  {
  factory $RecipeIngredientCopyWith(RecipeIngredient value, $Res Function(RecipeIngredient) _then) = _$RecipeIngredientCopyWithImpl;
@useResult
$Res call({
 String ingredientName, String ingredientAppId, String displayQuantity, int order, String? displayUnitName, double? displayUnitGrams, String? quantityGrams, String? notes
});




}
/// @nodoc
class _$RecipeIngredientCopyWithImpl<$Res>
    implements $RecipeIngredientCopyWith<$Res> {
  _$RecipeIngredientCopyWithImpl(this._self, this._then);

  final RecipeIngredient _self;
  final $Res Function(RecipeIngredient) _then;

/// Create a copy of RecipeIngredient
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ingredientName = null,Object? ingredientAppId = null,Object? displayQuantity = null,Object? order = null,Object? displayUnitName = freezed,Object? displayUnitGrams = freezed,Object? quantityGrams = freezed,Object? notes = freezed,}) {
  return _then(_self.copyWith(
ingredientName: null == ingredientName ? _self.ingredientName : ingredientName // ignore: cast_nullable_to_non_nullable
as String,ingredientAppId: null == ingredientAppId ? _self.ingredientAppId : ingredientAppId // ignore: cast_nullable_to_non_nullable
as String,displayQuantity: null == displayQuantity ? _self.displayQuantity : displayQuantity // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,displayUnitName: freezed == displayUnitName ? _self.displayUnitName : displayUnitName // ignore: cast_nullable_to_non_nullable
as String?,displayUnitGrams: freezed == displayUnitGrams ? _self.displayUnitGrams : displayUnitGrams // ignore: cast_nullable_to_non_nullable
as double?,quantityGrams: freezed == quantityGrams ? _self.quantityGrams : quantityGrams // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RecipeIngredient].
extension RecipeIngredientPatterns on RecipeIngredient {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecipeIngredient value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecipeIngredient() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecipeIngredient value)  $default,){
final _that = this;
switch (_that) {
case _RecipeIngredient():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecipeIngredient value)?  $default,){
final _that = this;
switch (_that) {
case _RecipeIngredient() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String ingredientName,  String ingredientAppId,  String displayQuantity,  int order,  String? displayUnitName,  double? displayUnitGrams,  String? quantityGrams,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecipeIngredient() when $default != null:
return $default(_that.ingredientName,_that.ingredientAppId,_that.displayQuantity,_that.order,_that.displayUnitName,_that.displayUnitGrams,_that.quantityGrams,_that.notes);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String ingredientName,  String ingredientAppId,  String displayQuantity,  int order,  String? displayUnitName,  double? displayUnitGrams,  String? quantityGrams,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _RecipeIngredient():
return $default(_that.ingredientName,_that.ingredientAppId,_that.displayQuantity,_that.order,_that.displayUnitName,_that.displayUnitGrams,_that.quantityGrams,_that.notes);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String ingredientName,  String ingredientAppId,  String displayQuantity,  int order,  String? displayUnitName,  double? displayUnitGrams,  String? quantityGrams,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _RecipeIngredient() when $default != null:
return $default(_that.ingredientName,_that.ingredientAppId,_that.displayQuantity,_that.order,_that.displayUnitName,_that.displayUnitGrams,_that.quantityGrams,_that.notes);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _RecipeIngredient implements RecipeIngredient {
  const _RecipeIngredient({required this.ingredientName, required this.ingredientAppId, required this.displayQuantity, required this.order, this.displayUnitName, this.displayUnitGrams, this.quantityGrams, this.notes});
  factory _RecipeIngredient.fromJson(Map<String, dynamic> json) => _$RecipeIngredientFromJson(json);

@override final  String ingredientName;
@override final  String ingredientAppId;
@override final  String displayQuantity;
@override final  int order;
@override final  String? displayUnitName;
@override final  double? displayUnitGrams;
@override final  String? quantityGrams;
@override final  String? notes;

/// Create a copy of RecipeIngredient
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeIngredientCopyWith<_RecipeIngredient> get copyWith => __$RecipeIngredientCopyWithImpl<_RecipeIngredient>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecipeIngredientToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipeIngredient&&(identical(other.ingredientName, ingredientName) || other.ingredientName == ingredientName)&&(identical(other.ingredientAppId, ingredientAppId) || other.ingredientAppId == ingredientAppId)&&(identical(other.displayQuantity, displayQuantity) || other.displayQuantity == displayQuantity)&&(identical(other.order, order) || other.order == order)&&(identical(other.displayUnitName, displayUnitName) || other.displayUnitName == displayUnitName)&&(identical(other.displayUnitGrams, displayUnitGrams) || other.displayUnitGrams == displayUnitGrams)&&(identical(other.quantityGrams, quantityGrams) || other.quantityGrams == quantityGrams)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ingredientName,ingredientAppId,displayQuantity,order,displayUnitName,displayUnitGrams,quantityGrams,notes);

@override
String toString() {
  return 'RecipeIngredient(ingredientName: $ingredientName, ingredientAppId: $ingredientAppId, displayQuantity: $displayQuantity, order: $order, displayUnitName: $displayUnitName, displayUnitGrams: $displayUnitGrams, quantityGrams: $quantityGrams, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$RecipeIngredientCopyWith<$Res> implements $RecipeIngredientCopyWith<$Res> {
  factory _$RecipeIngredientCopyWith(_RecipeIngredient value, $Res Function(_RecipeIngredient) _then) = __$RecipeIngredientCopyWithImpl;
@override @useResult
$Res call({
 String ingredientName, String ingredientAppId, String displayQuantity, int order, String? displayUnitName, double? displayUnitGrams, String? quantityGrams, String? notes
});




}
/// @nodoc
class __$RecipeIngredientCopyWithImpl<$Res>
    implements _$RecipeIngredientCopyWith<$Res> {
  __$RecipeIngredientCopyWithImpl(this._self, this._then);

  final _RecipeIngredient _self;
  final $Res Function(_RecipeIngredient) _then;

/// Create a copy of RecipeIngredient
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ingredientName = null,Object? ingredientAppId = null,Object? displayQuantity = null,Object? order = null,Object? displayUnitName = freezed,Object? displayUnitGrams = freezed,Object? quantityGrams = freezed,Object? notes = freezed,}) {
  return _then(_RecipeIngredient(
ingredientName: null == ingredientName ? _self.ingredientName : ingredientName // ignore: cast_nullable_to_non_nullable
as String,ingredientAppId: null == ingredientAppId ? _self.ingredientAppId : ingredientAppId // ignore: cast_nullable_to_non_nullable
as String,displayQuantity: null == displayQuantity ? _self.displayQuantity : displayQuantity // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,displayUnitName: freezed == displayUnitName ? _self.displayUnitName : displayUnitName // ignore: cast_nullable_to_non_nullable
as String?,displayUnitGrams: freezed == displayUnitGrams ? _self.displayUnitGrams : displayUnitGrams // ignore: cast_nullable_to_non_nullable
as double?,quantityGrams: freezed == quantityGrams ? _self.quantityGrams : quantityGrams // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$RecipeDetail {

 String get slug; String get name; String get cuisine; String get mealType; int get prepTimeMin; int get cookTimeMin; int get servings; String get estimatedDifficulty; String get spiceLevel; String? get nameAlt; String? get imageUrl; String? get proteinSource; NutritionSummary? get cachedNutritionSummary; double? get cachedCostPerServingInr; bool? get costKnown; List<String> get dietTags; List<String> get allergenTags; List<RecipeIngredient> get ingredients; List<String> get instructions;
/// Create a copy of RecipeDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeDetailCopyWith<RecipeDetail> get copyWith => _$RecipeDetailCopyWithImpl<RecipeDetail>(this as RecipeDetail, _$identity);

  /// Serializes this RecipeDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipeDetail&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&(identical(other.cuisine, cuisine) || other.cuisine == cuisine)&&(identical(other.mealType, mealType) || other.mealType == mealType)&&(identical(other.prepTimeMin, prepTimeMin) || other.prepTimeMin == prepTimeMin)&&(identical(other.cookTimeMin, cookTimeMin) || other.cookTimeMin == cookTimeMin)&&(identical(other.servings, servings) || other.servings == servings)&&(identical(other.estimatedDifficulty, estimatedDifficulty) || other.estimatedDifficulty == estimatedDifficulty)&&(identical(other.spiceLevel, spiceLevel) || other.spiceLevel == spiceLevel)&&(identical(other.nameAlt, nameAlt) || other.nameAlt == nameAlt)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.proteinSource, proteinSource) || other.proteinSource == proteinSource)&&(identical(other.cachedNutritionSummary, cachedNutritionSummary) || other.cachedNutritionSummary == cachedNutritionSummary)&&(identical(other.cachedCostPerServingInr, cachedCostPerServingInr) || other.cachedCostPerServingInr == cachedCostPerServingInr)&&(identical(other.costKnown, costKnown) || other.costKnown == costKnown)&&const DeepCollectionEquality().equals(other.dietTags, dietTags)&&const DeepCollectionEquality().equals(other.allergenTags, allergenTags)&&const DeepCollectionEquality().equals(other.ingredients, ingredients)&&const DeepCollectionEquality().equals(other.instructions, instructions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,slug,name,cuisine,mealType,prepTimeMin,cookTimeMin,servings,estimatedDifficulty,spiceLevel,nameAlt,imageUrl,proteinSource,cachedNutritionSummary,cachedCostPerServingInr,costKnown,const DeepCollectionEquality().hash(dietTags),const DeepCollectionEquality().hash(allergenTags),const DeepCollectionEquality().hash(ingredients),const DeepCollectionEquality().hash(instructions)]);

@override
String toString() {
  return 'RecipeDetail(slug: $slug, name: $name, cuisine: $cuisine, mealType: $mealType, prepTimeMin: $prepTimeMin, cookTimeMin: $cookTimeMin, servings: $servings, estimatedDifficulty: $estimatedDifficulty, spiceLevel: $spiceLevel, nameAlt: $nameAlt, imageUrl: $imageUrl, proteinSource: $proteinSource, cachedNutritionSummary: $cachedNutritionSummary, cachedCostPerServingInr: $cachedCostPerServingInr, costKnown: $costKnown, dietTags: $dietTags, allergenTags: $allergenTags, ingredients: $ingredients, instructions: $instructions)';
}


}

/// @nodoc
abstract mixin class $RecipeDetailCopyWith<$Res>  {
  factory $RecipeDetailCopyWith(RecipeDetail value, $Res Function(RecipeDetail) _then) = _$RecipeDetailCopyWithImpl;
@useResult
$Res call({
 String slug, String name, String cuisine, String mealType, int prepTimeMin, int cookTimeMin, int servings, String estimatedDifficulty, String spiceLevel, String? nameAlt, String? imageUrl, String? proteinSource, NutritionSummary? cachedNutritionSummary, double? cachedCostPerServingInr, bool? costKnown, List<String> dietTags, List<String> allergenTags, List<RecipeIngredient> ingredients, List<String> instructions
});


$NutritionSummaryCopyWith<$Res>? get cachedNutritionSummary;

}
/// @nodoc
class _$RecipeDetailCopyWithImpl<$Res>
    implements $RecipeDetailCopyWith<$Res> {
  _$RecipeDetailCopyWithImpl(this._self, this._then);

  final RecipeDetail _self;
  final $Res Function(RecipeDetail) _then;

/// Create a copy of RecipeDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? slug = null,Object? name = null,Object? cuisine = null,Object? mealType = null,Object? prepTimeMin = null,Object? cookTimeMin = null,Object? servings = null,Object? estimatedDifficulty = null,Object? spiceLevel = null,Object? nameAlt = freezed,Object? imageUrl = freezed,Object? proteinSource = freezed,Object? cachedNutritionSummary = freezed,Object? cachedCostPerServingInr = freezed,Object? costKnown = freezed,Object? dietTags = null,Object? allergenTags = null,Object? ingredients = null,Object? instructions = null,}) {
  return _then(_self.copyWith(
slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,cuisine: null == cuisine ? _self.cuisine : cuisine // ignore: cast_nullable_to_non_nullable
as String,mealType: null == mealType ? _self.mealType : mealType // ignore: cast_nullable_to_non_nullable
as String,prepTimeMin: null == prepTimeMin ? _self.prepTimeMin : prepTimeMin // ignore: cast_nullable_to_non_nullable
as int,cookTimeMin: null == cookTimeMin ? _self.cookTimeMin : cookTimeMin // ignore: cast_nullable_to_non_nullable
as int,servings: null == servings ? _self.servings : servings // ignore: cast_nullable_to_non_nullable
as int,estimatedDifficulty: null == estimatedDifficulty ? _self.estimatedDifficulty : estimatedDifficulty // ignore: cast_nullable_to_non_nullable
as String,spiceLevel: null == spiceLevel ? _self.spiceLevel : spiceLevel // ignore: cast_nullable_to_non_nullable
as String,nameAlt: freezed == nameAlt ? _self.nameAlt : nameAlt // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,proteinSource: freezed == proteinSource ? _self.proteinSource : proteinSource // ignore: cast_nullable_to_non_nullable
as String?,cachedNutritionSummary: freezed == cachedNutritionSummary ? _self.cachedNutritionSummary : cachedNutritionSummary // ignore: cast_nullable_to_non_nullable
as NutritionSummary?,cachedCostPerServingInr: freezed == cachedCostPerServingInr ? _self.cachedCostPerServingInr : cachedCostPerServingInr // ignore: cast_nullable_to_non_nullable
as double?,costKnown: freezed == costKnown ? _self.costKnown : costKnown // ignore: cast_nullable_to_non_nullable
as bool?,dietTags: null == dietTags ? _self.dietTags : dietTags // ignore: cast_nullable_to_non_nullable
as List<String>,allergenTags: null == allergenTags ? _self.allergenTags : allergenTags // ignore: cast_nullable_to_non_nullable
as List<String>,ingredients: null == ingredients ? _self.ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<RecipeIngredient>,instructions: null == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}
/// Create a copy of RecipeDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutritionSummaryCopyWith<$Res>? get cachedNutritionSummary {
    if (_self.cachedNutritionSummary == null) {
    return null;
  }

  return $NutritionSummaryCopyWith<$Res>(_self.cachedNutritionSummary!, (value) {
    return _then(_self.copyWith(cachedNutritionSummary: value));
  });
}
}


/// Adds pattern-matching-related methods to [RecipeDetail].
extension RecipeDetailPatterns on RecipeDetail {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecipeDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecipeDetail() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecipeDetail value)  $default,){
final _that = this;
switch (_that) {
case _RecipeDetail():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecipeDetail value)?  $default,){
final _that = this;
switch (_that) {
case _RecipeDetail() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String slug,  String name,  String cuisine,  String mealType,  int prepTimeMin,  int cookTimeMin,  int servings,  String estimatedDifficulty,  String spiceLevel,  String? nameAlt,  String? imageUrl,  String? proteinSource,  NutritionSummary? cachedNutritionSummary,  double? cachedCostPerServingInr,  bool? costKnown,  List<String> dietTags,  List<String> allergenTags,  List<RecipeIngredient> ingredients,  List<String> instructions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecipeDetail() when $default != null:
return $default(_that.slug,_that.name,_that.cuisine,_that.mealType,_that.prepTimeMin,_that.cookTimeMin,_that.servings,_that.estimatedDifficulty,_that.spiceLevel,_that.nameAlt,_that.imageUrl,_that.proteinSource,_that.cachedNutritionSummary,_that.cachedCostPerServingInr,_that.costKnown,_that.dietTags,_that.allergenTags,_that.ingredients,_that.instructions);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String slug,  String name,  String cuisine,  String mealType,  int prepTimeMin,  int cookTimeMin,  int servings,  String estimatedDifficulty,  String spiceLevel,  String? nameAlt,  String? imageUrl,  String? proteinSource,  NutritionSummary? cachedNutritionSummary,  double? cachedCostPerServingInr,  bool? costKnown,  List<String> dietTags,  List<String> allergenTags,  List<RecipeIngredient> ingredients,  List<String> instructions)  $default,) {final _that = this;
switch (_that) {
case _RecipeDetail():
return $default(_that.slug,_that.name,_that.cuisine,_that.mealType,_that.prepTimeMin,_that.cookTimeMin,_that.servings,_that.estimatedDifficulty,_that.spiceLevel,_that.nameAlt,_that.imageUrl,_that.proteinSource,_that.cachedNutritionSummary,_that.cachedCostPerServingInr,_that.costKnown,_that.dietTags,_that.allergenTags,_that.ingredients,_that.instructions);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String slug,  String name,  String cuisine,  String mealType,  int prepTimeMin,  int cookTimeMin,  int servings,  String estimatedDifficulty,  String spiceLevel,  String? nameAlt,  String? imageUrl,  String? proteinSource,  NutritionSummary? cachedNutritionSummary,  double? cachedCostPerServingInr,  bool? costKnown,  List<String> dietTags,  List<String> allergenTags,  List<RecipeIngredient> ingredients,  List<String> instructions)?  $default,) {final _that = this;
switch (_that) {
case _RecipeDetail() when $default != null:
return $default(_that.slug,_that.name,_that.cuisine,_that.mealType,_that.prepTimeMin,_that.cookTimeMin,_that.servings,_that.estimatedDifficulty,_that.spiceLevel,_that.nameAlt,_that.imageUrl,_that.proteinSource,_that.cachedNutritionSummary,_that.cachedCostPerServingInr,_that.costKnown,_that.dietTags,_that.allergenTags,_that.ingredients,_that.instructions);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _RecipeDetail implements RecipeDetail {
  const _RecipeDetail({required this.slug, required this.name, required this.cuisine, required this.mealType, required this.prepTimeMin, required this.cookTimeMin, required this.servings, required this.estimatedDifficulty, required this.spiceLevel, this.nameAlt, this.imageUrl, this.proteinSource, this.cachedNutritionSummary, this.cachedCostPerServingInr, this.costKnown, final  List<String> dietTags = const [], final  List<String> allergenTags = const [], final  List<RecipeIngredient> ingredients = const [], final  List<String> instructions = const []}): _dietTags = dietTags,_allergenTags = allergenTags,_ingredients = ingredients,_instructions = instructions;
  factory _RecipeDetail.fromJson(Map<String, dynamic> json) => _$RecipeDetailFromJson(json);

@override final  String slug;
@override final  String name;
@override final  String cuisine;
@override final  String mealType;
@override final  int prepTimeMin;
@override final  int cookTimeMin;
@override final  int servings;
@override final  String estimatedDifficulty;
@override final  String spiceLevel;
@override final  String? nameAlt;
@override final  String? imageUrl;
@override final  String? proteinSource;
@override final  NutritionSummary? cachedNutritionSummary;
@override final  double? cachedCostPerServingInr;
@override final  bool? costKnown;
 final  List<String> _dietTags;
@override@JsonKey() List<String> get dietTags {
  if (_dietTags is EqualUnmodifiableListView) return _dietTags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dietTags);
}

 final  List<String> _allergenTags;
@override@JsonKey() List<String> get allergenTags {
  if (_allergenTags is EqualUnmodifiableListView) return _allergenTags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allergenTags);
}

 final  List<RecipeIngredient> _ingredients;
@override@JsonKey() List<RecipeIngredient> get ingredients {
  if (_ingredients is EqualUnmodifiableListView) return _ingredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ingredients);
}

 final  List<String> _instructions;
@override@JsonKey() List<String> get instructions {
  if (_instructions is EqualUnmodifiableListView) return _instructions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_instructions);
}


/// Create a copy of RecipeDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeDetailCopyWith<_RecipeDetail> get copyWith => __$RecipeDetailCopyWithImpl<_RecipeDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecipeDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipeDetail&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&(identical(other.cuisine, cuisine) || other.cuisine == cuisine)&&(identical(other.mealType, mealType) || other.mealType == mealType)&&(identical(other.prepTimeMin, prepTimeMin) || other.prepTimeMin == prepTimeMin)&&(identical(other.cookTimeMin, cookTimeMin) || other.cookTimeMin == cookTimeMin)&&(identical(other.servings, servings) || other.servings == servings)&&(identical(other.estimatedDifficulty, estimatedDifficulty) || other.estimatedDifficulty == estimatedDifficulty)&&(identical(other.spiceLevel, spiceLevel) || other.spiceLevel == spiceLevel)&&(identical(other.nameAlt, nameAlt) || other.nameAlt == nameAlt)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.proteinSource, proteinSource) || other.proteinSource == proteinSource)&&(identical(other.cachedNutritionSummary, cachedNutritionSummary) || other.cachedNutritionSummary == cachedNutritionSummary)&&(identical(other.cachedCostPerServingInr, cachedCostPerServingInr) || other.cachedCostPerServingInr == cachedCostPerServingInr)&&(identical(other.costKnown, costKnown) || other.costKnown == costKnown)&&const DeepCollectionEquality().equals(other._dietTags, _dietTags)&&const DeepCollectionEquality().equals(other._allergenTags, _allergenTags)&&const DeepCollectionEquality().equals(other._ingredients, _ingredients)&&const DeepCollectionEquality().equals(other._instructions, _instructions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,slug,name,cuisine,mealType,prepTimeMin,cookTimeMin,servings,estimatedDifficulty,spiceLevel,nameAlt,imageUrl,proteinSource,cachedNutritionSummary,cachedCostPerServingInr,costKnown,const DeepCollectionEquality().hash(_dietTags),const DeepCollectionEquality().hash(_allergenTags),const DeepCollectionEquality().hash(_ingredients),const DeepCollectionEquality().hash(_instructions)]);

@override
String toString() {
  return 'RecipeDetail(slug: $slug, name: $name, cuisine: $cuisine, mealType: $mealType, prepTimeMin: $prepTimeMin, cookTimeMin: $cookTimeMin, servings: $servings, estimatedDifficulty: $estimatedDifficulty, spiceLevel: $spiceLevel, nameAlt: $nameAlt, imageUrl: $imageUrl, proteinSource: $proteinSource, cachedNutritionSummary: $cachedNutritionSummary, cachedCostPerServingInr: $cachedCostPerServingInr, costKnown: $costKnown, dietTags: $dietTags, allergenTags: $allergenTags, ingredients: $ingredients, instructions: $instructions)';
}


}

/// @nodoc
abstract mixin class _$RecipeDetailCopyWith<$Res> implements $RecipeDetailCopyWith<$Res> {
  factory _$RecipeDetailCopyWith(_RecipeDetail value, $Res Function(_RecipeDetail) _then) = __$RecipeDetailCopyWithImpl;
@override @useResult
$Res call({
 String slug, String name, String cuisine, String mealType, int prepTimeMin, int cookTimeMin, int servings, String estimatedDifficulty, String spiceLevel, String? nameAlt, String? imageUrl, String? proteinSource, NutritionSummary? cachedNutritionSummary, double? cachedCostPerServingInr, bool? costKnown, List<String> dietTags, List<String> allergenTags, List<RecipeIngredient> ingredients, List<String> instructions
});


@override $NutritionSummaryCopyWith<$Res>? get cachedNutritionSummary;

}
/// @nodoc
class __$RecipeDetailCopyWithImpl<$Res>
    implements _$RecipeDetailCopyWith<$Res> {
  __$RecipeDetailCopyWithImpl(this._self, this._then);

  final _RecipeDetail _self;
  final $Res Function(_RecipeDetail) _then;

/// Create a copy of RecipeDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? slug = null,Object? name = null,Object? cuisine = null,Object? mealType = null,Object? prepTimeMin = null,Object? cookTimeMin = null,Object? servings = null,Object? estimatedDifficulty = null,Object? spiceLevel = null,Object? nameAlt = freezed,Object? imageUrl = freezed,Object? proteinSource = freezed,Object? cachedNutritionSummary = freezed,Object? cachedCostPerServingInr = freezed,Object? costKnown = freezed,Object? dietTags = null,Object? allergenTags = null,Object? ingredients = null,Object? instructions = null,}) {
  return _then(_RecipeDetail(
slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,cuisine: null == cuisine ? _self.cuisine : cuisine // ignore: cast_nullable_to_non_nullable
as String,mealType: null == mealType ? _self.mealType : mealType // ignore: cast_nullable_to_non_nullable
as String,prepTimeMin: null == prepTimeMin ? _self.prepTimeMin : prepTimeMin // ignore: cast_nullable_to_non_nullable
as int,cookTimeMin: null == cookTimeMin ? _self.cookTimeMin : cookTimeMin // ignore: cast_nullable_to_non_nullable
as int,servings: null == servings ? _self.servings : servings // ignore: cast_nullable_to_non_nullable
as int,estimatedDifficulty: null == estimatedDifficulty ? _self.estimatedDifficulty : estimatedDifficulty // ignore: cast_nullable_to_non_nullable
as String,spiceLevel: null == spiceLevel ? _self.spiceLevel : spiceLevel // ignore: cast_nullable_to_non_nullable
as String,nameAlt: freezed == nameAlt ? _self.nameAlt : nameAlt // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,proteinSource: freezed == proteinSource ? _self.proteinSource : proteinSource // ignore: cast_nullable_to_non_nullable
as String?,cachedNutritionSummary: freezed == cachedNutritionSummary ? _self.cachedNutritionSummary : cachedNutritionSummary // ignore: cast_nullable_to_non_nullable
as NutritionSummary?,cachedCostPerServingInr: freezed == cachedCostPerServingInr ? _self.cachedCostPerServingInr : cachedCostPerServingInr // ignore: cast_nullable_to_non_nullable
as double?,costKnown: freezed == costKnown ? _self.costKnown : costKnown // ignore: cast_nullable_to_non_nullable
as bool?,dietTags: null == dietTags ? _self._dietTags : dietTags // ignore: cast_nullable_to_non_nullable
as List<String>,allergenTags: null == allergenTags ? _self._allergenTags : allergenTags // ignore: cast_nullable_to_non_nullable
as List<String>,ingredients: null == ingredients ? _self._ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<RecipeIngredient>,instructions: null == instructions ? _self._instructions : instructions // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

/// Create a copy of RecipeDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutritionSummaryCopyWith<$Res>? get cachedNutritionSummary {
    if (_self.cachedNutritionSummary == null) {
    return null;
  }

  return $NutritionSummaryCopyWith<$Res>(_self.cachedNutritionSummary!, (value) {
    return _then(_self.copyWith(cachedNutritionSummary: value));
  });
}
}

// dart format on
