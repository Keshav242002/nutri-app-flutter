// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weekly_nutrition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DayNutritionEntry {

 String get date; NutritionSummary get totals; NutritionSummary? get targets; Map<String, double> get percentageOfTarget; int get mealsEaten; int get mealsSkipped;
/// Create a copy of DayNutritionEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DayNutritionEntryCopyWith<DayNutritionEntry> get copyWith => _$DayNutritionEntryCopyWithImpl<DayNutritionEntry>(this as DayNutritionEntry, _$identity);

  /// Serializes this DayNutritionEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DayNutritionEntry&&(identical(other.date, date) || other.date == date)&&(identical(other.totals, totals) || other.totals == totals)&&(identical(other.targets, targets) || other.targets == targets)&&const DeepCollectionEquality().equals(other.percentageOfTarget, percentageOfTarget)&&(identical(other.mealsEaten, mealsEaten) || other.mealsEaten == mealsEaten)&&(identical(other.mealsSkipped, mealsSkipped) || other.mealsSkipped == mealsSkipped));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,totals,targets,const DeepCollectionEquality().hash(percentageOfTarget),mealsEaten,mealsSkipped);

@override
String toString() {
  return 'DayNutritionEntry(date: $date, totals: $totals, targets: $targets, percentageOfTarget: $percentageOfTarget, mealsEaten: $mealsEaten, mealsSkipped: $mealsSkipped)';
}


}

/// @nodoc
abstract mixin class $DayNutritionEntryCopyWith<$Res>  {
  factory $DayNutritionEntryCopyWith(DayNutritionEntry value, $Res Function(DayNutritionEntry) _then) = _$DayNutritionEntryCopyWithImpl;
@useResult
$Res call({
 String date, NutritionSummary totals, NutritionSummary? targets, Map<String, double> percentageOfTarget, int mealsEaten, int mealsSkipped
});


$NutritionSummaryCopyWith<$Res> get totals;$NutritionSummaryCopyWith<$Res>? get targets;

}
/// @nodoc
class _$DayNutritionEntryCopyWithImpl<$Res>
    implements $DayNutritionEntryCopyWith<$Res> {
  _$DayNutritionEntryCopyWithImpl(this._self, this._then);

  final DayNutritionEntry _self;
  final $Res Function(DayNutritionEntry) _then;

/// Create a copy of DayNutritionEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? totals = null,Object? targets = freezed,Object? percentageOfTarget = null,Object? mealsEaten = null,Object? mealsSkipped = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,totals: null == totals ? _self.totals : totals // ignore: cast_nullable_to_non_nullable
as NutritionSummary,targets: freezed == targets ? _self.targets : targets // ignore: cast_nullable_to_non_nullable
as NutritionSummary?,percentageOfTarget: null == percentageOfTarget ? _self.percentageOfTarget : percentageOfTarget // ignore: cast_nullable_to_non_nullable
as Map<String, double>,mealsEaten: null == mealsEaten ? _self.mealsEaten : mealsEaten // ignore: cast_nullable_to_non_nullable
as int,mealsSkipped: null == mealsSkipped ? _self.mealsSkipped : mealsSkipped // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of DayNutritionEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutritionSummaryCopyWith<$Res> get totals {
  
  return $NutritionSummaryCopyWith<$Res>(_self.totals, (value) {
    return _then(_self.copyWith(totals: value));
  });
}/// Create a copy of DayNutritionEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutritionSummaryCopyWith<$Res>? get targets {
    if (_self.targets == null) {
    return null;
  }

  return $NutritionSummaryCopyWith<$Res>(_self.targets!, (value) {
    return _then(_self.copyWith(targets: value));
  });
}
}


