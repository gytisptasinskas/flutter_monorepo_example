import 'package:dependency_injection/dependency_injection.dart';
import 'package:domain/domain.dart';
import 'package:rxdart/rxdart.dart';
import 'package:storage/secure_storage.dart';

class CurrentUserState {
  final SecureStorage _secureStorage = locator<SecureStorage>();
  final BehaviorSubject<User?> _userSubject = BehaviorSubject<User?>();

  Stream<User?> get userStream => _userSubject.stream;

  User? get currentUser => _userSubject.valueOrNull;

  Future<void> setUser(User user) async {
    _userSubject.add(user);
    await _secureStorage.saveUser(user);
  }

  Future<void> clearUser() async {
    _userSubject.add(null);
    await _secureStorage.clearUserData();
  }

  void dispose() {
    _userSubject.close();
  }
}
