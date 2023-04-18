import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/widgets/graficas_widget.dart';

class Graficas extends StatefulWidget {
  const Graficas({super.key});

  @override
  State<Graficas> createState() => _GraficasState();
}

class _GraficasState extends State<Graficas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  title: Text('Graficas'),
  flexibleSpace: Container(
    decoration: BoxDecoration(
      color: Colors.grey
    ),
  ),
),
      body: Container(
        child: MyBarChart(),
      ),
    );
  }
}