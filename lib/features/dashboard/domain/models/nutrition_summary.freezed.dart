// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrition_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NutritionSummary {

 double get calories; double get proteinG; double get carbsG; double get fatG; double get fiberG;
/// Create a copy of NutritionSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NutritionSummaryCopyWith<NutritionSummary> get copyWith => _$NutritionSummaryCopyWithImpl<NutritionSummary>(this as NutritionSummary, _$identity);

  /// Serializes this NutritionSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NutritionSummary&&(identical(other.calories, calories) || other.calories == calories)&&(identical(other.proteinG, proteinG) || other.proteinG == proteinG)&&(identical(other.carbsG, carbsG) || other.carbsG == carbsG)&&(identical(other.fatG, fatG) || other.fatG == fatG)&&(identical(other.fiberG, fiberG) || other.fiberG == fiberG));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,calories,proteinG,carbsG,fatG,fiberG);

@override
String toString() {
  return 'NutritionSummary(calories: $calories, proteinG: $proteinG, carbsG: $carbsG, fatG: $fatG, fiberG: $fiberG)';
}


}

/// @nodoc
abstract mixin class $NutritionSummaryCopyWith<$Res>  {
  factory $NutritionSummaryCopyWith(NutritionSummary value, $Res Function(NutritionSummary) _then) = _$NutritionSummaryCopyWithImpl;
@useResult
$Res call({
 double calories, double proteinG, double carbsG, double fatG, double fiberG
});




}
/// @nodoc
class _$NutritionSummaryCopyWithImpl<$Res>
    implements $NutritionSummaryCopyWith<$Res> {
  _$NutritionSummaryCopyWithImpl(this._self, this._then);

  final NutritionSummary _self;
  final $Res Function(NutritionSummary) _then;

/// Create a copy of NutritionSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? calories = null,Object? proteinG = null,Object? carbsG = null,Object? fatG = null,Object? fiberG = null,}) {
  return _then(_self.copyWith(
calories: null == calories ? _self.calories : calories // ignore: cast_nullable_to_non_nullable
as double,proteinG: null == proteinG ? _self.proteinG : proteinG // ignore: cast_nullable_to_non_nullable
as double,carbsG: null == carbsG ? _self.carbsG : carbsG // ignore: cast_nullable_to_non_nullable
as double,fatG: null == fatG ? _self.fatG : fatG // ignore: cast_nullable_to_non_nullable
as double,fiberG: null == fiberG ? _self.fiberG : fiberG // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [NutritionSummary].
extension NutritionSummaryPatterns on NutritionSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NutritionSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NutritionSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NutritionSummary value)  $default,){
final _that = this;
switch (_that) {
case _NutritionSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NutritionSummary value)?  $default,){
final _that = this;
switch (_that) {
case _NutritionSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double calories,  double proteinG,  double carbsG,  double fatG,  double fiberG)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NutritionSummary() when $default != null:
return $default(_that.calories,_that.proteinG,_that.carbsG,_that.fatG,_that.fiberG);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double calories,  double proteinG,  double carbsG,  double fatG,  double fiberG)  $default,) {final _that = this;
switch (_that) {
case _NutritionSummary():
return $default(_that.calories,_that.proteinG,_that.carbsG,_that.fatG,_that.fiberG);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double calories,  double proteinG,  double carbsG,  double fatG,  double fiberG)?  $default,) {final _that = this;
switch (_that) {
case _NutritionSummary() when $default != null:
return $default(_that.calories,_that.proteinG,_that.carbsG,_that.fatG,_that.fiberG);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _NutritionSummary implements NutritionSummary {
  const _NutritionSummary({this.calories = 0.0, this.proteinG = 0.0, this.carbsG = 0.0, this.fatG = 0.0, this.fiberG = 0.0});
  factory _NutritionSummary.fromJson(Map<String, dynamic> json) => _$NutritionSummaryFromJson(json);

@override@JsonKey() final  double calories;
@override@JsonKey() final  double proteinG;
@override@JsonKey() final  double carbsG;
@override@JsonKey() final  double fatG;
@override@JsonKey() final  double fiberG;

/// Create a copy of NutritionSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NutritionSummaryCopyWith<_NutritionSummary> get copyWith => __$NutritionSummaryCopyWithImpl<_NutritionSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NutritionSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NutritionSummary&&(identical(other.calories, calories) || other.calories == calories)&&(identical(other.proteinG, proteinG) || other.proteinG == proteinG)&&(identical(other.carbsG, carbsG) || other.carbsG == carbsG)&&(identical(other.fatG, fatG) || other.fatG == fatG)&&(identical(other.fiberG, fiberG) || other.fiberG == fiberG));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,calories,proteinG,carbsG,fatG,fiberG);

@override
String toString() {
  return 'NutritionSummary(calories: $calories, proteinG: $proteinG, carbsG: $carbsG, fatG: $fatG, fiberG: $fiberG)';
}


}

/// @nodoc
abstract mixin class _$NutritionSummaryCopyWith<$Res> implements $NutritionSummaryCopyWith<$Res> {
  factory _$NutritionSummaryCopyWith(_NutritionSummary value, $Res Function(_NutritionSummary) _then) = __$NutritionSummaryCopyWithImpl;
@override @useResult
$Res call({
 double calories, double proteinG, double carbsG, double fatG, double fiberG
});




}
/// @nodoc
class __$NutritionSummaryCopyWithImpl<$Res>
    implements _$NutritionSummaryCopyWith<$Res> {
  __$NutritionSummaryCopyWithImpl(this._self, this._then);

  final _NutritionSummary _self;
  final $Res Function(_NutritionSummary) _then;

/// Create a copy of NutritionSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? calories = null,Object? proteinG = null,Object? carbsG = null,Object? fatG = null,Object? fiberG = null,}) {
  return _then(_NutritionSummary(
calories: null == calories ? _self.calories : calories // ignore: cast_nullable_to_non_nullable
as double,proteinG: null == proteinG ? _self.proteinG : proteinG // ignore: cast_nullable_to_non_nullable
as double,carbsG: null == carbsG ? _self.carbsG : carbsG // ignore: cast_nullable_to_non_nullable
as double,fatG: null == fatG ? _self.fatG : fatG // ignore: cast_nullable_to_non_nullable
as double,fiberG: null == fiberG ? _self.fiberG : fiberG // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
