// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dietary_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DietaryProfile {

// Required fields (submitted + echoed back)
 String get dateOfBirth; String get sex; int get heightCm; String get activityLevel; String get goal; String get primaryCuisineRegion; String get spiceTolerance; String get dietPattern; String get cookingFrequency; String get skillLevel;// Optional / defaulted submitted fields
 double get weightKg; List<String> get secondaryCuisinePreferences; bool get noOnionGarlic; List<String> get allergies; List<String> get dislikes; double? get dailyFoodBudgetInr; double? get weeklyFoodBudgetInr; int get householdSize; int get maxPrepTimeMin; String? get timezone;// Read-only computed fields
 int? get targetCalories;// ignore: invalid_annotation_target
@JsonKey(fromJson: _doubleFromJson) double? get targetProteinG;// ignore: invalid_annotation_target
@JsonKey(fromJson: _doubleFromJson) double? get targetCarbsG;// ignore: invalid_annotation_target
@JsonKey(fromJson: _doubleFromJson) double? get targetFatG;// ignore: invalid_annotation_target
@JsonKey(fromJson: _doubleFromJson) double? get targetFiberG; int? get age; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of DietaryProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DietaryProfileCopyWith<DietaryProfile> get copyWith => _$DietaryProfileCopyWithImpl<DietaryProfile>(this as DietaryProfile, _$identity);

  /// Serializes this DietaryProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DietaryProfile&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.sex, sex) || other.sex == sex)&&(identical(other.heightCm, heightCm) || other.heightCm == heightCm)&&(identical(other.activityLevel, activityLevel) || other.activityLevel == activityLevel)&&(identical(other.goal, goal) || other.goal == goal)&&(identical(other.primaryCuisineRegion, primaryCuisineRegion) || other.primaryCuisineRegion == primaryCuisineRegion)&&(identical(other.spiceTolerance, spiceTolerance) || other.spiceTolerance == spiceTolerance)&&(identical(other.dietPattern, dietPattern) || other.dietPattern == dietPattern)&&(identical(other.cookingFrequency, cookingFrequency) || other.cookingFrequency == cookingFrequency)&&(identical(other.skillLevel, skillLevel) || other.skillLevel == skillLevel)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&const DeepCollectionEquality().equals(other.secondaryCuisinePreferences, secondaryCuisinePreferences)&&(identical(other.noOnionGarlic, noOnionGarlic) || other.noOnionGarlic == noOnionGarlic)&&const DeepCollectionEquality().equals(other.allergies, allergies)&&const DeepCollectionEquality().equals(other.dislikes, dislikes)&&(identical(other.dailyFoodBudgetInr, dailyFoodBudgetInr) || other.dailyFoodBudgetInr == dailyFoodBudgetInr)&&(identical(other.weeklyFoodBudgetInr, weeklyFoodBudgetInr) || other.weeklyFoodBudgetInr == weeklyFoodBudgetInr)&&(identical(other.householdSize, householdSize) || other.householdSize == householdSize)&&(identical(other.maxPrepTimeMin, maxPrepTimeMin) || other.maxPrepTimeMin == maxPrepTimeMin)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.targetCalories, targetCalories) || other.targetCalories == targetCalories)&&(identical(other.targetProteinG, targetProteinG) || other.targetProteinG == targetProteinG)&&(identical(other.targetCarbsG, targetCarbsG) || other.targetCarbsG == targetCarbsG)&&(identical(other.targetFatG, targetFatG) || other.targetFatG == targetFatG)&&(identical(other.targetFiberG, targetFiberG) || other.targetFiberG == targetFiberG)&&(identical(other.age, age) || other.age == age)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,dateOfBirth,sex,heightCm,activityLevel,goal,primaryCuisineRegion,spiceTolerance,dietPattern,cookingFrequency,skillLevel,weightKg,const DeepCollectionEquality().hash(secondaryCuisinePreferences),noOnionGarlic,const DeepCollectionEquality().hash(allergies),const DeepCollectionEquality().hash(dislikes),dailyFoodBudgetInr,weeklyFoodBudgetInr,householdSize,maxPrepTimeMin,timezone,targetCalories,targetProteinG,targetCarbsG,targetFatG,targetFiberG,age,createdAt,updatedAt]);

