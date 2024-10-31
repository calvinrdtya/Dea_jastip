import 'package:flutter/material.dart';
import 'package:justipin/app/core/constants/constant.dart';

class FavoriteAddressButton extends StatelessWidget {
  final VoidCallback onPressed;

  const FavoriteAddressButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: primaryColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        'Tambah alamat',
        style: TextStyle(color: primaryColor, fontSize: 16),
      ),
    );
  }
}
