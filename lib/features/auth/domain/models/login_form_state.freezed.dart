// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginFormState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginFormState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginFormState()';
}


}

/// @nodoc
class $LoginFormStateCopyWith<$Res>  {
$LoginFormStateCopyWith(LoginFormState _, $Res Function(LoginFormState) __);
}


/// Adds pattern-matching-related methods to [LoginFormState].
extension LoginFormStatePatterns on LoginFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ChooseMethod value)?  chooseMethod,TResult Function( _EmailEntry value)?  emailEntry,TResult Function( _EmailLinkSending value)?  emailLinkSending,TResult Function( _EmailLinkSent value)?  emailLinkSent,TResult Function( _EmailLinkVerifying value)?  emailLinkVerifying,TResult Function( _EmailPasswordEntry value)?  emailPasswordEntry,TResult Function( _EmailPasswordSubmitting value)?  emailPasswordSubmitting,TResult Function( _GoogleSigningIn value)?  googleSigningIn,TResult Function( _Success value)?  success,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChooseMethod() when chooseMethod != null:
return chooseMethod(_that);case _EmailEntry() when emailEntry != null:
return emailEntry(_that);case _EmailLinkSending() when emailLinkSending != null:
return emailLinkSending(_that);case _EmailLinkSent() when emailLinkSent != null:
return emailLinkSent(_that);case _EmailLinkVerifying() when emailLinkVerifying != null:
return emailLinkVerifying(_that);case _EmailPasswordEntry() when emailPasswordEntry != null:
return emailPasswordEntry(_that);case _EmailPasswordSubmitting() when emailPasswordSubmitting != null:
return emailPasswordSubmitting(_that);case _GoogleSigningIn() when googleSigningIn != null:
return googleSigningIn(_that);case _Success() when success != null:
return success(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ChooseMethod value)  chooseMethod,required TResult Function( _EmailEntry value)  emailEntry,required TResult Function( _EmailLinkSending value)  emailLinkSending,required TResult Function( _EmailLinkSent value)  emailLinkSent,required TResult Function( _EmailLinkVerifying value)  emailLinkVerifying,required TResult Function( _EmailPasswordEntry value)  emailPasswordEntry,required TResult Function( _EmailPasswordSubmitting value)  emailPasswordSubmitting,required TResult Function( _GoogleSigningIn value)  googleSigningIn,required TResult Function( _Success value)  success,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _ChooseMethod():
return chooseMethod(_that);case _EmailEntry():
return emailEntry(_that);case _EmailLinkSending():
return emailLinkSending(_that);case _EmailLinkSent():
return emailLinkSent(_that);case _EmailLinkVerifying():
return emailLinkVerifying(_that);case _EmailPasswordEntry():
return emailPasswordEntry(_that);case _EmailPasswordSubmitting():
return emailPasswordSubmitting(_that);case _GoogleSigningIn():
return googleSigningIn(_that);case _Success():
return success(_that);case _Error():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ChooseMethod value)?  chooseMethod,TResult? Function( _EmailEntry value)?  emailEntry,TResult? Function( _EmailLinkSending value)?  emailLinkSending,TResult? Function( _EmailLinkSent value)?  emailLinkSent,TResult? Function( _EmailLinkVerifying value)?  emailLinkVerifying,TResult? Function( _EmailPasswordEntry value)?  emailPasswordEntry,TResult? Function( _EmailPasswordSubmitting value)?  emailPasswordSubmitting,TResult? Function( _GoogleSigningIn value)?  googleSigningIn,TResult? Function( _Success value)?  success,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _ChooseMethod() when chooseMethod != null:
return chooseMethod(_that);case _EmailEntry() when emailEntry != null:
return emailEntry(_that);case _EmailLinkSending() when emailLinkSending != null:
return emailLinkSending(_that);case _EmailLinkSent() when emailLinkSent != null:
return emailLinkSent(_that);case _EmailLinkVerifying() when emailLinkVerifying != null:
return emailLinkVerifying(_that);case _EmailPasswordEntry() when emailPasswordEntry != null:
return emailPasswordEntry(_that);case _EmailPasswordSubmitting() when emailPasswordSubmitting != null:
return emailPasswordSubmitting(_that);case _GoogleSigningIn() when googleSigningIn != null:
return googleSigningIn(_that);case _Success() when success != null:
return success(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  chooseMethod,TResult Function( String email,  bool isValid,  String? errorMessage)?  emailEntry,TResult Function( String email)?  emailLinkSending,TResult Function( String email,  int resendCountdown)?  emailLinkSent,TResult Function( String email)?  emailLinkVerifying,TResult Function( String email,  String password,  bool isSignUpMode,  String? errorMessage)?  emailPasswordEntry,TResult Function( String email)?  emailPasswordSubmitting,TResult Function()?  googleSigningIn,TResult Function( User user)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChooseMethod() when chooseMethod != null:
return chooseMethod();case _EmailEntry() when emailEntry != null:
return emailEntry(_that.email,_that.isValid,_that.errorMessage);case _EmailLinkSending() when emailLinkSending != null:
return emailLinkSending(_that.email);case _EmailLinkSent() when emailLinkSent != null:
return emailLinkSent(_that.email,_that.resendCountdown);case _EmailLinkVerifying() when emailLinkVerifying != null:
return emailLinkVerifying(_that.email);case _EmailPasswordEntry() when emailPasswordEntry != null:
return emailPasswordEntry(_that.email,_that.password,_that.isSignUpMode,_that.errorMessage);case _EmailPasswordSubmitting() when emailPasswordSubmitting != null:
return emailPasswordSubmitting(_that.email);case _GoogleSigningIn() when googleSigningIn != null:
return googleSigningIn();case _Success() when success != null:
return success(_that.user);case _Error() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  chooseMethod,required TResult Function( String email,  bool isValid,  String? errorMessage)  emailEntry,required TResult Function( String email)  emailLinkSending,required TResult Function( String email,  int resendCountdown)  emailLinkSent,required TResult Function( String email)  emailLinkVerifying,required TResult Function( String email,  String password,  bool isSignUpMode,  String? errorMessage)  emailPasswordEntry,required TResult Function( String email)  emailPasswordSubmitting,required TResult Function()  googleSigningIn,required TResult Function( User user)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _ChooseMethod():
return chooseMethod();case _EmailEntry():
return emailEntry(_that.email,_that.isValid,_that.errorMessage);case _EmailLinkSending():
return emailLinkSending(_that.email);case _EmailLinkSent():
return emailLinkSent(_that.email,_that.resendCountdown);case _EmailLinkVerifying():
return emailLinkVerifying(_that.email);case _EmailPasswordEntry():
return emailPasswordEntry(_that.email,_that.password,_that.isSignUpMode,_that.errorMessage);case _EmailPasswordSubmitting():
return emailPasswordSubmitting(_that.email);case _GoogleSigningIn():
return googleSigningIn();case _Success():
return success(_that.user);case _Error():
return error(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  chooseMethod,TResult? Function( String email,  bool isValid,  String? errorMessage)?  emailEntry,TResult? Function( String email)?  emailLinkSending,TResult? Function( String email,  int resendCountdown)?  emailLinkSent,TResult? Function( String email)?  emailLinkVerifying,TResult? Function( String email,  String password,  bool isSignUpMode,  String? errorMessage)?  emailPasswordEntry,TResult? Function( String email)?  emailPasswordSubmitting,TResult? Function()?  googleSigningIn,TResult? Function( User user)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _ChooseMethod() when chooseMethod != null:
return chooseMethod();case _EmailEntry() when emailEntry != null:
return emailEntry(_that.email,_that.isValid,_that.errorMessage);case _EmailLinkSending() when emailLinkSending != null:
return emailLinkSending(_that.email);case _EmailLinkSent() when emailLinkSent != null:
return emailLinkSent(_that.email,_that.resendCountdown);case _EmailLinkVerifying() when emailLinkVerifying != null:
return emailLinkVerifying(_that.email);case _EmailPasswordEntry() when emailPasswordEntry != null:
return emailPasswordEntry(_that.email,_that.password,_that.isSignUpMode,_that.errorMessage);case _EmailPasswordSubmitting() when emailPasswordSubmitting != null:
return emailPasswordSubmitting(_that.email);case _GoogleSigningIn() when googleSigningIn != null:
return googleSigningIn();case _Success() when success != null:
return success(_that.user);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _ChooseMethod implements LoginFormState {
  const _ChooseMethod();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChooseMethod);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginFormState.chooseMethod()';
}


}




