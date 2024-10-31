import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:justipin/app/core/constants/constant.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> pickImage(
    BuildContext context, Function(XFile?) onImagePicked) async {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return _buildBottomSheet(context, onImagePicked);
    },
  );
}

Widget _buildBottomSheet(BuildContext context, Function(XFile?) onImagePicked) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      SizedBox(height: 20),
      _buildListTile(
        context,
        icon: HugeIcons.strokeRoundedFile01,
        text: 'Gallery',
        source: ImageSource.gallery,
        onImagePicked: onImagePicked,
      ),
      _buildListTile(
        context,
        icon: HugeIcons.strokeRoundedCamera01,
        text: 'Camera',
        source: ImageSource.camera,
        onImagePicked: onImagePicked,
      ),
      SizedBox(height: 20),
    ],
  );
}

ListTile _buildListTile(
  BuildContext context, {
  required IconData icon,
  required String text,
  required ImageSource source,
  required Function(XFile?) onImagePicked,
}) {
  return ListTile(
    leading: HugeIcon(icon: icon, color: textColor, size: 24),
    title: Text(text, style: textTextStyle.copyWith(fontSize: 20)),
    onTap: () async {
      Navigator.of(context).pop();
      await _pickImageFromSource(context, source, onImagePicked);
    },
  );
}

Future<void> _pickImageFromSource(
  BuildContext context,
  ImageSource source,
  Function(XFile?) onImagePicked,
) async {
  var status = await Permission.photos.status;

  if (!status.isGranted) {
    status = await Permission.photos.request();
  }

  if (status.isGranted) {
    final ImagePicker _picker = ImagePicker();
    final pickedFile = await _picker.pickImage(source: source);
    onImagePicked(pickedFile);
  } else {
    // Handle kalau user gak ngasih izin
    print('Permission denied');
  }
}
