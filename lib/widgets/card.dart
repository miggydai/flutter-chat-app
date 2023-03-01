import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_chat_app/widgets/button.dart';
import 'package:flutter_chat_app/widgets/textfield.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyCard extends StatelessWidget {
  const MyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 70,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.transparent,
              foregroundImage: AssetImage('assets/addu-seal-black.png'),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                width: 500,
                child: textfield(
                  ob: false,
                  ico: Icons.person,
                )),
            SizedBox(
              height: 10,
            ),
            Container(width: 500, child: textfield(ob: true, ico: Icons.key)),
            SizedBox(
              height: 15,
            ),
            Container(
                width: MediaQuery.of(context).size.width * .4,
                height: 50,
                child: button(
                  icon: FontAwesomeIcons.doorOpen,
                  text: "Login",
                )),
            SizedBox(
              height: 18,
              child: Text("or"),
            ),
            Container(
                width: MediaQuery.of(context).size.width * .4,
                height: 50,
                child: button(
                  icon: FontAwesomeIcons.google,
                  text: " Login with Google",
                )),
          ],
        ),
      ),
    );
  }
}
