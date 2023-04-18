import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/views/AppColor.dart';

String? username;
String? password;
bool errorusername = false;
bool errorpassword = false;
class newlogin extends StatefulWidget {
  const newlogin({super.key});

  @override
  State<newlogin> createState() => _newloginState();
}

class _newloginState extends State<newlogin> {
  @override
  Widget build(BuildContext context) {
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
                     decoration: BoxDecoration(
    border: Border.all(color: errorusername == true ? Colors.red : Colors.transparent),
    borderRadius: BorderRadius.circular(4.0),
  ),
                 child: TextField(
                    decoration: InputDecoration(hintText: 'Usuario',fillColor: AppColor.secondary, filled: true),
                    style: TextStyle(    
                    ),
                    onChanged: (value) {
                      username = value;
                    },
                  ),
               ),
             ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
    border: Border.all(color: errorpassword == true ? Colors.red : Colors.transparent),
    borderRadius: BorderRadius.circular(4.0),
  ),
                  child: TextField(
                    decoration: InputDecoration(hintText: 'Contraseña', fillColor: AppColor.secondary,filled: true),
                    obscureText: true,
                    onChanged: (value) {
                      password = value;
                    },
                  ),
                ),
              ),
        ],
      ),
    );
  }
}