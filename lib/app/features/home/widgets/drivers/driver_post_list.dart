import 'package:flutter/material.dart';
import 'package:justipin/app/core/constants/constant.dart';
import '../../models/driver_post_model.dart';
import 'driver_post_card.dart';

class DriverPostList extends StatelessWidget {
  final String userRole; // Add userRole parameter

  const DriverPostList({super.key, required this.userRole});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: accentColor,
      body: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: dummyDriverPosts.length + 1,
        itemBuilder: (context, index) {
          if (index == dummyDriverPosts.length) {
            return SizedBox(height: 20);
          }
          return DriverPostCard(
              driverPost: dummyDriverPosts[index],
              userRole: userRole); // Pass userRole
        },
      ),
    );
  }
}
