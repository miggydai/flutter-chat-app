import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_chat_app/widgets/offices.dart';

import '../widgets/header.dart';
import '../widgets/inbox.dart';
import '../widgets/sidebar.dart';

class MyOfficePage extends StatefulWidget {
  const MyOfficePage({super.key});

  @override
  State<MyOfficePage> createState() => _MyOfficePageState();
}

class _MyOfficePageState extends State<MyOfficePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: [
        const Sidebar(index: 1),
        Expanded(
          child: Column(
            children: [
              const MyHeader(),
              Expanded(
                  child: Row(
                children: [
                  MyOffices(),
                ],
              ))
            ],
          ),
        )
      ]),
    );
  }
}