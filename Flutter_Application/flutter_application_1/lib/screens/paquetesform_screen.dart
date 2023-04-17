
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/fechasalida.dart';
import 'package:flutter_application_1/widgets/checkbox.dart';
import 'package:flutter_application_1/screens/DropDownLists/sucursales.dart';
import 'package:flutter_application_1/screens/DropDownLists/clientes.dart';
import 'package:flutter_application_1/screens/DropDownLists/departamentos.dart';
import 'package:flutter_application_1/screens/DropDownLists/municipios.dart';

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
        encabezado(),
  SizedBox(height: 10,),
  Container(decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 1,),borderRadius: BorderRadius.circular(4),),child: clientesddl(),),
  SizedBox(height: 10,),
  Container(decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 1,),borderRadius: BorderRadius.circular(4),),child: sucursalesddl(),),
  SizedBox(height: 10,),
  Expanded(child: PesoInput()),
  SizedBox(height: 10,),
  Container(decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 1,),borderRadius: BorderRadius.circular(4),),child: DepartamentosDDL(),),
  SizedBox(height: 10,),
  Expanded(child: DireccionExactaInput()),
  SizedBox(height: 10,),
  Expanded(child: FechaSalidaInput()),
  SizedBox(height: 10,),
  Expanded(child: checkbox()),
  SizedBox(height: 10,),
  Expanded(child: btnEnviar())
      ],
    ),
  ),
),
    );
  }
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
  return Column(
    children: [
      TextField(
        decoration: InputDecoration(
          hintText: 'Peso (lb)',
          border: OutlineInputBorder(),
        ),
      )
    ],
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
  return Column(
    children: [
      TextField(
        decoration: InputDecoration(
          labelText: 'Direccion Exacta',
           labelStyle: TextStyle(fontSize: 22),
            floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(),
        ),
      )
    ],
  );
}

Widget btnEnviar (){
  return Expanded(
    child: ElevatedButton(
    onPressed: () {
      print('hola');
    },
    child: Text('Enviar'),
    ),
  );
}

