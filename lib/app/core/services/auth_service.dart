import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_service.dart';

class AuthService {
  Future<Map<String, dynamic>?> _postRequest(
      String endpoint, Map<String, String> body) async {
    final url = Uri.parse(ApiService.userEndpoint(endpoint));
    try {
      final response = await http.post(url, body: body);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to $endpoint');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> _getRequest(
      String endpoint, String token) async {
    final url = Uri.parse(ApiService.userEndpoint(endpoint));
    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to fetch $endpoint');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> register(String name, String email,
      String password, String passwordConfirmation) async {
    return _postRequest('register', {
      'name': name,
      'email': email,
      'password': password,
      'password_confirm': passwordConfirmation,
    });
  }

  Future<Map<String, dynamic>?> login(String email, String password) async {
    return _postRequest('login', {
      'email': email,
      'password': password,
    });
  }

  Future<Map<String, dynamic>?> fetchUserData(
      String userId, String token) async {
    return _getRequest(userId, token);
  }

  Future<Map<String, dynamic>?> fetchDriverData(
      String userId, String token) async {
    return _getRequest(userId, token);
  }

  Future<Map<String, dynamic>?> fetchUserDetailData(
      String userId, String token) async {
    return _getRequest(userId, token);
  }
}
