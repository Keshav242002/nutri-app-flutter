import 'package:ahara/core/network/api_exceptions.dart';
import 'package:flutter/foundation.dart';

/// A sealed type representing either a successful value or a failure.
///
/// Used at the repository boundary per CLAUDE.md §5:
/// - Repositories return `Result<T>`.
/// - Controllers unwrap: `Success → AsyncData`, `Failure → AsyncError`.
/// - No raw exceptions escape past the repository layer.
sealed class Result<T> {
  const Result();

  /// Whether this result is a [Success].
  bool get isSuccess => this is Success<T>;

  /// Whether this result is a [Failure].
  bool get isFailure => this is Failure<T>;

  /// Maps a [Success] value using [transform], passes [Failure] through.
  Result<R> map<R>(R Function(T data) transform) {
    return switch (this) {
      Success<T>(:final data) => Success(transform(data)),
      Failure<T>(:final exception) => Failure(exception),
    };
  }

  /// Folds the result into a single value.
  R when<R>({
    required R Function(T data) success,
    required R Function(AppException exception) failure,
  }) {
    return switch (this) {
      Success<T>(:final data) => success(data),
      Failure<T>(:final exception) => failure(exception),
    };
  }
}

/// A successful result wrapping [data].
@immutable
final class Success<T> extends Result<T> {
  /// Creates a successful result.
  const Success(this.data);

  /// The success value.
  final T data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Success<T> && other.data == data;

  @override
  int get hashCode => data.hashCode;

  @override
  String toString() => 'Success($data)';
}

/// A failed result wrapping an [AppException].
@immutable
final class Failure<T> extends Result<T> {
  /// Creates a failure result.
  const Failure(this.exception);

  /// The exception describing what went wrong.
  final AppException exception;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Failure<T> && other.exception == exception;

  @override
  int get hashCode => exception.hashCode;

  @override
  String toString() => 'Failure($exception)';
}
