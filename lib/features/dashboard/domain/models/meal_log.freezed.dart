// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MealLogRecipeRef {

 int get id; String get name; String get slug; int get cachedCaloriesPerServing;
/// Create a copy of MealLogRecipeRef
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MealLogRecipeRefCopyWith<MealLogRecipeRef> get copyWith => _$MealLogRecipeRefCopyWithImpl<MealLogRecipeRef>(this as MealLogRecipeRef, _$identity);

  /// Serializes this MealLogRecipeRef to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MealLogRecipeRef&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.cachedCaloriesPerServing, cachedCaloriesPerServing) || other.cachedCaloriesPerServing == cachedCaloriesPerServing));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,cachedCaloriesPerServing);

@override
String toString() {
  return 'MealLogRecipeRef(id: $id, name: $name, slug: $slug, cachedCaloriesPerServing: $cachedCaloriesPerServing)';
}


}

/// @nodoc
abstract mixin class $MealLogRecipeRefCopyWith<$Res>  {
  factory $MealLogRecipeRefCopyWith(MealLogRecipeRef value, $Res Function(MealLogRecipeRef) _then) = _$MealLogRecipeRefCopyWithImpl;
@useResult
$Res call({
 int id, String name, String slug, int cachedCaloriesPerServing
});




}
/// @nodoc
class _$MealLogRecipeRefCopyWithImpl<$Res>
    implements $MealLogRecipeRefCopyWith<$Res> {
  _$MealLogRecipeRefCopyWithImpl(this._self, this._then);

  final MealLogRecipeRef _self;
  final $Res Function(MealLogRecipeRef) _then;

/// Create a copy of MealLogRecipeRef
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? cachedCaloriesPerServing = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,cachedCaloriesPerServing: null == cachedCaloriesPerServing ? _self.cachedCaloriesPerServing : cachedCaloriesPerServing // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MealLogRecipeRef].
extension MealLogRecipeRefPatterns on MealLogRecipeRef {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MealLogRecipeRef value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MealLogRecipeRef() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MealLogRecipeRef value)  $default,){
final _that = this;
switch (_that) {
case _MealLogRecipeRef():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MealLogRecipeRef value)?  $default,){
final _that = this;
switch (_that) {
case _MealLogRecipeRef() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String slug,  int cachedCaloriesPerServing)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MealLogRecipeRef() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.cachedCaloriesPerServing);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String slug,  int cachedCaloriesPerServing)  $default,) {final _that = this;
switch (_that) {
case _MealLogRecipeRef():
return $default(_that.id,_that.name,_that.slug,_that.cachedCaloriesPerServing);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String slug,  int cachedCaloriesPerServing)?  $default,) {final _that = this;
switch (_that) {
case _MealLogRecipeRef() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.cachedCaloriesPerServing);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _MealLogRecipeRef implements MealLogRecipeRef {
  const _MealLogRecipeRef({required this.id, required this.name, required this.slug, required this.cachedCaloriesPerServing});
  factory _MealLogRecipeRef.fromJson(Map<String, dynamic> json) => _$MealLogRecipeRefFromJson(json);

@override final  int id;
@override final  String name;
@override final  String slug;
@override final  int cachedCaloriesPerServing;

/// Create a copy of MealLogRecipeRef
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MealLogRecipeRefCopyWith<_MealLogRecipeRef> get copyWith => __$MealLogRecipeRefCopyWithImpl<_MealLogRecipeRef>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MealLogRecipeRefToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MealLogRecipeRef&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.cachedCaloriesPerServing, cachedCaloriesPerServing) || other.cachedCaloriesPerServing == cachedCaloriesPerServing));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,cachedCaloriesPerServing);

@override
String toString() {
  return 'MealLogRecipeRef(id: $id, name: $name, slug: $slug, cachedCaloriesPerServing: $cachedCaloriesPerServing)';
}


}

