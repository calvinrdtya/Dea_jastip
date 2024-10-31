import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:justipin/app/core/constants/constant.dart';
import 'package:provider/provider.dart';
import 'package:justipin/app/core/providers/auth_provider.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text("Menu logout"),
          Gap(20),
          SizedBox(
            width: 150,
            child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                ),
                onPressed: () async {
                  final authProvider =
                      Provider.of<AuthProvider>(context, listen: false);
                  await authProvider.logout();
                  Navigator.pushReplacementNamed(context, '/introduction');
                },
                child: const Row(children: [
                  HugeIcon(
                      icon: HugeIcons.strokeRoundedLogout01,
                      color: Colors.black,
                      size: 32),
                  Text("Logout")
                ])),
          )
        ]),
      ),
    );
  }
}
