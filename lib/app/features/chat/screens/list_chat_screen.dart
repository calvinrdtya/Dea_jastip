import 'package:flutter/material.dart';
// import 'package:justipin/app/core/constants/constant.dart';
import 'package:justipin/app/features/chat/models/chat_model.dart';
import 'package:justipin/app/shared/widgets/nav_bar.dart';
import 'package:justipin/app/features/chat/widgets/chat_card.dart';
import 'package:justipin/app/shared/widgets/primary_app_bar.dart';

class ListChatScreen extends StatefulWidget {
  @override
  _ListChatScreenState createState() => _ListChatScreenState();
}

class _ListChatScreenState extends State<ListChatScreen> {
  final List<Chat> chatHistory = chats;
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PrimaryAppBar(title: "Histori Pesan"),
      body: ListView.builder(
        itemCount: chatHistory.length,
        itemBuilder: (context, index) {
          final chat = chatHistory[index];
          return ChatCard(chat: chat);
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
