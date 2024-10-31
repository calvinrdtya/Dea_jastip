import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:justipin/app/shared/widgets/button/submit_button.dart';
import 'package:provider/provider.dart';
import 'package:justipin/app/core/providers/auth_provider.dart';
import 'package:justipin/app/core/constants/constant.dart';
import 'package:justipin/app/features/authentication/widgets/divider_text.dart';
import 'package:justipin/app/features/authentication/widgets/google_button.dart';
// import 'package:justipin/app/shared/widgets/button/primary_button.dart';
import 'package:justipin/app/features/authentication/widgets/primary_prompt.dart';
import 'package:justipin/app/shared/widgets/text_field/text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _errorMessage;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    setState(() {
      _isLoading = true;
    });
    try {
      await authProvider.login(_emailController.text, _passwordController.text);
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      setState(() {
        _errorMessage = 'Login failed: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildTitle(),
                      Gap(20),
                      _buildSubtitle(),
                      Gap(20),
                      _buildEmailField(),
                      _buildPasswordField(),
                      _buildForgotPasswordButton(),
                      if (_errorMessage != null)
                        Text(
                          _errorMessage!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      Gap(10),
                      SubmitButton(
                        buttonText: "Masuk",
                        onPressed: () async {
                          await _login();
                        },
                      ),
                      Gap(30),
                      DividerWithText(text: 'atau masuk dengan'),
                      Gap(25),
                      GoogleButton(
                        onPressed: () {
                          // Implement Google sign-in logic here
                        },
                      ),
                      CustomPrompt(
                          promptText: 'belum punya akun?',
                          buttonText: 'Daftar',
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, '/register');
                          }),
                    ],
                  ),
                ),
              ),
            ),
            if (_isLoading)
              Positioned.fill(
                child: ModalBarrier(
                  color: Colors.black.withOpacity(0.3),
                  dismissible: false,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      "Masuk",
      style: textTextStyle.copyWith(fontSize: 30, fontWeight: bold),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildSubtitle() {
    return Text(
      "Isi informasi Anda di bawah ini atau masuk dengan akun sosial media.",
      style: secondaryTextStyle,
      textAlign: TextAlign.center,
    );
  }

  Widget _buildEmailField() {
    return TextFieldWidget(
      label: "Email",
      controller: _emailController,
      isPassword: false,
      obscureText: false,
    );
  }

  Widget _buildPasswordField() {
    return TextFieldWidget(
      label: "Password",
      controller: _passwordController,
      isPassword: true,
      obscureText: _obscureText,
      onToggleVisibility: () {
        setState(() {
          _obscureText = !_obscureText;
        });
      },
    );
  }

  Widget _buildForgotPasswordButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: Text(
          "Lupa kata sandi?",
          style: textTextStyle.copyWith(fontSize: 15, color: textColor),
        ),
      ),
    );
  }
}
