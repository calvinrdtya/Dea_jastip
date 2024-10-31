import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:justipin/app/core/constants/constant.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  CustomBottomNavigationBar(
      {required this.selectedIndex, required this.onItemTapped});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      child: SizedBox(
        height: 56,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
                icon: HugeIcon(
                    icon: HugeIcons.strokeRoundedHome02,
                    color:
                        widget.selectedIndex == 0 ? primaryColor : Colors.black,
                    size: 32),
                onPressed: () {
                  widget.onItemTapped(0);
                  Navigator.pushReplacementNamed(context, '/home');
                }),
            IconButton(
                icon: HugeIcon(
                    icon: HugeIcons.strokeRoundedTransaction,
                    color:
                        widget.selectedIndex == 1 ? primaryColor : Colors.black,
                    size: 32),
                onPressed: () {
                  widget.onItemTapped(1);
                  Navigator.pushReplacementNamed(context, '/histori');
                }),
            const SizedBox(width: 0),
            IconButton(
                icon: HugeIcon(
                    icon: HugeIcons.strokeRoundedBubbleChat,
                    color:
                        widget.selectedIndex == 2 ? primaryColor : Colors.black,
                    size: 32),
                onPressed: () {
                  widget.onItemTapped(2);
                  Navigator.pushReplacementNamed(context, '/list-chat');
                }),
            IconButton(
                icon: HugeIcon(
                    icon: HugeIcons.strokeRoundedUser,
                    color:
                        widget.selectedIndex == 3 ? primaryColor : Colors.black,
                    size: 32),
                onPressed: () {
                  widget.onItemTapped(3);
                  Navigator.pushReplacementNamed(context, '/profile');
                }),
          ],
        ),
      ),
    );
  }
}
