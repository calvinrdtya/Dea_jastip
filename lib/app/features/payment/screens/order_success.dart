import 'package:flutter/material.dart';
import 'package:justipin/app/features/payment/widgets/success_icon.dart';
import 'package:justipin/app/shared/widgets/button/submit_button.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SuccessIcon(),
              const SizedBox(height: 24),
              const Text(
                'Pesanan berhasil diproses!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                'Pesanan Anda telah diproses dengan sukses.\nTerima kasih atas pembelian Anda!',
                style: TextStyle(fontSize: 16, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: SubmitButton(
                  buttonText: 'Continue',
                  onPressed: () async {
                    Navigator.pushNamed(context, '/order_tracking');
                    return;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
