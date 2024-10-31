import 'package:flutter/material.dart';
import 'custom_chip.dart';

class LocationDetailView extends StatelessWidget {
  final bool isLocationSelected;
  final VoidCallback onBack;
  final VoidCallback onEdit;
  final VoidCallback onConfirm;
  final Function(String) onSelectType;

  const LocationDetailView({
    Key? key,
    required this.isLocationSelected,
    required this.onBack,
    required this.onEdit,
    required this.onConfirm,
    required this.onSelectType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: onBack,
              ),
              const Text(
                'Detail alamat',
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
          const TextField(
            decoration: InputDecoration(
              labelText: 'Detail lokasi (opsional)',
              hintText: 'Cth: No. rumah/unit/lantai',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Patokan (opsional)',
              hintText: 'Cth: Rumah sebelah warung kopi',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Checkbox(
                value: true,
                onChanged: (val) {},
                activeColor: Color(0xFF426e92), // Warna biru custom
              ),
              const Text('Simpan alamat ini jadi favorit'),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              CustomChip(
                label: 'Rumah',
                icon: Icons.home,
                isSelected: false,
                onTap: () => onSelectType('Rumah'),
              ),
              const SizedBox(width: 8),
              CustomChip(
                label: 'Kantor',
                icon: Icons.business,
                isSelected: false,
                onTap: () => onSelectType('Kantor'),
              ),
              const SizedBox(width: 8),
              CustomChip(
                label: 'Lainnya',
                icon: Icons.more_horiz,
                isSelected: false,
                onTap: () => onSelectType('Lainnya'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onConfirm,
              style: ElevatedButton.styleFrom(
                backgroundColor: isLocationSelected
                    ? Colors.yellow[700]
                    : Colors.grey[400],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text('Konfirmasi', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
