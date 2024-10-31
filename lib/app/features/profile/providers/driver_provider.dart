import 'package:flutter/material.dart';
import 'package:justipin/app/features/profile/models/driver_form_model.dart';
import 'package:justipin/app/core/services/driver_service.dart';
import 'package:justipin/app/core/providers/auth_provider.dart';

class DriverProvider with ChangeNotifier {
  final DriverService _driverService = DriverService();
  final AuthProvider _authProvider;

  DriverProvider(this._authProvider);

  Future<void> submitDriverForm(DriverFormModel form) async {
    final token = _authProvider.token;
    if (token != null) {
      try {
        final response = await _driverService.submitDriverForm(form, token);
        if (response != null && response['status'] == 'success') {
          // Handle successful response
          notifyListeners();
        } else {
          throw Exception(response?['message'] ?? 'Unknown error');
        }
      } catch (e) {
        throw Exception('Failed to submit driver form: $e');
      }
    } else {
      throw Exception('User is not authenticated');
    }
  }
}
