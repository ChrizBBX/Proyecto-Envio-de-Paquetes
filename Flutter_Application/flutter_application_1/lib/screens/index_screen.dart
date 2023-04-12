import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String url = "https://localhost:44309/api/MetodosPago";

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
    body: FutureBuilder<dynamic>(
      future: _getListado(),
      builder: (context,item){
        if(item.hasData){
          return ListView(
            children: listado(item.data),
          );
        }
        else{
          return Text("Sin datos");
        }
      },
    ),
   );
  }
}

List<Widget> listado(List<dynamic> info){
  List<Widget> lista = [];

info.forEach((element) {
  lista.add(Text(element["meto_Nombre"]));
});

  return lista;
}