// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'questionnaire.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Questionnaire {

 String get version; List<QuestionnaireStep> get steps;
/// Create a copy of Questionnaire
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestionnaireCopyWith<Questionnaire> get copyWith => _$QuestionnaireCopyWithImpl<Questionnaire>(this as Questionnaire, _$identity);

  /// Serializes this Questionnaire to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Questionnaire&&(identical(other.version, version) || other.version == version)&&const DeepCollectionEquality().equals(other.steps, steps));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,version,const DeepCollectionEquality().hash(steps));

@override
String toString() {
  return 'Questionnaire(version: $version, steps: $steps)';
}


}

/// @nodoc
abstract mixin class $QuestionnaireCopyWith<$Res>  {
  factory $QuestionnaireCopyWith(Questionnaire value, $Res Function(Questionnaire) _then) = _$QuestionnaireCopyWithImpl;
@useResult
$Res call({
 String version, List<QuestionnaireStep> steps
});




}
/// @nodoc
class _$QuestionnaireCopyWithImpl<$Res>
    implements $QuestionnaireCopyWith<$Res> {
  _$QuestionnaireCopyWithImpl(this._self, this._then);

  final Questionnaire _self;
  final $Res Function(Questionnaire) _then;

/// Create a copy of Questionnaire
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? version = null,Object? steps = null,}) {
  return _then(_self.copyWith(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as List<QuestionnaireStep>,
  ));
}

}


/// Adds pattern-matching-related methods to [Questionnaire].
extension QuestionnairePatterns on Questionnaire {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Questionnaire value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Questionnaire() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Questionnaire value)  $default,){
final _that = this;
switch (_that) {
case _Questionnaire():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Questionnaire value)?  $default,){
final _that = this;
switch (_that) {
case _Questionnaire() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String version,  List<QuestionnaireStep> steps)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Questionnaire() when $default != null:
return $default(_that.version,_that.steps);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String version,  List<QuestionnaireStep> steps)  $default,) {final _that = this;
switch (_that) {
case _Questionnaire():
return $default(_that.version,_that.steps);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String version,  List<QuestionnaireStep> steps)?  $default,) {final _that = this;
switch (_that) {
case _Questionnaire() when $default != null:
return $default(_that.version,_that.steps);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _Questionnaire implements Questionnaire {
  const _Questionnaire({required this.version, required final  List<QuestionnaireStep> steps}): _steps = steps;
  factory _Questionnaire.fromJson(Map<String, dynamic> json) => _$QuestionnaireFromJson(json);

@override final  String version;
 final  List<QuestionnaireStep> _steps;
@override List<QuestionnaireStep> get steps {
  if (_steps is EqualUnmodifiableListView) return _steps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_steps);
}


/// Create a copy of Questionnaire
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuestionnaireCopyWith<_Questionnaire> get copyWith => __$QuestionnaireCopyWithImpl<_Questionnaire>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuestionnaireToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Questionnaire&&(identical(other.version, version) || other.version == version)&&const DeepCollectionEquality().equals(other._steps, _steps));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,version,const DeepCollectionEquality().hash(_steps));

@override
String toString() {
  return 'Questionnaire(version: $version, steps: $steps)';
}


}

/// @nodoc
abstract mixin class _$QuestionnaireCopyWith<$Res> implements $QuestionnaireCopyWith<$Res> {
  factory _$QuestionnaireCopyWith(_Questionnaire value, $Res Function(_Questionnaire) _then) = __$QuestionnaireCopyWithImpl;
@override @useResult
$Res call({
 String version, List<QuestionnaireStep> steps
});




}
/// @nodoc
class __$QuestionnaireCopyWithImpl<$Res>
    implements _$QuestionnaireCopyWith<$Res> {
  __$QuestionnaireCopyWithImpl(this._self, this._then);

  final _Questionnaire _self;
  final $Res Function(_Questionnaire) _then;

/// Create a copy of Questionnaire
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? version = null,Object? steps = null,}) {
  return _then(_Questionnaire(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,steps: null == steps ? _self._steps : steps // ignore: cast_nullable_to_non_nullable
as List<QuestionnaireStep>,
  ));
}


}


