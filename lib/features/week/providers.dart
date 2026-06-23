import 'package:ahara/core/network/api_client.dart';
import 'package:ahara/features/week/data/week_remote_datasource.dart';
import 'package:ahara/features/week/data/week_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

/// Provides the [WeekRemoteDatasource] backed by [apiClientProvider].
@riverpod
WeekRemoteDatasource weekRemoteDatasource(Ref ref) =>
    WeekRemoteDatasource(ref.read(apiClientProvider));

/// Provides the [WeekRepository].
@riverpod
WeekRepository weekRepository(Ref ref) =>
    WeekRepository(ref.read(weekRemoteDatasourceProvider));
