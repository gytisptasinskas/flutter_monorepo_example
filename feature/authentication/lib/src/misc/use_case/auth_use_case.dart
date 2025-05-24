import 'package:authentication/src/misc/repository/auth_repository.dart';
import 'package:dependency_injection/dependency_injection.dart';
import 'package:storage/storage.dart';

class AuthUseCase {
  final AuthRepository _authRepository = locator<AuthRepository>();
  final GeneralStorage _generalStorage = locator<GeneralStorage>();

  Future<void> login() => _authRepository.login();

  Future<void> saveUserLogin() async {
    await _authRepository.login();
    await _generalStorage.saveUserLoginStatus(isLoggedIn: true);
  }
}
