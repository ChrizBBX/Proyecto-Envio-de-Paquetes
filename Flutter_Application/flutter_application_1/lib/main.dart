import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_application_1/screens/index_screen.dart';
import 'package:flutter_application_1/screens/index_screen.dart';
import 'package:flutter_application_1/screens/login.dart';
import 'package:flutter_application_1/screens/auth/welcome_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hola mundo',
      home: WelcomePage(),
    );
  }
}