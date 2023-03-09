import 'package:flutter/material.dart';
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
      body: Row(
        children: [
          Sidebar(index: 0),
          Expanded(
              child: Container(
            child: Column(
              children: [],
            ),
          ))
        ],
      ),
    );
  }
}
