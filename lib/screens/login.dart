import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_chat_app/widgets/card.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/addu-jacinto.jpg'),
                    fit: BoxFit.cover)),
          ),
          Center(child: LayoutBuilder(
              builder: (BuildContext, BoxConstraints constraints) {
            if (constraints.maxWidth > 600) {
              return Container(
                  width: MediaQuery.of(context).size.width * .4,
                  height: 500,
                  child: MyCard());
            } else {
              return Container(
                width: MediaQuery.of(context).size.width * .7,
                height: 500,
                child: MyCard(),
              );
            }
          }))
        ],
      ),
    );
  }
}
