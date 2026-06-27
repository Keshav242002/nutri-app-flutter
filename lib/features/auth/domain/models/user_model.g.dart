// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: (json['id'] as num?)?.toInt() ?? 0,
  email: json['email'] as String? ?? '',
  firebaseUid: json['firebase_uid'] as String? ?? '',
  displayName: json['display_name'] as String? ?? '',
  hasProfile: json['has_profile'] as bool? ?? false,
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'firebase_uid': instance.firebaseUid,
  'display_name': instance.displayName,
  'has_profile': instance.hasProfile,
};
