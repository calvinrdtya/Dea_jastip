import 'package:flutter/material.dart';
import '../../../core/constants/constant.dart';

class PrimaryButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final bool isDisabled;

  const PrimaryButton(
      {Key? key,
      required this.buttonText,
      required this.onPressed,
      this.isDisabled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isDisabled ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isDisabled ? Colors.grey : primaryColor,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        buttonText,
        style: textTextStyle.copyWith(
            fontSize: 20,
            fontWeight: bold,
            color: isDisabled ? Colors.black38 : textColor),
      ),
    );
  }
}
