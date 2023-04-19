import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String url = "http://chris03-001-site1.htempurl.com/api/Paquetes";

Future<dynamic> _getListado({String? searchId}) async {
  final respuesta = await http.get(Uri.parse(url));
  if (respuesta.statusCode == 200) {
    final json = respuesta.body;
    final list = jsonDecode(json);
    if (searchId != null) {
      return list
          .where((element) =>
              element['paqu_ID'].toString().toLowerCase().contains(searchId.toLowerCase()))
          .toList();
    }
    return list;
  } else {
    print('Ha ocurrido un error');
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
    final _searchController = TextEditingController();
  final _searchFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
      final searchId = _searchController.text.trim();
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.grey,
  title: TextField(
    controller: _searchController,
    focusNode: _searchFocusNode,
    decoration: InputDecoration(
      hintText: 'Buscar por ID de tracking...',
      border: InputBorder.none,
      suffixIcon: IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          _searchController.clear();
          _searchFocusNode.unfocus();
        },
      ),
    ),
    onChanged: (value) {
      setState(() {});
    },
  ),
  // ...
),
    
      body: FutureBuilder<dynamic>(
      future: _getListado(searchId: searchId.isNotEmpty ? searchId : null),
      builder: (context, item) {
        if (item.hasData) {
          return ListView(
            children: listado(item.data),
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
  final String Tracking;

  ItemWidget({
    required this.paqu_ID,
    required this.paqu_ClienteNombreCompleto,
    required this.sucu_Nombre,
    required this.paqu_Peso,
    required this.muni_Descripcion,
    required this.muni_DireccionExacta,
        required this.Tracking,
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
                  'Tracking: ',
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
                Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [
                Text(
                  'Estado: ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                  Flexible(
        child: Text(
          Tracking,
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
           Tracking: element["tracking"],
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
