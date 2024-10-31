import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:justipin/app/core/constants/custom_icons.dart';
import '../../../core/constants/constant.dart';

class TextFieldWidget extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool isPassword;
  final bool obscureText;
  final VoidCallback? onToggleVisibility;
  final ValueChanged<String>? onChanged;

  const TextFieldWidget({
    Key? key,
    required this.label,
    required this.controller,
    required this.isPassword,
    required this.obscureText,
    this.onToggleVisibility,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: textTextStyle.copyWith(fontWeight: bold, fontSize: 16),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: isPassword ? obscureText : false,
          onChanged: onChanged,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            hintText: 'Masukkan $label',
            hintStyle: secondaryTextStyle.copyWith(color: Colors.grey[600]),
            suffixIcon: isPassword
                ? IconButton(
                    icon: obscureText
                        ? HugeIcon(
                            icon: HugeIcons.strokeRoundedEye,
                            color: Colors.black)
                        : CustomIcons.strokeRoundedEye(),
                    onPressed: onToggleVisibility,
                  )
                : null,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
            ),
          ),
          style: textTextStyle.copyWith(fontSize: 16),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
