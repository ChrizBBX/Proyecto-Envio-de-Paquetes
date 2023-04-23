import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/screens/pruebas.dart';
import 'package:flutter_application_1/widgets/graficas_widget.dart';

import 'index_screen.dart';

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
       automaticallyImplyLeading: false,
  flexibleSpace: Container(
    decoration: BoxDecoration(
      color: Colors.grey
    ),
  ),
),
      body: Container(
        child: MyBarChart(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home),
        onPressed: () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => FloatingBottomNavigationBar()));
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {          
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Index()));
                },
              ),
              IconButton(
                icon: Icon(Icons.show_chart),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Graficas()));
                },
              ),
            ],
          ),
        ),
      ),

    );
  }
}