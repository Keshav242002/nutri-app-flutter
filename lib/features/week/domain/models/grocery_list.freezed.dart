// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'grocery_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GroceryItem {

 String get ingredientAppId; String get ingredientName; double get totalGrams; String get displayQuantity; double get displayQuantityValue; String get displayUnit; int get recipeCount; bool get pantryStaple; double? get estimatedCostInr; String get notes;
/// Create a copy of GroceryItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GroceryItemCopyWith<GroceryItem> get copyWith => _$GroceryItemCopyWithImpl<GroceryItem>(this as GroceryItem, _$identity);

  /// Serializes this GroceryItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GroceryItem&&(identical(other.ingredientAppId, ingredientAppId) || other.ingredientAppId == ingredientAppId)&&(identical(other.ingredientName, ingredientName) || other.ingredientName == ingredientName)&&(identical(other.totalGrams, totalGrams) || other.totalGrams == totalGrams)&&(identical(other.displayQuantity, displayQuantity) || other.displayQuantity == displayQuantity)&&(identical(other.displayQuantityValue, displayQuantityValue) || other.displayQuantityValue == displayQuantityValue)&&(identical(other.displayUnit, displayUnit) || other.displayUnit == displayUnit)&&(identical(other.recipeCount, recipeCount) || other.recipeCount == recipeCount)&&(identical(other.pantryStaple, pantryStaple) || other.pantryStaple == pantryStaple)&&(identical(other.estimatedCostInr, estimatedCostInr) || other.estimatedCostInr == estimatedCostInr)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ingredientAppId,ingredientName,totalGrams,displayQuantity,displayQuantityValue,displayUnit,recipeCount,pantryStaple,estimatedCostInr,notes);

