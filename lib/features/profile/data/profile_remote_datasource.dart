import 'dart:developer' as dev;

import 'package:ahara/core/network/envelope.dart';
import 'package:ahara/features/onboarding/domain/models/dietary_profile.dart';
import 'package:dio/dio.dart';

/// Transport layer for the profile feature — wraps [Dio] for the
/// `/profiles/me` endpoint. Transport only; no business rules.
class ProfileRemoteDataSource {
  /// Creates a [ProfileRemoteDataSource].
  const ProfileRemoteDataSource({required Dio dio}) : _dio = dio;

  final Dio _dio;

  /// Calls `GET /api/v1/profiles/me`.
  Future<DietaryProfile> getMe() async {
    final response = await _dio.get<Map<String, dynamic>>('/profiles/me');
    dev.log('GET /profiles/me → ${response.data}', name: 'API');
    return EnvelopeParser.parseSuccess(response.data!, DietaryProfile.fromJson);
  }

  /// Calls `PATCH /api/v1/profiles/me` with only the changed fields.
  ///
  /// [changes] is a snake_case map; the backend applies a partial update and
  /// recomputes macro targets, returning the full profile.
  Future<DietaryProfile> patchMe(Map<String, dynamic> changes) async {
    final response = await _dio.patch<Map<String, dynamic>>(
      '/profiles/me',
      data: changes,
    );
    dev.log('PATCH /profiles/me → ${response.data}', name: 'API');
    return EnvelopeParser.parseSuccess(response.data!, DietaryProfile.fromJson);
  }
}
