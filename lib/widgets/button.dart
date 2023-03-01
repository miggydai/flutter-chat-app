import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class button extends StatelessWidget {
  final IconData icon;
  final String text;
  const button({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(
          icon,
          size: 20,
        ),
        label: AutoSizeText(
          text,
          maxFontSize: 15,
        ));
  }
}
