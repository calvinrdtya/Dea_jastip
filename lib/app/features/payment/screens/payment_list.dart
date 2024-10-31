import 'package:flutter/material.dart';
import 'package:justipin/app/core/constants/constant.dart';

class PaymentListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        backgroundColor: primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ListTile(
              title: Text(
                'Metode Pembayaran',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(),
            ListTile(
              leading: Image.asset(
                'lib/app/core/assets/qris.png', // pastikan kamu punya file qris_icon.png di folder assets
                width: 24,
                height: 24,
              ),
              title: const Text('QRIS'),
              onTap: () {
                // Aksi saat QRIS dipilih
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.attach_money),
              title: const Text('COD'),
              onTap: () {
                // Aksi saat COD dipilih
              },
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
