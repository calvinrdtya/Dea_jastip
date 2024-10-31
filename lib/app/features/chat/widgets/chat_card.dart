import 'package:flutter/material.dart';
import 'package:justipin/app/core/constants/constant.dart';
import 'package:justipin/app/features/chat/models/chat_model.dart';

class ChatCard extends StatelessWidget {
  final Chat chat;

  const ChatCard({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (chat.messages.isEmpty) {
      return SizedBox.shrink();
    }

    final latestMessage = chat.messages.last;
    final user = _getUserById(latestMessage.senderId);

    if (user.id == 'unknown') {
      return SizedBox.shrink();
    }

    return _buildChatCard(context, user.username, latestMessage);
  }

  User _getUserById(String senderId) {
    return users.firstWhere(
      (user) => user.id == senderId,
      orElse: () => User(id: 'unknown', username: 'Unknown'),
    );
  }

  Widget _buildChatCard(
      BuildContext context, String sender, Message latestMessage) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/chat', arguments: chat);
      },
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ListTile(
          leading: CircleAvatar(
            child: Text(sender[0]),
            backgroundColor: primaryColor,
          ),
          title: Text(
            sender,
            style: textTextStyle.copyWith(
                fontWeight: FontWeight.bold, fontSize: 20),
          ),
          subtitle: Text(
            latestMessage.message,
            style: textTextStyle.copyWith(fontSize: 16),
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Text(
            _formatTimestamp(latestMessage.timestamp),
            style: textTextStyle.copyWith(fontSize: 12),
          ),
        ),
      ),
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    return '${timestamp.hour}:${timestamp.minute.toString().padLeft(2, '0')}';
  }
}
