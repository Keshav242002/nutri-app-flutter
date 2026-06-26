import 'package:ahara/core/cache/cache_service.dart';
import 'package:ahara/core/network/api_client.dart';
import 'package:ahara/features/profile/data/profile_remote_datasource.dart';
import 'package:ahara/features/profile/data/profile_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

/// Provides the [ProfileRemoteDataSource] backed by [apiClientProvider].
@riverpod
ProfileRemoteDataSource profileRemoteDataSource(Ref ref) =>
    ProfileRemoteDataSource(dio: ref.read(apiClientProvider));

/// Provides the [ProfileRepository].
@riverpod
ProfileRepository profileRepository(Ref ref) => ProfileRepository(
      dataSource: ref.read(profileRemoteDataSourceProvider),
      cache: ref.read(cacheServiceProvider),
    );
