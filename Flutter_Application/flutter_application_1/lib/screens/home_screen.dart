import 'package:flutter/material.dart';

class HomeScreenState extends StatefulWidget {
  @override
  State<HomeScreenState> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenState> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi aplicación'),
        actions: [
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              // Mostrar diálogo de información
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Información'),
                    content: Text('Este es un ejemplo de aplicación.'),
                    actions: [
                      TextButton(
                        child: Text('Cerrar'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: CustomScreen(color: Colors.blueGrey),
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
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'MISIÓN',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Brindar soluciones y servicio de clase mundial con asegurar que nuestros minoristas reciban apoyo en las más de 5000 comunidades a las que servimos.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 32),
            Text(
              'VISIÓN',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Apoyar apasionadamente a las empresas pequeñas de nuestros vecindarios porque su comunidad es nuestra comunidad.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
         ElevatedButton(
            onPressed: () {},
            child: const Text('Sobre nosotros'),
          ),
          ],
        ),
      ),
    );
  }
}
