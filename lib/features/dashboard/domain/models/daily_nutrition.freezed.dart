// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_nutrition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DailyNutrition {

 String get date; NutritionSummary get totals; NutritionSummary get targets; int get mealsEaten; int get mealsSkipped;
/// Create a copy of DailyNutrition
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyNutritionCopyWith<DailyNutrition> get copyWith => _$DailyNutritionCopyWithImpl<DailyNutrition>(this as DailyNutrition, _$identity);

  /// Serializes this DailyNutrition to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyNutrition&&(identical(other.date, date) || other.date == date)&&(identical(other.totals, totals) || other.totals == totals)&&(identical(other.targets, targets) || other.targets == targets)&&(identical(other.mealsEaten, mealsEaten) || other.mealsEaten == mealsEaten)&&(identical(other.mealsSkipped, mealsSkipped) || other.mealsSkipped == mealsSkipped));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,totals,targets,mealsEaten,mealsSkipped);

@override
String toString() {
  return 'DailyNutrition(date: $date, totals: $totals, targets: $targets, mealsEaten: $mealsEaten, mealsSkipped: $mealsSkipped)';
}


}

/// @nodoc
abstract mixin class $DailyNutritionCopyWith<$Res>  {
  factory $DailyNutritionCopyWith(DailyNutrition value, $Res Function(DailyNutrition) _then) = _$DailyNutritionCopyWithImpl;
@useResult
$Res call({
 String date, NutritionSummary totals, NutritionSummary targets, int mealsEaten, int mealsSkipped
});


$NutritionSummaryCopyWith<$Res> get totals;$NutritionSummaryCopyWith<$Res> get targets;

}
/// @nodoc
class _$DailyNutritionCopyWithImpl<$Res>
    implements $DailyNutritionCopyWith<$Res> {
  _$DailyNutritionCopyWithImpl(this._self, this._then);

  final DailyNutrition _self;
  final $Res Function(DailyNutrition) _then;

/// Create a copy of DailyNutrition
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? totals = null,Object? targets = null,Object? mealsEaten = null,Object? mealsSkipped = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,totals: null == totals ? _self.totals : totals // ignore: cast_nullable_to_non_nullable
as NutritionSummary,targets: null == targets ? _self.targets : targets // ignore: cast_nullable_to_non_nullable
as NutritionSummary,mealsEaten: null == mealsEaten ? _self.mealsEaten : mealsEaten // ignore: cast_nullable_to_non_nullable
as int,mealsSkipped: null == mealsSkipped ? _self.mealsSkipped : mealsSkipped // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of DailyNutrition
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutritionSummaryCopyWith<$Res> get totals {
  
  return $NutritionSummaryCopyWith<$Res>(_self.totals, (value) {
    return _then(_self.copyWith(totals: value));
  });
}/// Create a copy of DailyNutrition
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutritionSummaryCopyWith<$Res> get targets {
  
  return $NutritionSummaryCopyWith<$Res>(_self.targets, (value) {
    return _then(_self.copyWith(targets: value));
  });
}
}


/// Adds pattern-matching-related methods to [DailyNutrition].
extension DailyNutritionPatterns on DailyNutrition {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyNutrition value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyNutrition() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyNutrition value)  $default,){
final _that = this;
switch (_that) {
case _DailyNutrition():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyNutrition value)?  $default,){
final _that = this;
switch (_that) {
case _DailyNutrition() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String date,  NutritionSummary totals,  NutritionSummary targets,  int mealsEaten,  int mealsSkipped)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyNutrition() when $default != null:
return $default(_that.date,_that.totals,_that.targets,_that.mealsEaten,_that.mealsSkipped);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String date,  NutritionSummary totals,  NutritionSummary targets,  int mealsEaten,  int mealsSkipped)  $default,) {final _that = this;
switch (_that) {
case _DailyNutrition():
return $default(_that.date,_that.totals,_that.targets,_that.mealsEaten,_that.mealsSkipped);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String date,  NutritionSummary totals,  NutritionSummary targets,  int mealsEaten,  int mealsSkipped)?  $default,) {final _that = this;
switch (_that) {
case _DailyNutrition() when $default != null:
return $default(_that.date,_that.totals,_that.targets,_that.mealsEaten,_that.mealsSkipped);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _DailyNutrition implements DailyNutrition {
  const _DailyNutrition({required this.date, required this.totals, required this.targets, required this.mealsEaten, required this.mealsSkipped});
  factory _DailyNutrition.fromJson(Map<String, dynamic> json) => _$DailyNutritionFromJson(json);

@override final  String date;
@override final  NutritionSummary totals;
@override final  NutritionSummary targets;
@override final  int mealsEaten;
@override final  int mealsSkipped;

/// Create a copy of DailyNutrition
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyNutritionCopyWith<_DailyNutrition> get copyWith => __$DailyNutritionCopyWithImpl<_DailyNutrition>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyNutritionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyNutrition&&(identical(other.date, date) || other.date == date)&&(identical(other.totals, totals) || other.totals == totals)&&(identical(other.targets, targets) || other.targets == targets)&&(identical(other.mealsEaten, mealsEaten) || other.mealsEaten == mealsEaten)&&(identical(other.mealsSkipped, mealsSkipped) || other.mealsSkipped == mealsSkipped));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,totals,targets,mealsEaten,mealsSkipped);

@override
String toString() {
  return 'DailyNutrition(date: $date, totals: $totals, targets: $targets, mealsEaten: $mealsEaten, mealsSkipped: $mealsSkipped)';
}


}

/// @nodoc
abstract mixin class _$DailyNutritionCopyWith<$Res> implements $DailyNutritionCopyWith<$Res> {
  factory _$DailyNutritionCopyWith(_DailyNutrition value, $Res Function(_DailyNutrition) _then) = __$DailyNutritionCopyWithImpl;
@override @useResult
$Res call({
 String date, NutritionSummary totals, NutritionSummary targets, int mealsEaten, int mealsSkipped
});


@override $NutritionSummaryCopyWith<$Res> get totals;@override $NutritionSummaryCopyWith<$Res> get targets;

}
/// @nodoc
class __$DailyNutritionCopyWithImpl<$Res>
    implements _$DailyNutritionCopyWith<$Res> {
  __$DailyNutritionCopyWithImpl(this._self, this._then);

  final _DailyNutrition _self;
  final $Res Function(_DailyNutrition) _then;

/// Create a copy of DailyNutrition
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? totals = null,Object? targets = null,Object? mealsEaten = null,Object? mealsSkipped = null,}) {
  return _then(_DailyNutrition(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,totals: null == totals ? _self.totals : totals // ignore: cast_nullable_to_non_nullable
as NutritionSummary,targets: null == targets ? _self.targets : targets // ignore: cast_nullable_to_non_nullable
as NutritionSummary,mealsEaten: null == mealsEaten ? _self.mealsEaten : mealsEaten // ignore: cast_nullable_to_non_nullable
as int,mealsSkipped: null == mealsSkipped ? _self.mealsSkipped : mealsSkipped // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of DailyNutrition
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutritionSummaryCopyWith<$Res> get totals {
  
  return $NutritionSummaryCopyWith<$Res>(_self.totals, (value) {
    return _then(_self.copyWith(totals: value));
  });
}/// Create a copy of DailyNutrition
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutritionSummaryCopyWith<$Res> get targets {
  
  return $NutritionSummaryCopyWith<$Res>(_self.targets, (value) {
    return _then(_self.copyWith(targets: value));
  });
}
}

// dart format on
