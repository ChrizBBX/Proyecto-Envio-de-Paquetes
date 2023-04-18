import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../views/AppColor.dart';

class register_screen extends StatefulWidget {
  const register_screen({super.key});

  @override
  State<register_screen> createState() => _register_screenState();
}

class _register_screenState extends State<register_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryExtraSoft,
      appBar: AppBar(
  title: Text('Registrarse',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
  flexibleSpace: Container(
    decoration: BoxDecoration(
      color: AppColor.secondary
    ),
  ),
),
      body: Center(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
