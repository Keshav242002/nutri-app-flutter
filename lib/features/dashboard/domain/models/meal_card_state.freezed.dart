// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_card_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MealCardState {

 MealSlot get slot;
/// Create a copy of MealCardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MealCardStateCopyWith<MealCardState> get copyWith => _$MealCardStateCopyWithImpl<MealCardState>(this as MealCardState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MealCardState&&(identical(other.slot, slot) || other.slot == slot));
}


@override
int get hashCode => Object.hash(runtimeType,slot);

@override
String toString() {
  return 'MealCardState(slot: $slot)';
}


}

/// @nodoc
abstract mixin class $MealCardStateCopyWith<$Res>  {
  factory $MealCardStateCopyWith(MealCardState value, $Res Function(MealCardState) _then) = _$MealCardStateCopyWithImpl;
@useResult
$Res call({
 MealSlot slot
});




}
/// @nodoc
class _$MealCardStateCopyWithImpl<$Res>
    implements $MealCardStateCopyWith<$Res> {
  _$MealCardStateCopyWithImpl(this._self, this._then);

  final MealCardState _self;
  final $Res Function(MealCardState) _then;

/// Create a copy of MealCardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? slot = null,}) {
  return _then(_self.copyWith(
slot: null == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as MealSlot,
  ));
}

}


/// Adds pattern-matching-related methods to [MealCardState].
extension MealCardStatePatterns on MealCardState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PlannedMealCard value)?  planned,TResult Function( EatenMealCard value)?  eaten,TResult Function( SubstitutedMealCard value)?  loggedSubstituted,TResult Function( CustomMealCard value)?  loggedCustom,TResult Function( SkippedMealCard value)?  skipped,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PlannedMealCard() when planned != null:
return planned(_that);case EatenMealCard() when eaten != null:
return eaten(_that);case SubstitutedMealCard() when loggedSubstituted != null:
return loggedSubstituted(_that);case CustomMealCard() when loggedCustom != null:
return loggedCustom(_that);case SkippedMealCard() when skipped != null:
return skipped(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PlannedMealCard value)  planned,required TResult Function( EatenMealCard value)  eaten,required TResult Function( SubstitutedMealCard value)  loggedSubstituted,required TResult Function( CustomMealCard value)  loggedCustom,required TResult Function( SkippedMealCard value)  skipped,}){
final _that = this;
switch (_that) {
case PlannedMealCard():
return planned(_that);case EatenMealCard():
return eaten(_that);case SubstitutedMealCard():
return loggedSubstituted(_that);case CustomMealCard():
return loggedCustom(_that);case SkippedMealCard():
return skipped(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PlannedMealCard value)?  planned,TResult? Function( EatenMealCard value)?  eaten,TResult? Function( SubstitutedMealCard value)?  loggedSubstituted,TResult? Function( CustomMealCard value)?  loggedCustom,TResult? Function( SkippedMealCard value)?  skipped,}){
final _that = this;
switch (_that) {
case PlannedMealCard() when planned != null:
return planned(_that);case EatenMealCard() when eaten != null:
return eaten(_that);case SubstitutedMealCard() when loggedSubstituted != null:
return loggedSubstituted(_that);case CustomMealCard() when loggedCustom != null:
return loggedCustom(_that);case SkippedMealCard() when skipped != null:
return skipped(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( RecipeSlim recipe,  MealSlot slot)?  planned,TResult Function( RecipeSlim recipe,  MealSlot slot,  double servingsEaten)?  eaten,TResult Function( RecipeSlim actualRecipe,  MealSlot slot)?  loggedSubstituted,TResult Function( String description,  int calories,  MealSlot slot)?  loggedCustom,TResult Function( RecipeSlim recipe,  MealSlot slot)?  skipped,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PlannedMealCard() when planned != null:
return planned(_that.recipe,_that.slot);case EatenMealCard() when eaten != null:
return eaten(_that.recipe,_that.slot,_that.servingsEaten);case SubstitutedMealCard() when loggedSubstituted != null:
return loggedSubstituted(_that.actualRecipe,_that.slot);case CustomMealCard() when loggedCustom != null:
return loggedCustom(_that.description,_that.calories,_that.slot);case SkippedMealCard() when skipped != null:
return skipped(_that.recipe,_that.slot);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( RecipeSlim recipe,  MealSlot slot)  planned,required TResult Function( RecipeSlim recipe,  MealSlot slot,  double servingsEaten)  eaten,required TResult Function( RecipeSlim actualRecipe,  MealSlot slot)  loggedSubstituted,required TResult Function( String description,  int calories,  MealSlot slot)  loggedCustom,required TResult Function( RecipeSlim recipe,  MealSlot slot)  skipped,}) {final _that = this;
switch (_that) {
case PlannedMealCard():
return planned(_that.recipe,_that.slot);case EatenMealCard():
return eaten(_that.recipe,_that.slot,_that.servingsEaten);case SubstitutedMealCard():
return loggedSubstituted(_that.actualRecipe,_that.slot);case CustomMealCard():
return loggedCustom(_that.description,_that.calories,_that.slot);case SkippedMealCard():
return skipped(_that.recipe,_that.slot);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( RecipeSlim recipe,  MealSlot slot)?  planned,TResult? Function( RecipeSlim recipe,  MealSlot slot,  double servingsEaten)?  eaten,TResult? Function( RecipeSlim actualRecipe,  MealSlot slot)?  loggedSubstituted,TResult? Function( String description,  int calories,  MealSlot slot)?  loggedCustom,TResult? Function( RecipeSlim recipe,  MealSlot slot)?  skipped,}) {final _that = this;
switch (_that) {
case PlannedMealCard() when planned != null:
return planned(_that.recipe,_that.slot);case EatenMealCard() when eaten != null:
return eaten(_that.recipe,_that.slot,_that.servingsEaten);case SubstitutedMealCard() when loggedSubstituted != null:
return loggedSubstituted(_that.actualRecipe,_that.slot);case CustomMealCard() when loggedCustom != null:
return loggedCustom(_that.description,_that.calories,_that.slot);case SkippedMealCard() when skipped != null:
return skipped(_that.recipe,_that.slot);case _:
  return null;

}
}

}

