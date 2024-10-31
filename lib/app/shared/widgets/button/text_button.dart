import 'package:flutter/material.dart';
import 'package:justipin/app/core/constants/constant.dart';

class CustomTextButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;
  final double height;

  const CustomTextButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.onPressed,
    this.height = 30.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: SizedBox(
        height: height,
        child: Row(
          children: [
            Icon(icon, color: textColor),
            const SizedBox(width: 10.0),
            Text(
              text,
              style: textTextStyle.copyWith(
                fontSize: 16.0,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
