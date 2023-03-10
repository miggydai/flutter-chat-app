import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_chat_app/widgets/chathead.dart';

class ChatMember extends StatefulWidget {
  const ChatMember({super.key});

  @override
  State<ChatMember> createState() => _ChatMemberState();
}

class _ChatMemberState extends State<ChatMember> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Chats",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
          ),
          ChatHead()
        ],
      ),
    );
  }
}
