import 'package:flutter/material.dart';
import 'package:justipin/app/core/services/post_service.dart';

class PostProvider with ChangeNotifier {
  final PostService _postService = PostService();

  Future<Map<String, dynamic>?> createPost(String caption, String startTime,
      {String? imagePath}) async {
    try {
      final response = await _postService.createPost(caption, startTime,
          imagePath: imagePath);
      if (response != null && response['success'] == true) {
        notifyListeners();
        return response;
      } else {
        print(
            'Post creation failed: ${response?['message'] ?? 'Unknown error'}');
        return null;
      }
    } catch (e) {
      print('Error creating post: $e');
      return null;
    }
  }
}