/// @nodoc
abstract mixin class _$MealLogRecipeRefCopyWith<$Res> implements $MealLogRecipeRefCopyWith<$Res> {
  factory _$MealLogRecipeRefCopyWith(_MealLogRecipeRef value, $Res Function(_MealLogRecipeRef) _then) = __$MealLogRecipeRefCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String slug, int cachedCaloriesPerServing
});




}
/// @nodoc
class __$MealLogRecipeRefCopyWithImpl<$Res>
    implements _$MealLogRecipeRefCopyWith<$Res> {
  __$MealLogRecipeRefCopyWithImpl(this._self, this._then);

  final _MealLogRecipeRef _self;
  final $Res Function(_MealLogRecipeRef) _then;

/// Create a copy of MealLogRecipeRef
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? cachedCaloriesPerServing = null,}) {
  return _then(_MealLogRecipeRef(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,cachedCaloriesPerServing: null == cachedCaloriesPerServing ? _self.cachedCaloriesPerServing : cachedCaloriesPerServing // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$MealLog {

 int get id; String get logDate; String get slot; MealLogStatus get status;// ignore: invalid_annotation_target — @JsonKey on factory param, freezed limitation
@JsonKey(fromJson: _doubleFromString) double? get servingsEaten; String? get customDescription; int? get customCalories;// ignore: invalid_annotation_target — @JsonKey on factory param, freezed limitation
@JsonKey(fromJson: _doubleFromString) double? get customProteinG;// ignore: invalid_annotation_target — @JsonKey on factory param, freezed limitation
@JsonKey(fromJson: _doubleFromString) double? get customCarbsG;// ignore: invalid_annotation_target — @JsonKey on factory param, freezed limitation
@JsonKey(fromJson: _doubleFromString) double? get customFatG; String? get notes; MealLogRecipeRef? get plannedRecipe; MealLogRecipeRef? get actualRecipe;
/// Create a copy of MealLog
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MealLogCopyWith<MealLog> get copyWith => _$MealLogCopyWithImpl<MealLog>(this as MealLog, _$identity);

  /// Serializes this MealLog to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MealLog&&(identical(other.id, id) || other.id == id)&&(identical(other.logDate, logDate) || other.logDate == logDate)&&(identical(other.slot, slot) || other.slot == slot)&&(identical(other.status, status) || other.status == status)&&(identical(other.servingsEaten, servingsEaten) || other.servingsEaten == servingsEaten)&&(identical(other.customDescription, customDescription) || other.customDescription == customDescription)&&(identical(other.customCalories, customCalories) || other.customCalories == customCalories)&&(identical(other.customProteinG, customProteinG) || other.customProteinG == customProteinG)&&(identical(other.customCarbsG, customCarbsG) || other.customCarbsG == customCarbsG)&&(identical(other.customFatG, customFatG) || other.customFatG == customFatG)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.plannedRecipe, plannedRecipe) || other.plannedRecipe == plannedRecipe)&&(identical(other.actualRecipe, actualRecipe) || other.actualRecipe == actualRecipe));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,logDate,slot,status,servingsEaten,customDescription,customCalories,customProteinG,customCarbsG,customFatG,notes,plannedRecipe,actualRecipe);

@override
String toString() {
  return 'MealLog(id: $id, logDate: $logDate, slot: $slot, status: $status, servingsEaten: $servingsEaten, customDescription: $customDescription, customCalories: $customCalories, customProteinG: $customProteinG, customCarbsG: $customCarbsG, customFatG: $customFatG, notes: $notes, plannedRecipe: $plannedRecipe, actualRecipe: $actualRecipe)';
}


}

/// @nodoc
abstract mixin class $MealLogCopyWith<$Res>  {
  factory $MealLogCopyWith(MealLog value, $Res Function(MealLog) _then) = _$MealLogCopyWithImpl;
@useResult
$Res call({
 int id, String logDate, String slot, MealLogStatus status,@JsonKey(fromJson: _doubleFromString) double? servingsEaten, String? customDescription, int? customCalories,@JsonKey(fromJson: _doubleFromString) double? customProteinG,@JsonKey(fromJson: _doubleFromString) double? customCarbsG,@JsonKey(fromJson: _doubleFromString) double? customFatG, String? notes, MealLogRecipeRef? plannedRecipe, MealLogRecipeRef? actualRecipe
});


$MealLogRecipeRefCopyWith<$Res>? get plannedRecipe;$MealLogRecipeRefCopyWith<$Res>? get actualRecipe;

}
/// @nodoc
class _$MealLogCopyWithImpl<$Res>
    implements $MealLogCopyWith<$Res> {
  _$MealLogCopyWithImpl(this._self, this._then);

  final MealLog _self;
  final $Res Function(MealLog) _then;

/// Create a copy of MealLog
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? logDate = null,Object? slot = null,Object? status = null,Object? servingsEaten = freezed,Object? customDescription = freezed,Object? customCalories = freezed,Object? customProteinG = freezed,Object? customCarbsG = freezed,Object? customFatG = freezed,Object? notes = freezed,Object? plannedRecipe = freezed,Object? actualRecipe = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,logDate: null == logDate ? _self.logDate : logDate // ignore: cast_nullable_to_non_nullable
as String,slot: null == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MealLogStatus,servingsEaten: freezed == servingsEaten ? _self.servingsEaten : servingsEaten // ignore: cast_nullable_to_non_nullable
as double?,customDescription: freezed == customDescription ? _self.customDescription : customDescription // ignore: cast_nullable_to_non_nullable
as String?,customCalories: freezed == customCalories ? _self.customCalories : customCalories // ignore: cast_nullable_to_non_nullable
as int?,customProteinG: freezed == customProteinG ? _self.customProteinG : customProteinG // ignore: cast_nullable_to_non_nullable
as double?,customCarbsG: freezed == customCarbsG ? _self.customCarbsG : customCarbsG // ignore: cast_nullable_to_non_nullable
as double?,customFatG: freezed == customFatG ? _self.customFatG : customFatG // ignore: cast_nullable_to_non_nullable
as double?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,plannedRecipe: freezed == plannedRecipe ? _self.plannedRecipe : plannedRecipe // ignore: cast_nullable_to_non_nullable
as MealLogRecipeRef?,actualRecipe: freezed == actualRecipe ? _self.actualRecipe : actualRecipe // ignore: cast_nullable_to_non_nullable
as MealLogRecipeRef?,
  ));
}
/// Create a copy of MealLog
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MealLogRecipeRefCopyWith<$Res>? get plannedRecipe {
    if (_self.plannedRecipe == null) {
    return null;
  }

  return $MealLogRecipeRefCopyWith<$Res>(_self.plannedRecipe!, (value) {
    return _then(_self.copyWith(plannedRecipe: value));
  });
}/// Create a copy of MealLog
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MealLogRecipeRefCopyWith<$Res>? get actualRecipe {
    if (_self.actualRecipe == null) {
    return null;
  }

  return $MealLogRecipeRefCopyWith<$Res>(_self.actualRecipe!, (value) {
    return _then(_self.copyWith(actualRecipe: value));
  });
}
}


