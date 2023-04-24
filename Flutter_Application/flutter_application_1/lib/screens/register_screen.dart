import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/screens/auth/welcome_page.dart';
import 'package:flutter_application_1/widgets/modals/login_modal.dart';
import 'package:flutter/services.dart';
import '../views/AppColor.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

String? Identidad;
String? Nombres;
String? Apellidos;
String? Sexo;
String? Contrasena;
String? Username1;
String? errorIdentidad;
String? errorNombres;
String? errorApellidos;
bool errorSexo = false;
String? errorUsername;
String? errorContrasena;
String? sexoSeleccionado;
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
      color: Colors.grey
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
     keyboardType: TextInputType.number, // Define el tipo de teclado como números
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), // Aplica un formateador para permitir solo números
        ],
    decoration: InputDecoration(
      hintText: 'Numero de Identidad',
      errorText: errorIdentidad
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
      errorText: errorNombres
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
      errorText: errorApellidos,
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
      errorText: errorUsername
      ),
          onChanged: (value) {
                  Username1 = value;
                },
  );
}

Widget ContrasenaInput(){
  return TextField(
    obscureText: true,
      decoration: InputDecoration(
      hintText: 'Contraseña',
      errorText: errorContrasena
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
   x = false;
   errorIdentidad = "Complete este campo";
 });
}else{
 setState(() {
   errorIdentidad = null;
 });
}

if(Nombres == "" || Nombres == null){
   x = false;
 setState(() {
   errorNombres = "Complete este campo";
 });
}else{
 setState(() {

   errorNombres = null;
 });
}

if(Apellidos == "" || Apellidos == null){
   x = false;
 setState(() {
   errorApellidos = "Complete este campo";
 });
}else{
 setState(() {
   errorApellidos = null;
 });
}

if(Sexo == "" || Sexo == null){
   x = false;
 setState(() {
   errorSexo = true;
 });
}else{
 setState(() {
   errorSexo = false;
 });
}

if(Username1 == "" || Username1 == null){
   x = false;
 setState(() {
   errorUsername = "Complete este campo";
 });
}else{
 setState(() {
   errorUsername = null;
 });
}

if(Contrasena == "" || Contrasena == null){
   x = false;
 setState(() {
  print(Contrasena);
   errorContrasena = "Complete este campo";
 });
}else{
 setState(() {
   errorContrasena = null;
 });
}

if(x == true){
  var url = Uri.parse('http://chris03-001-site1.htempurl.com/api/Register');
var response = await http.post(
  url,
  headers: {'Content-Type': 'application/json'},
  body: json.encode({'pers_Identidad': Identidad, 'pers_Nombres': Nombres,'pers_Apellidos': Apellidos,'pers_Sexo': Sexo,'pers_EsAdmin': false,'user_Username': Username1,"user_Contrasena": Contrasena}),
);

print(response.statusCode);
  if (response.statusCode == 200) {
   var jsonResponse = json.decode(response.body);
  if (jsonResponse != null && jsonResponse.length > 0) {
          Navigator.of(context).pop();
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => WelcomePage()));
  } else {
//Mostar mensaje de register fallido
print('register fallido');
  }
  } else {
    print('ERROR CON LA URL O ALGO ASI XD');
//Por si ocurre un error con la URL
  }
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
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sexo:',style: TextStyle(fontSize: 15),),
            RadioListTile(
              title: Text('Masculino'),
              value: 'M',
              groupValue: _sexoSeleccionado,
              onChanged: (String? value) {
                setState(() {
                  _sexoSeleccionado = value;
                  Sexo = value;
                });
              },
            ),
            RadioListTile(
              title: Text('Femenino'),
              value: 'F',
              groupValue: _sexoSeleccionado,
              onChanged: (String? value) {
                setState(() {
                  _sexoSeleccionado = value;
                  Sexo = value;
                });
              },
              subtitle: errorSexo == true ? Text('Seleccione una opcion',style: TextStyle(color:Colors.red),): null,
            ),
          ],
        ),
    );
  }
}