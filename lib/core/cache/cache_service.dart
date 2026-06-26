import 'dart:convert';
import 'dart:developer' as dev;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

/// Name of the Hive box backing the offline read-cache.
const String kApiCacheBoxName = 'api_cache';

/// Persistent read-only cache for API GET responses.
///
/// Stores the last-known JSON payload for a given cache key so screens can
/// render stale data when the device is offline. Writes (POST/PATCH) are never
/// cached — they are blocked while offline at the controller layer.
///
/// Values are stored as JSON strings keyed by a stable, endpoint-derived key
/// (see callers in the feature repositories).
class CacheService {
  /// Creates a [CacheService] backed by an already-open Hive box.
  const CacheService(this._box);

  final Box<String> _box;

  /// Writes [json] (a Map or List) under [key], replacing any prior value.
  Future<void> write(String key, Object json) async {
    try {
      await _box.put(key, jsonEncode(json));
    } on Object catch (e) {
      dev.log('cache write failed for "$key": $e', name: 'CACHE');
    }
  }

  /// Reads a cached JSON object under [key], or `null` if absent/corrupt.
  Map<String, dynamic>? readMap(String key) {
    final raw = _box.get(key);
    if (raw == null) return null;
    try {
      final decoded = jsonDecode(raw);
      return decoded is Map<String, dynamic> ? decoded : null;
    } on Object catch (e) {
      dev.log('cache readMap failed for "$key": $e', name: 'CACHE');
      return null;
    }
  }

  /// Reads a cached JSON array under [key], or `null` if absent/corrupt.
  List<dynamic>? readList(String key) {
    final raw = _box.get(key);
    if (raw == null) return null;
    try {
      final decoded = jsonDecode(raw);
      return decoded is List ? decoded : null;
    } on Object catch (e) {
      dev.log('cache readList failed for "$key": $e', name: 'CACHE');
      return null;
    }
  }
}

/// Provides the app-wide [CacheService].
///
/// Overridden in `main()` with an instance bound to the opened Hive box.
/// Accessing it without that override throws — the box must be opened first.
final cacheServiceProvider = Provider<CacheService>(
  (ref) => throw StateError(
    'cacheServiceProvider must be overridden in main() with an open box',
  ),
);
