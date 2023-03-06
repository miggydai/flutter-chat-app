import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/screens/accoutpage.dart';
import 'package:flutter_chat_app/screens/homepage.dart';
import 'package:flutter_chat_app/screens/login.dart';

import 'firebase_options.dart';

// com.migsD.flutter_chat_app
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => LoginPage(),
      '/Home': (context) => MyHomePage(),
      '/ChooseAccount': (context) => ChooseAccPage(),
    },
  ));
}
