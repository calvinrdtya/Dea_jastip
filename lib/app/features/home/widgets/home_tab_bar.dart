import 'package:flutter/material.dart';
import 'package:justipin/app/core/constants/constant.dart';

PreferredSize buildTabBar() {
  return PreferredSize(
    preferredSize: const Size.fromHeight(60.0),
    child: TabBar(
      labelColor: textColor,
      unselectedLabelColor: Colors.black45,
      indicatorColor: textColor,
      tabs: [
        Tab(
          child: Text('Drivers',
              style: textTextStyle.copyWith(fontWeight: bold, fontSize: 18)),
        ),
        Tab(
          child: Text('Users',
              style: textTextStyle.copyWith(fontSize: 18, fontWeight: bold)),
        ),
      ],
    ),
  );
}
