// success_icon.dart
import 'package:flutter/material.dart';

class SuccessIcon extends StatelessWidget {
  const SuccessIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.yellow.shade100,
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.check,
        color: Colors.yellow.shade700,
        size: 80,
      ),
    );
  }
}
