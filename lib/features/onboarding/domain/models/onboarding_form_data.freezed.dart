// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_form_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OnboardingFormData {

// Step 1 — Basic Information
 int? get dobDay; int? get dobMonth; int? get dobYear; Sex? get sex; int get heightCm; double get weightKg;// Step 2 — Activity & Goal
 ActivityLevel? get activityLevel; Goal? get goal;// Step 3 — Cuisine & Region
 CuisineRegion? get primaryCuisineRegion; List<String> get secondaryCuisinePreferences; SpiceTolerance? get spiceTolerance;// Step 4 — Dietary Pattern
 DietPattern? get dietPattern; bool get noOnionGarlic; List<String> get allergies; List<String> get dislikes;// Step 5 — Budget & Household
 double? get dailyFoodBudgetInr; double? get weeklyFoodBudgetInr; int get householdSize; CookingFrequency? get cookingFrequency;// Step 6 — Cooking Constraints
 int get maxPrepTimeMin; SkillLevel? get skillLevel; bool get disclaimerAcknowledged;
/// Create a copy of OnboardingFormData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingFormDataCopyWith<OnboardingFormData> get copyWith => _$OnboardingFormDataCopyWithImpl<OnboardingFormData>(this as OnboardingFormData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingFormData&&(identical(other.dobDay, dobDay) || other.dobDay == dobDay)&&(identical(other.dobMonth, dobMonth) || other.dobMonth == dobMonth)&&(identical(other.dobYear, dobYear) || other.dobYear == dobYear)&&(identical(other.sex, sex) || other.sex == sex)&&(identical(other.heightCm, heightCm) || other.heightCm == heightCm)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.activityLevel, activityLevel) || other.activityLevel == activityLevel)&&(identical(other.goal, goal) || other.goal == goal)&&(identical(other.primaryCuisineRegion, primaryCuisineRegion) || other.primaryCuisineRegion == primaryCuisineRegion)&&const DeepCollectionEquality().equals(other.secondaryCuisinePreferences, secondaryCuisinePreferences)&&(identical(other.spiceTolerance, spiceTolerance) || other.spiceTolerance == spiceTolerance)&&(identical(other.dietPattern, dietPattern) || other.dietPattern == dietPattern)&&(identical(other.noOnionGarlic, noOnionGarlic) || other.noOnionGarlic == noOnionGarlic)&&const DeepCollectionEquality().equals(other.allergies, allergies)&&const DeepCollectionEquality().equals(other.dislikes, dislikes)&&(identical(other.dailyFoodBudgetInr, dailyFoodBudgetInr) || other.dailyFoodBudgetInr == dailyFoodBudgetInr)&&(identical(other.weeklyFoodBudgetInr, weeklyFoodBudgetInr) || other.weeklyFoodBudgetInr == weeklyFoodBudgetInr)&&(identical(other.householdSize, householdSize) || other.householdSize == householdSize)&&(identical(other.cookingFrequency, cookingFrequency) || other.cookingFrequency == cookingFrequency)&&(identical(other.maxPrepTimeMin, maxPrepTimeMin) || other.maxPrepTimeMin == maxPrepTimeMin)&&(identical(other.skillLevel, skillLevel) || other.skillLevel == skillLevel)&&(identical(other.disclaimerAcknowledged, disclaimerAcknowledged) || other.disclaimerAcknowledged == disclaimerAcknowledged));
}


@override
int get hashCode => Object.hashAll([runtimeType,dobDay,dobMonth,dobYear,sex,heightCm,weightKg,activityLevel,goal,primaryCuisineRegion,const DeepCollectionEquality().hash(secondaryCuisinePreferences),spiceTolerance,dietPattern,noOnionGarlic,const DeepCollectionEquality().hash(allergies),const DeepCollectionEquality().hash(dislikes),dailyFoodBudgetInr,weeklyFoodBudgetInr,householdSize,cookingFrequency,maxPrepTimeMin,skillLevel,disclaimerAcknowledged]);

