import 'package:flutter/material.dart';
import 'package:justipin/app/core/constants/constant.dart';

class SentMessageWidget extends StatelessWidget {
  final String message;
  final String date;

  const SentMessageWidget({
    Key? key,
    required this.message,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (date.isNotEmpty) _buildDateText(),
        _buildMessageContainer(),
        const SizedBox(width: 10),
        const CircleAvatar(radius: 25),
      ],
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

  Widget _buildMessageContainer() {
    return Flexible(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          message,
          softWrap: true,
          style: textTextStyle.copyWith(fontSize: 16),
        ),
      ),
    );
  }
}
