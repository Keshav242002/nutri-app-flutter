// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'week_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WeekState {

 DateTime get weekStart; DateTime get selectedDay; List<WeekMealDay> get weekPlans; WeeklyNutrition? get weeklyNutrition; List<MealLog> get selectedDayLogs; bool get isLoadingSelectedDayLogs; GroceryList? get groceryList; bool get isGroceryLoading; AppException? get groceryError; Map<String, bool> get checkedItems;
/// Create a copy of WeekState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeekStateCopyWith<WeekState> get copyWith => _$WeekStateCopyWithImpl<WeekState>(this as WeekState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeekState&&(identical(other.weekStart, weekStart) || other.weekStart == weekStart)&&(identical(other.selectedDay, selectedDay) || other.selectedDay == selectedDay)&&const DeepCollectionEquality().equals(other.weekPlans, weekPlans)&&(identical(other.weeklyNutrition, weeklyNutrition) || other.weeklyNutrition == weeklyNutrition)&&const DeepCollectionEquality().equals(other.selectedDayLogs, selectedDayLogs)&&(identical(other.isLoadingSelectedDayLogs, isLoadingSelectedDayLogs) || other.isLoadingSelectedDayLogs == isLoadingSelectedDayLogs)&&(identical(other.groceryList, groceryList) || other.groceryList == groceryList)&&(identical(other.isGroceryLoading, isGroceryLoading) || other.isGroceryLoading == isGroceryLoading)&&(identical(other.groceryError, groceryError) || other.groceryError == groceryError)&&const DeepCollectionEquality().equals(other.checkedItems, checkedItems));
}


@override
int get hashCode => Object.hash(runtimeType,weekStart,selectedDay,const DeepCollectionEquality().hash(weekPlans),weeklyNutrition,const DeepCollectionEquality().hash(selectedDayLogs),isLoadingSelectedDayLogs,groceryList,isGroceryLoading,groceryError,const DeepCollectionEquality().hash(checkedItems));

@override
String toString() {
  return 'WeekState(weekStart: $weekStart, selectedDay: $selectedDay, weekPlans: $weekPlans, weeklyNutrition: $weeklyNutrition, selectedDayLogs: $selectedDayLogs, isLoadingSelectedDayLogs: $isLoadingSelectedDayLogs, groceryList: $groceryList, isGroceryLoading: $isGroceryLoading, groceryError: $groceryError, checkedItems: $checkedItems)';
}


}

