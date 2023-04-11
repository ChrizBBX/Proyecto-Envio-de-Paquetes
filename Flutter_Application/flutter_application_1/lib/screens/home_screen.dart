import 'package:flutter/material.dart';

class HomeScreenState extends StatefulWidget {

  @override
  State<HomeScreenState> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenState> {
  int num = 10;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
appBar: AppBar(
  title: Text('Hola mundo: $num'),
),
body: PageView(
children: [
  CustomScreen(color: Colors.pink)
],
),
   );
  }
}

class CustomScreen extends StatelessWidget {
final Color color;

const CustomScreen({required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
color: color,
child: Center(
  child: Text('Los hijos pueden tener hijos'),
),
    );
  }
}