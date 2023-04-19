import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/auth/welcome_page.dart';
import 'package:flutter_application_1/views/AppColor.dart';
import 'package:flutter_application_1/screens/admin_screen.dart';
import 'package:flutter_application_1/widgets/modals/register_modal.dart';
import 'package:flutter_application_1/screens/register_screen.dart';
import 'package:flutter_application_1/widgets/newlogin.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

String? UsernameRecover;
String? ContrasenaRecover;
String? errorUsernameRecover;
String? errorContrasenaRecover;
class RecoverPage extends StatefulWidget {
  @override
  State<RecoverPage> createState() => _RecoverPageState();
}

class _RecoverPageState extends State<RecoverPage> {
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
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 150),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 75 / 100,
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
                        child: Text('Cambiar Contraseña', style: TextStyle(fontFamily: 'inter', fontWeight: FontWeight.w700, fontSize: 32, color: Colors.white)),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
  
                     Campos(),
                      SizedBox(height: 16),
                      // Log in Button
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        child: OutlinedButton(
                          child: Text('Cambiar Contraseña', style: TextStyle(color: AppColor.secondary, fontSize: 16, fontWeight: FontWeight.w600, fontFamily: 'inter')),
                          onPressed: () async {
                            bool x = true;
                            if(UsernameRecover == "" || UsernameRecover == null){
                              x = false;
                                    setState(() {
                            errorUsernameRecover = "Este campo es requerido";
                             });
                            }else{
                                    setState(() {
                            errorUsernameRecover = null;
                             });
                            }

                             if(ContrasenaRecover == "" || ContrasenaRecover == null){
                              x = false;
                                    setState(() {
                            errorContrasenaRecover = "Este campo es requerido";
                             });
                            }else{
                                    setState(() {
                            errorContrasenaRecover = null;
                             });
                            }

                            if(x == true){
var url = Uri.parse('http://chris03-001-site1.htempurl.com/api/Usuarios/Recover');
var response = await http.put(
  url,
  headers: {'Content-Type': 'application/json'},
  body: json.encode({'user_Username': UsernameRecover, 'user_Contrasena': ContrasenaRecover}),
);

  if (response.statusCode == 200) {
   var jsonResponse = json.decode(response.body);
if (jsonResponse != null && jsonResponse.length > 0) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => WelcomePage()));
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
                            }
},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            primary: AppColor.primarySoft,
                          ),
                        ),
                      ),
                        SizedBox(height: 1,),
                        Container(child: Text('Ya tienes una cuenta?',style: TextStyle(color: AppColor.secondary),),),
                        Container(
                          child: InkWell(
          // Usamos InkWell para hacer el texto clickeable
          child: Text(
            'Iniciar Sesion',
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WelcomePage(),
              ),
            );
          },
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


Widget Campos (){
  return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0)
        ),
      ),
      child: Column(
        children: [
             Padding(
               padding: const EdgeInsets.all(15.0),
               child: Container(
                 child: TextField(
                    decoration: InputDecoration(hintText: 'Usuario',fillColor: AppColor.secondary.withOpacity(0.5), filled: true,errorText: errorUsernameRecover),
                    style: TextStyle(    
                    ),
                    onChanged: (value) {
                      UsernameRecover = value;
                    },
                  ),
               ),
             ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  decoration: InputDecoration(hintText: 'Nueva Contraseña', fillColor: AppColor.secondary.withOpacity(0.5),filled: true,errorText: errorContrasenaRecover),
                  obscureText: true,
                  onChanged: (value) {
                    ContrasenaRecover = value;
                  },
                ),
              ),
        ],
      ),
    );
}