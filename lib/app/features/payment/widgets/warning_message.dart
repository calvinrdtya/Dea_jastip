// warning_message.dart
import 'package:flutter/material.dart';

class WarningMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red),
        borderRadius: BorderRadius.circular(25),
      ),
      child: const Row(
        children: [
          Icon(Icons.warning, color: Colors.red, size: 18),
          SizedBox(width: 4),
          Expanded(
            child: Text(
              'Isi detail alamat biar driver gampang cari lokasimu pas antar pesananmu.',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
