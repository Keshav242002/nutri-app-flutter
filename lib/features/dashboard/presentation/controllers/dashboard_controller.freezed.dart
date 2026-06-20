// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DashboardState {

 TodayMealPlan get mealPlan; DailyNutrition get nutrition; MealCardState get breakfastState; MealCardState get lunchState; MealCardState get dinnerState;
/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardStateCopyWith<DashboardState> get copyWith => _$DashboardStateCopyWithImpl<DashboardState>(this as DashboardState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardState&&(identical(other.mealPlan, mealPlan) || other.mealPlan == mealPlan)&&(identical(other.nutrition, nutrition) || other.nutrition == nutrition)&&(identical(other.breakfastState, breakfastState) || other.breakfastState == breakfastState)&&(identical(other.lunchState, lunchState) || other.lunchState == lunchState)&&(identical(other.dinnerState, dinnerState) || other.dinnerState == dinnerState));
}


@override
int get hashCode => Object.hash(runtimeType,mealPlan,nutrition,breakfastState,lunchState,dinnerState);

@override
String toString() {
  return 'DashboardState(mealPlan: $mealPlan, nutrition: $nutrition, breakfastState: $breakfastState, lunchState: $lunchState, dinnerState: $dinnerState)';
}


}

/// @nodoc
abstract mixin class $DashboardStateCopyWith<$Res>  {
  factory $DashboardStateCopyWith(DashboardState value, $Res Function(DashboardState) _then) = _$DashboardStateCopyWithImpl;
@useResult
$Res call({
 TodayMealPlan mealPlan, DailyNutrition nutrition, MealCardState breakfastState, MealCardState lunchState, MealCardState dinnerState
});


$TodayMealPlanCopyWith<$Res> get mealPlan;$DailyNutritionCopyWith<$Res> get nutrition;$MealCardStateCopyWith<$Res> get breakfastState;$MealCardStateCopyWith<$Res> get lunchState;$MealCardStateCopyWith<$Res> get dinnerState;

}
/// @nodoc
class _$DashboardStateCopyWithImpl<$Res>
    implements $DashboardStateCopyWith<$Res> {
  _$DashboardStateCopyWithImpl(this._self, this._then);

  final DashboardState _self;
  final $Res Function(DashboardState) _then;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mealPlan = null,Object? nutrition = null,Object? breakfastState = null,Object? lunchState = null,Object? dinnerState = null,}) {
  return _then(_self.copyWith(
mealPlan: null == mealPlan ? _self.mealPlan : mealPlan // ignore: cast_nullable_to_non_nullable
as TodayMealPlan,nutrition: null == nutrition ? _self.nutrition : nutrition // ignore: cast_nullable_to_non_nullable
as DailyNutrition,breakfastState: null == breakfastState ? _self.breakfastState : breakfastState // ignore: cast_nullable_to_non_nullable
as MealCardState,lunchState: null == lunchState ? _self.lunchState : lunchState // ignore: cast_nullable_to_non_nullable
as MealCardState,dinnerState: null == dinnerState ? _self.dinnerState : dinnerState // ignore: cast_nullable_to_non_nullable
as MealCardState,
  ));
}
/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TodayMealPlanCopyWith<$Res> get mealPlan {
  
  return $TodayMealPlanCopyWith<$Res>(_self.mealPlan, (value) {
    return _then(_self.copyWith(mealPlan: value));
  });
}/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DailyNutritionCopyWith<$Res> get nutrition {
  
  return $DailyNutritionCopyWith<$Res>(_self.nutrition, (value) {
    return _then(_self.copyWith(nutrition: value));
  });
}/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MealCardStateCopyWith<$Res> get breakfastState {
  
  return $MealCardStateCopyWith<$Res>(_self.breakfastState, (value) {
    return _then(_self.copyWith(breakfastState: value));
  });
}/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MealCardStateCopyWith<$Res> get lunchState {
  
  return $MealCardStateCopyWith<$Res>(_self.lunchState, (value) {
    return _then(_self.copyWith(lunchState: value));
  });
}/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MealCardStateCopyWith<$Res> get dinnerState {
  
  return $MealCardStateCopyWith<$Res>(_self.dinnerState, (value) {
    return _then(_self.copyWith(dinnerState: value));
  });
}
}


