import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/screens/index_screen.dart';
import 'package:flutter_application_1/screens/paquetesform_screen.dart';
import 'package:flutter_application_1/screens/pruebas.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:async';

import 'graficas_screen.dart';


          String? _errorDireccionExacta;
          bool? Alerta;
class FormEditPaquete extends StatefulWidget {
    final String? id;

  FormEditPaquete({required this.id,direccion});

  @override
  State<FormEditPaquete> createState() => _FormEditPaqueteState();
}

class _FormEditPaqueteState extends State<FormEditPaquete> {

    String? _DireccionExactaInput = direccion;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text('Editar Paquete'),
           automaticallyImplyLeading: false,
    ),
    body: Container(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
                 TextField(
                   controller: TextEditingController(text: _DireccionExactaInput),
              onChanged: (value) {
                 _DireccionExactaInput = value;
              },
              decoration: InputDecoration(
                labelText: 'Direccion Exacta',
                errorText: _errorDireccionExacta,
                border: OutlineInputBorder(),
              ),
            ),
            //Boton
            ElevatedButton(onPressed:  () async{
  if(_DireccionExactaInput != null && _DireccionExactaInput != ""){
        setState(() {
      _errorDireccionExacta = null;
    });
    print(_DireccionExactaInput);
var url = Uri.parse('http://chris03-001-site1.htempurl.com/api/Paquetes/Edit');
var response = await http.post(
  
  url,
  headers: {'Content-Type': 'application/json'},
  body: json.encode({'paqu_ID': paqu_ID, 'paqu_DireccionExacta': _DireccionExactaInput}),
);
  if (response.statusCode == 200) {
   var jsonResponse = json.decode(response.body);
if (jsonResponse != null && jsonResponse.length > 0) {
  ElegantNotification.success(
                    width: 360,
                    notificationPosition: NotificationPosition.topLeft,
                    animation: AnimationType.fromTop,
                    title: Text('Editado'),
                    description: Text('Direccion del paquete editada exitosamente'),
                    onDismiss: () {
                      print(
                        'Direccion del paquete editada exitosamente',
                      );
                    },
                  ).show(context);
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => Index()),
  );
  } else {

  }
  } else {
//Por si ocurre un error con la URL
print('hay un error manito');
  }
  }else{
    setState(() {
      _errorDireccionExacta = "Este campo es requerido";
    });
  }
            },
             child: Text('Editar'))
          ], 
        ),
      ),
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

void _redirigirPantalla(BuildContext context) {
  // Lógica para redirigir a la pantalla deseada después de la operación exitosa
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => Index()),
  );

  // Mostrar el mensaje flotante de éxito
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
          children: [
            Icon(Icons.warning), // Barra de progreso circular
            SizedBox(width: 10), // Espaciado horizontal
            Text('Ha ocurrido un error'), // Mensaje de texto
          ],  
        ),
      duration: Duration(seconds: 2), // Duración del mensaje flotante
    ),
  );
}


