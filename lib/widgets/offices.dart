import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_chat_app/widgets/officeslist.dart';

class MyOffices extends StatefulWidget {
  const MyOffices({super.key});

  @override
  State<MyOffices> createState() => _MyOfficesState();
}

class _MyOfficesState extends State<MyOffices> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .2,
      height: MediaQuery.of(context).size.height,
      color: Colors.pink,
      child: OfficeList(),
    );
  }
}