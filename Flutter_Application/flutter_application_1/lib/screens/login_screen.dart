import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginForm extends StatefulWidget{
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm>{
  @override
  Widget build(BuildContext context){
   return Scaffold(
    body: Text(
      'hola'
    )
   );
  }
}