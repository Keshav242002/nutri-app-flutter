import 'package:ahara/core/cache/cache_service.dart';
import 'package:ahara/core/network/api_exceptions.dart';
import 'package:ahara/core/utils/result.dart';
import 'package:dio/dio.dart';

/// Whether a failure represents "we couldn't reach the server" — the only
/// case where falling back to cached data is appropriate. A 404/401/validation
/// error is a real answer from the server, not an offline condition.
bool _isOffline(AppException e) =>
    e is NetworkException || e is TimeoutException;

AppException _asAppException(Object e) {
  if (e is AppException) return e;
  if (e is DioException) {
    final inner = e.error;
    return inner is AppException
        ? inner
        : UnknownException(message: e.message ?? '');
  }
  return UnknownException(message: e.toString());
}

/// Fetches an object via [fetch], caching the JSON on success and falling back
/// to the last cached copy under [key] when the device is offline.
///
/// On success → writes cache, returns `Success`. On an offline error with a
/// cached copy → returns the cached `Success`. Otherwise → `Failure`.
Future<Result<T>> cachedFetch<T>({
  required CacheService cache,
  required String key,
  required Future<T> Function() fetch,
  required Map<String, dynamic> Function(T value) toJson,
  required T Function(Map<String, dynamic> json) fromJson,
}) async {
  try {
    final data = await fetch();
    await cache.write(key, toJson(data));
    return Success(data);
  } on Object catch (e) {
    final mapped = _asAppException(e);
    if (_isOffline(mapped)) {
      final cached = cache.readMap(key);
      if (cached != null) return Success(fromJson(cached));
    }
    return Failure(mapped);
  }
}

/// List variant of [cachedFetch] — caches/restores a JSON array under [key].
Future<Result<List<T>>> cachedFetchList<T>({
  required CacheService cache,
  required String key,
  required Future<List<T>> Function() fetch,
  required Map<String, dynamic> Function(T value) toJson,
  required T Function(Map<String, dynamic> json) fromJson,
}) async {
  try {
    final data = await fetch();
    await cache.write(key, data.map(toJson).toList());
    return Success(data);
  } on Object catch (e) {
    final mapped = _asAppException(e);
    if (_isOffline(mapped)) {
      final cached = cache.readList(key);
      if (cached != null) {
        return Success(
          cached
              .whereType<Map<String, dynamic>>()
              .map(fromJson)
              .toList(),
        );
      }
    }
    return Failure(mapped);
  }
}
