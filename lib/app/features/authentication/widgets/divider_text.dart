import 'package:flutter/material.dart';
import '../../../core/constants/constant.dart';

class DividerWithText extends StatelessWidget {
  final String text;

  const DividerWithText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            color: secondaryTextColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            text,
            style: secondaryTextStyle,
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            color: secondaryTextColor,
          ),
        ),
      ],
    );
  }
}
