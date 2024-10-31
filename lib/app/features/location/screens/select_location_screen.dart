import 'package:flutter/material.dart';


class SelectLocationScreen extends StatelessWidget {
  const SelectLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFC107), // Warna kuning
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
        title: const Text(
          'Pilih Lokasi',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Pilih Lokasi",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            // Text Field untuk mencari alamat
            TextField(
              decoration: InputDecoration(
                hintText: "Cari alamat",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Tombol Lokasimu saat ini dan Pilih lewat peta
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      // Tambahkan fungsionalitas untuk Lokasimu saat ini
                    },
                    icon: const Icon(Icons.location_on),
                    label: const Text('Lokasimu saat ini'),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      // Tambahkan fungsionalitas untuk Pilih lewat peta
                    },
                    icon: const Icon(Icons.map),
                    label: const Text('Pilih lewat peta'),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Tombol Tambah alamat
            // Tombol Tambah alamat
            Center(
              child: OutlinedButton(
                onPressed: () {
                  // Tambahkan fungsionalitas untuk Tambah alamat
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Ubah radius sesuai kebutuhan
                    side: const BorderSide(color: Color.fromARGB(255, 255, 230, 9), width: 2), // Ubah warna dan ketebalan border
                  ),
                ),
                child: const Text(
                  'Tambah alamat',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Alamat favorit",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            // Daftar alamat terakhir
            Expanded(
              child: ListView(
                children: [
                  buildAddressTile(
                    'Kos Margoyoso',
                    'Tembalang, Kota Semarang, Jawa Tengah, Indonesia',
                    Icons.access_time,
                  ),
                  const Divider(),
                  buildAddressTile(
                    'Gedung Kuliah Terpadu (GKT)',
                    'Tembalang, Kota Semarang, Jawa Tengah, Indonesia',
                    Icons.access_time,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk setiap alamat dalam daftar
  Widget buildAddressTile(String title, String subtitle, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.bookmark, color: Colors.grey),
      onTap: () {
        // Tambahkan fungsionalitas saat alamat diklik
      },
    );
  }
}