@override
String toString() {
  return 'DietaryProfile(dateOfBirth: $dateOfBirth, sex: $sex, heightCm: $heightCm, activityLevel: $activityLevel, goal: $goal, primaryCuisineRegion: $primaryCuisineRegion, spiceTolerance: $spiceTolerance, dietPattern: $dietPattern, cookingFrequency: $cookingFrequency, skillLevel: $skillLevel, weightKg: $weightKg, secondaryCuisinePreferences: $secondaryCuisinePreferences, noOnionGarlic: $noOnionGarlic, allergies: $allergies, dislikes: $dislikes, dailyFoodBudgetInr: $dailyFoodBudgetInr, weeklyFoodBudgetInr: $weeklyFoodBudgetInr, householdSize: $householdSize, maxPrepTimeMin: $maxPrepTimeMin, timezone: $timezone, targetCalories: $targetCalories, targetProteinG: $targetProteinG, targetCarbsG: $targetCarbsG, targetFatG: $targetFatG, targetFiberG: $targetFiberG, age: $age, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $DietaryProfileCopyWith<$Res>  {
  factory $DietaryProfileCopyWith(DietaryProfile value, $Res Function(DietaryProfile) _then) = _$DietaryProfileCopyWithImpl;
@useResult
$Res call({
 String dateOfBirth, String sex, int heightCm, String activityLevel, String goal, String primaryCuisineRegion, String spiceTolerance, String dietPattern, String cookingFrequency, String skillLevel, double weightKg, List<String> secondaryCuisinePreferences, bool noOnionGarlic, List<String> allergies, List<String> dislikes, double? dailyFoodBudgetInr, double? weeklyFoodBudgetInr, int householdSize, int maxPrepTimeMin, String? timezone, int? targetCalories,@JsonKey(fromJson: _doubleFromJson) double? targetProteinG,@JsonKey(fromJson: _doubleFromJson) double? targetCarbsG,@JsonKey(fromJson: _doubleFromJson) double? targetFatG,@JsonKey(fromJson: _doubleFromJson) double? targetFiberG, int? age, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$DietaryProfileCopyWithImpl<$Res>
    implements $DietaryProfileCopyWith<$Res> {
  _$DietaryProfileCopyWithImpl(this._self, this._then);

  final DietaryProfile _self;
  final $Res Function(DietaryProfile) _then;

/// Create a copy of DietaryProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dateOfBirth = null,Object? sex = null,Object? heightCm = null,Object? activityLevel = null,Object? goal = null,Object? primaryCuisineRegion = null,Object? spiceTolerance = null,Object? dietPattern = null,Object? cookingFrequency = null,Object? skillLevel = null,Object? weightKg = null,Object? secondaryCuisinePreferences = null,Object? noOnionGarlic = null,Object? allergies = null,Object? dislikes = null,Object? dailyFoodBudgetInr = freezed,Object? weeklyFoodBudgetInr = freezed,Object? householdSize = null,Object? maxPrepTimeMin = null,Object? timezone = freezed,Object? targetCalories = freezed,Object? targetProteinG = freezed,Object? targetCarbsG = freezed,Object? targetFatG = freezed,Object? targetFiberG = freezed,Object? age = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String,sex: null == sex ? _self.sex : sex // ignore: cast_nullable_to_non_nullable
as String,heightCm: null == heightCm ? _self.heightCm : heightCm // ignore: cast_nullable_to_non_nullable
as int,activityLevel: null == activityLevel ? _self.activityLevel : activityLevel // ignore: cast_nullable_to_non_nullable
as String,goal: null == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as String,primaryCuisineRegion: null == primaryCuisineRegion ? _self.primaryCuisineRegion : primaryCuisineRegion // ignore: cast_nullable_to_non_nullable
as String,spiceTolerance: null == spiceTolerance ? _self.spiceTolerance : spiceTolerance // ignore: cast_nullable_to_non_nullable
as String,dietPattern: null == dietPattern ? _self.dietPattern : dietPattern // ignore: cast_nullable_to_non_nullable
as String,cookingFrequency: null == cookingFrequency ? _self.cookingFrequency : cookingFrequency // ignore: cast_nullable_to_non_nullable
as String,skillLevel: null == skillLevel ? _self.skillLevel : skillLevel // ignore: cast_nullable_to_non_nullable
as String,weightKg: null == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double,secondaryCuisinePreferences: null == secondaryCuisinePreferences ? _self.secondaryCuisinePreferences : secondaryCuisinePreferences // ignore: cast_nullable_to_non_nullable
as List<String>,noOnionGarlic: null == noOnionGarlic ? _self.noOnionGarlic : noOnionGarlic // ignore: cast_nullable_to_non_nullable
as bool,allergies: null == allergies ? _self.allergies : allergies // ignore: cast_nullable_to_non_nullable
as List<String>,dislikes: null == dislikes ? _self.dislikes : dislikes // ignore: cast_nullable_to_non_nullable
as List<String>,dailyFoodBudgetInr: freezed == dailyFoodBudgetInr ? _self.dailyFoodBudgetInr : dailyFoodBudgetInr // ignore: cast_nullable_to_non_nullable
as double?,weeklyFoodBudgetInr: freezed == weeklyFoodBudgetInr ? _self.weeklyFoodBudgetInr : weeklyFoodBudgetInr // ignore: cast_nullable_to_non_nullable
as double?,householdSize: null == householdSize ? _self.householdSize : householdSize // ignore: cast_nullable_to_non_nullable
as int,maxPrepTimeMin: null == maxPrepTimeMin ? _self.maxPrepTimeMin : maxPrepTimeMin // ignore: cast_nullable_to_non_nullable
as int,timezone: freezed == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String?,targetCalories: freezed == targetCalories ? _self.targetCalories : targetCalories // ignore: cast_nullable_to_non_nullable
as int?,targetProteinG: freezed == targetProteinG ? _self.targetProteinG : targetProteinG // ignore: cast_nullable_to_non_nullable
as double?,targetCarbsG: freezed == targetCarbsG ? _self.targetCarbsG : targetCarbsG // ignore: cast_nullable_to_non_nullable
as double?,targetFatG: freezed == targetFatG ? _self.targetFatG : targetFatG // ignore: cast_nullable_to_non_nullable
as double?,targetFiberG: freezed == targetFiberG ? _self.targetFiberG : targetFiberG // ignore: cast_nullable_to_non_nullable
as double?,age: freezed == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [DietaryProfile].
extension DietaryProfilePatterns on DietaryProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DietaryProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DietaryProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DietaryProfile value)  $default,){
final _that = this;
switch (_that) {
case _DietaryProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DietaryProfile value)?  $default,){
final _that = this;
switch (_that) {
case _DietaryProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String dateOfBirth,  String sex,  int heightCm,  String activityLevel,  String goal,  String primaryCuisineRegion,  String spiceTolerance,  String dietPattern,  String cookingFrequency,  String skillLevel,  double weightKg,  List<String> secondaryCuisinePreferences,  bool noOnionGarlic,  List<String> allergies,  List<String> dislikes,  double? dailyFoodBudgetInr,  double? weeklyFoodBudgetInr,  int householdSize,  int maxPrepTimeMin,  String? timezone,  int? targetCalories, @JsonKey(fromJson: _doubleFromJson)  double? targetProteinG, @JsonKey(fromJson: _doubleFromJson)  double? targetCarbsG, @JsonKey(fromJson: _doubleFromJson)  double? targetFatG, @JsonKey(fromJson: _doubleFromJson)  double? targetFiberG,  int? age,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DietaryProfile() when $default != null:
return $default(_that.dateOfBirth,_that.sex,_that.heightCm,_that.activityLevel,_that.goal,_that.primaryCuisineRegion,_that.spiceTolerance,_that.dietPattern,_that.cookingFrequency,_that.skillLevel,_that.weightKg,_that.secondaryCuisinePreferences,_that.noOnionGarlic,_that.allergies,_that.dislikes,_that.dailyFoodBudgetInr,_that.weeklyFoodBudgetInr,_that.householdSize,_that.maxPrepTimeMin,_that.timezone,_that.targetCalories,_that.targetProteinG,_that.targetCarbsG,_that.targetFatG,_that.targetFiberG,_that.age,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String dateOfBirth,  String sex,  int heightCm,  String activityLevel,  String goal,  String primaryCuisineRegion,  String spiceTolerance,  String dietPattern,  String cookingFrequency,  String skillLevel,  double weightKg,  List<String> secondaryCuisinePreferences,  bool noOnionGarlic,  List<String> allergies,  List<String> dislikes,  double? dailyFoodBudgetInr,  double? weeklyFoodBudgetInr,  int householdSize,  int maxPrepTimeMin,  String? timezone,  int? targetCalories, @JsonKey(fromJson: _doubleFromJson)  double? targetProteinG, @JsonKey(fromJson: _doubleFromJson)  double? targetCarbsG, @JsonKey(fromJson: _doubleFromJson)  double? targetFatG, @JsonKey(fromJson: _doubleFromJson)  double? targetFiberG,  int? age,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _DietaryProfile():
return $default(_that.dateOfBirth,_that.sex,_that.heightCm,_that.activityLevel,_that.goal,_that.primaryCuisineRegion,_that.spiceTolerance,_that.dietPattern,_that.cookingFrequency,_that.skillLevel,_that.weightKg,_that.secondaryCuisinePreferences,_that.noOnionGarlic,_that.allergies,_that.dislikes,_that.dailyFoodBudgetInr,_that.weeklyFoodBudgetInr,_that.householdSize,_that.maxPrepTimeMin,_that.timezone,_that.targetCalories,_that.targetProteinG,_that.targetCarbsG,_that.targetFatG,_that.targetFiberG,_that.age,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String dateOfBirth,  String sex,  int heightCm,  String activityLevel,  String goal,  String primaryCuisineRegion,  String spiceTolerance,  String dietPattern,  String cookingFrequency,  String skillLevel,  double weightKg,  List<String> secondaryCuisinePreferences,  bool noOnionGarlic,  List<String> allergies,  List<String> dislikes,  double? dailyFoodBudgetInr,  double? weeklyFoodBudgetInr,  int householdSize,  int maxPrepTimeMin,  String? timezone,  int? targetCalories, @JsonKey(fromJson: _doubleFromJson)  double? targetProteinG, @JsonKey(fromJson: _doubleFromJson)  double? targetCarbsG, @JsonKey(fromJson: _doubleFromJson)  double? targetFatG, @JsonKey(fromJson: _doubleFromJson)  double? targetFiberG,  int? age,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _DietaryProfile() when $default != null:
return $default(_that.dateOfBirth,_that.sex,_that.heightCm,_that.activityLevel,_that.goal,_that.primaryCuisineRegion,_that.spiceTolerance,_that.dietPattern,_that.cookingFrequency,_that.skillLevel,_that.weightKg,_that.secondaryCuisinePreferences,_that.noOnionGarlic,_that.allergies,_that.dislikes,_that.dailyFoodBudgetInr,_that.weeklyFoodBudgetInr,_that.householdSize,_that.maxPrepTimeMin,_that.timezone,_that.targetCalories,_that.targetProteinG,_that.targetCarbsG,_that.targetFatG,_that.targetFiberG,_that.age,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _DietaryProfile implements DietaryProfile {
  const _DietaryProfile({required this.dateOfBirth, required this.sex, required this.heightCm, required this.activityLevel, required this.goal, required this.primaryCuisineRegion, required this.spiceTolerance, required this.dietPattern, required this.cookingFrequency, required this.skillLevel, this.weightKg = 0.0, final  List<String> secondaryCuisinePreferences = const [], this.noOnionGarlic = false, final  List<String> allergies = const [], final  List<String> dislikes = const [], this.dailyFoodBudgetInr, this.weeklyFoodBudgetInr, this.householdSize = 1, this.maxPrepTimeMin = 30, this.timezone, this.targetCalories, @JsonKey(fromJson: _doubleFromJson) this.targetProteinG, @JsonKey(fromJson: _doubleFromJson) this.targetCarbsG, @JsonKey(fromJson: _doubleFromJson) this.targetFatG, @JsonKey(fromJson: _doubleFromJson) this.targetFiberG, this.age, this.createdAt, this.updatedAt}): _secondaryCuisinePreferences = secondaryCuisinePreferences,_allergies = allergies,_dislikes = dislikes;
  factory _DietaryProfile.fromJson(Map<String, dynamic> json) => _$DietaryProfileFromJson(json);

// Required fields (submitted + echoed back)
@override final  String dateOfBirth;
@override final  String sex;
@override final  int heightCm;
@override final  String activityLevel;
@override final  String goal;
@override final  String primaryCuisineRegion;
@override final  String spiceTolerance;
@override final  String dietPattern;
@override final  String cookingFrequency;
@override final  String skillLevel;
// Optional / defaulted submitted fields
@override@JsonKey() final  double weightKg;
 final  List<String> _secondaryCuisinePreferences;
@override@JsonKey() List<String> get secondaryCuisinePreferences {
  if (_secondaryCuisinePreferences is EqualUnmodifiableListView) return _secondaryCuisinePreferences;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_secondaryCuisinePreferences);
}

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

@override final  double? dailyFoodBudgetInr;
@override final  double? weeklyFoodBudgetInr;
@override@JsonKey() final  int householdSize;
@override@JsonKey() final  int maxPrepTimeMin;
@override final  String? timezone;
// Read-only computed fields
@override final  int? targetCalories;
// ignore: invalid_annotation_target
@override@JsonKey(fromJson: _doubleFromJson) final  double? targetProteinG;
// ignore: invalid_annotation_target
@override@JsonKey(fromJson: _doubleFromJson) final  double? targetCarbsG;
// ignore: invalid_annotation_target
@override@JsonKey(fromJson: _doubleFromJson) final  double? targetFatG;
// ignore: invalid_annotation_target
@override@JsonKey(fromJson: _doubleFromJson) final  double? targetFiberG;
@override final  int? age;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of DietaryProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DietaryProfileCopyWith<_DietaryProfile> get copyWith => __$DietaryProfileCopyWithImpl<_DietaryProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DietaryProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DietaryProfile&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.sex, sex) || other.sex == sex)&&(identical(other.heightCm, heightCm) || other.heightCm == heightCm)&&(identical(other.activityLevel, activityLevel) || other.activityLevel == activityLevel)&&(identical(other.goal, goal) || other.goal == goal)&&(identical(other.primaryCuisineRegion, primaryCuisineRegion) || other.primaryCuisineRegion == primaryCuisineRegion)&&(identical(other.spiceTolerance, spiceTolerance) || other.spiceTolerance == spiceTolerance)&&(identical(other.dietPattern, dietPattern) || other.dietPattern == dietPattern)&&(identical(other.cookingFrequency, cookingFrequency) || other.cookingFrequency == cookingFrequency)&&(identical(other.skillLevel, skillLevel) || other.skillLevel == skillLevel)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&const DeepCollectionEquality().equals(other._secondaryCuisinePreferences, _secondaryCuisinePreferences)&&(identical(other.noOnionGarlic, noOnionGarlic) || other.noOnionGarlic == noOnionGarlic)&&const DeepCollectionEquality().equals(other._allergies, _allergies)&&const DeepCollectionEquality().equals(other._dislikes, _dislikes)&&(identical(other.dailyFoodBudgetInr, dailyFoodBudgetInr) || other.dailyFoodBudgetInr == dailyFoodBudgetInr)&&(identical(other.weeklyFoodBudgetInr, weeklyFoodBudgetInr) || other.weeklyFoodBudgetInr == weeklyFoodBudgetInr)&&(identical(other.householdSize, householdSize) || other.householdSize == householdSize)&&(identical(other.maxPrepTimeMin, maxPrepTimeMin) || other.maxPrepTimeMin == maxPrepTimeMin)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.targetCalories, targetCalories) || other.targetCalories == targetCalories)&&(identical(other.targetProteinG, targetProteinG) || other.targetProteinG == targetProteinG)&&(identical(other.targetCarbsG, targetCarbsG) || other.targetCarbsG == targetCarbsG)&&(identical(other.targetFatG, targetFatG) || other.targetFatG == targetFatG)&&(identical(other.targetFiberG, targetFiberG) || other.targetFiberG == targetFiberG)&&(identical(other.age, age) || other.age == age)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,dateOfBirth,sex,heightCm,activityLevel,goal,primaryCuisineRegion,spiceTolerance,dietPattern,cookingFrequency,skillLevel,weightKg,const DeepCollectionEquality().hash(_secondaryCuisinePreferences),noOnionGarlic,const DeepCollectionEquality().hash(_allergies),const DeepCollectionEquality().hash(_dislikes),dailyFoodBudgetInr,weeklyFoodBudgetInr,householdSize,maxPrepTimeMin,timezone,targetCalories,targetProteinG,targetCarbsG,targetFatG,targetFiberG,age,createdAt,updatedAt]);

@override
String toString() {
  return 'DietaryProfile(dateOfBirth: $dateOfBirth, sex: $sex, heightCm: $heightCm, activityLevel: $activityLevel, goal: $goal, primaryCuisineRegion: $primaryCuisineRegion, spiceTolerance: $spiceTolerance, dietPattern: $dietPattern, cookingFrequency: $cookingFrequency, skillLevel: $skillLevel, weightKg: $weightKg, secondaryCuisinePreferences: $secondaryCuisinePreferences, noOnionGarlic: $noOnionGarlic, allergies: $allergies, dislikes: $dislikes, dailyFoodBudgetInr: $dailyFoodBudgetInr, weeklyFoodBudgetInr: $weeklyFoodBudgetInr, householdSize: $householdSize, maxPrepTimeMin: $maxPrepTimeMin, timezone: $timezone, targetCalories: $targetCalories, targetProteinG: $targetProteinG, targetCarbsG: $targetCarbsG, targetFatG: $targetFatG, targetFiberG: $targetFiberG, age: $age, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$DietaryProfileCopyWith<$Res> implements $DietaryProfileCopyWith<$Res> {
  factory _$DietaryProfileCopyWith(_DietaryProfile value, $Res Function(_DietaryProfile) _then) = __$DietaryProfileCopyWithImpl;
@override @useResult
$Res call({
 String dateOfBirth, String sex, int heightCm, String activityLevel, String goal, String primaryCuisineRegion, String spiceTolerance, String dietPattern, String cookingFrequency, String skillLevel, double weightKg, List<String> secondaryCuisinePreferences, bool noOnionGarlic, List<String> allergies, List<String> dislikes, double? dailyFoodBudgetInr, double? weeklyFoodBudgetInr, int householdSize, int maxPrepTimeMin, String? timezone, int? targetCalories,@JsonKey(fromJson: _doubleFromJson) double? targetProteinG,@JsonKey(fromJson: _doubleFromJson) double? targetCarbsG,@JsonKey(fromJson: _doubleFromJson) double? targetFatG,@JsonKey(fromJson: _doubleFromJson) double? targetFiberG, int? age, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$DietaryProfileCopyWithImpl<$Res>
    implements _$DietaryProfileCopyWith<$Res> {
  __$DietaryProfileCopyWithImpl(this._self, this._then);

  final _DietaryProfile _self;
  final $Res Function(_DietaryProfile) _then;

/// Create a copy of DietaryProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dateOfBirth = null,Object? sex = null,Object? heightCm = null,Object? activityLevel = null,Object? goal = null,Object? primaryCuisineRegion = null,Object? spiceTolerance = null,Object? dietPattern = null,Object? cookingFrequency = null,Object? skillLevel = null,Object? weightKg = null,Object? secondaryCuisinePreferences = null,Object? noOnionGarlic = null,Object? allergies = null,Object? dislikes = null,Object? dailyFoodBudgetInr = freezed,Object? weeklyFoodBudgetInr = freezed,Object? householdSize = null,Object? maxPrepTimeMin = null,Object? timezone = freezed,Object? targetCalories = freezed,Object? targetProteinG = freezed,Object? targetCarbsG = freezed,Object? targetFatG = freezed,Object? targetFiberG = freezed,Object? age = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_DietaryProfile(
dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String,sex: null == sex ? _self.sex : sex // ignore: cast_nullable_to_non_nullable
as String,heightCm: null == heightCm ? _self.heightCm : heightCm // ignore: cast_nullable_to_non_nullable
as int,activityLevel: null == activityLevel ? _self.activityLevel : activityLevel // ignore: cast_nullable_to_non_nullable
as String,goal: null == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as String,primaryCuisineRegion: null == primaryCuisineRegion ? _self.primaryCuisineRegion : primaryCuisineRegion // ignore: cast_nullable_to_non_nullable
as String,spiceTolerance: null == spiceTolerance ? _self.spiceTolerance : spiceTolerance // ignore: cast_nullable_to_non_nullable
as String,dietPattern: null == dietPattern ? _self.dietPattern : dietPattern // ignore: cast_nullable_to_non_nullable
as String,cookingFrequency: null == cookingFrequency ? _self.cookingFrequency : cookingFrequency // ignore: cast_nullable_to_non_nullable
as String,skillLevel: null == skillLevel ? _self.skillLevel : skillLevel // ignore: cast_nullable_to_non_nullable
as String,weightKg: null == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double,secondaryCuisinePreferences: null == secondaryCuisinePreferences ? _self._secondaryCuisinePreferences : secondaryCuisinePreferences // ignore: cast_nullable_to_non_nullable
as List<String>,noOnionGarlic: null == noOnionGarlic ? _self.noOnionGarlic : noOnionGarlic // ignore: cast_nullable_to_non_nullable
as bool,allergies: null == allergies ? _self._allergies : allergies // ignore: cast_nullable_to_non_nullable
as List<String>,dislikes: null == dislikes ? _self._dislikes : dislikes // ignore: cast_nullable_to_non_nullable
as List<String>,dailyFoodBudgetInr: freezed == dailyFoodBudgetInr ? _self.dailyFoodBudgetInr : dailyFoodBudgetInr // ignore: cast_nullable_to_non_nullable
as double?,weeklyFoodBudgetInr: freezed == weeklyFoodBudgetInr ? _self.weeklyFoodBudgetInr : weeklyFoodBudgetInr // ignore: cast_nullable_to_non_nullable
as double?,householdSize: null == householdSize ? _self.householdSize : householdSize // ignore: cast_nullable_to_non_nullable
as int,maxPrepTimeMin: null == maxPrepTimeMin ? _self.maxPrepTimeMin : maxPrepTimeMin // ignore: cast_nullable_to_non_nullable
as int,timezone: freezed == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String?,targetCalories: freezed == targetCalories ? _self.targetCalories : targetCalories // ignore: cast_nullable_to_non_nullable
as int?,targetProteinG: freezed == targetProteinG ? _self.targetProteinG : targetProteinG // ignore: cast_nullable_to_non_nullable
as double?,targetCarbsG: freezed == targetCarbsG ? _self.targetCarbsG : targetCarbsG // ignore: cast_nullable_to_non_nullable
as double?,targetFatG: freezed == targetFatG ? _self.targetFatG : targetFatG // ignore: cast_nullable_to_non_nullable
as double?,targetFiberG: freezed == targetFiberG ? _self.targetFiberG : targetFiberG // ignore: cast_nullable_to_non_nullable
as double?,age: freezed == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