/// @nodoc
abstract mixin class $WeekStateCopyWith<$Res>  {
  factory $WeekStateCopyWith(WeekState value, $Res Function(WeekState) _then) = _$WeekStateCopyWithImpl;
@useResult
$Res call({
 DateTime weekStart, DateTime selectedDay, List<WeekMealDay> weekPlans, WeeklyNutrition? weeklyNutrition, List<MealLog> selectedDayLogs, bool isLoadingSelectedDayLogs, GroceryList? groceryList, bool isGroceryLoading, AppException? groceryError, Map<String, bool> checkedItems
});


$WeeklyNutritionCopyWith<$Res>? get weeklyNutrition;$GroceryListCopyWith<$Res>? get groceryList;

}
/// @nodoc
class _$WeekStateCopyWithImpl<$Res>
    implements $WeekStateCopyWith<$Res> {
  _$WeekStateCopyWithImpl(this._self, this._then);

  final WeekState _self;
  final $Res Function(WeekState) _then;

/// Create a copy of WeekState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? weekStart = null,Object? selectedDay = null,Object? weekPlans = null,Object? weeklyNutrition = freezed,Object? selectedDayLogs = null,Object? isLoadingSelectedDayLogs = null,Object? groceryList = freezed,Object? isGroceryLoading = null,Object? groceryError = freezed,Object? checkedItems = null,}) {
  return _then(_self.copyWith(
weekStart: null == weekStart ? _self.weekStart : weekStart // ignore: cast_nullable_to_non_nullable
as DateTime,selectedDay: null == selectedDay ? _self.selectedDay : selectedDay // ignore: cast_nullable_to_non_nullable
as DateTime,weekPlans: null == weekPlans ? _self.weekPlans : weekPlans // ignore: cast_nullable_to_non_nullable
as List<WeekMealDay>,weeklyNutrition: freezed == weeklyNutrition ? _self.weeklyNutrition : weeklyNutrition // ignore: cast_nullable_to_non_nullable
as WeeklyNutrition?,selectedDayLogs: null == selectedDayLogs ? _self.selectedDayLogs : selectedDayLogs // ignore: cast_nullable_to_non_nullable
as List<MealLog>,isLoadingSelectedDayLogs: null == isLoadingSelectedDayLogs ? _self.isLoadingSelectedDayLogs : isLoadingSelectedDayLogs // ignore: cast_nullable_to_non_nullable
as bool,groceryList: freezed == groceryList ? _self.groceryList : groceryList // ignore: cast_nullable_to_non_nullable
as GroceryList?,isGroceryLoading: null == isGroceryLoading ? _self.isGroceryLoading : isGroceryLoading // ignore: cast_nullable_to_non_nullable
as bool,groceryError: freezed == groceryError ? _self.groceryError : groceryError // ignore: cast_nullable_to_non_nullable
as AppException?,checkedItems: null == checkedItems ? _self.checkedItems : checkedItems // ignore: cast_nullable_to_non_nullable
as Map<String, bool>,
  ));
}
/// Create a copy of WeekState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeeklyNutritionCopyWith<$Res>? get weeklyNutrition {
    if (_self.weeklyNutrition == null) {
    return null;
  }

  return $WeeklyNutritionCopyWith<$Res>(_self.weeklyNutrition!, (value) {
    return _then(_self.copyWith(weeklyNutrition: value));
  });
}/// Create a copy of WeekState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GroceryListCopyWith<$Res>? get groceryList {
    if (_self.groceryList == null) {
    return null;
  }

  return $GroceryListCopyWith<$Res>(_self.groceryList!, (value) {
    return _then(_self.copyWith(groceryList: value));
  });
}
}


/// Adds pattern-matching-related methods to [WeekState].
extension WeekStatePatterns on WeekState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeekState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeekState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeekState value)  $default,){
final _that = this;
switch (_that) {
case _WeekState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeekState value)?  $default,){
final _that = this;
switch (_that) {
case _WeekState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime weekStart,  DateTime selectedDay,  List<WeekMealDay> weekPlans,  WeeklyNutrition? weeklyNutrition,  List<MealLog> selectedDayLogs,  bool isLoadingSelectedDayLogs,  GroceryList? groceryList,  bool isGroceryLoading,  AppException? groceryError,  Map<String, bool> checkedItems)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeekState() when $default != null:
return $default(_that.weekStart,_that.selectedDay,_that.weekPlans,_that.weeklyNutrition,_that.selectedDayLogs,_that.isLoadingSelectedDayLogs,_that.groceryList,_that.isGroceryLoading,_that.groceryError,_that.checkedItems);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime weekStart,  DateTime selectedDay,  List<WeekMealDay> weekPlans,  WeeklyNutrition? weeklyNutrition,  List<MealLog> selectedDayLogs,  bool isLoadingSelectedDayLogs,  GroceryList? groceryList,  bool isGroceryLoading,  AppException? groceryError,  Map<String, bool> checkedItems)  $default,) {final _that = this;
switch (_that) {
case _WeekState():
return $default(_that.weekStart,_that.selectedDay,_that.weekPlans,_that.weeklyNutrition,_that.selectedDayLogs,_that.isLoadingSelectedDayLogs,_that.groceryList,_that.isGroceryLoading,_that.groceryError,_that.checkedItems);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime weekStart,  DateTime selectedDay,  List<WeekMealDay> weekPlans,  WeeklyNutrition? weeklyNutrition,  List<MealLog> selectedDayLogs,  bool isLoadingSelectedDayLogs,  GroceryList? groceryList,  bool isGroceryLoading,  AppException? groceryError,  Map<String, bool> checkedItems)?  $default,) {final _that = this;
switch (_that) {
case _WeekState() when $default != null:
return $default(_that.weekStart,_that.selectedDay,_that.weekPlans,_that.weeklyNutrition,_that.selectedDayLogs,_that.isLoadingSelectedDayLogs,_that.groceryList,_that.isGroceryLoading,_that.groceryError,_that.checkedItems);case _:
  return null;

}
}

}

