
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class PaquetesForm extends StatefulWidget {

  @override
  State<PaquetesForm> createState() => _PaquetesFormState();
}

class _PaquetesFormState extends State<PaquetesForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hola'),
      ),
    );
  }
}

