// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provides the [ChatRemoteDataSource] backed by [apiClientProvider].

@ProviderFor(chatRemoteDataSource)
final chatRemoteDataSourceProvider = ChatRemoteDataSourceProvider._();

/// Provides the [ChatRemoteDataSource] backed by [apiClientProvider].

final class ChatRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          ChatRemoteDataSource,
          ChatRemoteDataSource,
          ChatRemoteDataSource
        >
    with $Provider<ChatRemoteDataSource> {
  /// Provides the [ChatRemoteDataSource] backed by [apiClientProvider].
  ChatRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chatRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chatRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<ChatRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ChatRemoteDataSource create(Ref ref) {
    return chatRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ChatRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChatRemoteDataSource>(value),
    );
  }
}

String _$chatRemoteDataSourceHash() =>
    r'c1a2b3d4e5f60718293a4b5c6d7e8f9012345678';

/// Provides the [ChatRepository].

@ProviderFor(chatRepository)
final chatRepositoryProvider = ChatRepositoryProvider._();

/// Provides the [ChatRepository].

final class ChatRepositoryProvider
    extends $FunctionalProvider<ChatRepository, ChatRepository, ChatRepository>
    with $Provider<ChatRepository> {
  /// Provides the [ChatRepository].
  ChatRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chatRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chatRepositoryHash();

  @$internal
  @override
  $ProviderElement<ChatRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ChatRepository create(Ref ref) {
    return chatRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ChatRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChatRepository>(value),
    );
  }
}

String _$chatRepositoryHash() => r'd2b3c4e5f60718293a4b5c6d7e8f901234567890';
