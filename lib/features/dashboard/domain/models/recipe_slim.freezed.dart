// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_slim.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecipeSlim {

 int get id; String get name; String get slug; String get mealType; String get cuisine; int get prepTimeMin; int get cachedCaloriesPerServing; String? get imageUrl; String? get proteinSource;
/// Create a copy of RecipeSlim
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeSlimCopyWith<RecipeSlim> get copyWith => _$RecipeSlimCopyWithImpl<RecipeSlim>(this as RecipeSlim, _$identity);

  /// Serializes this RecipeSlim to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipeSlim&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.mealType, mealType) || other.mealType == mealType)&&(identical(other.cuisine, cuisine) || other.cuisine == cuisine)&&(identical(other.prepTimeMin, prepTimeMin) || other.prepTimeMin == prepTimeMin)&&(identical(other.cachedCaloriesPerServing, cachedCaloriesPerServing) || other.cachedCaloriesPerServing == cachedCaloriesPerServing)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.proteinSource, proteinSource) || other.proteinSource == proteinSource));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,mealType,cuisine,prepTimeMin,cachedCaloriesPerServing,imageUrl,proteinSource);

@override
String toString() {
  return 'RecipeSlim(id: $id, name: $name, slug: $slug, mealType: $mealType, cuisine: $cuisine, prepTimeMin: $prepTimeMin, cachedCaloriesPerServing: $cachedCaloriesPerServing, imageUrl: $imageUrl, proteinSource: $proteinSource)';
}


}

/// @nodoc
abstract mixin class $RecipeSlimCopyWith<$Res>  {
  factory $RecipeSlimCopyWith(RecipeSlim value, $Res Function(RecipeSlim) _then) = _$RecipeSlimCopyWithImpl;
@useResult
$Res call({
 int id, String name, String slug, String mealType, String cuisine, int prepTimeMin, int cachedCaloriesPerServing, String? imageUrl, String? proteinSource
});




}
/// @nodoc
class _$RecipeSlimCopyWithImpl<$Res>
    implements $RecipeSlimCopyWith<$Res> {
  _$RecipeSlimCopyWithImpl(this._self, this._then);

  final RecipeSlim _self;
  final $Res Function(RecipeSlim) _then;

/// Create a copy of RecipeSlim
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? mealType = null,Object? cuisine = null,Object? prepTimeMin = null,Object? cachedCaloriesPerServing = null,Object? imageUrl = freezed,Object? proteinSource = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,mealType: null == mealType ? _self.mealType : mealType // ignore: cast_nullable_to_non_nullable
as String,cuisine: null == cuisine ? _self.cuisine : cuisine // ignore: cast_nullable_to_non_nullable
as String,prepTimeMin: null == prepTimeMin ? _self.prepTimeMin : prepTimeMin // ignore: cast_nullable_to_non_nullable
as int,cachedCaloriesPerServing: null == cachedCaloriesPerServing ? _self.cachedCaloriesPerServing : cachedCaloriesPerServing // ignore: cast_nullable_to_non_nullable
as int,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,proteinSource: freezed == proteinSource ? _self.proteinSource : proteinSource // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RecipeSlim].
extension RecipeSlimPatterns on RecipeSlim {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecipeSlim value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecipeSlim() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecipeSlim value)  $default,){
final _that = this;
switch (_that) {
case _RecipeSlim():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecipeSlim value)?  $default,){
final _that = this;
switch (_that) {
case _RecipeSlim() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String slug,  String mealType,  String cuisine,  int prepTimeMin,  int cachedCaloriesPerServing,  String? imageUrl,  String? proteinSource)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecipeSlim() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.mealType,_that.cuisine,_that.prepTimeMin,_that.cachedCaloriesPerServing,_that.imageUrl,_that.proteinSource);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String slug,  String mealType,  String cuisine,  int prepTimeMin,  int cachedCaloriesPerServing,  String? imageUrl,  String? proteinSource)  $default,) {final _that = this;
switch (_that) {
case _RecipeSlim():
return $default(_that.id,_that.name,_that.slug,_that.mealType,_that.cuisine,_that.prepTimeMin,_that.cachedCaloriesPerServing,_that.imageUrl,_that.proteinSource);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String slug,  String mealType,  String cuisine,  int prepTimeMin,  int cachedCaloriesPerServing,  String? imageUrl,  String? proteinSource)?  $default,) {final _that = this;
switch (_that) {
case _RecipeSlim() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.mealType,_that.cuisine,_that.prepTimeMin,_that.cachedCaloriesPerServing,_that.imageUrl,_that.proteinSource);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _RecipeSlim implements RecipeSlim {
  const _RecipeSlim({required this.id, required this.name, required this.slug, required this.mealType, required this.cuisine, required this.prepTimeMin, required this.cachedCaloriesPerServing, this.imageUrl, this.proteinSource});
  factory _RecipeSlim.fromJson(Map<String, dynamic> json) => _$RecipeSlimFromJson(json);

@override final  int id;
@override final  String name;
@override final  String slug;
@override final  String mealType;
@override final  String cuisine;
@override final  int prepTimeMin;
@override final  int cachedCaloriesPerServing;
@override final  String? imageUrl;
@override final  String? proteinSource;

/// Create a copy of RecipeSlim
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeSlimCopyWith<_RecipeSlim> get copyWith => __$RecipeSlimCopyWithImpl<_RecipeSlim>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecipeSlimToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipeSlim&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.mealType, mealType) || other.mealType == mealType)&&(identical(other.cuisine, cuisine) || other.cuisine == cuisine)&&(identical(other.prepTimeMin, prepTimeMin) || other.prepTimeMin == prepTimeMin)&&(identical(other.cachedCaloriesPerServing, cachedCaloriesPerServing) || other.cachedCaloriesPerServing == cachedCaloriesPerServing)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.proteinSource, proteinSource) || other.proteinSource == proteinSource));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,mealType,cuisine,prepTimeMin,cachedCaloriesPerServing,imageUrl,proteinSource);

