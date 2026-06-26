import 'package:ahara/core/cache/cache_service.dart';
import 'package:ahara/core/cache/cached_fetch.dart';
import 'package:ahara/core/network/api_exceptions.dart';
import 'package:ahara/core/utils/result.dart';
import 'package:ahara/features/onboarding/domain/models/dietary_profile.dart';
import 'package:ahara/features/profile/data/profile_remote_datasource.dart';
import 'package:dio/dio.dart';

/// Business-logic boundary for the profile feature.
///
/// All methods return [Result<T>] — no raw exceptions escape this layer.
class ProfileRepository {
  /// Creates a [ProfileRepository].
  const ProfileRepository({
    required ProfileRemoteDataSource dataSource,
    required CacheService cache,
  })  : _ds = dataSource,
        _cache = cache;

  final ProfileRemoteDataSource _ds;
  final CacheService _cache;

  /// Fetches the authenticated user's dietary profile. Cached for offline use.
  Future<Result<DietaryProfile>> getMe() => cachedFetch(
        cache: _cache,
        key: 'profile:me',
        fetch: _ds.getMe,
        toJson: (v) => v.toJson(),
        fromJson: DietaryProfile.fromJson,
      );

  /// Partially updates the profile with the given snake_case [changes].
  Future<Result<DietaryProfile>> updateProfile(Map<String, dynamic> changes) =>
      _wrap(() => _ds.patchMe(changes));

  Future<Result<T>> _wrap<T>(Future<T> Function() call) async {
    try {
      return Success(await call());
    } on AppException catch (e) {
      return Failure(e);
    } on DioException catch (e) {
      final err = e.error;
      return Failure(
        err is AppException ? err : UnknownException(message: e.message ?? ''),
      );
    } on Object catch (e) {
      return Failure(UnknownException(message: e.toString()));
    }
  }
}
