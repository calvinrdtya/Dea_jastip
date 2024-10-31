import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:justipin/app/core/constants/constant.dart';

class InputAreaWidget extends StatelessWidget {
  const InputAreaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          _buildAddButton(context),
          _buildTextField(),
          _buildSendButton(),
        ],
      ),
    );
  }

  Widget _buildAddButton(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.add_circle_outline, color: primaryColor),
      onPressed: () => _showBottomSheet(context),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: <Widget>[
            _buildBottomSheetItem(
              context,
              icon: HugeIcons.strokeRoundedShoppingBag01,
              text: 'Pesanan',
              onTap: () {
                Navigator.pushNamed(context, '/payment');
              },
            ),
            _buildBottomSheetItem(
              context,
              icon: HugeIcons.strokeRoundedLocation01,
              text: 'Maps',
              onTap: () {
                Navigator.pushNamed(context, '/location');
              },
            ),
            _buildBottomSheetItem(
              context,
              icon: HugeIcons.strokeRoundedFile01,
              text: 'Media',
              onTap: () {
                Navigator.pop(context);
                // Tambahkan fungsionalitas Media
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildBottomSheetItem(BuildContext context,
      {required IconData icon,
      required String text,
      required VoidCallback onTap}) {
    return ListTile(
      leading: HugeIcon(icon: icon, color: textColor, size: 24),
      title: Text(text, style: textTextStyle.copyWith(fontSize: 20)),
      onTap: onTap,
    );
  }

  Widget _buildTextField() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: "Start typing...",
            hintStyle: textTextStyle.copyWith(color: Colors.grey[600]),
            border: InputBorder.none,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          ),
        ),
      ),
    );
  }

  Widget _buildSendButton() {
    return IconButton(
      icon: Icon(Icons.send, color: primaryColor),
      onPressed: () {
        // Tambahkan fungsionalitas kirim pesan
      },
    );
  }
}
