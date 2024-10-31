import 'package:flutter/material.dart';
import 'package:justipin/app/core/constants/constant.dart';

class CustomDropdown extends StatelessWidget {
  final String label;
  final String? value;
  final List<DropdownMenuItem<String>> items;
  final Function(String?) onChanged;

  const CustomDropdown({
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: textTextStyle.copyWith(fontSize: 16, fontWeight: bold)),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              borderRadius: BorderRadius.circular(20),
              dropdownColor: Colors.white,
              value: items.any((item) => item.value == value) ? value : null,
              items: items,
              onChanged: onChanged,
              isExpanded: true,
              hint: Text('Pilih $label',
                  style: textTextStyle.copyWith(fontSize: 16)),
            ),
          ),
        ),
      ],
    );
  }
}
