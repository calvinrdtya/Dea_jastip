import 'package:flutter/material.dart';
import 'package:justipin/app/core/constants/constant.dart';
import 'package:justipin/app/features/payment/widgets/address_section.dart';
import 'package:justipin/app/features/payment/widgets/payment_method.dart';
import 'package:justipin/app/features/payment/widgets/payment_summary.dart';
import 'package:justipin/app/features/payment/widgets/term_condition.dart';
import 'package:justipin/app/features/payment/widgets/warning_message.dart';
import 'package:justipin/app/shared/widgets/button/submit_button.dart';
import 'package:justipin/app/shared/widgets/primary_app_bar.dart'; 

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String selectedPaymentMethod = '';
  bool showPaymentOptions = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(
        title: 'Pembayaran',
        isBack: true,
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddressSection(),
            const SizedBox(height: 8),
            WarningMessage(),
            const SizedBox(height: 16),
            PaymentSummary(),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () => setState(() => showPaymentOptions = !showPaymentOptions),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Metode pembayaran', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Icon(showPaymentOptions ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
                ],
              ),
            ),
            if (showPaymentOptions)
              PaymentMethodSelector(
                selectedPaymentMethod: selectedPaymentMethod,
                onSelect: (method) => setState(() => selectedPaymentMethod = method),
              ),
            const SizedBox(height: 16),
            TermsAndConditions(),
            const Spacer(),
            SubmitButton(
              buttonText: 'Pesan dan Antar Sekarang',
              onPressed: () => Navigator.pushNamed(context, '/order_success'),
            ),
          ],
        ),
      ),
    );
  }
}
