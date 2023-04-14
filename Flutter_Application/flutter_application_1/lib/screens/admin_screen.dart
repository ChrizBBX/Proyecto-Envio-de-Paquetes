import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/auth/welcome_page.dart';
import 'package:flutter_application_1/screens/index_screen.dart';
import 'package:flutter_application_1/views/AppColor.dart';
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
      ElevatedButton(onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyWidget()));
      }, child:   Row(
              children: [
                //Icono
                Icon(Icons.local_shipping,
                size: 50,
                color: Colors.black,),
                //Espacio entre el icono y el texto
                SizedBox(width: 30,),
                Text('Enviar un paquete',
                style: 
                TextStyle(fontSize: 20,
                color: Colors.black),),
                //espacio entre el texto y la flechita
                SizedBox(width: 80,),
                //Flechita xd
                Icon(Icons.arrow_forward_ios,  size: 30, color: Colors.black,)
              ],
            ),
              style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Colors.white,
                  ),
            )
    ],
  );
}

Widget btnHistorialdePaquetes(context){
  return               Column(
              children: [
                 ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyWidget()));
                  },
                  child:    Row(
              children: [
                //Icono
                Icon(Icons.access_time,
                size: 50,
                color: Colors.black,),
                //Espacio entre el icono y el texto
                SizedBox(width: 30,),
                Text('Historial de Paquetes',
                style: 
                TextStyle(fontSize: 20,
                color: Colors.black),),
                //espacio entre el texto y la flechita
                SizedBox(width: 50,),
                //Flechita xd
                Icon(Icons.arrow_forward_ios,  size: 30,color: Colors.black,)
              ],
            ),  
              style: ElevatedButton.styleFrom(
backgroundColor: Colors.white,
  ),
                ),        
              ],
            );
}

Widget btnEstadisticas(context){
  return               Column(
              children: [
                 ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyWidget()));
                  },
                  child:    Row(
              children: [
                //Icono
                Icon(Icons.bar_chart,
                size: 50,
                color: Colors.black,),
                //Espacio entre el icono y el texto
                SizedBox(width: 30,),
                Text('Estadisticas y Graficas',
                style: 
                TextStyle(fontSize: 20,
                color: Colors.black),),
                //espacio entre el texto y la flechita
                SizedBox(width: 50,),
                //Flechita xd
                Icon(Icons.arrow_forward_ios,  size: 30,color: Colors.black,)
              ],
            ),  
              style: ElevatedButton.styleFrom(
backgroundColor: Colors.white,
  ),
                ),        
              ],
            );
}