import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:justipin/app/shared/widgets/button/submit_button.dart';
import 'package:provider/provider.dart';
import 'package:justipin/app/core/providers/auth_provider.dart';
import 'package:justipin/app/core/constants/constant.dart';
import 'package:justipin/app/features/authentication/widgets/divider_text.dart';
import 'package:justipin/app/features/authentication/widgets/google_button.dart';
import 'package:justipin/app/features/authentication/widgets/primary_prompt.dart';
import 'package:justipin/app/shared/widgets/text_field/text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscureText = true;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();
  String? _errorMessage;
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmationController.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    setState(() {
      _isLoading = true;
    });
    try {
      await authProvider.register(
        _nameController.text,
        _emailController.text,
        _passwordController.text,
        _passwordConfirmationController.text,
      );
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      setState(() {
        _errorMessage = 'Registration failed: $e';
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
                      _buildFormFields(),
                      if (_errorMessage != null)
                        Text(
                          _errorMessage!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      Gap(10),
                      SubmitButton(
                        buttonText: "Daftar",
                        onPressed: () async {
                          await _register();
                        },
                      ),
                      Gap(30),
                      DividerWithText(text: 'atau daftar dengan'),
                      Gap(25),
                      GoogleButton(
                        onPressed: () {
                          // Implement Google sign-in logic here
                        },
                      ),
                      CustomPrompt(
                          promptText: 'sudah punya akun?',
                          buttonText: 'Masuk',
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/login');
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
      "Daftar",
      style: textTextStyle.copyWith(fontSize: 30, fontWeight: bold),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildSubtitle() {
    return Text(
      "Isi informasi Anda di bawah ini atau daftar dengan akun sosial media.",
      style: secondaryTextStyle,
      textAlign: TextAlign.center,
    );
  }

  Widget _buildFormFields() {
    return Column(
      children: [
        _buildTextField(
          label: "Nama",
          controller: _nameController,
          isPassword: false,
          obscureText: false,
        ),
        _buildTextField(
          label: "Email",
          controller: _emailController,
          isPassword: false,
          obscureText: false,
        ),
        _buildTextField(
          label: "Password",
          controller: _passwordController,
          isPassword: true,
          obscureText: _obscureText,
          onToggleVisibility: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
        _buildTextField(
          label: "Konfirmasi Password",
          controller: _passwordConfirmationController,
          isPassword: true,
          obscureText: _obscureText,
          onToggleVisibility: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ],
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required bool isPassword,
    required bool obscureText,
    VoidCallback? onToggleVisibility,
  }) {
    return TextFieldWidget(
      label: label,
      controller: controller,
      isPassword: isPassword,
      obscureText: obscureText,
      onToggleVisibility: onToggleVisibility,
    );
  }
}
