import 'package:flutter/material.dart';
import 'package:justipin/app/core/constants/constant.dart';

class SettingText extends StatelessWidget {
  final String title;
  final String subtitle;

  const SettingText({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(
            title,
            style: textTextStyle.copyWith(fontSize: 25, fontWeight: bold),
          ),
          const SizedBox(height: 10),
          Text(
            subtitle,
            style: textTextStyle.copyWith(fontSize: 19),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
