import 'package:authentication/src/misc/use_case/auth_use_case.dart';
import 'package:dependency_injection/dependency_injection.dart';
import 'package:event_bus/event_bus.dart';
import 'package:event_bus/event_bus.dart' as event_bus;
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final AuthUseCase _authUseCase = locator<AuthUseCase>();
  @readonly
  bool _isLoggedIn = false;
  @readonly
  bool _isLoading = false;

  @action
  Future<void> login() async {
    try {
      _isLoading = true;
      await _authUseCase.login();
      await _authUseCase.saveUserLogin();
      event_bus.fire(const UserLoggedIn());
    } catch (e) {
      if (kDebugMode) {
        print('Login failed: $e');
      }
    } finally {
      _isLoading = false;
    }
  }
}
