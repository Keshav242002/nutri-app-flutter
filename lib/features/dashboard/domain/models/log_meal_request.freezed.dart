// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'log_meal_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LogMealRequest {

 String get logDate; String get slot; String get status; int? get plannedRecipeId; int? get actualRecipeId; String? get servingsEaten; String? get customDescription; int? get customCalories; String? get customProteinG; String? get customCarbsG; String? get customFatG;
/// Create a copy of LogMealRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogMealRequestCopyWith<LogMealRequest> get copyWith => _$LogMealRequestCopyWithImpl<LogMealRequest>(this as LogMealRequest, _$identity);

  /// Serializes this LogMealRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogMealRequest&&(identical(other.logDate, logDate) || other.logDate == logDate)&&(identical(other.slot, slot) || other.slot == slot)&&(identical(other.status, status) || other.status == status)&&(identical(other.plannedRecipeId, plannedRecipeId) || other.plannedRecipeId == plannedRecipeId)&&(identical(other.actualRecipeId, actualRecipeId) || other.actualRecipeId == actualRecipeId)&&(identical(other.servingsEaten, servingsEaten) || other.servingsEaten == servingsEaten)&&(identical(other.customDescription, customDescription) || other.customDescription == customDescription)&&(identical(other.customCalories, customCalories) || other.customCalories == customCalories)&&(identical(other.customProteinG, customProteinG) || other.customProteinG == customProteinG)&&(identical(other.customCarbsG, customCarbsG) || other.customCarbsG == customCarbsG)&&(identical(other.customFatG, customFatG) || other.customFatG == customFatG));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,logDate,slot,status,plannedRecipeId,actualRecipeId,servingsEaten,customDescription,customCalories,customProteinG,customCarbsG,customFatG);

@override
String toString() {
  return 'LogMealRequest(logDate: $logDate, slot: $slot, status: $status, plannedRecipeId: $plannedRecipeId, actualRecipeId: $actualRecipeId, servingsEaten: $servingsEaten, customDescription: $customDescription, customCalories: $customCalories, customProteinG: $customProteinG, customCarbsG: $customCarbsG, customFatG: $customFatG)';
}


}

