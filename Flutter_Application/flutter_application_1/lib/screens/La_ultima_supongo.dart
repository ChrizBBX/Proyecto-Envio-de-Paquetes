import 'dart:ui';
import 'package:flutter/material.dart';

class puta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 50.0), // ajusta el valor de padding para mover hacia abajo
        child: Center(
          child: SizedBox(
            width: 250.0, // ajusta el valor de width para hacer más pequeño
            height: 250.0, // ajusta el valor de height para hacer más pequeño
            child: Image.asset('assets/images/Encamino.gif'),
          ),
        ),
      ),
    );
  }
}





// class MiDato {
//   final String id;
//   final String nombre;
//   final String descripcion;

//   MiDato({required this.id, required this.nombre, required this.descripcion});
// }

// final misDatos = [
//   MiDato(
//     id: '1',
//     nombre: 'Dato 1',
//     descripcion: 'Descripción del dato 1',
//   ),
//   MiDato(
//     id: '2',
//     nombre: 'Dato 2',
//     descripcion: 'Descripción del dato 2',
//   ),
//   MiDato(
//     id: '3',
//     nombre: 'Dato 3',
//     descripcion: 'Descripción del dato 3',
//   ),
// ];

// ListView.builder(
//   itemCount: misDatos.length,
//   itemBuilder: (BuildContext context, int index) {
//     return Card(
//       child: InkWell(
//         onTap: () {
//           // Navegar a la pantalla de detalles cuando se haga clic en la tarjeta
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => DetallesScreen(dato: misDatos[index]),
//             ),
//           );
//         },
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Text(
//                 misDatos[index].nombre,
//                 style: TextStyle(fontSize: 18.0),
//               ),
//               SizedBox(height: 8.0),
//               Text(misDatos[index].descripcion),
//             ],
//           ),
//         ),
//       ),
//     );
//   },
// );

// class DetallesScreen extends StatelessWidget {
//   final MiDato dato;

//   DetallesScreen({required this.dato});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(dato.nombre)),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               dato.nombre,
//               style: TextStyle(fontSize: 18.0),
//             ),
//             SizedBox(height: 8.0),
//             Text(dato.descripcion),
//             SizedBox(height: 16.0),
//             Text('ID: ${dato.id}'),
//           ],
//         ),
//       ),
//     );
//   }
// }
