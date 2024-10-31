import 'package:flutter/material.dart';
import 'package:justipin/app/core/constants/constant.dart';

class ReceivedMessageWidget extends StatelessWidget {
  final String message;
  final String date;

  const ReceivedMessageWidget({
    Key? key,
    required this.message,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(radius: 25),
            const SizedBox(width: 10),
            _buildMessageBubble(),
            if (date.isNotEmpty) _buildDateText(),
          ],
        ),
      ],
    );
  }

  Widget _buildMessageBubble() {
    return Flexible(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          message,
          style: textTextStyle.copyWith(fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildDateText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Text(
        date,
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
