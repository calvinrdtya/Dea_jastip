import 'package:flutter/material.dart';
import 'package:justipin/app/core/constants/constant.dart';
import '../../models/user_post_model.dart';
import 'user_post_card.dart';

class UserPostList extends StatelessWidget {
  final String userRole; // Add userRole parameter

  const UserPostList({super.key, required this.userRole});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: accentColor,
      body: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: dummyUserPosts.length + 1,
        itemBuilder: (context, index) {
          if (index == dummyUserPosts.length) {
            return SizedBox(height: 20);
          }
          return UserPostCard(
              userPost: dummyUserPosts[index], userRole: userRole);
        },
      ),
    );
  }
}