/// @nodoc


class PlannedMealCard implements MealCardState {
  const PlannedMealCard({required this.recipe, required this.slot});
  

 final  RecipeSlim recipe;
@override final  MealSlot slot;

/// Create a copy of MealCardState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlannedMealCardCopyWith<PlannedMealCard> get copyWith => _$PlannedMealCardCopyWithImpl<PlannedMealCard>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlannedMealCard&&(identical(other.recipe, recipe) || other.recipe == recipe)&&(identical(other.slot, slot) || other.slot == slot));
}


@override
int get hashCode => Object.hash(runtimeType,recipe,slot);

@override
String toString() {
  return 'MealCardState.planned(recipe: $recipe, slot: $slot)';
}


}

/// @nodoc
abstract mixin class $PlannedMealCardCopyWith<$Res> implements $MealCardStateCopyWith<$Res> {
  factory $PlannedMealCardCopyWith(PlannedMealCard value, $Res Function(PlannedMealCard) _then) = _$PlannedMealCardCopyWithImpl;
@override @useResult
$Res call({
 RecipeSlim recipe, MealSlot slot
});


$RecipeSlimCopyWith<$Res> get recipe;

}
/// @nodoc
class _$PlannedMealCardCopyWithImpl<$Res>
    implements $PlannedMealCardCopyWith<$Res> {
  _$PlannedMealCardCopyWithImpl(this._self, this._then);

  final PlannedMealCard _self;
  final $Res Function(PlannedMealCard) _then;

/// Create a copy of MealCardState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? recipe = null,Object? slot = null,}) {
  return _then(PlannedMealCard(
recipe: null == recipe ? _self.recipe : recipe // ignore: cast_nullable_to_non_nullable
as RecipeSlim,slot: null == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as MealSlot,
  ));
}

/// Create a copy of MealCardState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeSlimCopyWith<$Res> get recipe {
  
  return $RecipeSlimCopyWith<$Res>(_self.recipe, (value) {
    return _then(_self.copyWith(recipe: value));
  });
}
}

/// @nodoc


