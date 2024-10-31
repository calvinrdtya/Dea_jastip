import 'package:flutter/material.dart';

class AddressTile extends StatelessWidget {
  final String title;
  final String subtitle;

  const AddressTile({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[200],
        child: const Icon(Icons.location_on, color: Colors.black),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.bookmark_border),
      contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
    );
  }
}
