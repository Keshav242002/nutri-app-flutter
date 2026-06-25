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
  const ProfileRepository({required ProfileRemoteDataSource dataSource})
    : _ds = dataSource;

  final ProfileRemoteDataSource _ds;

  /// Fetches the authenticated user's dietary profile.
  Future<Result<DietaryProfile>> getMe() => _wrap(_ds.getMe);

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
