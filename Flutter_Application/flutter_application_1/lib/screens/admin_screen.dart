import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/DropDownLists/clientes.dart';
import 'package:flutter_application_1/screens/DropDownLists/municipios.dart';
import 'package:flutter_application_1/screens/DropDownLists/sucursales.dart';
import 'package:flutter_application_1/screens/paquetesform_screen.dart';
import 'package:flutter_application_1/screens/auth/welcome_page.dart';
import 'package:flutter_application_1/screens/index_screen.dart';
import 'package:flutter_application_1/views/AppColor.dart';
import 'package:flutter_application_1/widgets/fechasalida.dart';
import 'package:flutter_application_1/screens/graficas_screen.dart';
class admin_screen extends StatefulWidget {

  @override
  State<admin_screen> createState() => _admin_screenState();
}

class _admin_screenState extends State<admin_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  title: Text('RapiExprezzz'),
  flexibleSpace: Container(
    decoration: BoxDecoration(
      color: Colors.grey
    ),
  ),
),

      body: Container(
        child: ListView(
          children: [
            //Un poco de espacio arriba
            SizedBox(height: 20,),
       btnHistorialdePaquetes(context),
            //Division Historial de paqutes con Hacer un paquete
            SizedBox(height: 30,),
      btnEnviarUnPaquete(context),
            SizedBox(height: 30,),
      btnEstadisticas(context),
          ],
        ),
      )
    );
  }
}

// Widget btnBackToLogin (final context){
//   return       Column(
//               children: [
//                  ElevatedButton(
//                   onPressed: () {
//                     Navigator.of(context).push(MaterialPageRoute(builder: (context) => WelcomePage()));
//                   },
//                   child: Text('Regresar al login xd', style: TextStyle(color: AppColor.secondary, fontSize: 16, fontWeight: FontWeight.w600, fontFamily: 'inter')
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                     primary: AppColor.primarySoft,
//                   ),
//                 ),   
//                 //            
//               ],
//             );
// }

Widget btnEnviarUnPaquete (context){
  return Column(
    children: [
      ElevatedButton(
        onPressed: () {
 peso = "";
 errorPeso = false;
 errorCliente = false;
errorSucursal = false;
errorDepartamento = false;
errorMunicipio = false;
 errorDireccionExacta = false;
 errorFechaSalida = false;
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
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
                Icon(Icons.local_shipping, color:  Colors.black,size: 50,),
                           //Espacio entre el icono y el texto
                                  SizedBox(width: 30,),
              //Espacio entre el texto y la flechita
              Expanded(child: Text('Enviar un Paquete',
                style: TextStyle(fontSize: 20, color: Colors.black),
              )),
            
              //Flechita xd
              Icon(Icons.arrow_forward_ios,  size: 30,color: Colors.black,),
            ],
          ),
        ),  
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
        ),
      ),        
    ],
  );
}

Widget btnHistorialdePaquetes(context){
  return Column(
    children: [
      ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyWidget()));
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
                Icon(Icons.access_time, color:  Colors.black,size: 50,),
                           //Espacio entre el icono y el texto
                                  SizedBox(width: 30,),
              //Espacio entre el texto y la flechita
              Expanded(child: Text('Historial de Paquetes',
                style: TextStyle(fontSize: 20, color: Colors.black),
              )),
            
              //Flechita xd
              Icon(Icons.arrow_forward_ios,  size: 30,color: Colors.black,),
            ],
          ),
        ),  
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
        ),
      ),        
    ],
  );
}


Widget btnEstadisticas(context){
  return Column(
    children: [
      ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Graficas()));
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
                Icon(Icons.bar_chart, color:  Colors.black,size: 50,),
                           //Espacio entre el icono y el texto
                                  SizedBox(width: 30,),
              //Espacio entre el texto y la flechita
              Expanded(child: Text('Estadisticas y Graficas',
                style: TextStyle(fontSize: 20, color: Colors.black),
              )),
            
              //Flechita xd
              Icon(Icons.arrow_forward_ios,  size: 30,color: Colors.black,),
            ],
          ),
        ),  
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
        ),
      ),        
    ],
  );
}