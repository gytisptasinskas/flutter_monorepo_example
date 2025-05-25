import 'dart:convert';

import 'package:domain/domain.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:storage/storage_keys.dart';

class SecureStorage {
  final _secureStorage = const FlutterSecureStorage();

  Future<void> saveUserName({required String userName}) =>
      _secureStorage.write(key: StorageKeys.userName, value: userName);

  Future<void> saveUser(User user) async {
    await _secureStorage.write(
      key: StorageKeys.user,
      value: jsonEncode(user.toJson()),
    );
  }

  Future<User?> getUser() async {
    final userData = await _secureStorage.read(key: StorageKeys.user);
    if (userData == null) {
      return null;
    }
    final userMap = jsonDecode(userData) as Map<String, dynamic>;
    return User.fromJson(userMap);
  }

  Future<void> clearUserData() async {
    await _secureStorage.delete(key: StorageKeys.userName);
  }
}