/// @nodoc


class _WeekState implements WeekState {
  const _WeekState({required this.weekStart, required this.selectedDay, final  List<WeekMealDay> weekPlans = const [], this.weeklyNutrition, final  List<MealLog> selectedDayLogs = const [], this.isLoadingSelectedDayLogs = false, this.groceryList, this.isGroceryLoading = false, this.groceryError = null, final  Map<String, bool> checkedItems = const {}}): _weekPlans = weekPlans,_selectedDayLogs = selectedDayLogs,_checkedItems = checkedItems;
  

@override final  DateTime weekStart;
@override final  DateTime selectedDay;
 final  List<WeekMealDay> _weekPlans;
@override@JsonKey() List<WeekMealDay> get weekPlans {
  if (_weekPlans is EqualUnmodifiableListView) return _weekPlans;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_weekPlans);
}

@override final  WeeklyNutrition? weeklyNutrition;
 final  List<MealLog> _selectedDayLogs;
@override@JsonKey() List<MealLog> get selectedDayLogs {
  if (_selectedDayLogs is EqualUnmodifiableListView) return _selectedDayLogs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedDayLogs);
}

@override@JsonKey() final  bool isLoadingSelectedDayLogs;
@override final  GroceryList? groceryList;
@override@JsonKey() final  bool isGroceryLoading;
@override@JsonKey() final  AppException? groceryError;
 final  Map<String, bool> _checkedItems;
@override@JsonKey() Map<String, bool> get checkedItems {
  if (_checkedItems is EqualUnmodifiableMapView) return _checkedItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_checkedItems);
}


/// Create a copy of WeekState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeekStateCopyWith<_WeekState> get copyWith => __$WeekStateCopyWithImpl<_WeekState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeekState&&(identical(other.weekStart, weekStart) || other.weekStart == weekStart)&&(identical(other.selectedDay, selectedDay) || other.selectedDay == selectedDay)&&const DeepCollectionEquality().equals(other._weekPlans, _weekPlans)&&(identical(other.weeklyNutrition, weeklyNutrition) || other.weeklyNutrition == weeklyNutrition)&&const DeepCollectionEquality().equals(other._selectedDayLogs, _selectedDayLogs)&&(identical(other.isLoadingSelectedDayLogs, isLoadingSelectedDayLogs) || other.isLoadingSelectedDayLogs == isLoadingSelectedDayLogs)&&(identical(other.groceryList, groceryList) || other.groceryList == groceryList)&&(identical(other.isGroceryLoading, isGroceryLoading) || other.isGroceryLoading == isGroceryLoading)&&(identical(other.groceryError, groceryError) || other.groceryError == groceryError)&&const DeepCollectionEquality().equals(other._checkedItems, _checkedItems));
}


@override
int get hashCode => Object.hash(runtimeType,weekStart,selectedDay,const DeepCollectionEquality().hash(_weekPlans),weeklyNutrition,const DeepCollectionEquality().hash(_selectedDayLogs),isLoadingSelectedDayLogs,groceryList,isGroceryLoading,groceryError,const DeepCollectionEquality().hash(_checkedItems));

@override
String toString() {
  return 'WeekState(weekStart: $weekStart, selectedDay: $selectedDay, weekPlans: $weekPlans, weeklyNutrition: $weeklyNutrition, selectedDayLogs: $selectedDayLogs, isLoadingSelectedDayLogs: $isLoadingSelectedDayLogs, groceryList: $groceryList, isGroceryLoading: $isGroceryLoading, groceryError: $groceryError, checkedItems: $checkedItems)';
}


}

