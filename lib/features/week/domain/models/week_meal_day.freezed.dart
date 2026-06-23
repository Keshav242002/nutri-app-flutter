// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'week_meal_day.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WeekMealDay {

 int get id; String get planDate; String get generatedBy; String get generatedAt; Map<String, dynamic> get regenerationCount; RecipeSlim? get breakfast; RecipeSlim? get lunch; RecipeSlim? get dinner;
/// Create a copy of WeekMealDay
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeekMealDayCopyWith<WeekMealDay> get copyWith => _$WeekMealDayCopyWithImpl<WeekMealDay>(this as WeekMealDay, _$identity);

  /// Serializes this WeekMealDay to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeekMealDay&&(identical(other.id, id) || other.id == id)&&(identical(other.planDate, planDate) || other.planDate == planDate)&&(identical(other.generatedBy, generatedBy) || other.generatedBy == generatedBy)&&(identical(other.generatedAt, generatedAt) || other.generatedAt == generatedAt)&&(identical(other.regenerationCount, regenerationCount) || other.regenerationCount == regenerationCount)&&(identical(other.breakfast, breakfast) || other.breakfast == breakfast)&&(identical(other.lunch, lunch) || other.lunch == lunch)&&(identical(other.dinner, dinner) || other.dinner == dinner));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,planDate,generatedBy,generatedAt,regenerationCount,breakfast,lunch,dinner);

@override
String toString() {
  return 'WeekMealDay(id: $id, planDate: $planDate, generatedBy: $generatedBy, generatedAt: $generatedAt, regenerationCount: $regenerationCount, breakfast: $breakfast, lunch: $lunch, dinner: $dinner)';
}


}

/// @nodoc
abstract mixin class $WeekMealDayCopyWith<$Res>  {
  factory $WeekMealDayCopyWith(WeekMealDay value, $Res Function(WeekMealDay) _then) = _$WeekMealDayCopyWithImpl;
@useResult
$Res call({
 int id, String planDate, String generatedBy, String generatedAt, Map<String, dynamic> regenerationCount, RecipeSlim? breakfast, RecipeSlim? lunch, RecipeSlim? dinner
});


$RecipeSlimCopyWith<$Res>? get breakfast;$RecipeSlimCopyWith<$Res>? get lunch;$RecipeSlimCopyWith<$Res>? get dinner;

}
/// @nodoc
class _$WeekMealDayCopyWithImpl<$Res>
    implements $WeekMealDayCopyWith<$Res> {
  _$WeekMealDayCopyWithImpl(this._self, this._then);

  final WeekMealDay _self;
  final $Res Function(WeekMealDay) _then;

/// Create a copy of WeekMealDay
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? planDate = null,Object? generatedBy = null,Object? generatedAt = null,Object? regenerationCount = null,Object? breakfast = freezed,Object? lunch = freezed,Object? dinner = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,planDate: null == planDate ? _self.planDate : planDate // ignore: cast_nullable_to_non_nullable
as String,generatedBy: null == generatedBy ? _self.generatedBy : generatedBy // ignore: cast_nullable_to_non_nullable
as String,generatedAt: null == generatedAt ? _self.generatedAt : generatedAt // ignore: cast_nullable_to_non_nullable
as String,regenerationCount: null == regenerationCount ? _self.regenerationCount : regenerationCount // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,breakfast: freezed == breakfast ? _self.breakfast : breakfast // ignore: cast_nullable_to_non_nullable
as RecipeSlim?,lunch: freezed == lunch ? _self.lunch : lunch // ignore: cast_nullable_to_non_nullable
as RecipeSlim?,dinner: freezed == dinner ? _self.dinner : dinner // ignore: cast_nullable_to_non_nullable
as RecipeSlim?,
  ));
}
/// Create a copy of WeekMealDay
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeSlimCopyWith<$Res>? get breakfast {
    if (_self.breakfast == null) {
    return null;
  }

  return $RecipeSlimCopyWith<$Res>(_self.breakfast!, (value) {
    return _then(_self.copyWith(breakfast: value));
  });
}/// Create a copy of WeekMealDay
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeSlimCopyWith<$Res>? get lunch {
    if (_self.lunch == null) {
    return null;
  }

  return $RecipeSlimCopyWith<$Res>(_self.lunch!, (value) {
    return _then(_self.copyWith(lunch: value));
  });
}/// Create a copy of WeekMealDay
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeSlimCopyWith<$Res>? get dinner {
    if (_self.dinner == null) {
    return null;
  }

  return $RecipeSlimCopyWith<$Res>(_self.dinner!, (value) {
    return _then(_self.copyWith(dinner: value));
  });
}
}


