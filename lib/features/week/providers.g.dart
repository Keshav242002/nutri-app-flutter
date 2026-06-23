// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provides the [WeekRemoteDatasource] backed by [apiClientProvider].

@ProviderFor(weekRemoteDatasource)
final weekRemoteDatasourceProvider = WeekRemoteDatasourceProvider._();

/// Provides the [WeekRemoteDatasource] backed by [apiClientProvider].

final class WeekRemoteDatasourceProvider
    extends
        $FunctionalProvider<
          WeekRemoteDatasource,
          WeekRemoteDatasource,
          WeekRemoteDatasource
        >
    with $Provider<WeekRemoteDatasource> {
  /// Provides the [WeekRemoteDatasource] backed by [apiClientProvider].
  WeekRemoteDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'weekRemoteDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$weekRemoteDatasourceHash();

  @$internal
  @override
  $ProviderElement<WeekRemoteDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WeekRemoteDatasource create(Ref ref) {
    return weekRemoteDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WeekRemoteDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WeekRemoteDatasource>(value),
    );
  }
}

String _$weekRemoteDatasourceHash() =>
    r'7184593754a7e872cd1893326d82175dd3472150';

/// Provides the [WeekRepository].

@ProviderFor(weekRepository)
final weekRepositoryProvider = WeekRepositoryProvider._();

/// Provides the [WeekRepository].

final class WeekRepositoryProvider
    extends $FunctionalProvider<WeekRepository, WeekRepository, WeekRepository>
    with $Provider<WeekRepository> {
  /// Provides the [WeekRepository].
  WeekRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'weekRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$weekRepositoryHash();

  @$internal
  @override
  $ProviderElement<WeekRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  WeekRepository create(Ref ref) {
    return weekRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WeekRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WeekRepository>(value),
    );
  }
}

String _$weekRepositoryHash() => r'a27f15e583ad0dc2e464313541013c68599d7789';
