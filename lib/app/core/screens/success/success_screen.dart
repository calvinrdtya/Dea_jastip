import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:justipin/app/core/constants/constant.dart';
import 'package:justipin/app/shared/widgets/button/primary_button.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HugeIcon(
                icon: HugeIcons.strokeRoundedTime04,
                color: primaryColor,
                size: 200),
            const SizedBox(height: 20),
            Text(
              'Driver registered successfully,\n please wait for approval',
              textAlign: TextAlign.center,
              style: textTextStyle.copyWith(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: PrimaryButton(
                buttonText: 'Back to Home',
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/home', (route) => false);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
