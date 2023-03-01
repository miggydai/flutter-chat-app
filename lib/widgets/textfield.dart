import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class textfield extends StatelessWidget {
  final bool ob;
  final IconData ico;
  const textfield({Key? key, required this.ob, required this.ico})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(prefixIcon: Icon(ico)),
      maxLines: 1,
      obscureText: ob,
    );
  }
}
