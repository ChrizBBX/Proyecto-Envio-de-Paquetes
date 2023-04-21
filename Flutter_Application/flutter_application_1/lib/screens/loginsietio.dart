import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/custom_app_bar.dart';
import 'package:flutter_application_1/screens/profile_.dart';

class FloatingBottomNavigationBar extends StatefulWidget {
  @override
  _FloatingBottomNavigationBarState createState() =>
      _FloatingBottomNavigationBarState();
}

class _FloatingBottomNavigationBarState
    extends State<FloatingBottomNavigationBar> {
  int _selectedIndex = 1; // Índice de la opción seleccionada

  // Lista de íconos para la barra de navegación
  final List<IconData> _icons = [
    Icons.search, // Ícono de historial
    Icons.add, // Ícono de más
    Icons.show_chart, // Ícono de gráficos
  ];

  // Función para cambiar la opción seleccionada
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Lógica adicional basada en la opción seleccionada
    switch (index) {
      case 0:
        // Lógica para el ícono de historial
        break;
      case 1:
        // Lógica para el ícono de más
        break;
      case 2:
        // Lógica para el ícono de gráficos
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text('Prueba de Perfil'),
        showProfilePhoto: true,
        profilePhoto: AssetImage('assets/images/profile.png'),
        profilePhotoOnPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfilePage()));
        },
      ),
      body: Center(
        child: Text('Contenido de la página'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
      //          peso = "";
      // errorPeso = false;
      // errorCliente = false;
      // errorSucursal = false;
      // errorDepartamento = false;
      // errorMunicipio = false;
      // errorDireccionExacta = false;
      // DireccionExacta = "";
      // cliente = "";
      // sucursal = "";
      // peso = "";
      // departamento = "";
      // municipio = "";
      // DireccionExacta = "";
      // fechaFormateada = "";

      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaquetesForm()));
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // IconButton(
              //   icon: Icon(Icons.search),
              //   onPressed: () {          
              //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => Index()));
              //   },
              // ),
              // IconButton(
              //   icon: Icon(Icons.show_chart),
              //   onPressed: () {
              //     _onItemTapped(2);
              //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => Graficas()));
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}