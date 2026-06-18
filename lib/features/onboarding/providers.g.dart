// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provides [OnboardingRemoteDataSource] wired to the Dio client.

@ProviderFor(onboardingRemoteDataSource)
final onboardingRemoteDataSourceProvider =
    OnboardingRemoteDataSourceProvider._();

/// Provides [OnboardingRemoteDataSource] wired to the Dio client.

final class OnboardingRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          OnboardingRemoteDataSource,
          OnboardingRemoteDataSource,
          OnboardingRemoteDataSource
        >
    with $Provider<OnboardingRemoteDataSource> {
  /// Provides [OnboardingRemoteDataSource] wired to the Dio client.
  OnboardingRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'onboardingRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$onboardingRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<OnboardingRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  OnboardingRemoteDataSource create(Ref ref) {
    return onboardingRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OnboardingRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OnboardingRemoteDataSource>(value),
    );
  }
}

String _$onboardingRemoteDataSourceHash() =>
    r'ea4c1c87ad0ece91d310f6bc94af80e0a125c837';

/// Provides [OnboardingRepository] backed by [OnboardingRemoteDataSource].

@ProviderFor(onboardingRepository)
final onboardingRepositoryProvider = OnboardingRepositoryProvider._();

/// Provides [OnboardingRepository] backed by [OnboardingRemoteDataSource].

final class OnboardingRepositoryProvider
    extends
        $FunctionalProvider<
          OnboardingRepository,
          OnboardingRepository,
          OnboardingRepository
        >
    with $Provider<OnboardingRepository> {
  /// Provides [OnboardingRepository] backed by [OnboardingRemoteDataSource].
  OnboardingRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'onboardingRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$onboardingRepositoryHash();

  @$internal
  @override
  $ProviderElement<OnboardingRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  OnboardingRepository create(Ref ref) {
    return onboardingRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OnboardingRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OnboardingRepository>(value),
    );
  }
}

String _$onboardingRepositoryHash() =>
    r'8be93de666dc42d5abf069f90a26297451b67e51';
