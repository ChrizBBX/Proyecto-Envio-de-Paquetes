import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/auth/recoverpassword_page.dart';
import 'package:flutter_application_1/views/AppColor.dart';
import 'package:flutter_application_1/screens/admin_screen.dart';
import 'package:flutter_application_1/widgets/modals/register_modal.dart';
import 'package:flutter_application_1/screens/register_screen.dart';
import 'package:flutter_application_1/widgets/newlogin.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import '../pruebas.dart';

bool? userEsAdmin;
bool errorLogin = false;
String? pers_ID;
String? user_NombreCompleto;
String? user_Username;
String? pers_Identidad;
class WelcomePage extends StatefulWidget {
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/bg.gif'), fit: BoxFit.cover)),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 32),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 80 / 100,
              decoration: BoxDecoration(gradient: AppColor.linearBlackBottom),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: Text('Con Ganas de Enviar un Paquete?', style: TextStyle(fontFamily: 'inter', fontWeight: FontWeight.w700, fontSize: 32, color: Colors.white)),
                      ),
                      Text("Te ayudaremos cuando necesites ayuda", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      newlogin(),
                     
                      SizedBox(height: 16),
                      // Log in Button
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        child: OutlinedButton(
                          child: Text('Iniciar Sesión', style: TextStyle(color: AppColor.secondary, fontSize: 16, fontWeight: FontWeight.w600, fontFamily: 'inter')),
                          onPressed: () async {

                            if(username == "" || username == null){
                                    setState(() {
                            errorusername = true;
                             });
                            }else{
                                    setState(() {
                            errorusername = false;
                             });
                            }

                             if(password == "" || password == null){
                                    setState(() {
                            errorpassword = true;
                             });
                            }else{
                                    setState(() {
                            errorpassword = false;
                             });
                            }
var url = Uri.parse('http://chris03-001-site1.htempurl.com/api/Usuarios/Login');
var response = await http.put(
  url,
  headers: {'Content-Type': 'application/json'},
  body: json.encode({'user_Username': username, 'user_Contrasena': password}),
);

  if (response.statusCode == 200) {
   var jsonResponse = json.decode(response.body);
if (jsonResponse != null && jsonResponse.length > 0) {
    userEsAdmin = jsonResponse[0]['pers_EsAdmin'];
    pers_ID = jsonResponse[0]['pers_ID'].toString();
    user_NombreCompleto = jsonResponse[0]['user_NombreCompleto'];
    user_Username = jsonResponse[0]['user_Username'];
    pers_Identidad = jsonResponse[0]['pers_Identidad'];
    print(userEsAdmin);
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => FloatingBottomNavigationBar()));
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Row(
          children: [
            Icon(Icons.warning), // Barra de progreso circular
            SizedBox(width: 10), // Espaciado horizontal
            Text('Usuario o contraseña incorrectos'), // Mensaje de texto
          ],  
        ),
        duration: Duration(seconds: 2), // Duración del SnackBar
      ),
    );
  }
  } else {
//Por si ocurre un error con la URL
  }
},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            primary: AppColor.primarySoft,
                          ),
                        ),
                      ),
                      //Mensaje de login faliido
                    
                      //Fin mensaje de login fallido
                      Text('No tienes una cuenta?', style: TextStyle(color: AppColor.secondary),),
                        Container(
                          child: InkWell(
          // Usamos InkWell para hacer el texto clickeable
          child: Text(
            'Registrate',
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
             Identidad = null;
 Nombres = null;
 Apellidos = null;
 Sexo = null;
 Contrasena = null;
 Username1 = null;
 errorIdentidad = null;
 errorNombres = null;
 errorApellidos = null;
 errorSexo = false;
 errorUsername = null;
 errorContrasena = null;
 sexoSeleccionado = null; 
 username = null;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => register_screen(),
              ),
            );
          },
        ),
                        ),
                        SizedBox(height: 20,),
                        Container(child: Text('Has olvidado tu contraseña?',style: TextStyle(color: AppColor.secondary),),),
                        Container(
                          child: InkWell(
          // Usamos InkWell para hacer el texto clickeable
          child: Text(
            'Cambiar Contraseña',
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
             Identidad = null;
 Nombres = null;
 Apellidos = null;
 Sexo = null;
 Contrasena = null;
 Username1 = null;
 errorIdentidad = null;
 errorNombres = null;
 errorApellidos = null;
 errorSexo = false;
 errorUsername = null;
 errorContrasena = null;
 sexoSeleccionado = null;
 username = null;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RecoverPage(),
              ),
            );
          },
        ),
                        ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        margin: EdgeInsets.only(top: 20),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'Para unirse a RapiExprezzz tienes que aceptar nuestros',
                            style: TextStyle(color: Colors.white.withOpacity(0.6), height: 150 / 100),
                            children: [
                              TextSpan(
                                text: 'Terminos y Servicios ',
                                style: TextStyle(color: Colors.white.withOpacity(0.6), fontWeight: FontWeight.w700, height: 150 / 100),
                              ),
                              TextSpan(
                                text: 'Y ',
                                style: TextStyle(color: Colors.white.withOpacity(0.6), height: 150 / 100),
                              ),
                              TextSpan(
                                text: 'Politica de Privacidad.',
                                style: TextStyle(color: Colors.white.withOpacity(0.6), fontWeight: FontWeight.w700, height: 150 / 100),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }
}
