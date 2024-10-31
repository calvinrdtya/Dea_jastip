import 'package:flutter/material.dart';

class LocationSimpleView extends StatelessWidget {
  final bool isLocationSelected;
  final VoidCallback onBack;
  final VoidCallback onEdit;
  final VoidCallback onConfirm;

  const LocationSimpleView({
    Key? key,
    required this.isLocationSelected,
    required this.onBack,
    required this.onEdit,
    required this.onConfirm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: onBack,
            ),
            const Text(
              'Pilih Lokasi',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.location_on, color: Colors.grey),
            const SizedBox(width: 8),
            const Text('Gg. Margoyoso No. 15'),
            const Spacer(),
            TextButton(
              onPressed: onEdit,
              child: const Text('Ubah', style: TextStyle(color: Colors.orange)),
            )
          ],
        ),
        const SizedBox(height: 16),
        const Spacer(),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onConfirm,
            style: ElevatedButton.styleFrom(
              backgroundColor: isLocationSelected
                  ? Colors.yellow[700]
                  : Colors.grey[400],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text('Konfirmasi Alamat', style: TextStyle(color: Colors.black)),
          ),
        ),
      ],
    );
  }
}
