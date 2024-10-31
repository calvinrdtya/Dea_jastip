import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:justipin/app/core/constants/constant.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String content;
  final String time;

  const NotificationCard({
    required this.title,
    required this.content,
    required this.time,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(5),
            ),
            child: HugeIcon(
              icon: HugeIcons.strokeRoundedLocation01,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: textTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: bold,
                      color: textColor,
                    )),
                const SizedBox(height: 4),
                Text(content,
                    style: textTextStyle.copyWith(
                      fontSize: 14,
                      color: textColor,
                    )),
                if (time.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(time,
                      style: textTextStyle.copyWith(
                        fontSize: 12,
                        color: textColor,
                      )),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