class EatenMealCard implements MealCardState {
  const EatenMealCard({required this.recipe, required this.slot, required this.servingsEaten});
  

 final  RecipeSlim recipe;
@override final  MealSlot slot;
 final  double servingsEaten;

/// Create a copy of MealCardState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EatenMealCardCopyWith<EatenMealCard> get copyWith => _$EatenMealCardCopyWithImpl<EatenMealCard>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EatenMealCard&&(identical(other.recipe, recipe) || other.recipe == recipe)&&(identical(other.slot, slot) || other.slot == slot)&&(identical(other.servingsEaten, servingsEaten) || other.servingsEaten == servingsEaten));
}


@override
int get hashCode => Object.hash(runtimeType,recipe,slot,servingsEaten);

@override
String toString() {
  return 'MealCardState.eaten(recipe: $recipe, slot: $slot, servingsEaten: $servingsEaten)';
}


}

/// @nodoc
abstract mixin class $EatenMealCardCopyWith<$Res> implements $MealCardStateCopyWith<$Res> {
  factory $EatenMealCardCopyWith(EatenMealCard value, $Res Function(EatenMealCard) _then) = _$EatenMealCardCopyWithImpl;
@override @useResult
$Res call({
 RecipeSlim recipe, MealSlot slot, double servingsEaten
});


$RecipeSlimCopyWith<$Res> get recipe;

}
/// @nodoc
class _$EatenMealCardCopyWithImpl<$Res>
    implements $EatenMealCardCopyWith<$Res> {
  _$EatenMealCardCopyWithImpl(this._self, this._then);

  final EatenMealCard _self;
  final $Res Function(EatenMealCard) _then;

/// Create a copy of MealCardState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? recipe = null,Object? slot = null,Object? servingsEaten = null,}) {
  return _then(EatenMealCard(
recipe: null == recipe ? _self.recipe : recipe // ignore: cast_nullable_to_non_nullable
as RecipeSlim,slot: null == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as MealSlot,servingsEaten: null == servingsEaten ? _self.servingsEaten : servingsEaten // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of MealCardState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeSlimCopyWith<$Res> get recipe {
  
  return $RecipeSlimCopyWith<$Res>(_self.recipe, (value) {
    return _then(_self.copyWith(recipe: value));
  });
}
}

/// @nodoc


class SubstitutedMealCard implements MealCardState {
  const SubstitutedMealCard({required this.actualRecipe, required this.slot});
  

 final  RecipeSlim actualRecipe;
@override final  MealSlot slot;

/// Create a copy of MealCardState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubstitutedMealCardCopyWith<SubstitutedMealCard> get copyWith => _$SubstitutedMealCardCopyWithImpl<SubstitutedMealCard>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubstitutedMealCard&&(identical(other.actualRecipe, actualRecipe) || other.actualRecipe == actualRecipe)&&(identical(other.slot, slot) || other.slot == slot));
}


@override
int get hashCode => Object.hash(runtimeType,actualRecipe,slot);

@override
String toString() {
  return 'MealCardState.loggedSubstituted(actualRecipe: $actualRecipe, slot: $slot)';
}


}

/// @nodoc
abstract mixin class $SubstitutedMealCardCopyWith<$Res> implements $MealCardStateCopyWith<$Res> {
  factory $SubstitutedMealCardCopyWith(SubstitutedMealCard value, $Res Function(SubstitutedMealCard) _then) = _$SubstitutedMealCardCopyWithImpl;
@override @useResult
$Res call({
 RecipeSlim actualRecipe, MealSlot slot
});


$RecipeSlimCopyWith<$Res> get actualRecipe;

}
/// @nodoc
class _$SubstitutedMealCardCopyWithImpl<$Res>
    implements $SubstitutedMealCardCopyWith<$Res> {
  _$SubstitutedMealCardCopyWithImpl(this._self, this._then);

  final SubstitutedMealCard _self;
  final $Res Function(SubstitutedMealCard) _then;

/// Create a copy of MealCardState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? actualRecipe = null,Object? slot = null,}) {
  return _then(SubstitutedMealCard(
actualRecipe: null == actualRecipe ? _self.actualRecipe : actualRecipe // ignore: cast_nullable_to_non_nullable
as RecipeSlim,slot: null == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as MealSlot,
  ));
}

