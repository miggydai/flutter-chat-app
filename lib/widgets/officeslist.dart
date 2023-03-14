import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_chat_app/widgets/officehead.dart';

class OfficeList extends StatefulWidget {
  const OfficeList({super.key});

  @override
  State<OfficeList> createState() => _OfficeListState();
}

class _OfficeListState extends State<OfficeList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Offices",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
          ),
          OfficeHead()
        ],
      ),
    );
  }
}