import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/model/usermodel.dart';
import 'package:flutter_chat_app/screens/accoutpage.dart';
import 'package:flutter_chat_app/screens/authPage.dart';
import 'package:flutter_chat_app/screens/homepage.dart';
import 'package:flutter_chat_app/screens/login.dart';
import 'package:flutter_chat_app/services/auth_services.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

// com.migsD.flutter_chat_app
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(StreamProvider<UserModel?>.value(
      initialData: null,
      value: AuthService().onAuthStateChanged,
      builder: (context, snapshot) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) => AuthPage(),
            '/Home': (context) => MyHomePage(),
            '/ChooseAccount': (context) => ChooseAccPage(),
            '/Login': (context) => LoginPage(),
          },
        );
      }));
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
