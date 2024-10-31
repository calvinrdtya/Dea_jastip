// payment_method_selector.dart
import 'package:flutter/material.dart';

class PaymentMethodSelector extends StatelessWidget {
  final String selectedPaymentMethod;
  final Function(String) onSelect;

  const PaymentMethodSelector({
    Key? key,
    required this.selectedPaymentMethod,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => onSelect('QRIS'),
          child: ListTile(
            title: const Text('QRIS'),
            trailing: selectedPaymentMethod == 'QRIS'
                ? const Icon(Icons.check, color: Colors.yellow)
                : null,
          ),
        ),
        GestureDetector(
          onTap: () => onSelect('COD'),
          child: ListTile(
            title: const Text('COD'),
            trailing: selectedPaymentMethod == 'COD'
                ? const Icon(Icons.check, color: Colors.yellow)
                : null,
          ),
        ),
      ],
    );
  }
}