@override
String toString() {
  return 'RecipeSlim(id: $id, name: $name, slug: $slug, mealType: $mealType, cuisine: $cuisine, prepTimeMin: $prepTimeMin, cachedCaloriesPerServing: $cachedCaloriesPerServing, imageUrl: $imageUrl, proteinSource: $proteinSource)';
}


}

/// @nodoc
abstract mixin class _$RecipeSlimCopyWith<$Res> implements $RecipeSlimCopyWith<$Res> {
  factory _$RecipeSlimCopyWith(_RecipeSlim value, $Res Function(_RecipeSlim) _then) = __$RecipeSlimCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String slug, String mealType, String cuisine, int prepTimeMin, int cachedCaloriesPerServing, String? imageUrl, String? proteinSource
});




}
/// @nodoc
class __$RecipeSlimCopyWithImpl<$Res>
    implements _$RecipeSlimCopyWith<$Res> {
  __$RecipeSlimCopyWithImpl(this._self, this._then);

  final _RecipeSlim _self;
  final $Res Function(_RecipeSlim) _then;

/// Create a copy of RecipeSlim
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? mealType = null,Object? cuisine = null,Object? prepTimeMin = null,Object? cachedCaloriesPerServing = null,Object? imageUrl = freezed,Object? proteinSource = freezed,}) {
  return _then(_RecipeSlim(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,mealType: null == mealType ? _self.mealType : mealType // ignore: cast_nullable_to_non_nullable
as String,cuisine: null == cuisine ? _self.cuisine : cuisine // ignore: cast_nullable_to_non_nullable
as String,prepTimeMin: null == prepTimeMin ? _self.prepTimeMin : prepTimeMin // ignore: cast_nullable_to_non_nullable
as int,cachedCaloriesPerServing: null == cachedCaloriesPerServing ? _self.cachedCaloriesPerServing : cachedCaloriesPerServing // ignore: cast_nullable_to_non_nullable
as int,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,proteinSource: freezed == proteinSource ? _self.proteinSource : proteinSource // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
