import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:justipin/app/core/constants/constant.dart';

class CustomFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      backgroundColor: primaryColor,
      child: const HugeIcon(
          icon: HugeIcons.strokeRoundedAdd01, color: Colors.black, size: 32),
      onPressed: () {
        Navigator.pushNamed(context, '/create-post');
      },
    );
  }
}
