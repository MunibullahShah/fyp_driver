import 'package:flutter/material.dart';
import 'package:fyp_driver/Screens/welcome_page.dart';
import 'package:fyp_driver/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme:
          ThemeData(colorSchemeSeed: const Color(0xffd64d), useMaterial3: true),
      home: const LoginPage(),
    );
  }
}