/// Adds pattern-matching-related methods to [MealLog].
extension MealLogPatterns on MealLog {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MealLog value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MealLog() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MealLog value)  $default,){
final _that = this;
switch (_that) {
case _MealLog():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MealLog value)?  $default,){
final _that = this;
switch (_that) {
case _MealLog() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String logDate,  String slot,  MealLogStatus status, @JsonKey(fromJson: _doubleFromString)  double? servingsEaten,  String? customDescription,  int? customCalories, @JsonKey(fromJson: _doubleFromString)  double? customProteinG, @JsonKey(fromJson: _doubleFromString)  double? customCarbsG, @JsonKey(fromJson: _doubleFromString)  double? customFatG,  String? notes,  MealLogRecipeRef? plannedRecipe,  MealLogRecipeRef? actualRecipe)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MealLog() when $default != null:
return $default(_that.id,_that.logDate,_that.slot,_that.status,_that.servingsEaten,_that.customDescription,_that.customCalories,_that.customProteinG,_that.customCarbsG,_that.customFatG,_that.notes,_that.plannedRecipe,_that.actualRecipe);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String logDate,  String slot,  MealLogStatus status, @JsonKey(fromJson: _doubleFromString)  double? servingsEaten,  String? customDescription,  int? customCalories, @JsonKey(fromJson: _doubleFromString)  double? customProteinG, @JsonKey(fromJson: _doubleFromString)  double? customCarbsG, @JsonKey(fromJson: _doubleFromString)  double? customFatG,  String? notes,  MealLogRecipeRef? plannedRecipe,  MealLogRecipeRef? actualRecipe)  $default,) {final _that = this;
switch (_that) {
case _MealLog():
return $default(_that.id,_that.logDate,_that.slot,_that.status,_that.servingsEaten,_that.customDescription,_that.customCalories,_that.customProteinG,_that.customCarbsG,_that.customFatG,_that.notes,_that.plannedRecipe,_that.actualRecipe);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String logDate,  String slot,  MealLogStatus status, @JsonKey(fromJson: _doubleFromString)  double? servingsEaten,  String? customDescription,  int? customCalories, @JsonKey(fromJson: _doubleFromString)  double? customProteinG, @JsonKey(fromJson: _doubleFromString)  double? customCarbsG, @JsonKey(fromJson: _doubleFromString)  double? customFatG,  String? notes,  MealLogRecipeRef? plannedRecipe,  MealLogRecipeRef? actualRecipe)?  $default,) {final _that = this;
switch (_that) {
case _MealLog() when $default != null:
return $default(_that.id,_that.logDate,_that.slot,_that.status,_that.servingsEaten,_that.customDescription,_that.customCalories,_that.customProteinG,_that.customCarbsG,_that.customFatG,_that.notes,_that.plannedRecipe,_that.actualRecipe);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _MealLog implements MealLog {
  const _MealLog({required this.id, required this.logDate, required this.slot, required this.status, @JsonKey(fromJson: _doubleFromString) this.servingsEaten, this.customDescription, this.customCalories, @JsonKey(fromJson: _doubleFromString) this.customProteinG, @JsonKey(fromJson: _doubleFromString) this.customCarbsG, @JsonKey(fromJson: _doubleFromString) this.customFatG, this.notes, this.plannedRecipe, this.actualRecipe});
  factory _MealLog.fromJson(Map<String, dynamic> json) => _$MealLogFromJson(json);

@override final  int id;
@override final  String logDate;
@override final  String slot;
@override final  MealLogStatus status;
// ignore: invalid_annotation_target — @JsonKey on factory param, freezed limitation
@override@JsonKey(fromJson: _doubleFromString) final  double? servingsEaten;
@override final  String? customDescription;
@override final  int? customCalories;
// ignore: invalid_annotation_target — @JsonKey on factory param, freezed limitation
@override@JsonKey(fromJson: _doubleFromString) final  double? customProteinG;
// ignore: invalid_annotation_target — @JsonKey on factory param, freezed limitation
@override@JsonKey(fromJson: _doubleFromString) final  double? customCarbsG;
// ignore: invalid_annotation_target — @JsonKey on factory param, freezed limitation
@override@JsonKey(fromJson: _doubleFromString) final  double? customFatG;
@override final  String? notes;
@override final  MealLogRecipeRef? plannedRecipe;
@override final  MealLogRecipeRef? actualRecipe;

/// Create a copy of MealLog
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MealLogCopyWith<_MealLog> get copyWith => __$MealLogCopyWithImpl<_MealLog>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MealLogToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MealLog&&(identical(other.id, id) || other.id == id)&&(identical(other.logDate, logDate) || other.logDate == logDate)&&(identical(other.slot, slot) || other.slot == slot)&&(identical(other.status, status) || other.status == status)&&(identical(other.servingsEaten, servingsEaten) || other.servingsEaten == servingsEaten)&&(identical(other.customDescription, customDescription) || other.customDescription == customDescription)&&(identical(other.customCalories, customCalories) || other.customCalories == customCalories)&&(identical(other.customProteinG, customProteinG) || other.customProteinG == customProteinG)&&(identical(other.customCarbsG, customCarbsG) || other.customCarbsG == customCarbsG)&&(identical(other.customFatG, customFatG) || other.customFatG == customFatG)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.plannedRecipe, plannedRecipe) || other.plannedRecipe == plannedRecipe)&&(identical(other.actualRecipe, actualRecipe) || other.actualRecipe == actualRecipe));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,logDate,slot,status,servingsEaten,customDescription,customCalories,customProteinG,customCarbsG,customFatG,notes,plannedRecipe,actualRecipe);

