import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:justipin/app/core/constants/constant.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isBack;

  const PrimaryAppBar({Key? key, required this.title, this.isBack = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      toolbarHeight: 70,
      title: Text(
        title,
        style: textTextStyle.copyWith(fontSize: 22),
      ),
      backgroundColor: primaryColor,
      leading: isBack
          ? IconButton(
              icon: HugeIcon(
                icon: HugeIcons.strokeRoundedArrowLeft01,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
