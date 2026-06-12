// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: (json['id'] as num).toInt(),
  email: json['email'] as String,
  firebaseUid: json['firebaseUid'] as String,
  displayName: json['displayName'] as String,
  hasProfile: json['hasProfile'] as bool,
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'firebaseUid': instance.firebaseUid,
  'displayName': instance.displayName,
  'hasProfile': instance.hasProfile,
};