@override
String toString() {
  return 'OnboardingFormData(dobDay: $dobDay, dobMonth: $dobMonth, dobYear: $dobYear, sex: $sex, heightCm: $heightCm, weightKg: $weightKg, activityLevel: $activityLevel, goal: $goal, primaryCuisineRegion: $primaryCuisineRegion, secondaryCuisinePreferences: $secondaryCuisinePreferences, spiceTolerance: $spiceTolerance, dietPattern: $dietPattern, noOnionGarlic: $noOnionGarlic, allergies: $allergies, dislikes: $dislikes, dailyFoodBudgetInr: $dailyFoodBudgetInr, weeklyFoodBudgetInr: $weeklyFoodBudgetInr, householdSize: $householdSize, cookingFrequency: $cookingFrequency, maxPrepTimeMin: $maxPrepTimeMin, skillLevel: $skillLevel, disclaimerAcknowledged: $disclaimerAcknowledged)';
}


}

/// @nodoc
abstract mixin class $OnboardingFormDataCopyWith<$Res>  {
  factory $OnboardingFormDataCopyWith(OnboardingFormData value, $Res Function(OnboardingFormData) _then) = _$OnboardingFormDataCopyWithImpl;
@useResult
$Res call({
 int? dobDay, int? dobMonth, int? dobYear, Sex? sex, int heightCm, double weightKg, ActivityLevel? activityLevel, Goal? goal, CuisineRegion? primaryCuisineRegion, List<String> secondaryCuisinePreferences, SpiceTolerance? spiceTolerance, DietPattern? dietPattern, bool noOnionGarlic, List<String> allergies, List<String> dislikes, double? dailyFoodBudgetInr, double? weeklyFoodBudgetInr, int householdSize, CookingFrequency? cookingFrequency, int maxPrepTimeMin, SkillLevel? skillLevel, bool disclaimerAcknowledged
});




}
/// @nodoc
class _$OnboardingFormDataCopyWithImpl<$Res>
    implements $OnboardingFormDataCopyWith<$Res> {
  _$OnboardingFormDataCopyWithImpl(this._self, this._then);

  final OnboardingFormData _self;
  final $Res Function(OnboardingFormData) _then;

/// Create a copy of OnboardingFormData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dobDay = freezed,Object? dobMonth = freezed,Object? dobYear = freezed,Object? sex = freezed,Object? heightCm = null,Object? weightKg = null,Object? activityLevel = freezed,Object? goal = freezed,Object? primaryCuisineRegion = freezed,Object? secondaryCuisinePreferences = null,Object? spiceTolerance = freezed,Object? dietPattern = freezed,Object? noOnionGarlic = null,Object? allergies = null,Object? dislikes = null,Object? dailyFoodBudgetInr = freezed,Object? weeklyFoodBudgetInr = freezed,Object? householdSize = null,Object? cookingFrequency = freezed,Object? maxPrepTimeMin = null,Object? skillLevel = freezed,Object? disclaimerAcknowledged = null,}) {
  return _then(_self.copyWith(
dobDay: freezed == dobDay ? _self.dobDay : dobDay // ignore: cast_nullable_to_non_nullable
as int?,dobMonth: freezed == dobMonth ? _self.dobMonth : dobMonth // ignore: cast_nullable_to_non_nullable
as int?,dobYear: freezed == dobYear ? _self.dobYear : dobYear // ignore: cast_nullable_to_non_nullable
as int?,sex: freezed == sex ? _self.sex : sex // ignore: cast_nullable_to_non_nullable
as Sex?,heightCm: null == heightCm ? _self.heightCm : heightCm // ignore: cast_nullable_to_non_nullable
as int,weightKg: null == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double,activityLevel: freezed == activityLevel ? _self.activityLevel : activityLevel // ignore: cast_nullable_to_non_nullable
as ActivityLevel?,goal: freezed == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as Goal?,primaryCuisineRegion: freezed == primaryCuisineRegion ? _self.primaryCuisineRegion : primaryCuisineRegion // ignore: cast_nullable_to_non_nullable
as CuisineRegion?,secondaryCuisinePreferences: null == secondaryCuisinePreferences ? _self.secondaryCuisinePreferences : secondaryCuisinePreferences // ignore: cast_nullable_to_non_nullable
as List<String>,spiceTolerance: freezed == spiceTolerance ? _self.spiceTolerance : spiceTolerance // ignore: cast_nullable_to_non_nullable
as SpiceTolerance?,dietPattern: freezed == dietPattern ? _self.dietPattern : dietPattern // ignore: cast_nullable_to_non_nullable
as DietPattern?,noOnionGarlic: null == noOnionGarlic ? _self.noOnionGarlic : noOnionGarlic // ignore: cast_nullable_to_non_nullable
as bool,allergies: null == allergies ? _self.allergies : allergies // ignore: cast_nullable_to_non_nullable
as List<String>,dislikes: null == dislikes ? _self.dislikes : dislikes // ignore: cast_nullable_to_non_nullable
as List<String>,dailyFoodBudgetInr: freezed == dailyFoodBudgetInr ? _self.dailyFoodBudgetInr : dailyFoodBudgetInr // ignore: cast_nullable_to_non_nullable
as double?,weeklyFoodBudgetInr: freezed == weeklyFoodBudgetInr ? _self.weeklyFoodBudgetInr : weeklyFoodBudgetInr // ignore: cast_nullable_to_non_nullable
as double?,householdSize: null == householdSize ? _self.householdSize : householdSize // ignore: cast_nullable_to_non_nullable
as int,cookingFrequency: freezed == cookingFrequency ? _self.cookingFrequency : cookingFrequency // ignore: cast_nullable_to_non_nullable
as CookingFrequency?,maxPrepTimeMin: null == maxPrepTimeMin ? _self.maxPrepTimeMin : maxPrepTimeMin // ignore: cast_nullable_to_non_nullable
as int,skillLevel: freezed == skillLevel ? _self.skillLevel : skillLevel // ignore: cast_nullable_to_non_nullable
as SkillLevel?,disclaimerAcknowledged: null == disclaimerAcknowledged ? _self.disclaimerAcknowledged : disclaimerAcknowledged // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [OnboardingFormData].
extension OnboardingFormDataPatterns on OnboardingFormData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OnboardingFormData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OnboardingFormData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OnboardingFormData value)  $default,){
final _that = this;
switch (_that) {
case _OnboardingFormData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OnboardingFormData value)?  $default,){
final _that = this;
switch (_that) {
case _OnboardingFormData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? dobDay,  int? dobMonth,  int? dobYear,  Sex? sex,  int heightCm,  double weightKg,  ActivityLevel? activityLevel,  Goal? goal,  CuisineRegion? primaryCuisineRegion,  List<String> secondaryCuisinePreferences,  SpiceTolerance? spiceTolerance,  DietPattern? dietPattern,  bool noOnionGarlic,  List<String> allergies,  List<String> dislikes,  double? dailyFoodBudgetInr,  double? weeklyFoodBudgetInr,  int householdSize,  CookingFrequency? cookingFrequency,  int maxPrepTimeMin,  SkillLevel? skillLevel,  bool disclaimerAcknowledged)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OnboardingFormData() when $default != null:
return $default(_that.dobDay,_that.dobMonth,_that.dobYear,_that.sex,_that.heightCm,_that.weightKg,_that.activityLevel,_that.goal,_that.primaryCuisineRegion,_that.secondaryCuisinePreferences,_that.spiceTolerance,_that.dietPattern,_that.noOnionGarlic,_that.allergies,_that.dislikes,_that.dailyFoodBudgetInr,_that.weeklyFoodBudgetInr,_that.householdSize,_that.cookingFrequency,_that.maxPrepTimeMin,_that.skillLevel,_that.disclaimerAcknowledged);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? dobDay,  int? dobMonth,  int? dobYear,  Sex? sex,  int heightCm,  double weightKg,  ActivityLevel? activityLevel,  Goal? goal,  CuisineRegion? primaryCuisineRegion,  List<String> secondaryCuisinePreferences,  SpiceTolerance? spiceTolerance,  DietPattern? dietPattern,  bool noOnionGarlic,  List<String> allergies,  List<String> dislikes,  double? dailyFoodBudgetInr,  double? weeklyFoodBudgetInr,  int householdSize,  CookingFrequency? cookingFrequency,  int maxPrepTimeMin,  SkillLevel? skillLevel,  bool disclaimerAcknowledged)  $default,) {final _that = this;
switch (_that) {
case _OnboardingFormData():
return $default(_that.dobDay,_that.dobMonth,_that.dobYear,_that.sex,_that.heightCm,_that.weightKg,_that.activityLevel,_that.goal,_that.primaryCuisineRegion,_that.secondaryCuisinePreferences,_that.spiceTolerance,_that.dietPattern,_that.noOnionGarlic,_that.allergies,_that.dislikes,_that.dailyFoodBudgetInr,_that.weeklyFoodBudgetInr,_that.householdSize,_that.cookingFrequency,_that.maxPrepTimeMin,_that.skillLevel,_that.disclaimerAcknowledged);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? dobDay,  int? dobMonth,  int? dobYear,  Sex? sex,  int heightCm,  double weightKg,  ActivityLevel? activityLevel,  Goal? goal,  CuisineRegion? primaryCuisineRegion,  List<String> secondaryCuisinePreferences,  SpiceTolerance? spiceTolerance,  DietPattern? dietPattern,  bool noOnionGarlic,  List<String> allergies,  List<String> dislikes,  double? dailyFoodBudgetInr,  double? weeklyFoodBudgetInr,  int householdSize,  CookingFrequency? cookingFrequency,  int maxPrepTimeMin,  SkillLevel? skillLevel,  bool disclaimerAcknowledged)?  $default,) {final _that = this;
switch (_that) {
case _OnboardingFormData() when $default != null:
return $default(_that.dobDay,_that.dobMonth,_that.dobYear,_that.sex,_that.heightCm,_that.weightKg,_that.activityLevel,_that.goal,_that.primaryCuisineRegion,_that.secondaryCuisinePreferences,_that.spiceTolerance,_that.dietPattern,_that.noOnionGarlic,_that.allergies,_that.dislikes,_that.dailyFoodBudgetInr,_that.weeklyFoodBudgetInr,_that.householdSize,_that.cookingFrequency,_that.maxPrepTimeMin,_that.skillLevel,_that.disclaimerAcknowledged);case _:
  return null;

}
}

}

