import 'package:ahara/core/network/api_exceptions.dart';
import 'package:ahara/core/utils/result.dart';
import 'package:ahara/features/auth/data/auth_remote_datasource.dart';
import 'package:ahara/features/auth/data/auth_repository.dart';
import 'package:ahara/features/auth/domain/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

const _kUser = User(
  id: 1,
  email: 'user@example.com',
  firebaseUid: 'uid-123',
  displayName: 'Test User',
  hasProfile: false,
);

class _FakeDataSource extends Fake implements AuthRemoteDataSource {
  _FakeDataSource({
    this.throwOnGetMe = false,
    this.throwOnSignOut = false,
  });

  final bool throwOnGetMe;
  final bool throwOnSignOut;

  @override
  Future<User> getMe() async {
    if (throwOnGetMe) throw const NetworkException();
    return _kUser;
  }

  @override
  Future<User> register() async => _kUser;

  @override
  Future<void> signOut() async {
    if (throwOnSignOut) throw StateError('signOut failed');
  }
}

AuthRepository _repo({_FakeDataSource? ds}) =>
    AuthRepository(dataSource: ds ?? _FakeDataSource());

void main() {
  group('AuthRepository.getCurrentUser', () {
    test('returns Success(user) on datasource success', () async {
      final result = await _repo().getCurrentUser();
      expect(result, isA<Success<User>>());
      expect((result as Success<User>).data, equals(_kUser));
    });

    test('returns Failure(AppException) when datasource throws', () async {
      final result = await _repo(
        ds: _FakeDataSource(throwOnGetMe: true),
      ).getCurrentUser();
      expect(result, isA<Failure<User>>());
      expect((result as Failure<User>).exception, isA<NetworkException>());
    });
  });

  group('AuthRepository.register', () {
    test('returns Success(user) on datasource success', () async {
      final result = await _repo().register();
      expect(result, isA<Success<User>>());
    });
  });

  group('AuthRepository.signOut', () {
    test('returns Success(null) on clean sign-out', () async {
      final result = await _repo().signOut();
      expect(result, isA<Success<void>>());
    });

    test('returns Failure(UnknownException) when datasource throws', () async {
      final result = await _repo(
        ds: _FakeDataSource(throwOnSignOut: true),
      ).signOut();
      expect(result, isA<Failure<void>>());
      expect((result as Failure<void>).exception, isA<UnknownException>());
    });
  });
}
