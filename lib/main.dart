import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/screens/homepage.dart';
import 'package:flutter_chat_app/screens/login.dart';

// com.migsD.flutter_chat_app
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {'/': (context) => LoginPage(), '/Home': (context) => MyHomePage()},
  ));
}
