import 'package:flutter/material.dart';
import 'package:show_off/screens/chat/chat_screen_1.dart';
import 'package:show_off/screens/chat/chat_screen_2.dart';
import 'package:show_off/screens/chat/chat_screen_3.dart';

class ChatContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black54,
          ),
          title: Text(
            'Chat Container',
            style: TextStyle(color: Colors.black54),
          ),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.orange,
            labelColor: Colors.orange,
            unselectedLabelColor: Colors.black54,
            tabs: [
              Tab(
                text: "Chat 1",
              ),
              Tab(
                text: "Chat 2",
              ),
              Tab(
                text: "Chat 3",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ChatScreen1(),
            ChatScreen2(),
            ChatScreen3(),
          ],
        ),
      ),
    );
  }
}
