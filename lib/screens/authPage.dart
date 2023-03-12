import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_chat_app/globals.dart';
import 'package:flutter_chat_app/model/usermodel.dart';
import 'package:flutter_chat_app/screens/accoutpage.dart';
import 'package:flutter_chat_app/screens/homepage.dart';
import 'package:flutter_chat_app/screens/login.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (Provider.of<UserModel?>(context) == null) {
      return LoginPage();
    } else {
      print(Globals.fullName);
      return MyHomePage();
    }
  }
}