/// @nodoc


class _OnboardingFormData implements OnboardingFormData {
  const _OnboardingFormData({this.dobDay, this.dobMonth, this.dobYear, this.sex, this.heightCm = 165, this.weightKg = 68.0, this.activityLevel, this.goal, this.primaryCuisineRegion, final  List<String> secondaryCuisinePreferences = const [], this.spiceTolerance, this.dietPattern, this.noOnionGarlic = false, final  List<String> allergies = const [], final  List<String> dislikes = const [], this.dailyFoodBudgetInr, this.weeklyFoodBudgetInr, this.householdSize = 1, this.cookingFrequency, this.maxPrepTimeMin = 30, this.skillLevel, this.disclaimerAcknowledged = false}): _secondaryCuisinePreferences = secondaryCuisinePreferences,_allergies = allergies,_dislikes = dislikes;
  

// Step 1 — Basic Information
@override final  int? dobDay;
@override final  int? dobMonth;
@override final  int? dobYear;
@override final  Sex? sex;
@override@JsonKey() final  int heightCm;
@override@JsonKey() final  double weightKg;
// Step 2 — Activity & Goal
@override final  ActivityLevel? activityLevel;
@override final  Goal? goal;
// Step 3 — Cuisine & Region
@override final  CuisineRegion? primaryCuisineRegion;
 final  List<String> _secondaryCuisinePreferences;
@override@JsonKey() List<String> get secondaryCuisinePreferences {
  if (_secondaryCuisinePreferences is EqualUnmodifiableListView) return _secondaryCuisinePreferences;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_secondaryCuisinePreferences);
}

