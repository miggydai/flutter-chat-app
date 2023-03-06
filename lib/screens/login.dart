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
                    image: NetworkImage(
                        'https://firebasestorage.googleapis.com/v0/b/flutter-chat-app-fd3bf.appspot.com/o/assets%2Faddu-jacinto.jpg?alt=media&token=edb508a2-8ba9-42c2-a85c-2dfe7442dbd6'),
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