/// Adds pattern-matching-related methods to [DayNutritionEntry].
extension DayNutritionEntryPatterns on DayNutritionEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DayNutritionEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DayNutritionEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DayNutritionEntry value)  $default,){
final _that = this;
switch (_that) {
case _DayNutritionEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DayNutritionEntry value)?  $default,){
final _that = this;
switch (_that) {
case _DayNutritionEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String date,  NutritionSummary totals,  NutritionSummary? targets,  Map<String, double> percentageOfTarget,  int mealsEaten,  int mealsSkipped)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DayNutritionEntry() when $default != null:
return $default(_that.date,_that.totals,_that.targets,_that.percentageOfTarget,_that.mealsEaten,_that.mealsSkipped);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String date,  NutritionSummary totals,  NutritionSummary? targets,  Map<String, double> percentageOfTarget,  int mealsEaten,  int mealsSkipped)  $default,) {final _that = this;
switch (_that) {
case _DayNutritionEntry():
return $default(_that.date,_that.totals,_that.targets,_that.percentageOfTarget,_that.mealsEaten,_that.mealsSkipped);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String date,  NutritionSummary totals,  NutritionSummary? targets,  Map<String, double> percentageOfTarget,  int mealsEaten,  int mealsSkipped)?  $default,) {final _that = this;
switch (_that) {
case _DayNutritionEntry() when $default != null:
return $default(_that.date,_that.totals,_that.targets,_that.percentageOfTarget,_that.mealsEaten,_that.mealsSkipped);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _DayNutritionEntry implements DayNutritionEntry {
  const _DayNutritionEntry({required this.date, required this.totals, this.targets, final  Map<String, double> percentageOfTarget = const {}, this.mealsEaten = 0, this.mealsSkipped = 0}): _percentageOfTarget = percentageOfTarget;
  factory _DayNutritionEntry.fromJson(Map<String, dynamic> json) => _$DayNutritionEntryFromJson(json);

@override final  String date;
@override final  NutritionSummary totals;
@override final  NutritionSummary? targets;
 final  Map<String, double> _percentageOfTarget;
@override@JsonKey() Map<String, double> get percentageOfTarget {
  if (_percentageOfTarget is EqualUnmodifiableMapView) return _percentageOfTarget;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_percentageOfTarget);
}

@override@JsonKey() final  int mealsEaten;
@override@JsonKey() final  int mealsSkipped;

/// Create a copy of DayNutritionEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DayNutritionEntryCopyWith<_DayNutritionEntry> get copyWith => __$DayNutritionEntryCopyWithImpl<_DayNutritionEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DayNutritionEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DayNutritionEntry&&(identical(other.date, date) || other.date == date)&&(identical(other.totals, totals) || other.totals == totals)&&(identical(other.targets, targets) || other.targets == targets)&&const DeepCollectionEquality().equals(other._percentageOfTarget, _percentageOfTarget)&&(identical(other.mealsEaten, mealsEaten) || other.mealsEaten == mealsEaten)&&(identical(other.mealsSkipped, mealsSkipped) || other.mealsSkipped == mealsSkipped));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,totals,targets,const DeepCollectionEquality().hash(_percentageOfTarget),mealsEaten,mealsSkipped);

@override
String toString() {
  return 'DayNutritionEntry(date: $date, totals: $totals, targets: $targets, percentageOfTarget: $percentageOfTarget, mealsEaten: $mealsEaten, mealsSkipped: $mealsSkipped)';
}


}

/// @nodoc
abstract mixin class _$DayNutritionEntryCopyWith<$Res> implements $DayNutritionEntryCopyWith<$Res> {
  factory _$DayNutritionEntryCopyWith(_DayNutritionEntry value, $Res Function(_DayNutritionEntry) _then) = __$DayNutritionEntryCopyWithImpl;
@override @useResult
$Res call({
 String date, NutritionSummary totals, NutritionSummary? targets, Map<String, double> percentageOfTarget, int mealsEaten, int mealsSkipped
});


@override $NutritionSummaryCopyWith<$Res> get totals;@override $NutritionSummaryCopyWith<$Res>? get targets;

}
/// @nodoc
class __$DayNutritionEntryCopyWithImpl<$Res>
    implements _$DayNutritionEntryCopyWith<$Res> {
  __$DayNutritionEntryCopyWithImpl(this._self, this._then);

  final _DayNutritionEntry _self;
  final $Res Function(_DayNutritionEntry) _then;

/// Create a copy of DayNutritionEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? totals = null,Object? targets = freezed,Object? percentageOfTarget = null,Object? mealsEaten = null,Object? mealsSkipped = null,}) {
  return _then(_DayNutritionEntry(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,totals: null == totals ? _self.totals : totals // ignore: cast_nullable_to_non_nullable
as NutritionSummary,targets: freezed == targets ? _self.targets : targets // ignore: cast_nullable_to_non_nullable
as NutritionSummary?,percentageOfTarget: null == percentageOfTarget ? _self._percentageOfTarget : percentageOfTarget // ignore: cast_nullable_to_non_nullable
as Map<String, double>,mealsEaten: null == mealsEaten ? _self.mealsEaten : mealsEaten // ignore: cast_nullable_to_non_nullable
as int,mealsSkipped: null == mealsSkipped ? _self.mealsSkipped : mealsSkipped // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of DayNutritionEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutritionSummaryCopyWith<$Res> get totals {
  
  return $NutritionSummaryCopyWith<$Res>(_self.totals, (value) {
    return _then(_self.copyWith(totals: value));
  });
}/// Create a copy of DayNutritionEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutritionSummaryCopyWith<$Res>? get targets {
    if (_self.targets == null) {
    return null;
  }

  return $NutritionSummaryCopyWith<$Res>(_self.targets!, (value) {
    return _then(_self.copyWith(targets: value));
  });
}
}

/// @nodoc
mixin _$WeeklyNutrition {

 List<DayNutritionEntry> get days; NutritionSummary? get averages;
/// Create a copy of WeeklyNutrition
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeeklyNutritionCopyWith<WeeklyNutrition> get copyWith => _$WeeklyNutritionCopyWithImpl<WeeklyNutrition>(this as WeeklyNutrition, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeeklyNutrition&&const DeepCollectionEquality().equals(other.days, days)&&(identical(other.averages, averages) || other.averages == averages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(days),averages);

@override
String toString() {
  return 'WeeklyNutrition(days: $days, averages: $averages)';
}


}

/// @nodoc
abstract mixin class $WeeklyNutritionCopyWith<$Res>  {
  factory $WeeklyNutritionCopyWith(WeeklyNutrition value, $Res Function(WeeklyNutrition) _then) = _$WeeklyNutritionCopyWithImpl;
@useResult
$Res call({
 List<DayNutritionEntry> days, NutritionSummary? averages
});


$NutritionSummaryCopyWith<$Res>? get averages;

}
/// @nodoc
class _$WeeklyNutritionCopyWithImpl<$Res>
    implements $WeeklyNutritionCopyWith<$Res> {
  _$WeeklyNutritionCopyWithImpl(this._self, this._then);

  final WeeklyNutrition _self;
  final $Res Function(WeeklyNutrition) _then;

/// Create a copy of WeeklyNutrition
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? days = null,Object? averages = freezed,}) {
  return _then(_self.copyWith(
days: null == days ? _self.days : days // ignore: cast_nullable_to_non_nullable
as List<DayNutritionEntry>,averages: freezed == averages ? _self.averages : averages // ignore: cast_nullable_to_non_nullable
as NutritionSummary?,
  ));
}
/// Create a copy of WeeklyNutrition
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutritionSummaryCopyWith<$Res>? get averages {
    if (_self.averages == null) {
    return null;
  }

  return $NutritionSummaryCopyWith<$Res>(_self.averages!, (value) {
    return _then(_self.copyWith(averages: value));
  });
}
}