/// @nodoc
mixin _$QuestionnaireStep {

 int get step; String get title; List<QuestionnaireField> get fields;
/// Create a copy of QuestionnaireStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestionnaireStepCopyWith<QuestionnaireStep> get copyWith => _$QuestionnaireStepCopyWithImpl<QuestionnaireStep>(this as QuestionnaireStep, _$identity);

  /// Serializes this QuestionnaireStep to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestionnaireStep&&(identical(other.step, step) || other.step == step)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.fields, fields));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,step,title,const DeepCollectionEquality().hash(fields));

@override
String toString() {
  return 'QuestionnaireStep(step: $step, title: $title, fields: $fields)';
}


}

/// @nodoc
abstract mixin class $QuestionnaireStepCopyWith<$Res>  {
  factory $QuestionnaireStepCopyWith(QuestionnaireStep value, $Res Function(QuestionnaireStep) _then) = _$QuestionnaireStepCopyWithImpl;
@useResult
$Res call({
 int step, String title, List<QuestionnaireField> fields
});




}
/// @nodoc
class _$QuestionnaireStepCopyWithImpl<$Res>
    implements $QuestionnaireStepCopyWith<$Res> {
  _$QuestionnaireStepCopyWithImpl(this._self, this._then);

  final QuestionnaireStep _self;
  final $Res Function(QuestionnaireStep) _then;

/// Create a copy of QuestionnaireStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? step = null,Object? title = null,Object? fields = null,}) {
  return _then(_self.copyWith(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,fields: null == fields ? _self.fields : fields // ignore: cast_nullable_to_non_nullable
as List<QuestionnaireField>,
  ));
}

}


/// Adds pattern-matching-related methods to [QuestionnaireStep].
extension QuestionnaireStepPatterns on QuestionnaireStep {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuestionnaireStep value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuestionnaireStep() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuestionnaireStep value)  $default,){
final _that = this;
switch (_that) {
case _QuestionnaireStep():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuestionnaireStep value)?  $default,){
final _that = this;
switch (_that) {
case _QuestionnaireStep() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int step,  String title,  List<QuestionnaireField> fields)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuestionnaireStep() when $default != null:
return $default(_that.step,_that.title,_that.fields);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int step,  String title,  List<QuestionnaireField> fields)  $default,) {final _that = this;
switch (_that) {
case _QuestionnaireStep():
return $default(_that.step,_that.title,_that.fields);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int step,  String title,  List<QuestionnaireField> fields)?  $default,) {final _that = this;
switch (_that) {
case _QuestionnaireStep() when $default != null:
return $default(_that.step,_that.title,_that.fields);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _QuestionnaireStep implements QuestionnaireStep {
  const _QuestionnaireStep({required this.step, required this.title, required final  List<QuestionnaireField> fields}): _fields = fields;
  factory _QuestionnaireStep.fromJson(Map<String, dynamic> json) => _$QuestionnaireStepFromJson(json);

@override final  int step;
@override final  String title;
 final  List<QuestionnaireField> _fields;
@override List<QuestionnaireField> get fields {
  if (_fields is EqualUnmodifiableListView) return _fields;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fields);
}


/// Create a copy of QuestionnaireStep
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuestionnaireStepCopyWith<_QuestionnaireStep> get copyWith => __$QuestionnaireStepCopyWithImpl<_QuestionnaireStep>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuestionnaireStepToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuestionnaireStep&&(identical(other.step, step) || other.step == step)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._fields, _fields));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,step,title,const DeepCollectionEquality().hash(_fields));

@override
String toString() {
  return 'QuestionnaireStep(step: $step, title: $title, fields: $fields)';
}


}

/// @nodoc
abstract mixin class _$QuestionnaireStepCopyWith<$Res> implements $QuestionnaireStepCopyWith<$Res> {
  factory _$QuestionnaireStepCopyWith(_QuestionnaireStep value, $Res Function(_QuestionnaireStep) _then) = __$QuestionnaireStepCopyWithImpl;
@override @useResult
$Res call({
 int step, String title, List<QuestionnaireField> fields
});




}
/// @nodoc
class __$QuestionnaireStepCopyWithImpl<$Res>
    implements _$QuestionnaireStepCopyWith<$Res> {
  __$QuestionnaireStepCopyWithImpl(this._self, this._then);

  final _QuestionnaireStep _self;
  final $Res Function(_QuestionnaireStep) _then;

/// Create a copy of QuestionnaireStep
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? step = null,Object? title = null,Object? fields = null,}) {
  return _then(_QuestionnaireStep(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,fields: null == fields ? _self._fields : fields // ignore: cast_nullable_to_non_nullable
as List<QuestionnaireField>,
  ));
}


}


