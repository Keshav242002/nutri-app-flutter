// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OnboardingState {

/// Zero-based PageView index (0–5).
 int get currentStep;/// Accumulated form answers across all steps.
 OnboardingFormData get formData;/// Questionnaire metadata loaded from the API.
 Questionnaire? get questionnaire;/// Whether a submission is in-flight.
 bool get isSubmitting;/// Non-null when the last submit attempt failed.
 String? get submitError;/// Populated after a successful submit.
 DietaryProfile? get result;
/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingStateCopyWith<OnboardingState> get copyWith => _$OnboardingStateCopyWithImpl<OnboardingState>(this as OnboardingState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingState&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.formData, formData) || other.formData == formData)&&(identical(other.questionnaire, questionnaire) || other.questionnaire == questionnaire)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.submitError, submitError) || other.submitError == submitError)&&(identical(other.result, result) || other.result == result));
}


@override
int get hashCode => Object.hash(runtimeType,currentStep,formData,questionnaire,isSubmitting,submitError,result);

@override
String toString() {
  return 'OnboardingState(currentStep: $currentStep, formData: $formData, questionnaire: $questionnaire, isSubmitting: $isSubmitting, submitError: $submitError, result: $result)';
}


}

/// @nodoc
abstract mixin class $OnboardingStateCopyWith<$Res>  {
  factory $OnboardingStateCopyWith(OnboardingState value, $Res Function(OnboardingState) _then) = _$OnboardingStateCopyWithImpl;
@useResult
$Res call({
 int currentStep, OnboardingFormData formData, Questionnaire? questionnaire, bool isSubmitting, String? submitError, DietaryProfile? result
});


$OnboardingFormDataCopyWith<$Res> get formData;$QuestionnaireCopyWith<$Res>? get questionnaire;$DietaryProfileCopyWith<$Res>? get result;

}
/// @nodoc
class _$OnboardingStateCopyWithImpl<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  _$OnboardingStateCopyWithImpl(this._self, this._then);

  final OnboardingState _self;
  final $Res Function(OnboardingState) _then;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentStep = null,Object? formData = null,Object? questionnaire = freezed,Object? isSubmitting = null,Object? submitError = freezed,Object? result = freezed,}) {
  return _then(_self.copyWith(
currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as int,formData: null == formData ? _self.formData : formData // ignore: cast_nullable_to_non_nullable
as OnboardingFormData,questionnaire: freezed == questionnaire ? _self.questionnaire : questionnaire // ignore: cast_nullable_to_non_nullable
as Questionnaire?,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,submitError: freezed == submitError ? _self.submitError : submitError // ignore: cast_nullable_to_non_nullable
as String?,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as DietaryProfile?,
  ));
}
/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OnboardingFormDataCopyWith<$Res> get formData {
  
  return $OnboardingFormDataCopyWith<$Res>(_self.formData, (value) {
    return _then(_self.copyWith(formData: value));
  });
}/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuestionnaireCopyWith<$Res>? get questionnaire {
    if (_self.questionnaire == null) {
    return null;
  }

  return $QuestionnaireCopyWith<$Res>(_self.questionnaire!, (value) {
    return _then(_self.copyWith(questionnaire: value));
  });
}/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DietaryProfileCopyWith<$Res>? get result {
    if (_self.result == null) {
    return null;
  }

  return $DietaryProfileCopyWith<$Res>(_self.result!, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}


/// Adds pattern-matching-related methods to [OnboardingState].
extension OnboardingStatePatterns on OnboardingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OnboardingState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OnboardingState value)  $default,){
final _that = this;
switch (_that) {
case _OnboardingState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OnboardingState value)?  $default,){
final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int currentStep,  OnboardingFormData formData,  Questionnaire? questionnaire,  bool isSubmitting,  String? submitError,  DietaryProfile? result)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
return $default(_that.currentStep,_that.formData,_that.questionnaire,_that.isSubmitting,_that.submitError,_that.result);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int currentStep,  OnboardingFormData formData,  Questionnaire? questionnaire,  bool isSubmitting,  String? submitError,  DietaryProfile? result)  $default,) {final _that = this;
switch (_that) {
case _OnboardingState():
return $default(_that.currentStep,_that.formData,_that.questionnaire,_that.isSubmitting,_that.submitError,_that.result);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int currentStep,  OnboardingFormData formData,  Questionnaire? questionnaire,  bool isSubmitting,  String? submitError,  DietaryProfile? result)?  $default,) {final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
return $default(_that.currentStep,_that.formData,_that.questionnaire,_that.isSubmitting,_that.submitError,_that.result);case _:
  return null;

}
}

}

