import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyHeader extends StatelessWidget {
  const MyHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Container(
            padding: EdgeInsets.symmetric(horizontal: 38, vertical: 28),
            width: double.infinity,
            height: 100,
            child: Row(
              children: [
                Icon(Icons.message, color: Colors.blue),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "AdDU Chat",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w800),
                ),
                Spacer(),
                Container(
                  constraints: BoxConstraints(maxWidth: 120),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search",
                        suffixIcon: Icon(Icons.search)),
                  ),
                ),
                SizedBox(width: 20),
                Icon(Icons.notifications, size: 33)
              ],
            ))
      ],
    ));
  }
}
