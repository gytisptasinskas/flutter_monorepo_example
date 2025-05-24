import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:storage/storage_keys.dart';

class SecureStorage {
  final _secureStorage = const FlutterSecureStorage();

  Future<void> saveUserName({required String userName}) =>
      _secureStorage.write(key: StorageKeys.userName, value: userName);
}
