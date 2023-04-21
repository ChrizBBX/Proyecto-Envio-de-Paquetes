
import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/index_screen.dart';
import 'package:flutter_application_1/widgets/fechasalida.dart';
import 'package:flutter_application_1/widgets/checkbox.dart';
import 'package:flutter_application_1/screens/DropDownLists/sucursales.dart';
import 'package:flutter_application_1/screens/DropDownLists/clientes.dart';
import 'package:flutter_application_1/screens/DropDownLists/municipios.dart';
import 'package:flutter_application_1/screens/pruebas.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/services.dart';

String peso = "";
bool errorPeso = false;
bool errorCliente = false;
bool errorSucursal = false;
bool errorDepartamento = false;
bool errorMunicipio = false;
bool errorDireccionExacta = false;
bool errorFechaSalida = false;
String DireccionExacta = "";
class PaquetesForm extends StatefulWidget {

  @override
  State<PaquetesForm> createState() => _PaquetesFormState();
}

class _PaquetesFormState extends State<PaquetesForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  title: Text('Enviar un paquete'),
  flexibleSpace: Container(
    decoration: BoxDecoration(
      color: Colors.grey
    ),
  ),
),
body: Container(
  child: 
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListView(
  children: [
    SizedBox(height: 10,),
    Container(decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 1,),borderRadius: BorderRadius.circular(4),),child: ClientesDDL(),),
    SizedBox(height: 10,),
    Container(decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 1,),borderRadius: BorderRadius.circular(4),),child: sucursalesddl(),),
    SizedBox(height: 10,),
    PesoInput(),
    SizedBox(height: 10,),
    Container(decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 1,),borderRadius: BorderRadius.circular(4),),child: DepartamentosDDL(),),
    SizedBox(height: 10,),
    DireccionExactaInput(),
    SizedBox(height: 10,),
    FechaSalidaInput(),
    SizedBox(height: 10,),
    checkbox(),
    SizedBox(height: 10,),
    btnEnviar(),
  ],
),
  ),
),
    );
  }
  
Widget btnEnviar (){
  return ElevatedButton(
  onPressed: () async {
    bool x = true;
    if(cliente == '' || cliente == 'Seleccione un Cliente'){
       x = false;   
       setState(() {
                    errorCliente = true;
                  });
       print('cliente vacio');
    }else{
         print('cliente lleno');
                  setState(() {
                    errorCliente = false;
                  });
    }

    if(sucursal == 'Seleccione una Sucursal' || sucursal == ''){
       x = false;
                  setState(() {
                    errorSucursal = true;
                  });
       print('sucursal vacia');
    }else{
         print('sucursal lleno');
                  setState(() {
                    errorSucursal = false;
                  });
    }

    if(peso == '' || peso == null){
       x = false;
           setState(() {
                    errorPeso = true;
                  });
      print('peso vacio');
    }else{
         print('peso lleno');
          setState(() {
                    errorPeso = false;
                  });
    }

    if(departamento == 'Seleccione un departamento' || departamento == ''){
       x = false;
      setState(() {
                    errorDepartamento = true;
                  });
       print('Departamento vacio');
    }else{
      print('departamento lleno');
             setState(() {
                    errorDepartamento = false;
                  });
    }

    if(municipio == 'Seleccione un municipio' || municipio == ''){
       x = false;
         setState(() {
                    errorMunicipio = true;
                  });
       print('municipio vacio');
    }else{
         print('municipio lleno');
          setState(() {
                    errorMunicipio = false;
                  });
    }

    if(DireccionExacta == ''){
       x = false;
        setState(() {
                    errorDireccionExacta = true;
                  });
       print('direccion vacio');
    }else{
         print('direccionExacta lleno');
     setState(() {
                    errorDireccionExacta = false;
                  });
    }

    if(fechaFormateada == null || fechaFormateada == ''){
       x = false;
            setState(() {
                    errorFechaSalida = true;
                  });
       print('fecha vacia');
    }else{
         print('fecha lleno');
       setState(() {
                    errorFechaSalida = false;
                  });
    }
print(x);
if(x == true){
var url = Uri.parse('http://chris03-001-site1.htempurl.com/api/Paquetes/Insert');
var response = await http.post(
  url,
  headers: {'Content-Type': 'application/json'},
  body: json.encode({'paqu_Cliente': cliente, 'sucu_ID': sucursal, 'paqu_Peso': peso, 'paqu_Fragil': Fragil, 'muni_ID': municipio, 'paqu_DireccionExacta': DireccionExacta, 'paqu_FechaSalida': fechaFormateada,'trac_ID': "1"}),
);
  if (response.statusCode == 200) {
   var jsonResponse = json.decode(response.body);
if (jsonResponse != null && jsonResponse.length > 0) {
    ElegantNotification.success(
                    width: 360,
                    notificationPosition: NotificationPosition.topLeft,
                    animation: AnimationType.fromTop,
                    title: Text('Agregado'),
                    description: Text('Paquete agregado correctamente'),
                    onDismiss: () {
                      print(
                        'Se envio',
                      );
                    },
                  ).show(context);
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => FloatingBottomNavigationBar()));
  } 
  }
}

},
  child: Text('Enviar'),
  );
}

Widget encabezado (){
  return Container(
    height: 100,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.blue, Colors.purple],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 10),
        Text(
          'Envío de paquete',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}

Widget ClienteInput() {
  return Column(
    children: [
      TextField(
        decoration: InputDecoration(
          hintText: 'Cliente',
          border: OutlineInputBorder(),
        ),
      )
    ],
  );
}

Widget SucursalInput (){
  return Column(
    children: [
      TextField(
        decoration: InputDecoration(
          hintText: 'Sucursal',
          border: OutlineInputBorder(),
        ),
      )
    ],
  );
}
Widget PesoInput (){
  return Container(
    decoration:BoxDecoration(
    border: Border.all(color: errorPeso ? Colors.red : Colors.transparent), // Configura el color del borde según el valor de cliente
    borderRadius: BorderRadius.circular(4.0), // Configura el radio de borde
  ), 
    child: Column(
      children: [
        TextField(
            keyboardType: TextInputType.number, // Define el tipo de teclado como números
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), // Aplica un formateador para permitir solo números
        ],
          decoration: InputDecoration(
            hintText: 'Peso (lb)',
            border: OutlineInputBorder(),
          ),
            onChanged: (value) {
                    peso = value;
                  },
        )
      ],
    ),
  );
}

Widget MetodoPagoInput (){
  return Column(
    children: [
      TextField(
        decoration: InputDecoration(
          hintText: 'Metodo de pago',
          border: OutlineInputBorder(),
        ),
      )
    ],
  );
}

Widget MunicipioInput (){
  return Column(
    children: [
      TextField(
        decoration: InputDecoration(
          hintText: 'Municipio',
          border: OutlineInputBorder(),
        ),
      )
    ],
  );
}

Widget DireccionExactaInput (){
  return Container(
    decoration: BoxDecoration(
    border: Border.all(color: errorDireccionExacta ? Colors.red : Colors.transparent), // Configura el color del borde según el valor de cliente
    borderRadius: BorderRadius.circular(4.0), // Configura el radio de borde
  ),
    child: TextField(
      decoration: InputDecoration(
        hintText: 'Direccion Exacta',
        border:  OutlineInputBorder(),
      ),
         onChanged: (value) {
                DireccionExacta = value;
              },
    ),
  );
}

}