/// @nodoc
abstract mixin class _$WeekStateCopyWith<$Res> implements $WeekStateCopyWith<$Res> {
  factory _$WeekStateCopyWith(_WeekState value, $Res Function(_WeekState) _then) = __$WeekStateCopyWithImpl;
@override @useResult
$Res call({
 DateTime weekStart, DateTime selectedDay, List<WeekMealDay> weekPlans, WeeklyNutrition? weeklyNutrition, List<MealLog> selectedDayLogs, bool isLoadingSelectedDayLogs, GroceryList? groceryList, bool isGroceryLoading, AppException? groceryError, Map<String, bool> checkedItems
});


@override $WeeklyNutritionCopyWith<$Res>? get weeklyNutrition;@override $GroceryListCopyWith<$Res>? get groceryList;

}
/// @nodoc
class __$WeekStateCopyWithImpl<$Res>
    implements _$WeekStateCopyWith<$Res> {
  __$WeekStateCopyWithImpl(this._self, this._then);

  final _WeekState _self;
  final $Res Function(_WeekState) _then;

/// Create a copy of WeekState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? weekStart = null,Object? selectedDay = null,Object? weekPlans = null,Object? weeklyNutrition = freezed,Object? selectedDayLogs = null,Object? isLoadingSelectedDayLogs = null,Object? groceryList = freezed,Object? isGroceryLoading = null,Object? groceryError = freezed,Object? checkedItems = null,}) {
  return _then(_WeekState(
weekStart: null == weekStart ? _self.weekStart : weekStart // ignore: cast_nullable_to_non_nullable
as DateTime,selectedDay: null == selectedDay ? _self.selectedDay : selectedDay // ignore: cast_nullable_to_non_nullable
as DateTime,weekPlans: null == weekPlans ? _self._weekPlans : weekPlans // ignore: cast_nullable_to_non_nullable
as List<WeekMealDay>,weeklyNutrition: freezed == weeklyNutrition ? _self.weeklyNutrition : weeklyNutrition // ignore: cast_nullable_to_non_nullable
as WeeklyNutrition?,selectedDayLogs: null == selectedDayLogs ? _self._selectedDayLogs : selectedDayLogs // ignore: cast_nullable_to_non_nullable
as List<MealLog>,isLoadingSelectedDayLogs: null == isLoadingSelectedDayLogs ? _self.isLoadingSelectedDayLogs : isLoadingSelectedDayLogs // ignore: cast_nullable_to_non_nullable
as bool,groceryList: freezed == groceryList ? _self.groceryList : groceryList // ignore: cast_nullable_to_non_nullable
as GroceryList?,isGroceryLoading: null == isGroceryLoading ? _self.isGroceryLoading : isGroceryLoading // ignore: cast_nullable_to_non_nullable
as bool,groceryError: freezed == groceryError ? _self.groceryError : groceryError // ignore: cast_nullable_to_non_nullable
as AppException?,checkedItems: null == checkedItems ? _self._checkedItems : checkedItems // ignore: cast_nullable_to_non_nullable
as Map<String, bool>,
  ));
}

/// Create a copy of WeekState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeeklyNutritionCopyWith<$Res>? get weeklyNutrition {
    if (_self.weeklyNutrition == null) {
    return null;
  }

  return $WeeklyNutritionCopyWith<$Res>(_self.weeklyNutrition!, (value) {
    return _then(_self.copyWith(weeklyNutrition: value));
  });
}/// Create a copy of WeekState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GroceryListCopyWith<$Res>? get groceryList {
    if (_self.groceryList == null) {
    return null;
  }

  return $GroceryListCopyWith<$Res>(_self.groceryList!, (value) {
    return _then(_self.copyWith(groceryList: value));
  });
}
}

// dart format on
