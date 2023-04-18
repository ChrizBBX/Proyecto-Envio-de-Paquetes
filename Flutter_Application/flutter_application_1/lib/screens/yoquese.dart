import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String url = "http://rapiexprezzz.somee.com/api/Paquetes";

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

class ItemWidget extends StatelessWidget {
  final String paqu_ID;

  ItemWidget({
    required this.paqu_ID,
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
    );
    lista.add(item);
  });

  return lista;
}


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi App'),
      ),
      body: ListView(
        children: [
          Card(
              child: ListTile(
              title: Text('Título de la Card'),
              subtitle: Text('Descripción de la Card'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreenState(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
