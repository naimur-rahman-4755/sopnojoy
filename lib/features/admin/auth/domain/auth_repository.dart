abstract class AuthRepository {
  Future<bool> login({
    required String username,
    required String specialId,
    required String password,
  });

  Future<void> logout();

  Future<bool> isLoggedIn();
}