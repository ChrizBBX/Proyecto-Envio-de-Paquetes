import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/paquetesform_screen.dart';
import 'package:flutter_application_1/screens/index_screen.dart';
import 'package:flutter_application_1/screens/DropDownLists/clientes.dart';
import 'package:flutter_application_1/screens/DropDownLists/municipios.dart';
import 'package:flutter_application_1/screens/DropDownLists/sucursales.dart';
import 'package:flutter_application_1/widgets/fechasalida.dart';
import 'package:flutter_application_1/screens/graficas_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
 
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
      appBar: AppBar(
        title: Text('Bottom Navigation Bar Example'),
      ),
      body: Container(
        child: Column(
          children: [
            Card(
      elevation: 4, // Elevación de la tarjeta
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0), // Bordes redondeados de la tarjeta
      ),
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Márgenes de la tarjeta
      child: Padding(
        padding: EdgeInsets.all(16.0), // Padding interno de la tarjeta
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Alineación del contenido a la izquierda
          children: [
            Text(
              'Quines somos', // Encabezado
              style: TextStyle(
                fontSize: 24.0, // Tamaño de fuente del encabezado
                fontWeight: FontWeight.bold, // Estilo de fuente del encabezado
              ),
            ),
            SizedBox(height: 16.0), // Espaciado entre el encabezado y el cuerpo de texto
            Text(
              'RapiExprezzz es una empresa con un orgulloso pasado y un futuro aún más brillante. Nuestros valores nos definen. Nuestra cultura nos distingue. Nuestra estrategia nos impulsa. En RapiExprezzzz el cliente es lo primero, las personas lideran y la innovación impulsa.', // Cuerpo de texto
              style: TextStyle(
                fontSize: 16.0, // Tamaño de fuente del cuerpo de texto
              ),
            ),// Espaciado flexible para empujar el botón a la parte inferior
            ElevatedButton(
              onPressed: () {
                // Acción del botón
              },
              child: Text(
                'Saber mas', // Texto del botón
                style: TextStyle(
                  fontSize: 16.0, // Tamaño de fuente del botón
                  fontWeight: FontWeight.bold, // Estilo de fuente del botón
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Color de fondo del botón
                onPrimary: Colors.white, // Color de texto del botón
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 1.0), // Padding del botón
              ),
            ),
          ],
        ),
      ),
    ),
    SizedBox(height: 35,),
CarouselSlider(
  options: CarouselOptions(
    height: 200.0, // Altura del carrusel
    enableInfiniteScroll: true, // Desplazamiento infinito del carrusel
    autoPlay: true, // Reproducción automática del carrusel
    autoPlayInterval: Duration(seconds: 3), // Intervalo de reproducción automática
    autoPlayAnimationDuration: Duration(milliseconds: 800), // Duración de la animación de reproducción automática
    autoPlayCurve: Curves.fastOutSlowIn, // Curva de animación de reproducción automática
    enlargeCenterPage: true, // Ampliar la página central del carrusel
  ),
  items: [
    // Lista de elementos del carrusel
    // Elemento 1
    Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg1.jpg'), // Ejemplo de una imagen cargada desde un archivo local
          fit: BoxFit.cover, // Ajuste de la imagen en el contenedor
        ),
      ),
      child: Center(
    child: Column(
      children: [
        SizedBox(height: 10,),
        Container(child: Text('Envios a nivel nacional',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.white),),decoration: BoxDecoration(color: Color.fromRGBO(100, 94, 94, 0.561)),),
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text('Tenemos rutas que cubren todo el pais "No hay ruta donde no lleguemos"',style: TextStyle(fontSize: 20,color: Colors.white),),
        )
      ],
    ),
      ),
    ),
    // Elemento 2
    Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/seguridad.jpg'), // Ejemplo de una imagen cargada desde un archivo local
          fit: BoxFit.cover, // Ajuste de la imagen en el contenedor
        ),
      ),
      child: Center(
       child: Column(
        children: [
          Container(child: Text('Seguridad',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),)
        ],
       ),
      ),
    ),
    // Agrega más elementos aquí según tus necesidades
  ],
),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
               peso = "";
      errorPeso = false;
      errorCliente = false;
      errorSucursal = false;
      errorDepartamento = false;
      errorMunicipio = false;
      errorDireccionExacta = false;
      DireccionExacta = "";
      cliente = "";
      sucursal = "";
      peso = "";
      departamento = "";
      municipio = "";
      DireccionExacta = "";
      fechaFormateada = "";

      Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaquetesForm()));
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
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Index()));
                },
              ),
              IconButton(
                icon: Icon(Icons.show_chart),
                onPressed: () {
                  _onItemTapped(2);
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Graficas()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
