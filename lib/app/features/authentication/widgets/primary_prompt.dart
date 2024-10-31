import 'package:flutter/material.dart';
import '../../../core/constants/constant.dart';

class CustomPrompt extends StatelessWidget {
  final VoidCallback onPressed;
  final String promptText;
  final String buttonText;

  const CustomPrompt({
    Key? key,
    required this.onPressed,
    required this.promptText,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(promptText),
          TextButton(
            onPressed: onPressed,
            child: Text(
              buttonText,
              style:
                  textTextStyle.copyWith(fontWeight: bold, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
