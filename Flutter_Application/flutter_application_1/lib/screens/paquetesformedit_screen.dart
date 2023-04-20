import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/screens/index_screen.dart';
import 'package:flutter_application_1/screens/paquetesform_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:async';


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
  Alerta = true;
  Navigator.push(
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
    );
  }
}

void _redirigirPantalla(BuildContext context) {
  // Lógica para redirigir a la pantalla deseada después de la operación exitosa
  Navigator.push(
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


