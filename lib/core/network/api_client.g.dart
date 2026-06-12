// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provides the configured [Dio] HTTP client.
///
/// Per FLUTTER_SPEC.json#api_integration.http_client:
/// - Single instance, exposed as [apiClientProvider].
/// - BaseOptions: connectTimeout=15s, receiveTimeout=30s.
/// - Base URL from [Env] config.
/// - Interceptors: AuthInterceptor, ErrorInterceptor, LogInterceptor.

@ProviderFor(apiClient)
final apiClientProvider = ApiClientProvider._();

/// Provides the configured [Dio] HTTP client.
///
/// Per FLUTTER_SPEC.json#api_integration.http_client:
/// - Single instance, exposed as [apiClientProvider].
/// - BaseOptions: connectTimeout=15s, receiveTimeout=30s.
/// - Base URL from [Env] config.
/// - Interceptors: AuthInterceptor, ErrorInterceptor, LogInterceptor.

final class ApiClientProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  /// Provides the configured [Dio] HTTP client.
  ///
  /// Per FLUTTER_SPEC.json#api_integration.http_client:
  /// - Single instance, exposed as [apiClientProvider].
  /// - BaseOptions: connectTimeout=15s, receiveTimeout=30s.
  /// - Base URL from [Env] config.
  /// - Interceptors: AuthInterceptor, ErrorInterceptor, LogInterceptor.
  ApiClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'apiClientProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$apiClientHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return apiClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$apiClientHash() => r'e18529de409353598b7a2aeaadf6ef3365c29da5';
