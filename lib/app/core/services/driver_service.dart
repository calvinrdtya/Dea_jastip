import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:justipin/app/features/profile/models/driver_form_model.dart';
import 'api_service.dart';

class DriverService {
  Future<Map<String, dynamic>?> submitDriverForm(
      DriverFormModel form, String token) async {
    final url = Uri.parse(ApiService.driverEndpoint('form'));

    try {
      final request = http.MultipartRequest('POST', url)
        ..headers['Authorization'] = 'Bearer $token'
        ..fields['name'] = form.name
        ..fields['nik'] = form.nik
        ..fields['vehicle_plat_number'] = form.vehiclePlatNumber
        ..files.add(await http.MultipartFile.fromPath(
          'profile_picture',
          form.profilePicturePath,
        ));

      final response = await request.send();

      final responseBody = await response.stream.bytesToString();
      final decodedResponse = jsonDecode(responseBody);

      if (response.statusCode == 200 &&
          decodedResponse['status'] == 'success') {
        return decodedResponse;
      } else {
        throw Exception(
            decodedResponse['message'] ?? 'Failed to submit driver form');
      }
    } catch (e) {
      rethrow;
    }
  }
}
