import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_chat_app/widgets/chatmembers.dart';

class MyInbox extends StatefulWidget {
  const MyInbox({super.key});

  @override
  State<MyInbox> createState() => _MyInboxState();
}

class _MyInboxState extends State<MyInbox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .2,
      height: MediaQuery.of(context).size.height,
      // color: Colors.pink,
      child: ChatMember(),
    );
  }
}
