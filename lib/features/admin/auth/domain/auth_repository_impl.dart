import '../../../../core/security/admin_credentials.dart';
import '../data/auth_local_datasource.dart';
import '../domain/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl(this.localDataSource);

  @override
  Future<bool> login({
    required String username,
    required String specialId,
    required String password,
  }) async {
    if (username == AdminCredentials.username &&
        specialId == AdminCredentials.specialId &&
        password == AdminCredentials.password) {
      await localDataSource.saveLogin();
      return true;
    }

    return false;
  }

  @override
  Future<void> logout() async {
    await localDataSource.clearLogin();
  }

  @override
  Future<bool> isLoggedIn() async {
    return localDataSource.isLoggedIn();
  }
}