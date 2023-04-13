import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String url = "https://localhost:44309/api/Paquetes";

Future<dynamic>  _getListado() async{
  final respuesta = await http.get(Uri.parse(url));
  if(respuesta.statusCode == 200){
    final json = respuesta.body;
    return jsonDecode(json);
  }else{
    print('Ha ocurrido un error');
  }
}

class MyWidget extends StatefulWidget{
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget>{
  @override
  Widget build(BuildContext context){
   return Scaffold(
    appBar: AppBar(
      title: Text("Listado Metodos Pago"),
    ),
    body: MetodosPagoGet()
   );
  }
}

List<Widget> listado(List<dynamic> info){
  List<Widget> lista = [];

  // Agregar fila de encabezado de tabla
  lista.add(
    Row(
      children: [
        Expanded(
          child: Text("ID"),
        ),
        Expanded(
          child: Text("Nombre"),
        ),
      ],
    )
  );

  // Agregar filas de tabla para cada elemento
  info.forEach((element) {
    lista.add(
      Row(
        children: [
          Expanded(
            child: Text(element["meto_ID"].toString()),
          ),
          Expanded(
            child: Text(element["meto_Nombre"]),
          ),
        ],
      )
    );
  });
  return lista;
}


Widget MetodosPagoGet(){
  return FutureBuilder<dynamic>(
      future: _getListado(),
      builder: (context,item){
        if(item.hasData){
          return Container(
            width: 300, 
            child: ListView(
              children: listado(item.data),
            ),
            alignment: Alignment.center,
          );
        }
        else{
          return Text("Sin datos");
        }
      },
    );
}
