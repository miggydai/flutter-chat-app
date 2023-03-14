import 'package:flutter/material.dart';
import 'package:flutter_chat_app/globals.dart';
import 'package:flutter_chat_app/widgets/header.dart';
import 'package:flutter_chat_app/widgets/inbox.dart';
import 'package:flutter_chat_app/widgets/offices.dart';
import 'package:flutter_chat_app/widgets/sidebar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: [
        const Sidebar(index: 0),
        Expanded(
          child: Column(
            children: [
              const MyHeader(),
              Expanded(
                  child: Row(
                children: [
                  Globals.x == 0 ?  MyInbox() :  MyOffices(),

                ],
              ))
            ],
          ),
        )
      ]),
    );
  }
}
