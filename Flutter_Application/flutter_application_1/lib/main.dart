import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/admin_screen.dart';
import 'package:flutter_application_1/screens/auth/welcome_page.dart';
import 'package:flutter_application_1/screens/pruebas.dart';


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
