import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String url = "http://rapiexprezzz.somee.com/api/Paquetes";

Future<dynamic>  _getListado() async{
  final respuesta = await http.get(Uri.parse(url));
  if(respuesta.statusCode == 200){
    final json = respuesta.body;
    return jsonDecode(json);
  }else{
    print('Ha ocurrido un error');
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
        title: Text("Historial de Paquetes"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.grey],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ),
    
      body: FutureBuilder<dynamic>(
        future: _getListado(),

        builder: (context, item){
          if(item.hasData){
            return ListView(
              children: listado(item.data)
            );
          }
          else{
            return const Text("Sin data");
          }
        },
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  final String paqu_ID;
  final String paqu_ClienteNombreCompleto;
  final String sucu_Nombre;
  final String paqu_Peso;
  final String muni_Descripcion;
  final String muni_DireccionExacta;

  ItemWidget({
    required this.paqu_ID,
    required this.paqu_ClienteNombreCompleto,
    required this.sucu_Nombre,
    required this.paqu_Peso,
    required this.muni_Descripcion,
    required this.muni_DireccionExacta,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [
                Text(
                  'ID: ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  paqu_ID,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [
                Text(
                  'Cliente: ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  paqu_ClienteNombreCompleto,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [
                Text(
                  'Sucursal: ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  sucu_Nombre,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [
                Text(
                  'Peso (lb): ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  paqu_Peso,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [
                Text(
                  'Destino: ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  muni_Descripcion,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [
                Text(
                  'DireccionExacta: ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                  Flexible(
        child: Text(
          muni_DireccionExacta,
          style: TextStyle(fontSize: 16),
        ),
      ),
              ],
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}



List<Widget> listado(List<dynamic> info){

  List<Widget> lista = [];

  info.forEach((element) {
    var item = ItemWidget(
      paqu_ID: element["paqu_ID"].toString(),
      paqu_ClienteNombreCompleto: element["paqu_ClienteNombreCompleto"],
      sucu_Nombre: element["sucu_Nombre"],
       paqu_Peso: element["paqu_Peso"].toString(),
        muni_Descripcion: element["muni_Descripcion"],
         muni_DireccionExacta: element["paqu_DireccionExacta"],
    );
    lista.add(item);
  });

  return lista;
}


Widget PaquetesGet(){
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
