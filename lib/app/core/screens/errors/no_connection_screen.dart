import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:justipin/app/core/constants/constant.dart';
import 'package:justipin/app/shared/widgets/button/icon_text_button.dart';

class NoConnectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('No Connection'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            HugeIcon(
                icon: HugeIcons.strokeRoundedUsbNotConnected01,
                color: primaryColor),
            const SizedBox(height: 20),
            Text('No Internet Connection',
                style: textTextStyle.copyWith(
                  fontSize: 24.0,
                  fontWeight: bold,
                  color: textColor,
                )),
            const SizedBox(height: 10),
            Text(
              'Please check your internet settings and try again.',
              textAlign: TextAlign.center,
              style: textTextStyle.copyWith(
                fontSize: 16.0,
                color: textColor,
              ),
            ),
            const SizedBox(height: 30),
            CustomIconTextButton(
                buttonText: 'Retry',
                onPressed: () {},
                icon: HugeIcons.strokeRoundedRepeat)
          ],
        ),
      ),
    );
  }
}
