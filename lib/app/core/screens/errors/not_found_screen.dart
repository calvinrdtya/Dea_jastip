import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:justipin/app/core/constants/constant.dart';
import 'package:justipin/app/shared/widgets/button/primary_button.dart';

class NotFoundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('404',
                        style: textTextStyle.copyWith(
                          fontSize: 100,
                          fontWeight: bold,
                          color: primaryColor,
                        )),
                    SizedBox(height: 20),
                    Text('Page Not Found',
                        style: textTextStyle.copyWith(
                          fontSize: 24,
                          fontWeight: bold,
                          color: textColor,
                        )),
                    SizedBox(height: 40),
                    HugeIcon(
                      icon: HugeIcons.strokeRoundedDead,
                      color: primaryColor,
                      size: 220,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: PrimaryButton(
              buttonText: 'Kembali ke Beranda',
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
            ),
          ),
        ],
      ),
    );
  }
}
