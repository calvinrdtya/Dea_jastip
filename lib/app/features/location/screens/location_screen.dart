import 'package:flutter/material.dart';
import 'package:justipin/app/core/constants/constant.dart';
import 'package:justipin/app/features/location/widgets/address_tile.dart';
import 'package:justipin/app/features/location/widgets/custom_button.dart';
import 'package:justipin/app/features/location/widgets/favorite_address_button.dart';
import 'package:justipin/app/features/location/widgets/search_input.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Lokasi'),
        backgroundColor: primaryColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pilih Lokasi',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const SearchInput(),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    icon: Icons.my_location,
                    label: 'Lokasimu saat ini',
                    onPressed: () {
                      // Aksi untuk mendapatkan lokasi saat ini
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomButton(
                    icon: Icons.map,
                    label: 'Pilih lewat peta',
                    onPressed: () {
                      Navigator.pushNamed(context, '/location-maps');
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Alamat favorit',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Center(
              child: FavoriteAddressButton(
                onPressed: () {
                  // Aksi tambah alamat
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Alamat terakhir',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: const [
                  AddressTile(
                    title: 'Kos Margoyoso',
                    subtitle: 'Tembalang, Kota Semarang, Jawa Tengah, Indonesia',
                  ),
                  AddressTile(
                    title: 'Gedung Kuliah Terpadu (GKT)',
                    subtitle: 'Tembalang, Kota Semarang, Jawa Tengah, Indonesia',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
