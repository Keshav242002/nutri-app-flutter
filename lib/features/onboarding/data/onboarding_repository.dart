import 'package:ahara/core/network/api_exceptions.dart';
import 'package:ahara/core/utils/result.dart';
import 'package:ahara/features/onboarding/data/onboarding_remote_datasource.dart';
import 'package:ahara/features/onboarding/domain/models/dietary_profile.dart';
import 'package:ahara/features/onboarding/domain/models/onboarding_form_data.dart';
import 'package:ahara/features/onboarding/domain/models/questionnaire.dart';
import 'package:dio/dio.dart';

/// Business-logic boundary for onboarding.
///
/// All methods return [Result<T>] — no raw exceptions escape this layer.
class OnboardingRepository {
  /// Creates an [OnboardingRepository].
  const OnboardingRepository({required OnboardingRemoteDataSource dataSource})
    : _ds = dataSource;

  final OnboardingRemoteDataSource _ds;

  /// Fetches the questionnaire metadata.
  Future<Result<Questionnaire>> getQuestions() => _wrap(_ds.getQuestions);

  /// Submits the completed dietary profile form.
  Future<Result<DietaryProfile>> submitProfile(OnboardingFormData form) =>
      _wrap(() => _ds.submitProfile(form));

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
