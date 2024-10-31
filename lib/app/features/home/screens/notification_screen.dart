import 'package:flutter/material.dart';
import 'package:justipin/app/shared/widgets/primary_app_bar.dart';
import '../widgets/notifications/notification_list.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PrimaryAppBar(title: "Notifikasi", isBack: true),
        body: NotificationList());
  }
}
