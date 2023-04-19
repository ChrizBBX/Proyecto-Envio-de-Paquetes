import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/screens/auth/welcome_page.dart';
import 'package:flutter_application_1/widgets/modals/login_modal.dart';

import '../views/AppColor.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

String? Identidad;
String? Nombres;
String? Apellidos;
String? Sexo;
String? Contrasena;
String? Username;
String? _errorIdentidad;
String? _errorNombres;
String? _errorApellidos;
String? _errorSexo;
String? _errorUsername;
String? _errorContrasena;

class register_screen extends StatefulWidget {
  const register_screen({super.key});

  @override
  State<register_screen> createState() => _register_screenState();
}

class _register_screenState extends State<register_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryExtraSoft,
      appBar: AppBar(
  title: Text('Registrarse',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
  flexibleSpace: Container(
    decoration: BoxDecoration(
      color: AppColor.secondary
    ),
  ),
),
      body: Container(
        child: Center(
          child: ListView(
            children: [
            Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
        IdentidadInput(),
        NombresInput(),
        ApellidosInput(),
        SexoCheckbox(),
        UsernameInput(),
        ContrasenaInput(),
        BotonEnviar()
            ],
          ),
        ),
            ],
          ),
        ),
      ),
    );
  }


Widget IdentidadInput(){
  return TextField(
    decoration: InputDecoration(
      hintText: 'Numero de Identidad',
      errorText: _errorIdentidad
    ),
    onChanged: (value) {
                  Identidad = value;
                },
  );
}

Widget NombresInput(){
  return TextField(
    decoration: InputDecoration(
      hintText: 'Nombres',
      errorText: _errorNombres
    ),
      onChanged: (value) {
                  Nombres = value;
                },
  );
}

Widget ApellidosInput(){
  return TextField(
    decoration: InputDecoration(
      hintText: 'Apellidos',
      errorText: _errorApellidos,
    ),
      onChanged: (value) {
                  Apellidos = value;
                },
  );
}

Widget UsernameInput(){
  return TextField(
      decoration: InputDecoration(
      hintText: 'Usuario',
      errorText: _errorUsername
      ),
          onChanged: (value) {
                  username = value;
                },
  );
}

Widget ContrasenaInput(){
  return TextField(
      decoration: InputDecoration(
      hintText: 'Contraseña',
      errorText: _errorContrasena
      ),
          onChanged: (value) {
                  Contrasena = value;
                },
  );
}

Widget BotonEnviar(){
  return ElevatedButton(onPressed: () async {
bool x = true;

if(Identidad == "" || Identidad == null){
 setState(() {
   _errorIdentidad = "Complete este campo";
 });
}else{
  print('entra');
 setState(() {
   _errorIdentidad = null;
 });
}

if(Nombres == "" || Nombres == null){
 setState(() {
   _errorNombres = "Complete este campo";
 });
}else{
 setState(() {
   _errorNombres = null;
 });
}

if(Apellidos == "" || Apellidos == null){
 setState(() {
   _errorApellidos = "Complete este campo";
 });
}else{
 setState(() {
   _errorApellidos = null;
 });
}

if(username == "" || username == null){
 setState(() {
   _errorUsername = "Complete este campo";
 });
}else{
 setState(() {
   _errorUsername = null;
 });
}

if(Contrasena == "" || Contrasena == null){
 setState(() {
  print(Contrasena);
   _errorContrasena = "Complete este campo";
 });
}else{
  print('hola');
 setState(() {
   _errorContrasena = null;
 });
}

var url = Uri.parse('http://rapiexprezzz.somee.com/api/Register');
var response = await http.post(
  url,
  headers: {'Content-Type': 'application/json'},
  body: json.encode({'pers_Identidad': Identidad, 'pers_Nombres': Nombres,'pers_Apellidos': Apellidos,'pers_Sexo': Sexo,'pers_EsAdmin': "false",'user_Username': username,"user_Contrasena": Contrasena}),
);

  if (response.statusCode == 200) {
   var jsonResponse = json.decode(response.body);
  if (jsonResponse != null && jsonResponse.length > 0) {
          Navigator.of(context).pop();
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => WelcomePage()));
  } else {

  }
  } else {
//Por si ocurre un error con la URL
  }
},
  child: Text('Registrarse',),
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(AppColor.primary),
  ),
  );
}

}


class SexoCheckbox extends StatefulWidget {
  @override
  _SexoCheckboxState createState() => _SexoCheckboxState();
}

class _SexoCheckboxState extends State<SexoCheckbox> {
  String? _sexoSeleccionado;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          RadioListTile(
            title: Text('Masculino'),
            value: 'Masculino',
            groupValue: _sexoSeleccionado,
            onChanged: (String? value) {
              setState(() {
                _sexoSeleccionado = value;
              });
            },
          ),
          RadioListTile(
            title: Text('Femenino'),
            value: 'Femenino',
            groupValue: _sexoSeleccionado,
            onChanged: (String? value) {
              setState(() {
                _sexoSeleccionado = value;
              });
            },
          ),
        ],
      );
  }
}