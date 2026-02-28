import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/auth_repository.dart';
import 'auth_provider.dart';

final authControllerProvider =
NotifierProvider<AuthController, AsyncValue<bool>>(
  AuthController.new,
);

class AuthController extends Notifier<AsyncValue<bool>> {
  late final AuthRepository _repository;

  @override
  AsyncValue<bool> build() {
    _repository = ref.read(authRepositoryProvider);
    _checkSession();
    return const AsyncValue.loading();
  }

  Future<void> _checkSession() async {
    final loggedIn = await _repository.isLoggedIn();
    state = AsyncValue.data(loggedIn);
  }

  Future<bool> login({
    required String username,
    required String specialId,
    required String password,
  }) async {
    state = const AsyncValue.loading();

    try {
      final result = await _repository.login(
        username: username,
        specialId: specialId,
        password: password,
      );

      state = AsyncValue.data(result);
      return result;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }

  Future<void> logout() async {
    await _repository.logout();
    state = const AsyncValue.data(false);
  }
}