import 'package:flutter/material.dart';
import 'package:show_off/screens/chat/list_user_screen.dart';
import 'package:show_off/screens/chat/conversation_screen.dart';
import 'package:show_off/screens/chat/assets_conversation_screen.dart';

class ChatContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final index = ModalRoute.of(context).settings.arguments;
    return DefaultTabController(
      length: 3,
      initialIndex: index != null ? index : 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black54,
          ),
          title: Text(
           'Skype Super Fake',
            style: TextStyle(color: Colors.black54),
          ),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.orange,
            labelColor: Colors.orange,
            unselectedLabelColor: Colors.black54,
            tabs: [
              Tab(
                text: "List User",
              ),
              Tab(
                text: "Conversation",
              ),
              Tab(
                text: "Assets shared",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListUserScreen(),
            ConversationScreen(),
            AssetsConversationScreen(),
          ],
        ),
      ),
    );
  }
}
