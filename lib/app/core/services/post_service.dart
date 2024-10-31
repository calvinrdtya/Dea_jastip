import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_service.dart';
import 'package:justipin/app/core/storage/storage_service.dart';

class PostService {
  final StorageService _storageService = StorageService();

  Future<Map<String, dynamic>?> createPost(String caption, String startTime,
      {String? imagePath}) async {
    final url = Uri.parse(ApiService.userEndpoint('post'));
    final token = await _storageService.getToken();
    final request = http.MultipartRequest('POST', url)
      ..fields['content'] = caption
      ..fields['start_time'] = startTime
      ..headers['Authorization'] = 'Bearer $token';

    if (imagePath != null) {
      request.files.add(await http.MultipartFile.fromPath('image', imagePath));
    }

    try {
      final response = await request.send();
      final responseBody = await response.stream.bytesToString();
      final decodedResponse = jsonDecode(responseBody);

      if (response.statusCode == 201 && decodedResponse['success'] == true) {
        return decodedResponse;
      } else {
        print('Failed to create post: ${decodedResponse['message']}');
        return null;
      }
    } catch (e) {
      print('Error creating post: $e');
      return null;
    }
  }
}
