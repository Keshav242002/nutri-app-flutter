import 'package:ahara/core/network/api_client.dart';
import 'package:ahara/features/dashboard/data/dashboard_remote_datasource.dart';
import 'package:ahara/features/dashboard/data/dashboard_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

/// Provides the [DashboardRemoteDataSource] backed by [apiClientProvider].
@riverpod
DashboardRemoteDataSource dashboardRemoteDataSource(Ref ref) =>
    DashboardRemoteDataSource(ref.read(apiClientProvider));

/// Provides the [DashboardRepository].
@riverpod
DashboardRepository dashboardRepository(Ref ref) =>
    DashboardRepository(ref.read(dashboardRemoteDataSourceProvider));
