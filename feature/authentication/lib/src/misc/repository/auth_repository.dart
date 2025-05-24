import 'package:authentication/src/misc/entity/user.dart';
import 'package:authentication/src/misc/mapper/auth_mapper.dart';
import 'package:authentication/src/misc/network/auth_service.dart';
import 'package:dependency_injection/dependency_injection.dart';

class AuthRepository {
  final AuthService _authService = locator<AuthService>();
  final AuthMapper _authMapper = locator<AuthMapper>();

  Future<User> login() async {
    final response = await _authService.login();
    return _authMapper.getUserFromResponse(response);
  }
}