/// @nodoc
mixin _$QuestionnaireField {

 String get name; String get label; String get type;// ignore: invalid_annotation_target — freezed requires @JsonKey on factory params
@JsonKey(name: 'required') bool get isRequired; List<FieldOption>? get options; Map<String, dynamic>? get constraints; String? get hint; String? get group;// ignore: invalid_annotation_target — freezed requires @JsonKey on factory params
@JsonKey(name: 'group_constraint') String? get groupConstraint;
/// Create a copy of QuestionnaireField
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestionnaireFieldCopyWith<QuestionnaireField> get copyWith => _$QuestionnaireFieldCopyWithImpl<QuestionnaireField>(this as QuestionnaireField, _$identity);

  /// Serializes this QuestionnaireField to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestionnaireField&&(identical(other.name, name) || other.name == name)&&(identical(other.label, label) || other.label == label)&&(identical(other.type, type) || other.type == type)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&const DeepCollectionEquality().equals(other.options, options)&&const DeepCollectionEquality().equals(other.constraints, constraints)&&(identical(other.hint, hint) || other.hint == hint)&&(identical(other.group, group) || other.group == group)&&(identical(other.groupConstraint, groupConstraint) || other.groupConstraint == groupConstraint));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,label,type,isRequired,const DeepCollectionEquality().hash(options),const DeepCollectionEquality().hash(constraints),hint,group,groupConstraint);

@override
String toString() {
  return 'QuestionnaireField(name: $name, label: $label, type: $type, isRequired: $isRequired, options: $options, constraints: $constraints, hint: $hint, group: $group, groupConstraint: $groupConstraint)';
}


}

