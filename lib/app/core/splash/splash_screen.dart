import 'package:flutter/material.dart';
import 'package:justipin/app/core/constants/constant.dart';
import 'package:provider/provider.dart';
import 'package:justipin/app/core/providers/auth_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateBasedOnAuthStatus();
  }

  void _navigateBasedOnAuthStatus() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    try {
      await authProvider
          .checkLoginStatus()
          .timeout(const Duration(seconds: 10));
      if (authProvider.isLoggedIn) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        Navigator.pushReplacementNamed(context, '/introduction');
      }
    } catch (e) {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: const Center(
        child: _SplashScreenText(),
      ),
    );
  }
}

class _SplashScreenText extends StatelessWidget {
  const _SplashScreenText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'JUSTIP',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 50.0,
            color: Colors.white,
          ),
        ),
        Text(
          'in',
          style: TextStyle(
            fontSize: 50.0,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
