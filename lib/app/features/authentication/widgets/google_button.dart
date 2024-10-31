import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../core/constants/constant.dart';

class GoogleButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GoogleButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: Colors.white,
        elevation: 2,
        shadowColor: Colors.grey.withOpacity(0.5),
        side: BorderSide(color: textColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HugeIcon(
              icon: HugeIcons.strokeRoundedGoogle, color: textColor, size: 28),
          const SizedBox(width: 8),
          Text(
            'Google',
            style: textTextStyle.copyWith(
                color: textColor, fontWeight: bold, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