@override final  SpiceTolerance? spiceTolerance;
// Step 4 — Dietary Pattern
@override final  DietPattern? dietPattern;
@override@JsonKey() final  bool noOnionGarlic;
 final  List<String> _allergies;
@override@JsonKey() List<String> get allergies {
  if (_allergies is EqualUnmodifiableListView) return _allergies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allergies);
}

 final  List<String> _dislikes;
@override@JsonKey() List<String> get dislikes {
  if (_dislikes is EqualUnmodifiableListView) return _dislikes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dislikes);
}

// Step 5 — Budget & Household
@override final  double? dailyFoodBudgetInr;
@override final  double? weeklyFoodBudgetInr;
@override@JsonKey() final  int householdSize;
@override final  CookingFrequency? cookingFrequency;
// Step 6 — Cooking Constraints
@override@JsonKey() final  int maxPrepTimeMin;
@override final  SkillLevel? skillLevel;
@override@JsonKey() final  bool disclaimerAcknowledged;

/// Create a copy of OnboardingFormData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnboardingFormDataCopyWith<_OnboardingFormData> get copyWith => __$OnboardingFormDataCopyWithImpl<_OnboardingFormData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnboardingFormData&&(identical(other.dobDay, dobDay) || other.dobDay == dobDay)&&(identical(other.dobMonth, dobMonth) || other.dobMonth == dobMonth)&&(identical(other.dobYear, dobYear) || other.dobYear == dobYear)&&(identical(other.sex, sex) || other.sex == sex)&&(identical(other.heightCm, heightCm) || other.heightCm == heightCm)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.activityLevel, activityLevel) || other.activityLevel == activityLevel)&&(identical(other.goal, goal) || other.goal == goal)&&(identical(other.primaryCuisineRegion, primaryCuisineRegion) || other.primaryCuisineRegion == primaryCuisineRegion)&&const DeepCollectionEquality().equals(other._secondaryCuisinePreferences, _secondaryCuisinePreferences)&&(identical(other.spiceTolerance, spiceTolerance) || other.spiceTolerance == spiceTolerance)&&(identical(other.dietPattern, dietPattern) || other.dietPattern == dietPattern)&&(identical(other.noOnionGarlic, noOnionGarlic) || other.noOnionGarlic == noOnionGarlic)&&const DeepCollectionEquality().equals(other._allergies, _allergies)&&const DeepCollectionEquality().equals(other._dislikes, _dislikes)&&(identical(other.dailyFoodBudgetInr, dailyFoodBudgetInr) || other.dailyFoodBudgetInr == dailyFoodBudgetInr)&&(identical(other.weeklyFoodBudgetInr, weeklyFoodBudgetInr) || other.weeklyFoodBudgetInr == weeklyFoodBudgetInr)&&(identical(other.householdSize, householdSize) || other.householdSize == householdSize)&&(identical(other.cookingFrequency, cookingFrequency) || other.cookingFrequency == cookingFrequency)&&(identical(other.maxPrepTimeMin, maxPrepTimeMin) || other.maxPrepTimeMin == maxPrepTimeMin)&&(identical(other.skillLevel, skillLevel) || other.skillLevel == skillLevel)&&(identical(other.disclaimerAcknowledged, disclaimerAcknowledged) || other.disclaimerAcknowledged == disclaimerAcknowledged));
}


