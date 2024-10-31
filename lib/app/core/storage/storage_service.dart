import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  // Save token to SecureStorage
  Future<void> saveToken(String token) async {
    await _secureStorage.write(key: 'auth_token', value: token);
  }

  // Get token from SecureStorage
  Future<String?> getToken() async {
    return await _secureStorage.read(key: 'auth_token');
  }

  // Delete token from SecureStorage
  Future<void> deleteToken() async {
    await _secureStorage.delete(key: 'auth_token');
  }

  // Save user_id to SecureStorage
  Future<void> saveUserId(String userId) async {
    await _secureStorage.write(key: 'user_id', value: userId);
  }

  // Get user_id from SecureStorage
  Future<String?> getUserId() async {
    return await _secureStorage.read(key: 'user_id');
  }

  // Delete user_id from SecureStorage
  Future<void> deleteUserId() async {
    await _secureStorage.delete(key: 'user_id');
  }

  // Save login status to SharedPreferences
  Future<void> setLoginStatus(bool status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('is_logged_in', status);
  }

  // Get login status from SharedPreferences
  Future<bool> getLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('is_logged_in') ?? false;
  }
}