/// Adds pattern-matching-related methods to [DashboardState].
extension DashboardStatePatterns on DashboardState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardState value)  $default,){
final _that = this;
switch (_that) {
case _DashboardState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardState value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TodayMealPlan mealPlan,  DailyNutrition nutrition,  MealCardState breakfastState,  MealCardState lunchState,  MealCardState dinnerState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardState() when $default != null:
return $default(_that.mealPlan,_that.nutrition,_that.breakfastState,_that.lunchState,_that.dinnerState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TodayMealPlan mealPlan,  DailyNutrition nutrition,  MealCardState breakfastState,  MealCardState lunchState,  MealCardState dinnerState)  $default,) {final _that = this;
switch (_that) {
case _DashboardState():
return $default(_that.mealPlan,_that.nutrition,_that.breakfastState,_that.lunchState,_that.dinnerState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TodayMealPlan mealPlan,  DailyNutrition nutrition,  MealCardState breakfastState,  MealCardState lunchState,  MealCardState dinnerState)?  $default,) {final _that = this;
switch (_that) {
case _DashboardState() when $default != null:
return $default(_that.mealPlan,_that.nutrition,_that.breakfastState,_that.lunchState,_that.dinnerState);case _:
  return null;

}
}

}

/// @nodoc


class _DashboardState implements DashboardState {
  const _DashboardState({required this.mealPlan, required this.nutrition, required this.breakfastState, required this.lunchState, required this.dinnerState});
  

@override final  TodayMealPlan mealPlan;
@override final  DailyNutrition nutrition;
@override final  MealCardState breakfastState;
@override final  MealCardState lunchState;
@override final  MealCardState dinnerState;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardStateCopyWith<_DashboardState> get copyWith => __$DashboardStateCopyWithImpl<_DashboardState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardState&&(identical(other.mealPlan, mealPlan) || other.mealPlan == mealPlan)&&(identical(other.nutrition, nutrition) || other.nutrition == nutrition)&&(identical(other.breakfastState, breakfastState) || other.breakfastState == breakfastState)&&(identical(other.lunchState, lunchState) || other.lunchState == lunchState)&&(identical(other.dinnerState, dinnerState) || other.dinnerState == dinnerState));
}


@override
int get hashCode => Object.hash(runtimeType,mealPlan,nutrition,breakfastState,lunchState,dinnerState);

@override
String toString() {
  return 'DashboardState(mealPlan: $mealPlan, nutrition: $nutrition, breakfastState: $breakfastState, lunchState: $lunchState, dinnerState: $dinnerState)';
}


}

/// @nodoc
abstract mixin class _$DashboardStateCopyWith<$Res> implements $DashboardStateCopyWith<$Res> {
  factory _$DashboardStateCopyWith(_DashboardState value, $Res Function(_DashboardState) _then) = __$DashboardStateCopyWithImpl;
@override @useResult
$Res call({
 TodayMealPlan mealPlan, DailyNutrition nutrition, MealCardState breakfastState, MealCardState lunchState, MealCardState dinnerState
});


@override $TodayMealPlanCopyWith<$Res> get mealPlan;@override $DailyNutritionCopyWith<$Res> get nutrition;@override $MealCardStateCopyWith<$Res> get breakfastState;@override $MealCardStateCopyWith<$Res> get lunchState;@override $MealCardStateCopyWith<$Res> get dinnerState;

}
/// @nodoc
class __$DashboardStateCopyWithImpl<$Res>
    implements _$DashboardStateCopyWith<$Res> {
  __$DashboardStateCopyWithImpl(this._self, this._then);

  final _DashboardState _self;
  final $Res Function(_DashboardState) _then;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mealPlan = null,Object? nutrition = null,Object? breakfastState = null,Object? lunchState = null,Object? dinnerState = null,}) {
  return _then(_DashboardState(
mealPlan: null == mealPlan ? _self.mealPlan : mealPlan // ignore: cast_nullable_to_non_nullable
as TodayMealPlan,nutrition: null == nutrition ? _self.nutrition : nutrition // ignore: cast_nullable_to_non_nullable
as DailyNutrition,breakfastState: null == breakfastState ? _self.breakfastState : breakfastState // ignore: cast_nullable_to_non_nullable
as MealCardState,lunchState: null == lunchState ? _self.lunchState : lunchState // ignore: cast_nullable_to_non_nullable
as MealCardState,dinnerState: null == dinnerState ? _self.dinnerState : dinnerState // ignore: cast_nullable_to_non_nullable
as MealCardState,
  ));
}

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TodayMealPlanCopyWith<$Res> get mealPlan {
  
  return $TodayMealPlanCopyWith<$Res>(_self.mealPlan, (value) {
    return _then(_self.copyWith(mealPlan: value));
  });
}/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DailyNutritionCopyWith<$Res> get nutrition {
  
  return $DailyNutritionCopyWith<$Res>(_self.nutrition, (value) {
    return _then(_self.copyWith(nutrition: value));
  });
}/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MealCardStateCopyWith<$Res> get breakfastState {
  
  return $MealCardStateCopyWith<$Res>(_self.breakfastState, (value) {
    return _then(_self.copyWith(breakfastState: value));
  });
}/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MealCardStateCopyWith<$Res> get lunchState {
  
  return $MealCardStateCopyWith<$Res>(_self.lunchState, (value) {
    return _then(_self.copyWith(lunchState: value));
  });
}/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MealCardStateCopyWith<$Res> get dinnerState {
  
  return $MealCardStateCopyWith<$Res>(_self.dinnerState, (value) {
    return _then(_self.copyWith(dinnerState: value));
  });
}
}

// dart format on
