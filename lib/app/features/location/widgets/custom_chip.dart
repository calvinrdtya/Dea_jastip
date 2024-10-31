import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomChip({
    Key? key,
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Chip(
        label: Text(label),
        avatar: Icon(
          icon,
          color: isSelected
              ? Colors.yellow[700]
              : const Color.fromARGB(255, 114, 111, 111),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