/// @nodoc
abstract mixin class $LogMealRequestCopyWith<$Res>  {
  factory $LogMealRequestCopyWith(LogMealRequest value, $Res Function(LogMealRequest) _then) = _$LogMealRequestCopyWithImpl;
@useResult
$Res call({
 String logDate, String slot, String status, int? plannedRecipeId, int? actualRecipeId, String? servingsEaten, String? customDescription, int? customCalories, String? customProteinG, String? customCarbsG, String? customFatG
});




}
/// @nodoc
class _$LogMealRequestCopyWithImpl<$Res>
    implements $LogMealRequestCopyWith<$Res> {
  _$LogMealRequestCopyWithImpl(this._self, this._then);

  final LogMealRequest _self;
  final $Res Function(LogMealRequest) _then;

/// Create a copy of LogMealRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? logDate = null,Object? slot = null,Object? status = null,Object? plannedRecipeId = freezed,Object? actualRecipeId = freezed,Object? servingsEaten = freezed,Object? customDescription = freezed,Object? customCalories = freezed,Object? customProteinG = freezed,Object? customCarbsG = freezed,Object? customFatG = freezed,}) {
  return _then(_self.copyWith(
logDate: null == logDate ? _self.logDate : logDate // ignore: cast_nullable_to_non_nullable
as String,slot: null == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,plannedRecipeId: freezed == plannedRecipeId ? _self.plannedRecipeId : plannedRecipeId // ignore: cast_nullable_to_non_nullable
as int?,actualRecipeId: freezed == actualRecipeId ? _self.actualRecipeId : actualRecipeId // ignore: cast_nullable_to_non_nullable
as int?,servingsEaten: freezed == servingsEaten ? _self.servingsEaten : servingsEaten // ignore: cast_nullable_to_non_nullable
as String?,customDescription: freezed == customDescription ? _self.customDescription : customDescription // ignore: cast_nullable_to_non_nullable
as String?,customCalories: freezed == customCalories ? _self.customCalories : customCalories // ignore: cast_nullable_to_non_nullable
as int?,customProteinG: freezed == customProteinG ? _self.customProteinG : customProteinG // ignore: cast_nullable_to_non_nullable
as String?,customCarbsG: freezed == customCarbsG ? _self.customCarbsG : customCarbsG // ignore: cast_nullable_to_non_nullable
as String?,customFatG: freezed == customFatG ? _self.customFatG : customFatG // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LogMealRequest].
extension LogMealRequestPatterns on LogMealRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LogMealRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LogMealRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LogMealRequest value)  $default,){
final _that = this;
switch (_that) {
case _LogMealRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LogMealRequest value)?  $default,){
final _that = this;
switch (_that) {
case _LogMealRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String logDate,  String slot,  String status,  int? plannedRecipeId,  int? actualRecipeId,  String? servingsEaten,  String? customDescription,  int? customCalories,  String? customProteinG,  String? customCarbsG,  String? customFatG)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LogMealRequest() when $default != null:
return $default(_that.logDate,_that.slot,_that.status,_that.plannedRecipeId,_that.actualRecipeId,_that.servingsEaten,_that.customDescription,_that.customCalories,_that.customProteinG,_that.customCarbsG,_that.customFatG);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String logDate,  String slot,  String status,  int? plannedRecipeId,  int? actualRecipeId,  String? servingsEaten,  String? customDescription,  int? customCalories,  String? customProteinG,  String? customCarbsG,  String? customFatG)  $default,) {final _that = this;
switch (_that) {
case _LogMealRequest():
return $default(_that.logDate,_that.slot,_that.status,_that.plannedRecipeId,_that.actualRecipeId,_that.servingsEaten,_that.customDescription,_that.customCalories,_that.customProteinG,_that.customCarbsG,_that.customFatG);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String logDate,  String slot,  String status,  int? plannedRecipeId,  int? actualRecipeId,  String? servingsEaten,  String? customDescription,  int? customCalories,  String? customProteinG,  String? customCarbsG,  String? customFatG)?  $default,) {final _that = this;
switch (_that) {
case _LogMealRequest() when $default != null:
return $default(_that.logDate,_that.slot,_that.status,_that.plannedRecipeId,_that.actualRecipeId,_that.servingsEaten,_that.customDescription,_that.customCalories,_that.customProteinG,_that.customCarbsG,_that.customFatG);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _LogMealRequest implements LogMealRequest {
  const _LogMealRequest({required this.logDate, required this.slot, required this.status, this.plannedRecipeId, this.actualRecipeId, this.servingsEaten, this.customDescription, this.customCalories, this.customProteinG, this.customCarbsG, this.customFatG});
  factory _LogMealRequest.fromJson(Map<String, dynamic> json) => _$LogMealRequestFromJson(json);

@override final  String logDate;
@override final  String slot;
@override final  String status;
@override final  int? plannedRecipeId;
@override final  int? actualRecipeId;
@override final  String? servingsEaten;
@override final  String? customDescription;
@override final  int? customCalories;
@override final  String? customProteinG;
@override final  String? customCarbsG;
@override final  String? customFatG;

/// Create a copy of LogMealRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogMealRequestCopyWith<_LogMealRequest> get copyWith => __$LogMealRequestCopyWithImpl<_LogMealRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LogMealRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogMealRequest&&(identical(other.logDate, logDate) || other.logDate == logDate)&&(identical(other.slot, slot) || other.slot == slot)&&(identical(other.status, status) || other.status == status)&&(identical(other.plannedRecipeId, plannedRecipeId) || other.plannedRecipeId == plannedRecipeId)&&(identical(other.actualRecipeId, actualRecipeId) || other.actualRecipeId == actualRecipeId)&&(identical(other.servingsEaten, servingsEaten) || other.servingsEaten == servingsEaten)&&(identical(other.customDescription, customDescription) || other.customDescription == customDescription)&&(identical(other.customCalories, customCalories) || other.customCalories == customCalories)&&(identical(other.customProteinG, customProteinG) || other.customProteinG == customProteinG)&&(identical(other.customCarbsG, customCarbsG) || other.customCarbsG == customCarbsG)&&(identical(other.customFatG, customFatG) || other.customFatG == customFatG));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,logDate,slot,status,plannedRecipeId,actualRecipeId,servingsEaten,customDescription,customCalories,customProteinG,customCarbsG,customFatG);

@override
String toString() {
  return 'LogMealRequest(logDate: $logDate, slot: $slot, status: $status, plannedRecipeId: $plannedRecipeId, actualRecipeId: $actualRecipeId, servingsEaten: $servingsEaten, customDescription: $customDescription, customCalories: $customCalories, customProteinG: $customProteinG, customCarbsG: $customCarbsG, customFatG: $customFatG)';
}


}

/// @nodoc
abstract mixin class _$LogMealRequestCopyWith<$Res> implements $LogMealRequestCopyWith<$Res> {
  factory _$LogMealRequestCopyWith(_LogMealRequest value, $Res Function(_LogMealRequest) _then) = __$LogMealRequestCopyWithImpl;
@override @useResult
$Res call({
 String logDate, String slot, String status, int? plannedRecipeId, int? actualRecipeId, String? servingsEaten, String? customDescription, int? customCalories, String? customProteinG, String? customCarbsG, String? customFatG
});




}
/// @nodoc
class __$LogMealRequestCopyWithImpl<$Res>
    implements _$LogMealRequestCopyWith<$Res> {
  __$LogMealRequestCopyWithImpl(this._self, this._then);

  final _LogMealRequest _self;
  final $Res Function(_LogMealRequest) _then;

/// Create a copy of LogMealRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? logDate = null,Object? slot = null,Object? status = null,Object? plannedRecipeId = freezed,Object? actualRecipeId = freezed,Object? servingsEaten = freezed,Object? customDescription = freezed,Object? customCalories = freezed,Object? customProteinG = freezed,Object? customCarbsG = freezed,Object? customFatG = freezed,}) {
  return _then(_LogMealRequest(
logDate: null == logDate ? _self.logDate : logDate // ignore: cast_nullable_to_non_nullable
as String,slot: null == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,plannedRecipeId: freezed == plannedRecipeId ? _self.plannedRecipeId : plannedRecipeId // ignore: cast_nullable_to_non_nullable
as int?,actualRecipeId: freezed == actualRecipeId ? _self.actualRecipeId : actualRecipeId // ignore: cast_nullable_to_non_nullable
as int?,servingsEaten: freezed == servingsEaten ? _self.servingsEaten : servingsEaten // ignore: cast_nullable_to_non_nullable
as String?,customDescription: freezed == customDescription ? _self.customDescription : customDescription // ignore: cast_nullable_to_non_nullable
as String?,customCalories: freezed == customCalories ? _self.customCalories : customCalories // ignore: cast_nullable_to_non_nullable
as int?,customProteinG: freezed == customProteinG ? _self.customProteinG : customProteinG // ignore: cast_nullable_to_non_nullable
as String?,customCarbsG: freezed == customCarbsG ? _self.customCarbsG : customCarbsG // ignore: cast_nullable_to_non_nullable
as String?,customFatG: freezed == customFatG ? _self.customFatG : customFatG // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
