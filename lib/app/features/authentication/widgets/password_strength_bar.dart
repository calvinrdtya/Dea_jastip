import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../core/constants/constant.dart';

class PasswordStrengthBar extends StatelessWidget {
  final int strength;

  const PasswordStrengthBar({Key? key, required this.strength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _buildStrengthBar(),
        const Gap(5),
        Text(_getStrengthText(), style: secondaryTextStyle),
      ],
    );
  }

  Widget _buildStrengthBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(4, (index) {
        return Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            height: 10,
            decoration: BoxDecoration(
              color: _getBarColor(index),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        );
      }),
    );
  }

  Color _getBarColor(int index) {
    List<Color> strengthColors = [
      Colors.red, // Lemah
      Colors.orange, // Sedang
      Colors.yellow, // Kuat
      Colors.green, // Sangat kuat
    ];
    return index < strength ? strengthColors[strength - 1] : Colors.grey[300]!;
  }

  String _getStrengthText() {
    switch (strength) {
      case 0:
      case 1:
        return 'Lemah';
      case 2:
        return 'Sedang';
      case 3:
        return 'Kuat';
      case 4:
        return 'Sangat Kuat';
      default:
        return 'Lemah';
    }
  }
}