/// @nodoc
abstract mixin class $QuestionnaireFieldCopyWith<$Res>  {
  factory $QuestionnaireFieldCopyWith(QuestionnaireField value, $Res Function(QuestionnaireField) _then) = _$QuestionnaireFieldCopyWithImpl;
@useResult
$Res call({
 String name, String label, String type,@JsonKey(name: 'required') bool isRequired, List<FieldOption>? options, Map<String, dynamic>? constraints, String? hint, String? group,@JsonKey(name: 'group_constraint') String? groupConstraint
});




}
/// @nodoc
class _$QuestionnaireFieldCopyWithImpl<$Res>
    implements $QuestionnaireFieldCopyWith<$Res> {
  _$QuestionnaireFieldCopyWithImpl(this._self, this._then);

  final QuestionnaireField _self;
  final $Res Function(QuestionnaireField) _then;

/// Create a copy of QuestionnaireField
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? label = null,Object? type = null,Object? isRequired = null,Object? options = freezed,Object? constraints = freezed,Object? hint = freezed,Object? group = freezed,Object? groupConstraint = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,options: freezed == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<FieldOption>?,constraints: freezed == constraints ? _self.constraints : constraints // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,hint: freezed == hint ? _self.hint : hint // ignore: cast_nullable_to_non_nullable
as String?,group: freezed == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String?,groupConstraint: freezed == groupConstraint ? _self.groupConstraint : groupConstraint // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [QuestionnaireField].
extension QuestionnaireFieldPatterns on QuestionnaireField {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuestionnaireField value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuestionnaireField() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuestionnaireField value)  $default,){
final _that = this;
switch (_that) {
case _QuestionnaireField():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuestionnaireField value)?  $default,){
final _that = this;
switch (_that) {
case _QuestionnaireField() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String label,  String type, @JsonKey(name: 'required')  bool isRequired,  List<FieldOption>? options,  Map<String, dynamic>? constraints,  String? hint,  String? group, @JsonKey(name: 'group_constraint')  String? groupConstraint)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuestionnaireField() when $default != null:
return $default(_that.name,_that.label,_that.type,_that.isRequired,_that.options,_that.constraints,_that.hint,_that.group,_that.groupConstraint);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String label,  String type, @JsonKey(name: 'required')  bool isRequired,  List<FieldOption>? options,  Map<String, dynamic>? constraints,  String? hint,  String? group, @JsonKey(name: 'group_constraint')  String? groupConstraint)  $default,) {final _that = this;
switch (_that) {
case _QuestionnaireField():
return $default(_that.name,_that.label,_that.type,_that.isRequired,_that.options,_that.constraints,_that.hint,_that.group,_that.groupConstraint);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String label,  String type, @JsonKey(name: 'required')  bool isRequired,  List<FieldOption>? options,  Map<String, dynamic>? constraints,  String? hint,  String? group, @JsonKey(name: 'group_constraint')  String? groupConstraint)?  $default,) {final _that = this;
switch (_that) {
case _QuestionnaireField() when $default != null:
return $default(_that.name,_that.label,_that.type,_that.isRequired,_that.options,_that.constraints,_that.hint,_that.group,_that.groupConstraint);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _QuestionnaireField implements QuestionnaireField {
  const _QuestionnaireField({required this.name, required this.label, required this.type, @JsonKey(name: 'required') required this.isRequired, final  List<FieldOption>? options, final  Map<String, dynamic>? constraints, this.hint, this.group, @JsonKey(name: 'group_constraint') this.groupConstraint}): _options = options,_constraints = constraints;
  factory _QuestionnaireField.fromJson(Map<String, dynamic> json) => _$QuestionnaireFieldFromJson(json);

@override final  String name;
@override final  String label;
@override final  String type;
// ignore: invalid_annotation_target — freezed requires @JsonKey on factory params
@override@JsonKey(name: 'required') final  bool isRequired;
 final  List<FieldOption>? _options;
@override List<FieldOption>? get options {
  final value = _options;
  if (value == null) return null;
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  Map<String, dynamic>? _constraints;
@override Map<String, dynamic>? get constraints {
  final value = _constraints;
  if (value == null) return null;
  if (_constraints is EqualUnmodifiableMapView) return _constraints;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  String? hint;
@override final  String? group;
// ignore: invalid_annotation_target — freezed requires @JsonKey on factory params
@override@JsonKey(name: 'group_constraint') final  String? groupConstraint;

/// Create a copy of QuestionnaireField
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuestionnaireFieldCopyWith<_QuestionnaireField> get copyWith => __$QuestionnaireFieldCopyWithImpl<_QuestionnaireField>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuestionnaireFieldToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuestionnaireField&&(identical(other.name, name) || other.name == name)&&(identical(other.label, label) || other.label == label)&&(identical(other.type, type) || other.type == type)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&const DeepCollectionEquality().equals(other._options, _options)&&const DeepCollectionEquality().equals(other._constraints, _constraints)&&(identical(other.hint, hint) || other.hint == hint)&&(identical(other.group, group) || other.group == group)&&(identical(other.groupConstraint, groupConstraint) || other.groupConstraint == groupConstraint));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,label,type,isRequired,const DeepCollectionEquality().hash(_options),const DeepCollectionEquality().hash(_constraints),hint,group,groupConstraint);

@override
String toString() {
  return 'QuestionnaireField(name: $name, label: $label, type: $type, isRequired: $isRequired, options: $options, constraints: $constraints, hint: $hint, group: $group, groupConstraint: $groupConstraint)';
}


}

/// @nodoc
abstract mixin class _$QuestionnaireFieldCopyWith<$Res> implements $QuestionnaireFieldCopyWith<$Res> {
  factory _$QuestionnaireFieldCopyWith(_QuestionnaireField value, $Res Function(_QuestionnaireField) _then) = __$QuestionnaireFieldCopyWithImpl;
@override @useResult
$Res call({
 String name, String label, String type,@JsonKey(name: 'required') bool isRequired, List<FieldOption>? options, Map<String, dynamic>? constraints, String? hint, String? group,@JsonKey(name: 'group_constraint') String? groupConstraint
});




}
/// @nodoc
class __$QuestionnaireFieldCopyWithImpl<$Res>
    implements _$QuestionnaireFieldCopyWith<$Res> {
  __$QuestionnaireFieldCopyWithImpl(this._self, this._then);

  final _QuestionnaireField _self;
  final $Res Function(_QuestionnaireField) _then;

/// Create a copy of QuestionnaireField
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? label = null,Object? type = null,Object? isRequired = null,Object? options = freezed,Object? constraints = freezed,Object? hint = freezed,Object? group = freezed,Object? groupConstraint = freezed,}) {
  return _then(_QuestionnaireField(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,options: freezed == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<FieldOption>?,constraints: freezed == constraints ? _self._constraints : constraints // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,hint: freezed == hint ? _self.hint : hint // ignore: cast_nullable_to_non_nullable
as String?,group: freezed == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String?,groupConstraint: freezed == groupConstraint ? _self.groupConstraint : groupConstraint // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$FieldOption {

 String get value; String get label; String? get description; String? get icon;
/// Create a copy of FieldOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FieldOptionCopyWith<FieldOption> get copyWith => _$FieldOptionCopyWithImpl<FieldOption>(this as FieldOption, _$identity);

  /// Serializes this FieldOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FieldOption&&(identical(other.value, value) || other.value == value)&&(identical(other.label, label) || other.label == label)&&(identical(other.description, description) || other.description == description)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,label,description,icon);

@override
String toString() {
  return 'FieldOption(value: $value, label: $label, description: $description, icon: $icon)';
}


}

/// @nodoc
abstract mixin class $FieldOptionCopyWith<$Res>  {
  factory $FieldOptionCopyWith(FieldOption value, $Res Function(FieldOption) _then) = _$FieldOptionCopyWithImpl;
@useResult
$Res call({
 String value, String label, String? description, String? icon
});




}
/// @nodoc
class _$FieldOptionCopyWithImpl<$Res>
    implements $FieldOptionCopyWith<$Res> {
  _$FieldOptionCopyWithImpl(this._self, this._then);

  final FieldOption _self;
  final $Res Function(FieldOption) _then;

/// Create a copy of FieldOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,Object? label = null,Object? description = freezed,Object? icon = freezed,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FieldOption].
extension FieldOptionPatterns on FieldOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FieldOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FieldOption() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FieldOption value)  $default,){
final _that = this;
switch (_that) {
case _FieldOption():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FieldOption value)?  $default,){
final _that = this;
switch (_that) {
case _FieldOption() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String value,  String label,  String? description,  String? icon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FieldOption() when $default != null:
return $default(_that.value,_that.label,_that.description,_that.icon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String value,  String label,  String? description,  String? icon)  $default,) {final _that = this;
switch (_that) {
case _FieldOption():
return $default(_that.value,_that.label,_that.description,_that.icon);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String value,  String label,  String? description,  String? icon)?  $default,) {final _that = this;
switch (_that) {
case _FieldOption() when $default != null:
return $default(_that.value,_that.label,_that.description,_that.icon);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FieldOption implements FieldOption {
  const _FieldOption({required this.value, required this.label, this.description, this.icon});
  factory _FieldOption.fromJson(Map<String, dynamic> json) => _$FieldOptionFromJson(json);

@override final  String value;
@override final  String label;
@override final  String? description;
@override final  String? icon;

/// Create a copy of FieldOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FieldOptionCopyWith<_FieldOption> get copyWith => __$FieldOptionCopyWithImpl<_FieldOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FieldOptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FieldOption&&(identical(other.value, value) || other.value == value)&&(identical(other.label, label) || other.label == label)&&(identical(other.description, description) || other.description == description)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,label,description,icon);

@override
String toString() {
  return 'FieldOption(value: $value, label: $label, description: $description, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$FieldOptionCopyWith<$Res> implements $FieldOptionCopyWith<$Res> {
  factory _$FieldOptionCopyWith(_FieldOption value, $Res Function(_FieldOption) _then) = __$FieldOptionCopyWithImpl;
@override @useResult
$Res call({
 String value, String label, String? description, String? icon
});




}
/// @nodoc
class __$FieldOptionCopyWithImpl<$Res>
    implements _$FieldOptionCopyWith<$Res> {
  __$FieldOptionCopyWithImpl(this._self, this._then);

  final _FieldOption _self;
  final $Res Function(_FieldOption) _then;

/// Create a copy of FieldOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? label = null,Object? description = freezed,Object? icon = freezed,}) {
  return _then(_FieldOption(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