@override
int get hashCode => Object.hashAll([runtimeType,dobDay,dobMonth,dobYear,sex,heightCm,weightKg,activityLevel,goal,primaryCuisineRegion,const DeepCollectionEquality().hash(_secondaryCuisinePreferences),spiceTolerance,dietPattern,noOnionGarlic,const DeepCollectionEquality().hash(_allergies),const DeepCollectionEquality().hash(_dislikes),dailyFoodBudgetInr,weeklyFoodBudgetInr,householdSize,cookingFrequency,maxPrepTimeMin,skillLevel,disclaimerAcknowledged]);

@override
String toString() {
  return 'OnboardingFormData(dobDay: $dobDay, dobMonth: $dobMonth, dobYear: $dobYear, sex: $sex, heightCm: $heightCm, weightKg: $weightKg, activityLevel: $activityLevel, goal: $goal, primaryCuisineRegion: $primaryCuisineRegion, secondaryCuisinePreferences: $secondaryCuisinePreferences, spiceTolerance: $spiceTolerance, dietPattern: $dietPattern, noOnionGarlic: $noOnionGarlic, allergies: $allergies, dislikes: $dislikes, dailyFoodBudgetInr: $dailyFoodBudgetInr, weeklyFoodBudgetInr: $weeklyFoodBudgetInr, householdSize: $householdSize, cookingFrequency: $cookingFrequency, maxPrepTimeMin: $maxPrepTimeMin, skillLevel: $skillLevel, disclaimerAcknowledged: $disclaimerAcknowledged)';
}


}

