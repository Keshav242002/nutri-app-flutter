// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'today_meal_plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TodayMealPlan {

 RecipeSlim get breakfast; RecipeSlim get lunch; RecipeSlim get dinner;
/// Create a copy of TodayMealPlan
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodayMealPlanCopyWith<TodayMealPlan> get copyWith => _$TodayMealPlanCopyWithImpl<TodayMealPlan>(this as TodayMealPlan, _$identity);

  /// Serializes this TodayMealPlan to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodayMealPlan&&(identical(other.breakfast, breakfast) || other.breakfast == breakfast)&&(identical(other.lunch, lunch) || other.lunch == lunch)&&(identical(other.dinner, dinner) || other.dinner == dinner));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,breakfast,lunch,dinner);

@override
String toString() {
  return 'TodayMealPlan(breakfast: $breakfast, lunch: $lunch, dinner: $dinner)';
}


}

/// @nodoc
abstract mixin class $TodayMealPlanCopyWith<$Res>  {
  factory $TodayMealPlanCopyWith(TodayMealPlan value, $Res Function(TodayMealPlan) _then) = _$TodayMealPlanCopyWithImpl;
@useResult
$Res call({
 RecipeSlim breakfast, RecipeSlim lunch, RecipeSlim dinner
});


$RecipeSlimCopyWith<$Res> get breakfast;$RecipeSlimCopyWith<$Res> get lunch;$RecipeSlimCopyWith<$Res> get dinner;

}
/// @nodoc
class _$TodayMealPlanCopyWithImpl<$Res>
    implements $TodayMealPlanCopyWith<$Res> {
  _$TodayMealPlanCopyWithImpl(this._self, this._then);

  final TodayMealPlan _self;
  final $Res Function(TodayMealPlan) _then;

/// Create a copy of TodayMealPlan
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? breakfast = null,Object? lunch = null,Object? dinner = null,}) {
  return _then(_self.copyWith(
breakfast: null == breakfast ? _self.breakfast : breakfast // ignore: cast_nullable_to_non_nullable
as RecipeSlim,lunch: null == lunch ? _self.lunch : lunch // ignore: cast_nullable_to_non_nullable
as RecipeSlim,dinner: null == dinner ? _self.dinner : dinner // ignore: cast_nullable_to_non_nullable
as RecipeSlim,
  ));
}
/// Create a copy of TodayMealPlan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeSlimCopyWith<$Res> get breakfast {
  
  return $RecipeSlimCopyWith<$Res>(_self.breakfast, (value) {
    return _then(_self.copyWith(breakfast: value));
  });
}/// Create a copy of TodayMealPlan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeSlimCopyWith<$Res> get lunch {
  
  return $RecipeSlimCopyWith<$Res>(_self.lunch, (value) {
    return _then(_self.copyWith(lunch: value));
  });
}/// Create a copy of TodayMealPlan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeSlimCopyWith<$Res> get dinner {
  
  return $RecipeSlimCopyWith<$Res>(_self.dinner, (value) {
    return _then(_self.copyWith(dinner: value));
  });
}
}


/// Adds pattern-matching-related methods to [TodayMealPlan].
extension TodayMealPlanPatterns on TodayMealPlan {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TodayMealPlan value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TodayMealPlan() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TodayMealPlan value)  $default,){
final _that = this;
switch (_that) {
case _TodayMealPlan():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TodayMealPlan value)?  $default,){
final _that = this;
switch (_that) {
case _TodayMealPlan() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RecipeSlim breakfast,  RecipeSlim lunch,  RecipeSlim dinner)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TodayMealPlan() when $default != null:
return $default(_that.breakfast,_that.lunch,_that.dinner);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RecipeSlim breakfast,  RecipeSlim lunch,  RecipeSlim dinner)  $default,) {final _that = this;
switch (_that) {
case _TodayMealPlan():
return $default(_that.breakfast,_that.lunch,_that.dinner);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RecipeSlim breakfast,  RecipeSlim lunch,  RecipeSlim dinner)?  $default,) {final _that = this;
switch (_that) {
case _TodayMealPlan() when $default != null:
return $default(_that.breakfast,_that.lunch,_that.dinner);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TodayMealPlan implements TodayMealPlan {
  const _TodayMealPlan({required this.breakfast, required this.lunch, required this.dinner});
  factory _TodayMealPlan.fromJson(Map<String, dynamic> json) => _$TodayMealPlanFromJson(json);

@override final  RecipeSlim breakfast;
@override final  RecipeSlim lunch;
@override final  RecipeSlim dinner;

/// Create a copy of TodayMealPlan
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TodayMealPlanCopyWith<_TodayMealPlan> get copyWith => __$TodayMealPlanCopyWithImpl<_TodayMealPlan>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TodayMealPlanToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TodayMealPlan&&(identical(other.breakfast, breakfast) || other.breakfast == breakfast)&&(identical(other.lunch, lunch) || other.lunch == lunch)&&(identical(other.dinner, dinner) || other.dinner == dinner));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,breakfast,lunch,dinner);

@override
String toString() {
  return 'TodayMealPlan(breakfast: $breakfast, lunch: $lunch, dinner: $dinner)';
}


}

/// @nodoc
abstract mixin class _$TodayMealPlanCopyWith<$Res> implements $TodayMealPlanCopyWith<$Res> {
  factory _$TodayMealPlanCopyWith(_TodayMealPlan value, $Res Function(_TodayMealPlan) _then) = __$TodayMealPlanCopyWithImpl;
@override @useResult
$Res call({
 RecipeSlim breakfast, RecipeSlim lunch, RecipeSlim dinner
});


@override $RecipeSlimCopyWith<$Res> get breakfast;@override $RecipeSlimCopyWith<$Res> get lunch;@override $RecipeSlimCopyWith<$Res> get dinner;

}
/// @nodoc
class __$TodayMealPlanCopyWithImpl<$Res>
    implements _$TodayMealPlanCopyWith<$Res> {
  __$TodayMealPlanCopyWithImpl(this._self, this._then);

  final _TodayMealPlan _self;
  final $Res Function(_TodayMealPlan) _then;

/// Create a copy of TodayMealPlan
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? breakfast = null,Object? lunch = null,Object? dinner = null,}) {
  return _then(_TodayMealPlan(
breakfast: null == breakfast ? _self.breakfast : breakfast // ignore: cast_nullable_to_non_nullable
as RecipeSlim,lunch: null == lunch ? _self.lunch : lunch // ignore: cast_nullable_to_non_nullable
as RecipeSlim,dinner: null == dinner ? _self.dinner : dinner // ignore: cast_nullable_to_non_nullable
as RecipeSlim,
  ));
}

/// Create a copy of TodayMealPlan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeSlimCopyWith<$Res> get breakfast {
  
  return $RecipeSlimCopyWith<$Res>(_self.breakfast, (value) {
    return _then(_self.copyWith(breakfast: value));
  });
}/// Create a copy of TodayMealPlan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeSlimCopyWith<$Res> get lunch {
  
  return $RecipeSlimCopyWith<$Res>(_self.lunch, (value) {
    return _then(_self.copyWith(lunch: value));
  });
}/// Create a copy of TodayMealPlan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeSlimCopyWith<$Res> get dinner {
  
  return $RecipeSlimCopyWith<$Res>(_self.dinner, (value) {
    return _then(_self.copyWith(dinner: value));
  });
}
}

// dart format on