/// Adds pattern-matching-related methods to [WeekMealDay].
extension WeekMealDayPatterns on WeekMealDay {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeekMealDay value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeekMealDay() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeekMealDay value)  $default,){
final _that = this;
switch (_that) {
case _WeekMealDay():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeekMealDay value)?  $default,){
final _that = this;
switch (_that) {
case _WeekMealDay() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String planDate,  String generatedBy,  String generatedAt,  Map<String, dynamic> regenerationCount,  RecipeSlim? breakfast,  RecipeSlim? lunch,  RecipeSlim? dinner)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeekMealDay() when $default != null:
return $default(_that.id,_that.planDate,_that.generatedBy,_that.generatedAt,_that.regenerationCount,_that.breakfast,_that.lunch,_that.dinner);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String planDate,  String generatedBy,  String generatedAt,  Map<String, dynamic> regenerationCount,  RecipeSlim? breakfast,  RecipeSlim? lunch,  RecipeSlim? dinner)  $default,) {final _that = this;
switch (_that) {
case _WeekMealDay():
return $default(_that.id,_that.planDate,_that.generatedBy,_that.generatedAt,_that.regenerationCount,_that.breakfast,_that.lunch,_that.dinner);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String planDate,  String generatedBy,  String generatedAt,  Map<String, dynamic> regenerationCount,  RecipeSlim? breakfast,  RecipeSlim? lunch,  RecipeSlim? dinner)?  $default,) {final _that = this;
switch (_that) {
case _WeekMealDay() when $default != null:
return $default(_that.id,_that.planDate,_that.generatedBy,_that.generatedAt,_that.regenerationCount,_that.breakfast,_that.lunch,_that.dinner);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _WeekMealDay implements WeekMealDay {
  const _WeekMealDay({required this.id, required this.planDate, required this.generatedBy, required this.generatedAt, this.regenerationCount = const {}, this.breakfast, this.lunch, this.dinner});
  factory _WeekMealDay.fromJson(Map<String, dynamic> json) => _$WeekMealDayFromJson(json);

@override final  int id;
@override final  String planDate;
@override final  String generatedBy;
@override final  String generatedAt;
@override final  Map<String, dynamic> regenerationCount;
@override final  RecipeSlim? breakfast;
@override final  RecipeSlim? lunch;
@override final  RecipeSlim? dinner;

/// Create a copy of WeekMealDay
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeekMealDayCopyWith<_WeekMealDay> get copyWith => __$WeekMealDayCopyWithImpl<_WeekMealDay>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeekMealDayToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeekMealDay&&(identical(other.id, id) || other.id == id)&&(identical(other.planDate, planDate) || other.planDate == planDate)&&(identical(other.generatedBy, generatedBy) || other.generatedBy == generatedBy)&&(identical(other.generatedAt, generatedAt) || other.generatedAt == generatedAt)&&(identical(other.regenerationCount, regenerationCount) || other.regenerationCount == regenerationCount)&&(identical(other.breakfast, breakfast) || other.breakfast == breakfast)&&(identical(other.lunch, lunch) || other.lunch == lunch)&&(identical(other.dinner, dinner) || other.dinner == dinner));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,planDate,generatedBy,generatedAt,regenerationCount,breakfast,lunch,dinner);

@override
String toString() {
  return 'WeekMealDay(id: $id, planDate: $planDate, generatedBy: $generatedBy, generatedAt: $generatedAt, regenerationCount: $regenerationCount, breakfast: $breakfast, lunch: $lunch, dinner: $dinner)';
}


}

/// @nodoc
abstract mixin class _$WeekMealDayCopyWith<$Res> implements $WeekMealDayCopyWith<$Res> {
  factory _$WeekMealDayCopyWith(_WeekMealDay value, $Res Function(_WeekMealDay) _then) = __$WeekMealDayCopyWithImpl;
@override @useResult
$Res call({
 int id, String planDate, String generatedBy, String generatedAt, Map<String, dynamic> regenerationCount, RecipeSlim? breakfast, RecipeSlim? lunch, RecipeSlim? dinner
});


@override $RecipeSlimCopyWith<$Res>? get breakfast;@override $RecipeSlimCopyWith<$Res>? get lunch;@override $RecipeSlimCopyWith<$Res>? get dinner;

}
/// @nodoc
class __$WeekMealDayCopyWithImpl<$Res>
    implements _$WeekMealDayCopyWith<$Res> {
  __$WeekMealDayCopyWithImpl(this._self, this._then);

  final _WeekMealDay _self;
  final $Res Function(_WeekMealDay) _then;

/// Create a copy of WeekMealDay
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? planDate = null,Object? generatedBy = null,Object? generatedAt = null,Object? regenerationCount = null,Object? breakfast = freezed,Object? lunch = freezed,Object? dinner = freezed,}) {
  return _then(_WeekMealDay(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,planDate: null == planDate ? _self.planDate : planDate // ignore: cast_nullable_to_non_nullable
as String,generatedBy: null == generatedBy ? _self.generatedBy : generatedBy // ignore: cast_nullable_to_non_nullable
as String,generatedAt: null == generatedAt ? _self.generatedAt : generatedAt // ignore: cast_nullable_to_non_nullable
as String,regenerationCount: null == regenerationCount ? _self.regenerationCount : regenerationCount // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,breakfast: freezed == breakfast ? _self.breakfast : breakfast // ignore: cast_nullable_to_non_nullable
as RecipeSlim?,lunch: freezed == lunch ? _self.lunch : lunch // ignore: cast_nullable_to_non_nullable
as RecipeSlim?,dinner: freezed == dinner ? _self.dinner : dinner // ignore: cast_nullable_to_non_nullable
as RecipeSlim?,
  ));
}

/// Create a copy of WeekMealDay
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeSlimCopyWith<$Res>? get breakfast {
    if (_self.breakfast == null) {
    return null;
  }

  return $RecipeSlimCopyWith<$Res>(_self.breakfast!, (value) {
    return _then(_self.copyWith(breakfast: value));
  });
}/// Create a copy of WeekMealDay
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeSlimCopyWith<$Res>? get lunch {
    if (_self.lunch == null) {
    return null;
  }

  return $RecipeSlimCopyWith<$Res>(_self.lunch!, (value) {
    return _then(_self.copyWith(lunch: value));
  });
}/// Create a copy of WeekMealDay
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeSlimCopyWith<$Res>? get dinner {
    if (_self.dinner == null) {
    return null;
  }

  return $RecipeSlimCopyWith<$Res>(_self.dinner!, (value) {
    return _then(_self.copyWith(dinner: value));
  });
}
}

// dart format on
