import 'package:flutter/material.dart';
import 'package:justipin/app/core/services/auth_service.dart';
import 'package:justipin/app/core/storage/storage_service.dart';
import 'package:justipin/app/shared/models/user_model.dart';
import 'package:justipin/app/shared/models/driver_model.dart';
import 'package:justipin/app/shared/models/user_detail_model.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  final StorageService _storageService = StorageService();

  String? _token;
  bool _isLoggedIn = false;
  UserModel? _user;
  DriverModel? _driver;
  UserDetailModel? _userDetail;

  String? get token => _token;
  bool get isLoggedIn => _isLoggedIn;
  UserModel? get user => _user;
  DriverModel? get driver => _driver;
  UserDetailModel? get userDetail => _userDetail;

  Future<void> register(String name, String email, String password,
      String passwordConfirmation) async {
    try {
      final response = await _authService.register(
          name, email, password, passwordConfirmation);
      if (response != null && response['status'] == 'success') {
        _token = response['authorisation']['token'];
        await _storageService.saveToken(_token!);
        await _storageService.setLoginStatus(true);
        _isLoggedIn = true;

        // Save user_id to storage
        final userId = response['user']['user_id'].toString();
        await _storageService.saveUserId(userId);

        // Fetch user data
        final userData = await _authService.fetchUserData(userId, _token!);
        if (userData != null && userData['success'] == true) {
          _user = UserModel.fromJson(userData['data']);
          // print('User Role after register: ${_user?.role}');
        }

        // Check if user is a driver
        if (userData?['data']?['driver_id'] != null) {
          final driverData =
              await _authService.fetchDriverData(userId, _token!);
          if (driverData != null && driverData['success'] == true) {
            _driver = DriverModel.fromJson(driverData['data']);
          }
        } else {
          // Fetch user detail data
          final userDetailData =
              await _authService.fetchUserDetailData(userId, _token!);
          if (userDetailData != null && userDetailData['success'] == true) {
            _userDetail = UserDetailModel.fromJson(userDetailData['data']);
          }
        }

        notifyListeners();
      } else {
        throw Exception(response?['message'] ?? 'Unknown error');
      }
    } catch (e) {
      throw Exception('Registration failed: $e');
    }
  }

  Future<void> login(String email, String password) async {
    try {
      final response = await _authService.login(email, password);
      if (response != null && response['success'] == true) {
        _token = response['token'];
        await _storageService.saveToken(_token!);
        await _storageService.setLoginStatus(true);
        _isLoggedIn = true;

        // Save user_id to storage
        final userId = response['user']['user_id'].toString();
        await _storageService.saveUserId(userId);

        // Fetch user data
        final userData = await _authService.fetchUserData(userId, _token!);
        if (userData != null && userData['success'] == true) {
          _user = UserModel.fromJson(userData['data']);
          // print('User Role after login: ${_user?.role}');
        }

        // Check if user is a driver
        if (userData?['data']?['driver_id'] != null) {
          final driverData =
              await _authService.fetchDriverData(userId, _token!);
          if (driverData != null && driverData['success'] == true) {
            _driver = DriverModel.fromJson(driverData['data']);
          }
        } else {
          // Fetch user detail data
          final userDetailData =
              await _authService.fetchUserDetailData(userId, _token!);
          if (userDetailData != null && userDetailData['success'] == true) {
            _userDetail = UserDetailModel.fromJson(userDetailData['data']);
          }
        }

        notifyListeners();
      } else {
        throw Exception(response?['message'] ?? 'Unknown error');
      }
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  Future<void> checkLoginStatus() async {
    _token = await _storageService.getToken();
    _isLoggedIn = await _storageService.getLoginStatus();
    final userId = await _storageService.getUserId();

    if (_isLoggedIn && _token != null && userId != null) {
      try {
        // Fetch user data
        final userData = await _authService.fetchUserData(userId, _token!);
        if (userData != null && userData['success'] == true) {
          _user = UserModel.fromJson(userData['data']);
          // print('User Role after checkLoginStatus: ${_user?.role}');
        } else {
          // Token is invalid, logout
          await logout();
          throw Exception('Invalid token');
        }

        // Check if user is a driver
        if (userData['data']?['driver_id'] != null) {
          final driverData =
              await _authService.fetchDriverData(userId, _token!);
          if (driverData != null && driverData['success'] == true) {
            _driver = DriverModel.fromJson(driverData['data']);
          }
        } else {
          // Fetch user detail data
          final userDetailData =
              await _authService.fetchUserDetailData(userId, _token!);
          if (userDetailData != null && userDetailData['success'] == true) {
            _userDetail = UserDetailModel.fromJson(userDetailData['data']);
          }
        }

        notifyListeners();
      } catch (e) {
        // Token is invalid, logout
        await logout();
        throw Exception('Failed to check login status: $e');
      }
    }
  }

  bool isDriverPendingApproval() {
    return _user?.role == 'user' && _driver != null && !_driver!.isApproved;
  }

  Future<void> logout() async {
    await _storageService.deleteToken();
    await _storageService.setLoginStatus(false);
    await _storageService.deleteUserId();
    _token = null;
    _isLoggedIn = false;
    _user = null;
    _driver = null;
    _userDetail = null;
    notifyListeners();
  }
}