@override
String toString() {
  return 'MealLog(id: $id, logDate: $logDate, slot: $slot, status: $status, servingsEaten: $servingsEaten, customDescription: $customDescription, customCalories: $customCalories, customProteinG: $customProteinG, customCarbsG: $customCarbsG, customFatG: $customFatG, notes: $notes, plannedRecipe: $plannedRecipe, actualRecipe: $actualRecipe)';
}


}

/// @nodoc
abstract mixin class _$MealLogCopyWith<$Res> implements $MealLogCopyWith<$Res> {
  factory _$MealLogCopyWith(_MealLog value, $Res Function(_MealLog) _then) = __$MealLogCopyWithImpl;
@override @useResult
$Res call({
 int id, String logDate, String slot, MealLogStatus status,@JsonKey(fromJson: _doubleFromString) double? servingsEaten, String? customDescription, int? customCalories,@JsonKey(fromJson: _doubleFromString) double? customProteinG,@JsonKey(fromJson: _doubleFromString) double? customCarbsG,@JsonKey(fromJson: _doubleFromString) double? customFatG, String? notes, MealLogRecipeRef? plannedRecipe, MealLogRecipeRef? actualRecipe
});


@override $MealLogRecipeRefCopyWith<$Res>? get plannedRecipe;@override $MealLogRecipeRefCopyWith<$Res>? get actualRecipe;

}
/// @nodoc
class __$MealLogCopyWithImpl<$Res>
    implements _$MealLogCopyWith<$Res> {
  __$MealLogCopyWithImpl(this._self, this._then);

  final _MealLog _self;
  final $Res Function(_MealLog) _then;

/// Create a copy of MealLog
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? logDate = null,Object? slot = null,Object? status = null,Object? servingsEaten = freezed,Object? customDescription = freezed,Object? customCalories = freezed,Object? customProteinG = freezed,Object? customCarbsG = freezed,Object? customFatG = freezed,Object? notes = freezed,Object? plannedRecipe = freezed,Object? actualRecipe = freezed,}) {
  return _then(_MealLog(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,logDate: null == logDate ? _self.logDate : logDate // ignore: cast_nullable_to_non_nullable
as String,slot: null == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MealLogStatus,servingsEaten: freezed == servingsEaten ? _self.servingsEaten : servingsEaten // ignore: cast_nullable_to_non_nullable
as double?,customDescription: freezed == customDescription ? _self.customDescription : customDescription // ignore: cast_nullable_to_non_nullable
as String?,customCalories: freezed == customCalories ? _self.customCalories : customCalories // ignore: cast_nullable_to_non_nullable
as int?,customProteinG: freezed == customProteinG ? _self.customProteinG : customProteinG // ignore: cast_nullable_to_non_nullable
as double?,customCarbsG: freezed == customCarbsG ? _self.customCarbsG : customCarbsG // ignore: cast_nullable_to_non_nullable
as double?,customFatG: freezed == customFatG ? _self.customFatG : customFatG // ignore: cast_nullable_to_non_nullable
as double?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,plannedRecipe: freezed == plannedRecipe ? _self.plannedRecipe : plannedRecipe // ignore: cast_nullable_to_non_nullable
as MealLogRecipeRef?,actualRecipe: freezed == actualRecipe ? _self.actualRecipe : actualRecipe // ignore: cast_nullable_to_non_nullable
as MealLogRecipeRef?,
  ));
}

/// Create a copy of MealLog
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MealLogRecipeRefCopyWith<$Res>? get plannedRecipe {
    if (_self.plannedRecipe == null) {
    return null;
  }

  return $MealLogRecipeRefCopyWith<$Res>(_self.plannedRecipe!, (value) {
    return _then(_self.copyWith(plannedRecipe: value));
  });
}/// Create a copy of MealLog
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MealLogRecipeRefCopyWith<$Res>? get actualRecipe {
    if (_self.actualRecipe == null) {
    return null;
  }

  return $MealLogRecipeRefCopyWith<$Res>(_self.actualRecipe!, (value) {
    return _then(_self.copyWith(actualRecipe: value));
  });
}
}

// dart format on
