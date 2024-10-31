import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:justipin/app/core/constants/constant.dart';
import 'package:justipin/app/features/chat/models/chat_model.dart';
import 'package:justipin/app/features/chat/widgets/received_message_widget.dart';
import 'package:justipin/app/features/chat/widgets/input_area_widget.dart';
import 'package:justipin/app/features/chat/widgets/sent_message_widget.dart';

class ChatScreen extends StatelessWidget {
  final Chat chat;

  const ChatScreen({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    final participantId = chat.participants.firstWhere((id) => id != '1');
    final participant = users.firstWhere((user) => user.id == participantId);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: HugeIcon(
              icon: HugeIcons.strokeRoundedArrowLeft01, color: textColor),
        ),
        title: Row(
          children: [
            CircleAvatar(child: Text(participant.username[0])),
            const SizedBox(width: 10),
            Text(
              participant.username,
              style: textTextStyle.copyWith(fontSize: 22, fontWeight: bold),
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: chat.messages.length,
              itemBuilder: (context, index) {
                final message = chat.messages[index];
                final isSent =
                    message.senderId == '1'; // Assuming '1' is the current user
                return isSent
                    ? SentMessageWidget(
                        message: message.message,
                        date: message.timestamp
                            .toLocal()
                            .toString()
                            .substring(11, 16),
                      )
                    : ReceivedMessageWidget(
                        message: message.message,
                        date: message.timestamp
                            .toLocal()
                            .toString()
                            .substring(11, 16),
                      );
              },
            ),
          ),
          const InputAreaWidget(),
        ],
      ),
    );
  }
}
