import 'package:authentication/src/misc/repository/auth_repository.dart';
import 'package:dependency_injection/dependency_injection.dart';
import 'package:domain/domain.dart';
import 'package:storage/storage.dart';

class AuthUseCase {
  final AuthRepository _authRepository = locator<AuthRepository>();
  final GeneralStorage _generalStorage = locator<GeneralStorage>();

  Future<User> login() async {
    final user = await _authRepository.login();
    await _generalStorage.saveUserLoginStatus(isLoggedIn: true);
    return user;
  }
}
