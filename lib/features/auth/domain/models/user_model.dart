import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

/// Authenticated Ahara user.
@freezed
abstract class User with _$User {
  /// Creates a [User].
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory User({
    required int id,
    required String email,
    required String firebaseUid,
    required String displayName,
    required bool hasProfile,
  }) = _User;

  /// Deserialises from the `GET /auth/me` response `data` field.
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
