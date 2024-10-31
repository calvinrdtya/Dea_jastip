import 'package:flutter/material.dart';
import 'notification_card.dart';
import '../../models/notification_model.dart';

class NotificationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: notifications.length,
      separatorBuilder: (context, index) =>
          const Divider(height: 1, color: Color(0xFFF1F1F1)),
      itemBuilder: (context, index) {
        final notification = notifications[index];
        return NotificationCard(
          title: notification.title,
          content: notification.content,
          time: notification.time ?? '',
        );
      },
    );
  }
}
