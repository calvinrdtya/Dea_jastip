import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class ProfilePictureWidget extends StatelessWidget {
  final double radius;
  final Color backgroundColor;
  final Color iconColor;

  const ProfilePictureWidget({
    Key? key,
    this.radius = 50.0,
    this.backgroundColor = Colors.grey,
    this.iconColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor,
      child: HugeIcon(icon: HugeIcons.strokeRoundedUser, color: iconColor),
    );
  }
}
