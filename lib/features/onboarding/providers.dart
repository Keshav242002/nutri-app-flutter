import 'package:ahara/core/network/api_client.dart';
import 'package:ahara/features/onboarding/data/onboarding_remote_datasource.dart';
import 'package:ahara/features/onboarding/data/onboarding_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

/// Provides [OnboardingRemoteDataSource] wired to the Dio client.
@riverpod
OnboardingRemoteDataSource onboardingRemoteDataSource(Ref ref) {
  return OnboardingRemoteDataSource(dio: ref.watch(apiClientProvider));
}

/// Provides [OnboardingRepository] backed by [OnboardingRemoteDataSource].
@riverpod
OnboardingRepository onboardingRepository(Ref ref) {
  return OnboardingRepository(
    dataSource: ref.watch(onboardingRemoteDataSourceProvider),
  );
}