/// @nodoc


class _OnboardingState implements OnboardingState {
  const _OnboardingState({this.currentStep = 0, this.formData = const OnboardingFormData(), this.questionnaire, this.isSubmitting = false, this.submitError, this.result});
  

/// Zero-based PageView index (0–5).
@override@JsonKey() final  int currentStep;
/// Accumulated form answers across all steps.
@override@JsonKey() final  OnboardingFormData formData;
/// Questionnaire metadata loaded from the API.
@override final  Questionnaire? questionnaire;
/// Whether a submission is in-flight.
@override@JsonKey() final  bool isSubmitting;
/// Non-null when the last submit attempt failed.
@override final  String? submitError;
/// Populated after a successful submit.
@override final  DietaryProfile? result;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnboardingStateCopyWith<_OnboardingState> get copyWith => __$OnboardingStateCopyWithImpl<_OnboardingState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnboardingState&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.formData, formData) || other.formData == formData)&&(identical(other.questionnaire, questionnaire) || other.questionnaire == questionnaire)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.submitError, submitError) || other.submitError == submitError)&&(identical(other.result, result) || other.result == result));
}


@override
int get hashCode => Object.hash(runtimeType,currentStep,formData,questionnaire,isSubmitting,submitError,result);

@override
String toString() {
  return 'OnboardingState(currentStep: $currentStep, formData: $formData, questionnaire: $questionnaire, isSubmitting: $isSubmitting, submitError: $submitError, result: $result)';
}


}

/// @nodoc
abstract mixin class _$OnboardingStateCopyWith<$Res> implements $OnboardingStateCopyWith<$Res> {
  factory _$OnboardingStateCopyWith(_OnboardingState value, $Res Function(_OnboardingState) _then) = __$OnboardingStateCopyWithImpl;
@override @useResult
$Res call({
 int currentStep, OnboardingFormData formData, Questionnaire? questionnaire, bool isSubmitting, String? submitError, DietaryProfile? result
});


@override $OnboardingFormDataCopyWith<$Res> get formData;@override $QuestionnaireCopyWith<$Res>? get questionnaire;@override $DietaryProfileCopyWith<$Res>? get result;

}
/// @nodoc
class __$OnboardingStateCopyWithImpl<$Res>
    implements _$OnboardingStateCopyWith<$Res> {
  __$OnboardingStateCopyWithImpl(this._self, this._then);

  final _OnboardingState _self;
  final $Res Function(_OnboardingState) _then;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentStep = null,Object? formData = null,Object? questionnaire = freezed,Object? isSubmitting = null,Object? submitError = freezed,Object? result = freezed,}) {
  return _then(_OnboardingState(
currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as int,formData: null == formData ? _self.formData : formData // ignore: cast_nullable_to_non_nullable
as OnboardingFormData,questionnaire: freezed == questionnaire ? _self.questionnaire : questionnaire // ignore: cast_nullable_to_non_nullable
as Questionnaire?,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,submitError: freezed == submitError ? _self.submitError : submitError // ignore: cast_nullable_to_non_nullable
as String?,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as DietaryProfile?,
  ));
}

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OnboardingFormDataCopyWith<$Res> get formData {
  
  return $OnboardingFormDataCopyWith<$Res>(_self.formData, (value) {
    return _then(_self.copyWith(formData: value));
  });
}/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuestionnaireCopyWith<$Res>? get questionnaire {
    if (_self.questionnaire == null) {
    return null;
  }

  return $QuestionnaireCopyWith<$Res>(_self.questionnaire!, (value) {
    return _then(_self.copyWith(questionnaire: value));
  });
}/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DietaryProfileCopyWith<$Res>? get result {
    if (_self.result == null) {
    return null;
  }

  return $DietaryProfileCopyWith<$Res>(_self.result!, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}

// dart format on
