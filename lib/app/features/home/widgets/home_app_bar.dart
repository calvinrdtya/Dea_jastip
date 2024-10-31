import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:justipin/app/core/constants/constant.dart';
import 'home_tab_bar.dart';

SliverAppBar buildAppBar(
  BuildContext context,
  String name,
) {
  return SliverAppBar(
    backgroundColor: primaryColor,
    expandedHeight: 160.0,
    floating: false,
    pinned: true,
    flexibleSpace: FlexibleSpaceBar(
      title: _buildTitle(context, name),
      titlePadding:
          const EdgeInsetsDirectional.only(start: 16.0, bottom: 50.0, end: 10),
      background: Container(color: primaryColor),
    ),
    bottom: buildTabBar(),
  );
}

Widget _buildTitle(BuildContext context, String name) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Flexible(
        child: Text(
          'Helow, $name',
          style: textTextStyle.copyWith(fontSize: 22),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
      // Text('Helow, $name', style: textTextStyle.copyWith(fontSize: 22)),
      _buildNotificationIcon(context),
    ],
  );
}

Widget _buildNotificationIcon(BuildContext context) {
  return IconButton(
    onPressed: () {
      Navigator.of(context).pushNamed('/notification');
    },
    icon: Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.3),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10.0,
                spreadRadius: 2.0,
              ),
            ],
          ),
          child: const HugeIcon(
              icon: HugeIcons.strokeRoundedNotification01,
              color: Colors.black,
              size: 24),
        ),
        Positioned(
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(1.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6.0),
            ),
            constraints: const BoxConstraints(
              minWidth: 12,
              minHeight: 12,
            ),
            child: Text('9',
                textAlign: TextAlign.center,
                style: textTextStyle.copyWith(fontSize: 8, fontWeight: bold)),
          ),
        ),
      ],
    ),
  );
}
