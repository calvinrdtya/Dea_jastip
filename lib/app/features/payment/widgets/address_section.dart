// address_section.dart
import 'package:flutter/material.dart';
import 'package:justipin/app/features/location/screens/select_location_screen.dart';

class AddressSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Alamat pengantaran',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Kos Margoyoso',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                elevation: 0,
                side: const BorderSide(color: Colors.yellow, width: 2),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SelectLocationScreen()),
                );
              },
              child: const Text('Ganti alamat'),
            ),
          ],
        ),
      ],
    );
  }
}
