import 'package:shared_preferences/shared_preferences.dart';
import 'package:storage/storage_keys.dart';

class GeneralStorage {
  final SharedPreferencesAsync _sharedPreferences = SharedPreferencesAsync();

  Future<void> saveUserLoginStatus({required bool isLoggedIn}) =>
      _sharedPreferences.setBool(StorageKeys.isLoggedIn, isLoggedIn);
}
