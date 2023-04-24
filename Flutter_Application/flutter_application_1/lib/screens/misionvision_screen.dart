import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/pruebas.dart';

import 'graficas_screen.dart';
import 'index_screen.dart';

class MisionVisionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Misión y Visión'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            elevation: 2.0,
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Misión',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Brindar soluciones y servicio de clase mundial asegurando que nuestros minoristas reciban apoyo en las más de 5000 comunidades a las que servimos.',
                    style: TextStyle(fontSize: 16.0,),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 2.0,
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Visión',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                    
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Apoyar apasionadamente a las empresas pequeñas de nuestros vecindarios porque su comunidad es nuestra comunidad.',
                    style: TextStyle(fontSize: 16.0),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home),
        onPressed: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => FloatingBottomNavigationBar()));
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