/// Adds pattern-matching-related methods to [WeeklyNutrition].
extension WeeklyNutritionPatterns on WeeklyNutrition {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeeklyNutrition value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeeklyNutrition() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeeklyNutrition value)  $default,){
final _that = this;
switch (_that) {
case _WeeklyNutrition():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeeklyNutrition value)?  $default,){
final _that = this;
switch (_that) {
case _WeeklyNutrition() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<DayNutritionEntry> days,  NutritionSummary? averages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeeklyNutrition() when $default != null:
return $default(_that.days,_that.averages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<DayNutritionEntry> days,  NutritionSummary? averages)  $default,) {final _that = this;
switch (_that) {
case _WeeklyNutrition():
return $default(_that.days,_that.averages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<DayNutritionEntry> days,  NutritionSummary? averages)?  $default,) {final _that = this;
switch (_that) {
case _WeeklyNutrition() when $default != null:
return $default(_that.days,_that.averages);case _:
  return null;

}
}

}

/// @nodoc


class _WeeklyNutrition implements WeeklyNutrition {
  const _WeeklyNutrition({required final  List<DayNutritionEntry> days, this.averages}): _days = days;
  

 final  List<DayNutritionEntry> _days;
@override List<DayNutritionEntry> get days {
  if (_days is EqualUnmodifiableListView) return _days;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_days);
}

@override final  NutritionSummary? averages;

/// Create a copy of WeeklyNutrition
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeeklyNutritionCopyWith<_WeeklyNutrition> get copyWith => __$WeeklyNutritionCopyWithImpl<_WeeklyNutrition>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeeklyNutrition&&const DeepCollectionEquality().equals(other._days, _days)&&(identical(other.averages, averages) || other.averages == averages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_days),averages);

@override
String toString() {
  return 'WeeklyNutrition(days: $days, averages: $averages)';
}


}

/// @nodoc
abstract mixin class _$WeeklyNutritionCopyWith<$Res> implements $WeeklyNutritionCopyWith<$Res> {
  factory _$WeeklyNutritionCopyWith(_WeeklyNutrition value, $Res Function(_WeeklyNutrition) _then) = __$WeeklyNutritionCopyWithImpl;
@override @useResult
$Res call({
 List<DayNutritionEntry> days, NutritionSummary? averages
});


@override $NutritionSummaryCopyWith<$Res>? get averages;

}
/// @nodoc
class __$WeeklyNutritionCopyWithImpl<$Res>
    implements _$WeeklyNutritionCopyWith<$Res> {
  __$WeeklyNutritionCopyWithImpl(this._self, this._then);

  final _WeeklyNutrition _self;
  final $Res Function(_WeeklyNutrition) _then;

/// Create a copy of WeeklyNutrition
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? days = null,Object? averages = freezed,}) {
  return _then(_WeeklyNutrition(
days: null == days ? _self._days : days // ignore: cast_nullable_to_non_nullable
as List<DayNutritionEntry>,averages: freezed == averages ? _self.averages : averages // ignore: cast_nullable_to_non_nullable
as NutritionSummary?,
  ));
}

/// Create a copy of WeeklyNutrition
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutritionSummaryCopyWith<$Res>? get averages {
    if (_self.averages == null) {
    return null;
  }

  return $NutritionSummaryCopyWith<$Res>(_self.averages!, (value) {
    return _then(_self.copyWith(averages: value));
  });
}
}

// dart format on
