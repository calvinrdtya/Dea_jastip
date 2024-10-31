import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:justipin/app/features/profile/widgets/setting_text.dart';
import 'package:justipin/app/shared/widgets/button/icon_text_button.dart';
import 'package:justipin/app/shared/widgets/primary_app_bar.dart';

class ContactUsScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PrimaryAppBar(title: 'Bantuan', isBack: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SettingText(title: 'Hubungi Kami', subtitle: 'Jika ada pertanyaan'),
          _buildTextField(),
          const SizedBox(height: 20),
          // Tombol kirim
          CustomIconTextButton(
            buttonText: 'buttonText',
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                // Handle button press
              }
            },
            icon: HugeIcons.strokeRoundedContact,
          ),
        ],
      ),
    );
  }

  Widget _buildTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextFormField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: 'Masukkan pesan Anda', // Dynamic hint text
          hintStyle: TextStyle(color: Colors.grey[600]),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Colors.blue, // Replace with your primary color
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Colors.black,
              width: 2.0,
            ),
          ),
        ),
        maxLines: 6,
        keyboardType: TextInputType.multiline,
        style: const TextStyle(fontSize: 18.0),
      ),
    );
  }
}
