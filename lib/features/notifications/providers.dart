import 'package:ahara/core/network/api_client.dart';
import 'package:ahara/features/notifications/data/notifications_remote_datasource.dart';
import 'package:ahara/features/notifications/data/notifications_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

/// Provides the [NotificationsRemoteDataSource] backed by [apiClientProvider].
@riverpod
NotificationsRemoteDataSource notificationsRemoteDataSource(Ref ref) =>
    NotificationsRemoteDataSource(ref.read(apiClientProvider));

/// Provides the [NotificationsRepository].
@riverpod
NotificationsRepository notificationsRepository(Ref ref) =>
    NotificationsRepository(ref.read(notificationsRemoteDataSourceProvider));