/// Create a copy of MealCardState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeSlimCopyWith<$Res> get actualRecipe {
  
  return $RecipeSlimCopyWith<$Res>(_self.actualRecipe, (value) {
    return _then(_self.copyWith(actualRecipe: value));
  });
}
}

/// @nodoc


class CustomMealCard implements MealCardState {
  const CustomMealCard({required this.description, required this.calories, required this.slot});
  

 final  String description;
 final  int calories;
@override final  MealSlot slot;

/// Create a copy of MealCardState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomMealCardCopyWith<CustomMealCard> get copyWith => _$CustomMealCardCopyWithImpl<CustomMealCard>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomMealCard&&(identical(other.description, description) || other.description == description)&&(identical(other.calories, calories) || other.calories == calories)&&(identical(other.slot, slot) || other.slot == slot));
}


@override
int get hashCode => Object.hash(runtimeType,description,calories,slot);

@override
String toString() {
  return 'MealCardState.loggedCustom(description: $description, calories: $calories, slot: $slot)';
}


}

/// @nodoc
abstract mixin class $CustomMealCardCopyWith<$Res> implements $MealCardStateCopyWith<$Res> {
  factory $CustomMealCardCopyWith(CustomMealCard value, $Res Function(CustomMealCard) _then) = _$CustomMealCardCopyWithImpl;
@override @useResult
$Res call({
 String description, int calories, MealSlot slot
});




}
/// @nodoc
class _$CustomMealCardCopyWithImpl<$Res>
    implements $CustomMealCardCopyWith<$Res> {
  _$CustomMealCardCopyWithImpl(this._self, this._then);

  final CustomMealCard _self;
  final $Res Function(CustomMealCard) _then;

/// Create a copy of MealCardState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? description = null,Object? calories = null,Object? slot = null,}) {
  return _then(CustomMealCard(
description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,calories: null == calories ? _self.calories : calories // ignore: cast_nullable_to_non_nullable
as int,slot: null == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as MealSlot,
  ));
}


}

/// @nodoc


class SkippedMealCard implements MealCardState {
  const SkippedMealCard({required this.recipe, required this.slot});
  

 final  RecipeSlim recipe;
@override final  MealSlot slot;

/// Create a copy of MealCardState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SkippedMealCardCopyWith<SkippedMealCard> get copyWith => _$SkippedMealCardCopyWithImpl<SkippedMealCard>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SkippedMealCard&&(identical(other.recipe, recipe) || other.recipe == recipe)&&(identical(other.slot, slot) || other.slot == slot));
}


@override
int get hashCode => Object.hash(runtimeType,recipe,slot);

@override
String toString() {
  return 'MealCardState.skipped(recipe: $recipe, slot: $slot)';
}


}

/// @nodoc
abstract mixin class $SkippedMealCardCopyWith<$Res> implements $MealCardStateCopyWith<$Res> {
  factory $SkippedMealCardCopyWith(SkippedMealCard value, $Res Function(SkippedMealCard) _then) = _$SkippedMealCardCopyWithImpl;
@override @useResult
$Res call({
 RecipeSlim recipe, MealSlot slot
});


$RecipeSlimCopyWith<$Res> get recipe;

}
/// @nodoc
class _$SkippedMealCardCopyWithImpl<$Res>
    implements $SkippedMealCardCopyWith<$Res> {
  _$SkippedMealCardCopyWithImpl(this._self, this._then);

  final SkippedMealCard _self;
  final $Res Function(SkippedMealCard) _then;

/// Create a copy of MealCardState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? recipe = null,Object? slot = null,}) {
  return _then(SkippedMealCard(
recipe: null == recipe ? _self.recipe : recipe // ignore: cast_nullable_to_non_nullable
as RecipeSlim,slot: null == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as MealSlot,
  ));
}

/// Create a copy of MealCardState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeSlimCopyWith<$Res> get recipe {
  
  return $RecipeSlimCopyWith<$Res>(_self.recipe, (value) {
    return _then(_self.copyWith(recipe: value));
  });
}
}

// dart format on