/// @nodoc


class _EmailEntry implements LoginFormState {
  const _EmailEntry({required this.email, required this.isValid, this.errorMessage});
  

 final  String email;
 final  bool isValid;
 final  String? errorMessage;

/// Create a copy of LoginFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmailEntryCopyWith<_EmailEntry> get copyWith => __$EmailEntryCopyWithImpl<_EmailEntry>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmailEntry&&(identical(other.email, email) || other.email == email)&&(identical(other.isValid, isValid) || other.isValid == isValid)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,email,isValid,errorMessage);

@override
String toString() {
  return 'LoginFormState.emailEntry(email: $email, isValid: $isValid, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$EmailEntryCopyWith<$Res> implements $LoginFormStateCopyWith<$Res> {
  factory _$EmailEntryCopyWith(_EmailEntry value, $Res Function(_EmailEntry) _then) = __$EmailEntryCopyWithImpl;
@useResult
$Res call({
 String email, bool isValid, String? errorMessage
});




}
/// @nodoc
class __$EmailEntryCopyWithImpl<$Res>
    implements _$EmailEntryCopyWith<$Res> {
  __$EmailEntryCopyWithImpl(this._self, this._then);

  final _EmailEntry _self;
  final $Res Function(_EmailEntry) _then;

/// Create a copy of LoginFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? isValid = null,Object? errorMessage = freezed,}) {
  return _then(_EmailEntry(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _EmailLinkSending implements LoginFormState {
  const _EmailLinkSending({required this.email});
  

 final  String email;

/// Create a copy of LoginFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmailLinkSendingCopyWith<_EmailLinkSending> get copyWith => __$EmailLinkSendingCopyWithImpl<_EmailLinkSending>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmailLinkSending&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'LoginFormState.emailLinkSending(email: $email)';
}


}

/// @nodoc
abstract mixin class _$EmailLinkSendingCopyWith<$Res> implements $LoginFormStateCopyWith<$Res> {
  factory _$EmailLinkSendingCopyWith(_EmailLinkSending value, $Res Function(_EmailLinkSending) _then) = __$EmailLinkSendingCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class __$EmailLinkSendingCopyWithImpl<$Res>
    implements _$EmailLinkSendingCopyWith<$Res> {
  __$EmailLinkSendingCopyWithImpl(this._self, this._then);

  final _EmailLinkSending _self;
  final $Res Function(_EmailLinkSending) _then;

/// Create a copy of LoginFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(_EmailLinkSending(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _EmailLinkSent implements LoginFormState {
  const _EmailLinkSent({required this.email, required this.resendCountdown});
  

 final  String email;
 final  int resendCountdown;

/// Create a copy of LoginFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmailLinkSentCopyWith<_EmailLinkSent> get copyWith => __$EmailLinkSentCopyWithImpl<_EmailLinkSent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmailLinkSent&&(identical(other.email, email) || other.email == email)&&(identical(other.resendCountdown, resendCountdown) || other.resendCountdown == resendCountdown));
}


@override
int get hashCode => Object.hash(runtimeType,email,resendCountdown);

@override
String toString() {
  return 'LoginFormState.emailLinkSent(email: $email, resendCountdown: $resendCountdown)';
}


}

/// @nodoc
abstract mixin class _$EmailLinkSentCopyWith<$Res> implements $LoginFormStateCopyWith<$Res> {
  factory _$EmailLinkSentCopyWith(_EmailLinkSent value, $Res Function(_EmailLinkSent) _then) = __$EmailLinkSentCopyWithImpl;
@useResult
$Res call({
 String email, int resendCountdown
});




}
/// @nodoc
class __$EmailLinkSentCopyWithImpl<$Res>
    implements _$EmailLinkSentCopyWith<$Res> {
  __$EmailLinkSentCopyWithImpl(this._self, this._then);

  final _EmailLinkSent _self;
  final $Res Function(_EmailLinkSent) _then;

/// Create a copy of LoginFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? resendCountdown = null,}) {
  return _then(_EmailLinkSent(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,resendCountdown: null == resendCountdown ? _self.resendCountdown : resendCountdown // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _EmailLinkVerifying implements LoginFormState {
  const _EmailLinkVerifying({required this.email});
  

 final  String email;

/// Create a copy of LoginFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmailLinkVerifyingCopyWith<_EmailLinkVerifying> get copyWith => __$EmailLinkVerifyingCopyWithImpl<_EmailLinkVerifying>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmailLinkVerifying&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'LoginFormState.emailLinkVerifying(email: $email)';
}


}

/// @nodoc
abstract mixin class _$EmailLinkVerifyingCopyWith<$Res> implements $LoginFormStateCopyWith<$Res> {
  factory _$EmailLinkVerifyingCopyWith(_EmailLinkVerifying value, $Res Function(_EmailLinkVerifying) _then) = __$EmailLinkVerifyingCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class __$EmailLinkVerifyingCopyWithImpl<$Res>
    implements _$EmailLinkVerifyingCopyWith<$Res> {
  __$EmailLinkVerifyingCopyWithImpl(this._self, this._then);

  final _EmailLinkVerifying _self;
  final $Res Function(_EmailLinkVerifying) _then;

/// Create a copy of LoginFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(_EmailLinkVerifying(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _EmailPasswordEntry implements LoginFormState {
  const _EmailPasswordEntry({required this.email, required this.password, required this.isSignUpMode, this.errorMessage});
  

 final  String email;
 final  String password;
 final  bool isSignUpMode;
 final  String? errorMessage;

/// Create a copy of LoginFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmailPasswordEntryCopyWith<_EmailPasswordEntry> get copyWith => __$EmailPasswordEntryCopyWithImpl<_EmailPasswordEntry>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmailPasswordEntry&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.isSignUpMode, isSignUpMode) || other.isSignUpMode == isSignUpMode)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,email,password,isSignUpMode,errorMessage);

@override
String toString() {
  return 'LoginFormState.emailPasswordEntry(email: $email, password: $password, isSignUpMode: $isSignUpMode, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$EmailPasswordEntryCopyWith<$Res> implements $LoginFormStateCopyWith<$Res> {
  factory _$EmailPasswordEntryCopyWith(_EmailPasswordEntry value, $Res Function(_EmailPasswordEntry) _then) = __$EmailPasswordEntryCopyWithImpl;
@useResult
$Res call({
 String email, String password, bool isSignUpMode, String? errorMessage
});




}
/// @nodoc
class __$EmailPasswordEntryCopyWithImpl<$Res>
    implements _$EmailPasswordEntryCopyWith<$Res> {
  __$EmailPasswordEntryCopyWithImpl(this._self, this._then);

  final _EmailPasswordEntry _self;
  final $Res Function(_EmailPasswordEntry) _then;

/// Create a copy of LoginFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,Object? isSignUpMode = null,Object? errorMessage = freezed,}) {
  return _then(_EmailPasswordEntry(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,isSignUpMode: null == isSignUpMode ? _self.isSignUpMode : isSignUpMode // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _EmailPasswordSubmitting implements LoginFormState {
  const _EmailPasswordSubmitting({required this.email});
  

 final  String email;

/// Create a copy of LoginFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmailPasswordSubmittingCopyWith<_EmailPasswordSubmitting> get copyWith => __$EmailPasswordSubmittingCopyWithImpl<_EmailPasswordSubmitting>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmailPasswordSubmitting&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'LoginFormState.emailPasswordSubmitting(email: $email)';
}


}

/// @nodoc
abstract mixin class _$EmailPasswordSubmittingCopyWith<$Res> implements $LoginFormStateCopyWith<$Res> {
  factory _$EmailPasswordSubmittingCopyWith(_EmailPasswordSubmitting value, $Res Function(_EmailPasswordSubmitting) _then) = __$EmailPasswordSubmittingCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class __$EmailPasswordSubmittingCopyWithImpl<$Res>
    implements _$EmailPasswordSubmittingCopyWith<$Res> {
  __$EmailPasswordSubmittingCopyWithImpl(this._self, this._then);

  final _EmailPasswordSubmitting _self;
  final $Res Function(_EmailPasswordSubmitting) _then;

/// Create a copy of LoginFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(_EmailPasswordSubmitting(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _GoogleSigningIn implements LoginFormState {
  const _GoogleSigningIn();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoogleSigningIn);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginFormState.googleSigningIn()';
}


}




/// @nodoc


class _Success implements LoginFormState {
  const _Success(this.user);
  

 final  User user;

/// Create a copy of LoginFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'LoginFormState.success(user: $user)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $LoginFormStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of LoginFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_Success(
null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of LoginFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class _Error implements LoginFormState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of LoginFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'LoginFormState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $LoginFormStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of LoginFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
