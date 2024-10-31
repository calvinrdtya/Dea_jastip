// terms_conditions.dart
import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.article_outlined, size: 24),
        const SizedBox(width: 8),
        Expanded(
          child: RichText(
            text: const TextSpan(
              style: TextStyle(color: Colors.black, fontSize: 14),
              children: [
                TextSpan(text: 'Dengan melanjutkan, Saya setuju dengan Syarat dan Ketentuan yang berlaku. '),
                TextSpan(
                  text: 'Syarat dan Ketentuan',
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
