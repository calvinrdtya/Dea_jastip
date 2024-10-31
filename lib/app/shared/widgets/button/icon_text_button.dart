import 'package:flutter/material.dart';
import '../../../core/constants/constant.dart';

class CustomIconTextButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final IconData icon;

  const CustomIconTextButton(
      {Key? key,
      required this.buttonText,
      required this.onPressed,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: textColor,
            ),
            const SizedBox(width: 8),
            Text(
              buttonText,
              style: textTextStyle.copyWith(
                  fontSize: 20, fontWeight: bold, color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
