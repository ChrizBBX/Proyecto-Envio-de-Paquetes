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
      backgroundColor: AppColor.primaryExtraSoft,
//       appBar: AppBar(
//   flexibleSpace: Container(
//     decoration: BoxDecoration(
//       color: Colors.white
//     ),
//   ),
// ),

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

Widget btnEnviarUnPaquete(BuildContext context) {
  return GestureDetector(
    onTap: () {
      peso = "";
      errorPeso = false;
      errorCliente = false;
      errorSucursal = false;
      errorDepartamento = false;
      errorMunicipio = false;
      errorDireccionExacta = false;
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
    child: Container(
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
        image: DecorationImage(
          image: NetworkImage('https://static.vecteezy.com/system/resources/previews/003/212/264/non_2x/abstract-modern-soft-blue-gradient-diagonal-lines-background-free-vector.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Icon(Icons.local_shipping, color: Colors.black, size: 50,),
            SizedBox(width: 30,),
            Expanded(
              child: Text(
                'Enviar un Paquete',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 30, color: Colors.black,),
          ],
        ),
      ),
    ),
  );
}




Widget btnHistorialdePaquetes(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Index()));
    },
    child: Container(
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
        image: DecorationImage(
          image: NetworkImage('https://static.vecteezy.com/system/resources/previews/000/189/953/non_2x/vibrant-diagonal-lines-pattern-background-vector.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Icon(Icons.access_time, color: AppColor.secondary, size: 50,),
            SizedBox(width: 30,),
            Expanded(
              child: Text(
                'Historial de Paquetes',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 30, color: Colors.white,),
          ],
        ),
      ),
    ),
  );
}





Widget btnEstadisticas(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Graficas()));
    },
    child: Container(
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage('https://th.bing.com/th/id/OIP.0ykZkL654vrD8vuRRjIYGgHaEo?pid=ImgDet&rs=1'),
          fit: BoxFit.cover, // Ajustar la imagen al tamaño del contenedor
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Icon(Icons.bar_chart, color: AppColor.secondary, size: 50,),
            SizedBox(width: 30,),
            Expanded(
              child: Text(
                'Estadisticas y Graficas',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 30, color: Colors.white,),
          ],
        ),
      ),
    ),
  );
}