/// @nodoc
abstract mixin class _$OnboardingFormDataCopyWith<$Res> implements $OnboardingFormDataCopyWith<$Res> {
  factory _$OnboardingFormDataCopyWith(_OnboardingFormData value, $Res Function(_OnboardingFormData) _then) = __$OnboardingFormDataCopyWithImpl;
@override @useResult
$Res call({
 int? dobDay, int? dobMonth, int? dobYear, Sex? sex, int heightCm, double weightKg, ActivityLevel? activityLevel, Goal? goal, CuisineRegion? primaryCuisineRegion, List<String> secondaryCuisinePreferences, SpiceTolerance? spiceTolerance, DietPattern? dietPattern, bool noOnionGarlic, List<String> allergies, List<String> dislikes, double? dailyFoodBudgetInr, double? weeklyFoodBudgetInr, int householdSize, CookingFrequency? cookingFrequency, int maxPrepTimeMin, SkillLevel? skillLevel, bool disclaimerAcknowledged
});




}
/// @nodoc
class __$OnboardingFormDataCopyWithImpl<$Res>
    implements _$OnboardingFormDataCopyWith<$Res> {
  __$OnboardingFormDataCopyWithImpl(this._self, this._then);

  final _OnboardingFormData _self;
  final $Res Function(_OnboardingFormData) _then;

/// Create a copy of OnboardingFormData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dobDay = freezed,Object? dobMonth = freezed,Object? dobYear = freezed,Object? sex = freezed,Object? heightCm = null,Object? weightKg = null,Object? activityLevel = freezed,Object? goal = freezed,Object? primaryCuisineRegion = freezed,Object? secondaryCuisinePreferences = null,Object? spiceTolerance = freezed,Object? dietPattern = freezed,Object? noOnionGarlic = null,Object? allergies = null,Object? dislikes = null,Object? dailyFoodBudgetInr = freezed,Object? weeklyFoodBudgetInr = freezed,Object? householdSize = null,Object? cookingFrequency = freezed,Object? maxPrepTimeMin = null,Object? skillLevel = freezed,Object? disclaimerAcknowledged = null,}) {
  return _then(_OnboardingFormData(
dobDay: freezed == dobDay ? _self.dobDay : dobDay // ignore: cast_nullable_to_non_nullable
as int?,dobMonth: freezed == dobMonth ? _self.dobMonth : dobMonth // ignore: cast_nullable_to_non_nullable
as int?,dobYear: freezed == dobYear ? _self.dobYear : dobYear // ignore: cast_nullable_to_non_nullable
as int?,sex: freezed == sex ? _self.sex : sex // ignore: cast_nullable_to_non_nullable
as Sex?,heightCm: null == heightCm ? _self.heightCm : heightCm // ignore: cast_nullable_to_non_nullable
as int,weightKg: null == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double,activityLevel: freezed == activityLevel ? _self.activityLevel : activityLevel // ignore: cast_nullable_to_non_nullable
as ActivityLevel?,goal: freezed == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as Goal?,primaryCuisineRegion: freezed == primaryCuisineRegion ? _self.primaryCuisineRegion : primaryCuisineRegion // ignore: cast_nullable_to_non_nullable
as CuisineRegion?,secondaryCuisinePreferences: null == secondaryCuisinePreferences ? _self._secondaryCuisinePreferences : secondaryCuisinePreferences // ignore: cast_nullable_to_non_nullable
as List<String>,spiceTolerance: freezed == spiceTolerance ? _self.spiceTolerance : spiceTolerance // ignore: cast_nullable_to_non_nullable
as SpiceTolerance?,dietPattern: freezed == dietPattern ? _self.dietPattern : dietPattern // ignore: cast_nullable_to_non_nullable
as DietPattern?,noOnionGarlic: null == noOnionGarlic ? _self.noOnionGarlic : noOnionGarlic // ignore: cast_nullable_to_non_nullable
as bool,allergies: null == allergies ? _self._allergies : allergies // ignore: cast_nullable_to_non_nullable
as List<String>,dislikes: null == dislikes ? _self._dislikes : dislikes // ignore: cast_nullable_to_non_nullable
as List<String>,dailyFoodBudgetInr: freezed == dailyFoodBudgetInr ? _self.dailyFoodBudgetInr : dailyFoodBudgetInr // ignore: cast_nullable_to_non_nullable
as double?,weeklyFoodBudgetInr: freezed == weeklyFoodBudgetInr ? _self.weeklyFoodBudgetInr : weeklyFoodBudgetInr // ignore: cast_nullable_to_non_nullable
as double?,householdSize: null == householdSize ? _self.householdSize : householdSize // ignore: cast_nullable_to_non_nullable
as int,cookingFrequency: freezed == cookingFrequency ? _self.cookingFrequency : cookingFrequency // ignore: cast_nullable_to_non_nullable
as CookingFrequency?,maxPrepTimeMin: null == maxPrepTimeMin ? _self.maxPrepTimeMin : maxPrepTimeMin // ignore: cast_nullable_to_non_nullable
as int,skillLevel: freezed == skillLevel ? _self.skillLevel : skillLevel // ignore: cast_nullable_to_non_nullable
as SkillLevel?,disclaimerAcknowledged: null == disclaimerAcknowledged ? _self.disclaimerAcknowledged : disclaimerAcknowledged // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
