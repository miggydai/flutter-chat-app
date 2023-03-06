import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class button extends StatelessWidget {
  final IconData icon;
  final String text;
  final double n;
  const button(
      {Key? key, required this.icon, required this.text, required this.n})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: n == 1 ? btn1(context, icon, text) : btn2(context, icon, text));
  }
}

ElevatedButton btn1(BuildContext context, IconData ico, String txt) {
  return ElevatedButton.icon(
      onPressed: () {
        Navigator.pushNamedAndRemoveUntil(
            context, '/ChooseAccount', ModalRoute.withName('/'));
      },
      icon: Icon(
        ico,
        size: 20,
      ),
      label: AutoSizeText(
        txt,
        maxFontSize: 15,
      ));
}

TextButton btn2(BuildContext context, IconData ico, String txt) {
  return TextButton(
      onPressed: () {
        Navigator.pushNamedAndRemoveUntil(
            context, '/ChooseAccount', ModalRoute.withName('/'));
      },
      style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0))),
          overlayColor:
              MaterialStateProperty.all(Color.fromARGB(255, 227, 232, 233)),
          textStyle: MaterialStateProperty.all(
              const TextStyle(fontSize: 11, color: Colors.black))),
      child: Text(txt));
}
