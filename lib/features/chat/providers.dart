import 'package:ahara/core/network/api_client.dart';
import 'package:ahara/features/chat/data/chat_remote_datasource.dart';
import 'package:ahara/features/chat/data/chat_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

/// Provides the [ChatRemoteDataSource] backed by [apiClientProvider].
@riverpod
ChatRemoteDataSource chatRemoteDataSource(Ref ref) =>
    ChatRemoteDataSource(ref.read(apiClientProvider));

/// Provides the [ChatRepository].
@riverpod
ChatRepository chatRepository(Ref ref) =>
    ChatRepository(ref.read(chatRemoteDataSourceProvider));
