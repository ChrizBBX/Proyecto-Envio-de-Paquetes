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

class PaquetesGet extends StatefulWidget {
  @override
  _PaquetesGetState createState() => _PaquetesGetState();
}

class _PaquetesGetState extends State<PaquetesGet> {
  List<String> _selectedItems = [];

  Future<List<dynamic>> _getListado({String? searchId}) async {
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
    throw Exception('Error al obtener los datos');
  }
}

@override
Widget build(BuildContext context) {
  return FutureBuilder<List<dynamic>>(
    future: _getListado(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        final data = snapshot.data!;
        if (data.isNotEmpty) {
          return Scaffold(
            body: Container(
              width: 300,
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  final paquete = data[index];
                  return ListTile(
                    title: ItemWidget(paqu_ID: paquete["paqu_ID"].toString()),
                    selected: _selectedItems.contains(paquete["paqu_ID"].toString()),
                    onTap: () {
                      setState(() {
                        if (_selectedItems.contains(paquete["paqu_ID"].toString())) {
                          _selectedItems.remove(paquete["paqu_ID"].toString());
                        } else {
                          _selectedItems.add(paquete["paqu_ID"].toString());
                        }
                      });
                    },
                  );
                },
              ),
              alignment: Alignment.center,
            ),
          );
        } else {
          return Text('No se encontraron datos');
        }
      } else if (snapshot.hasError) {
        return Text('Ha ocurrido un error: ${snapshot.error}');
      } else {
        return CircularProgressIndicator();
      }
    },
  );
}

}