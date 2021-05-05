import 'package:flutter/material.dart';

class ConversationScreen extends StatefulWidget {
  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildConversation(context),
        _buildChat(context),
      ],
    );
  }

  Widget _buildChat(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        height: 60.0,
        decoration: BoxDecoration(color: Colors.black54),
      ),
    );
  }

  Widget _buildConversation(BuildContext context) {
    return Expanded(
      child: Container(
        child: ListView(),
      ),
    );
  }
}
