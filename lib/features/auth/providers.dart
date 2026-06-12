import 'package:ahara/core/network/api_client.dart';
import 'package:ahara/features/auth/data/auth_remote_datasource.dart';
import 'package:ahara/features/auth/data/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

/// Provides [AuthRemoteDataSource] wired to the Dio client.
@riverpod
AuthRemoteDataSource authRemoteDataSource(Ref ref) {
  return AuthRemoteDataSource(dio: ref.watch(apiClientProvider));
}

/// Provides [AuthRepository] backed by [AuthRemoteDataSource].
@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepository(dataSource: ref.watch(authRemoteDataSourceProvider));
}
