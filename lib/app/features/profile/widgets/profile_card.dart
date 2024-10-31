import 'package:flutter/material.dart';
import 'package:justipin/app/core/constants/constant.dart';
import 'package:justipin/app/shared/widgets/profile_picture_widget.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String role;

  const ProfileCard({
    super.key,
    required this.name,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0), color: primaryColor),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          ProfilePictureWidget(
            radius: 30,
            backgroundColor: Colors.white,
          ),
          const SizedBox(width: 16),
          Text(name,
              style: textTextStyle.copyWith(
                color: textColor,
                fontSize: 20,
                fontWeight: bold,
              )),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.all(8.0),
            child: Text(role,
                style: textTextStyle.copyWith(color: textColor, fontSize: 15)),
          )
        ],
      ),
    );
  }
}