@override
String toString() {
  return 'GroceryItem(ingredientAppId: $ingredientAppId, ingredientName: $ingredientName, totalGrams: $totalGrams, displayQuantity: $displayQuantity, displayQuantityValue: $displayQuantityValue, displayUnit: $displayUnit, recipeCount: $recipeCount, pantryStaple: $pantryStaple, estimatedCostInr: $estimatedCostInr, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $GroceryItemCopyWith<$Res>  {
  factory $GroceryItemCopyWith(GroceryItem value, $Res Function(GroceryItem) _then) = _$GroceryItemCopyWithImpl;
@useResult
$Res call({
 String ingredientAppId, String ingredientName, double totalGrams, String displayQuantity, double displayQuantityValue, String displayUnit, int recipeCount, bool pantryStaple, double? estimatedCostInr, String notes
});




}
/// @nodoc
class _$GroceryItemCopyWithImpl<$Res>
    implements $GroceryItemCopyWith<$Res> {
  _$GroceryItemCopyWithImpl(this._self, this._then);

  final GroceryItem _self;
  final $Res Function(GroceryItem) _then;

/// Create a copy of GroceryItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ingredientAppId = null,Object? ingredientName = null,Object? totalGrams = null,Object? displayQuantity = null,Object? displayQuantityValue = null,Object? displayUnit = null,Object? recipeCount = null,Object? pantryStaple = null,Object? estimatedCostInr = freezed,Object? notes = null,}) {
  return _then(_self.copyWith(
ingredientAppId: null == ingredientAppId ? _self.ingredientAppId : ingredientAppId // ignore: cast_nullable_to_non_nullable
as String,ingredientName: null == ingredientName ? _self.ingredientName : ingredientName // ignore: cast_nullable_to_non_nullable
as String,totalGrams: null == totalGrams ? _self.totalGrams : totalGrams // ignore: cast_nullable_to_non_nullable
as double,displayQuantity: null == displayQuantity ? _self.displayQuantity : displayQuantity // ignore: cast_nullable_to_non_nullable
as String,displayQuantityValue: null == displayQuantityValue ? _self.displayQuantityValue : displayQuantityValue // ignore: cast_nullable_to_non_nullable
as double,displayUnit: null == displayUnit ? _self.displayUnit : displayUnit // ignore: cast_nullable_to_non_nullable
as String,recipeCount: null == recipeCount ? _self.recipeCount : recipeCount // ignore: cast_nullable_to_non_nullable
as int,pantryStaple: null == pantryStaple ? _self.pantryStaple : pantryStaple // ignore: cast_nullable_to_non_nullable
as bool,estimatedCostInr: freezed == estimatedCostInr ? _self.estimatedCostInr : estimatedCostInr // ignore: cast_nullable_to_non_nullable
as double?,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GroceryItem].
extension GroceryItemPatterns on GroceryItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GroceryItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GroceryItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GroceryItem value)  $default,){
final _that = this;
switch (_that) {
case _GroceryItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GroceryItem value)?  $default,){
final _that = this;
switch (_that) {
case _GroceryItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String ingredientAppId,  String ingredientName,  double totalGrams,  String displayQuantity,  double displayQuantityValue,  String displayUnit,  int recipeCount,  bool pantryStaple,  double? estimatedCostInr,  String notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GroceryItem() when $default != null:
return $default(_that.ingredientAppId,_that.ingredientName,_that.totalGrams,_that.displayQuantity,_that.displayQuantityValue,_that.displayUnit,_that.recipeCount,_that.pantryStaple,_that.estimatedCostInr,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String ingredientAppId,  String ingredientName,  double totalGrams,  String displayQuantity,  double displayQuantityValue,  String displayUnit,  int recipeCount,  bool pantryStaple,  double? estimatedCostInr,  String notes)  $default,) {final _that = this;
switch (_that) {
case _GroceryItem():
return $default(_that.ingredientAppId,_that.ingredientName,_that.totalGrams,_that.displayQuantity,_that.displayQuantityValue,_that.displayUnit,_that.recipeCount,_that.pantryStaple,_that.estimatedCostInr,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String ingredientAppId,  String ingredientName,  double totalGrams,  String displayQuantity,  double displayQuantityValue,  String displayUnit,  int recipeCount,  bool pantryStaple,  double? estimatedCostInr,  String notes)?  $default,) {final _that = this;
switch (_that) {
case _GroceryItem() when $default != null:
return $default(_that.ingredientAppId,_that.ingredientName,_that.totalGrams,_that.displayQuantity,_that.displayQuantityValue,_that.displayUnit,_that.recipeCount,_that.pantryStaple,_that.estimatedCostInr,_that.notes);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _GroceryItem implements GroceryItem {
  const _GroceryItem({required this.ingredientAppId, required this.ingredientName, required this.totalGrams, required this.displayQuantity, required this.displayQuantityValue, required this.displayUnit, required this.recipeCount, required this.pantryStaple, this.estimatedCostInr, this.notes = ''});
  factory _GroceryItem.fromJson(Map<String, dynamic> json) => _$GroceryItemFromJson(json);

@override final  String ingredientAppId;
@override final  String ingredientName;
@override final  double totalGrams;
@override final  String displayQuantity;
@override final  double displayQuantityValue;
@override final  String displayUnit;
@override final  int recipeCount;
@override final  bool pantryStaple;
@override final  double? estimatedCostInr;
@override@JsonKey() final  String notes;

/// Create a copy of GroceryItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GroceryItemCopyWith<_GroceryItem> get copyWith => __$GroceryItemCopyWithImpl<_GroceryItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GroceryItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GroceryItem&&(identical(other.ingredientAppId, ingredientAppId) || other.ingredientAppId == ingredientAppId)&&(identical(other.ingredientName, ingredientName) || other.ingredientName == ingredientName)&&(identical(other.totalGrams, totalGrams) || other.totalGrams == totalGrams)&&(identical(other.displayQuantity, displayQuantity) || other.displayQuantity == displayQuantity)&&(identical(other.displayQuantityValue, displayQuantityValue) || other.displayQuantityValue == displayQuantityValue)&&(identical(other.displayUnit, displayUnit) || other.displayUnit == displayUnit)&&(identical(other.recipeCount, recipeCount) || other.recipeCount == recipeCount)&&(identical(other.pantryStaple, pantryStaple) || other.pantryStaple == pantryStaple)&&(identical(other.estimatedCostInr, estimatedCostInr) || other.estimatedCostInr == estimatedCostInr)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ingredientAppId,ingredientName,totalGrams,displayQuantity,displayQuantityValue,displayUnit,recipeCount,pantryStaple,estimatedCostInr,notes);

@override
String toString() {
  return 'GroceryItem(ingredientAppId: $ingredientAppId, ingredientName: $ingredientName, totalGrams: $totalGrams, displayQuantity: $displayQuantity, displayQuantityValue: $displayQuantityValue, displayUnit: $displayUnit, recipeCount: $recipeCount, pantryStaple: $pantryStaple, estimatedCostInr: $estimatedCostInr, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$GroceryItemCopyWith<$Res> implements $GroceryItemCopyWith<$Res> {
  factory _$GroceryItemCopyWith(_GroceryItem value, $Res Function(_GroceryItem) _then) = __$GroceryItemCopyWithImpl;
@override @useResult
$Res call({
 String ingredientAppId, String ingredientName, double totalGrams, String displayQuantity, double displayQuantityValue, String displayUnit, int recipeCount, bool pantryStaple, double? estimatedCostInr, String notes
});




}
/// @nodoc
class __$GroceryItemCopyWithImpl<$Res>
    implements _$GroceryItemCopyWith<$Res> {
  __$GroceryItemCopyWithImpl(this._self, this._then);

  final _GroceryItem _self;
  final $Res Function(_GroceryItem) _then;

/// Create a copy of GroceryItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ingredientAppId = null,Object? ingredientName = null,Object? totalGrams = null,Object? displayQuantity = null,Object? displayQuantityValue = null,Object? displayUnit = null,Object? recipeCount = null,Object? pantryStaple = null,Object? estimatedCostInr = freezed,Object? notes = null,}) {
  return _then(_GroceryItem(
ingredientAppId: null == ingredientAppId ? _self.ingredientAppId : ingredientAppId // ignore: cast_nullable_to_non_nullable
as String,ingredientName: null == ingredientName ? _self.ingredientName : ingredientName // ignore: cast_nullable_to_non_nullable
as String,totalGrams: null == totalGrams ? _self.totalGrams : totalGrams // ignore: cast_nullable_to_non_nullable
as double,displayQuantity: null == displayQuantity ? _self.displayQuantity : displayQuantity // ignore: cast_nullable_to_non_nullable
as String,displayQuantityValue: null == displayQuantityValue ? _self.displayQuantityValue : displayQuantityValue // ignore: cast_nullable_to_non_nullable
as double,displayUnit: null == displayUnit ? _self.displayUnit : displayUnit // ignore: cast_nullable_to_non_nullable
as String,recipeCount: null == recipeCount ? _self.recipeCount : recipeCount // ignore: cast_nullable_to_non_nullable
as int,pantryStaple: null == pantryStaple ? _self.pantryStaple : pantryStaple // ignore: cast_nullable_to_non_nullable
as bool,estimatedCostInr: freezed == estimatedCostInr ? _self.estimatedCostInr : estimatedCostInr // ignore: cast_nullable_to_non_nullable
as double?,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$GroceryCategory {

 String get category; String get categoryDisplay; List<GroceryItem> get items;
/// Create a copy of GroceryCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GroceryCategoryCopyWith<GroceryCategory> get copyWith => _$GroceryCategoryCopyWithImpl<GroceryCategory>(this as GroceryCategory, _$identity);

  /// Serializes this GroceryCategory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GroceryCategory&&(identical(other.category, category) || other.category == category)&&(identical(other.categoryDisplay, categoryDisplay) || other.categoryDisplay == categoryDisplay)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,category,categoryDisplay,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'GroceryCategory(category: $category, categoryDisplay: $categoryDisplay, items: $items)';
}


}

/// @nodoc
abstract mixin class $GroceryCategoryCopyWith<$Res>  {
  factory $GroceryCategoryCopyWith(GroceryCategory value, $Res Function(GroceryCategory) _then) = _$GroceryCategoryCopyWithImpl;
@useResult
$Res call({
 String category, String categoryDisplay, List<GroceryItem> items
});




}
/// @nodoc
class _$GroceryCategoryCopyWithImpl<$Res>
    implements $GroceryCategoryCopyWith<$Res> {
  _$GroceryCategoryCopyWithImpl(this._self, this._then);

  final GroceryCategory _self;
  final $Res Function(GroceryCategory) _then;

/// Create a copy of GroceryCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? category = null,Object? categoryDisplay = null,Object? items = null,}) {
  return _then(_self.copyWith(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,categoryDisplay: null == categoryDisplay ? _self.categoryDisplay : categoryDisplay // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<GroceryItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [GroceryCategory].
extension GroceryCategoryPatterns on GroceryCategory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GroceryCategory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GroceryCategory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GroceryCategory value)  $default,){
final _that = this;
switch (_that) {
case _GroceryCategory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GroceryCategory value)?  $default,){
final _that = this;
switch (_that) {
case _GroceryCategory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String category,  String categoryDisplay,  List<GroceryItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GroceryCategory() when $default != null:
return $default(_that.category,_that.categoryDisplay,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String category,  String categoryDisplay,  List<GroceryItem> items)  $default,) {final _that = this;
switch (_that) {
case _GroceryCategory():
return $default(_that.category,_that.categoryDisplay,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String category,  String categoryDisplay,  List<GroceryItem> items)?  $default,) {final _that = this;
switch (_that) {
case _GroceryCategory() when $default != null:
return $default(_that.category,_that.categoryDisplay,_that.items);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _GroceryCategory implements GroceryCategory {
  const _GroceryCategory({required this.category, required this.categoryDisplay, required final  List<GroceryItem> items}): _items = items;
  factory _GroceryCategory.fromJson(Map<String, dynamic> json) => _$GroceryCategoryFromJson(json);

@override final  String category;
@override final  String categoryDisplay;
 final  List<GroceryItem> _items;
@override List<GroceryItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of GroceryCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GroceryCategoryCopyWith<_GroceryCategory> get copyWith => __$GroceryCategoryCopyWithImpl<_GroceryCategory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GroceryCategoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GroceryCategory&&(identical(other.category, category) || other.category == category)&&(identical(other.categoryDisplay, categoryDisplay) || other.categoryDisplay == categoryDisplay)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,category,categoryDisplay,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'GroceryCategory(category: $category, categoryDisplay: $categoryDisplay, items: $items)';
}


}

/// @nodoc
abstract mixin class _$GroceryCategoryCopyWith<$Res> implements $GroceryCategoryCopyWith<$Res> {
  factory _$GroceryCategoryCopyWith(_GroceryCategory value, $Res Function(_GroceryCategory) _then) = __$GroceryCategoryCopyWithImpl;
@override @useResult
$Res call({
 String category, String categoryDisplay, List<GroceryItem> items
});




}
/// @nodoc
class __$GroceryCategoryCopyWithImpl<$Res>
    implements _$GroceryCategoryCopyWith<$Res> {
  __$GroceryCategoryCopyWithImpl(this._self, this._then);

  final _GroceryCategory _self;
  final $Res Function(_GroceryCategory) _then;

/// Create a copy of GroceryCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? category = null,Object? categoryDisplay = null,Object? items = null,}) {
  return _then(_GroceryCategory(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,categoryDisplay: null == categoryDisplay ? _self.categoryDisplay : categoryDisplay // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<GroceryItem>,
  ));
}


}


/// @nodoc
mixin _$GroceryList {

 int get id; String get weekStartDate; String get generatedAt; List<GroceryCategory> get categories; String? get estimatedCostInr;
/// Create a copy of GroceryList
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GroceryListCopyWith<GroceryList> get copyWith => _$GroceryListCopyWithImpl<GroceryList>(this as GroceryList, _$identity);

  /// Serializes this GroceryList to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GroceryList&&(identical(other.id, id) || other.id == id)&&(identical(other.weekStartDate, weekStartDate) || other.weekStartDate == weekStartDate)&&(identical(other.generatedAt, generatedAt) || other.generatedAt == generatedAt)&&const DeepCollectionEquality().equals(other.categories, categories)&&(identical(other.estimatedCostInr, estimatedCostInr) || other.estimatedCostInr == estimatedCostInr));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,weekStartDate,generatedAt,const DeepCollectionEquality().hash(categories),estimatedCostInr);

@override
String toString() {
  return 'GroceryList(id: $id, weekStartDate: $weekStartDate, generatedAt: $generatedAt, categories: $categories, estimatedCostInr: $estimatedCostInr)';
}


}

/// @nodoc
abstract mixin class $GroceryListCopyWith<$Res>  {
  factory $GroceryListCopyWith(GroceryList value, $Res Function(GroceryList) _then) = _$GroceryListCopyWithImpl;
@useResult
$Res call({
 int id, String weekStartDate, String generatedAt, List<GroceryCategory> categories, String? estimatedCostInr
});




}
/// @nodoc
class _$GroceryListCopyWithImpl<$Res>
    implements $GroceryListCopyWith<$Res> {
  _$GroceryListCopyWithImpl(this._self, this._then);

  final GroceryList _self;
  final $Res Function(GroceryList) _then;

/// Create a copy of GroceryList
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? weekStartDate = null,Object? generatedAt = null,Object? categories = null,Object? estimatedCostInr = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,weekStartDate: null == weekStartDate ? _self.weekStartDate : weekStartDate // ignore: cast_nullable_to_non_nullable
as String,generatedAt: null == generatedAt ? _self.generatedAt : generatedAt // ignore: cast_nullable_to_non_nullable
as String,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<GroceryCategory>,estimatedCostInr: freezed == estimatedCostInr ? _self.estimatedCostInr : estimatedCostInr // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GroceryList].
extension GroceryListPatterns on GroceryList {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GroceryList value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GroceryList() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GroceryList value)  $default,){
final _that = this;
switch (_that) {
case _GroceryList():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GroceryList value)?  $default,){
final _that = this;
switch (_that) {
case _GroceryList() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String weekStartDate,  String generatedAt,  List<GroceryCategory> categories,  String? estimatedCostInr)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GroceryList() when $default != null:
return $default(_that.id,_that.weekStartDate,_that.generatedAt,_that.categories,_that.estimatedCostInr);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String weekStartDate,  String generatedAt,  List<GroceryCategory> categories,  String? estimatedCostInr)  $default,) {final _that = this;
switch (_that) {
case _GroceryList():
return $default(_that.id,_that.weekStartDate,_that.generatedAt,_that.categories,_that.estimatedCostInr);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String weekStartDate,  String generatedAt,  List<GroceryCategory> categories,  String? estimatedCostInr)?  $default,) {final _that = this;
switch (_that) {
case _GroceryList() when $default != null:
return $default(_that.id,_that.weekStartDate,_that.generatedAt,_that.categories,_that.estimatedCostInr);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _GroceryList implements GroceryList {
  const _GroceryList({required this.id, required this.weekStartDate, required this.generatedAt, required final  List<GroceryCategory> categories, this.estimatedCostInr}): _categories = categories;
  factory _GroceryList.fromJson(Map<String, dynamic> json) => _$GroceryListFromJson(json);

@override final  int id;
@override final  String weekStartDate;
@override final  String generatedAt;
 final  List<GroceryCategory> _categories;
@override List<GroceryCategory> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

@override final  String? estimatedCostInr;

/// Create a copy of GroceryList
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GroceryListCopyWith<_GroceryList> get copyWith => __$GroceryListCopyWithImpl<_GroceryList>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GroceryListToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GroceryList&&(identical(other.id, id) || other.id == id)&&(identical(other.weekStartDate, weekStartDate) || other.weekStartDate == weekStartDate)&&(identical(other.generatedAt, generatedAt) || other.generatedAt == generatedAt)&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.estimatedCostInr, estimatedCostInr) || other.estimatedCostInr == estimatedCostInr));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,weekStartDate,generatedAt,const DeepCollectionEquality().hash(_categories),estimatedCostInr);

@override
String toString() {
  return 'GroceryList(id: $id, weekStartDate: $weekStartDate, generatedAt: $generatedAt, categories: $categories, estimatedCostInr: $estimatedCostInr)';
}


}

/// @nodoc
abstract mixin class _$GroceryListCopyWith<$Res> implements $GroceryListCopyWith<$Res> {
  factory _$GroceryListCopyWith(_GroceryList value, $Res Function(_GroceryList) _then) = __$GroceryListCopyWithImpl;
@override @useResult
$Res call({
 int id, String weekStartDate, String generatedAt, List<GroceryCategory> categories, String? estimatedCostInr
});




}
/// @nodoc
class __$GroceryListCopyWithImpl<$Res>
    implements _$GroceryListCopyWith<$Res> {
  __$GroceryListCopyWithImpl(this._self, this._then);

  final _GroceryList _self;
  final $Res Function(_GroceryList) _then;

/// Create a copy of GroceryList
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? weekStartDate = null,Object? generatedAt = null,Object? categories = null,Object? estimatedCostInr = freezed,}) {
  return _then(_GroceryList(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,weekStartDate: null == weekStartDate ? _self.weekStartDate : weekStartDate // ignore: cast_nullable_to_non_nullable
as String,generatedAt: null == generatedAt ? _self.generatedAt : generatedAt // ignore: cast_nullable_to_non_nullable
as String,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<GroceryCategory>,estimatedCostInr: freezed == estimatedCostInr ? _self.estimatedCostInr : estimatedCostInr // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
