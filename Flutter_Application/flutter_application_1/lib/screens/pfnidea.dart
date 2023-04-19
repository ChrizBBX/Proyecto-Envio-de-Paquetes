import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/admin_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class MostrarExtintoresAll extends StatefulWidget {
  const MostrarExtintoresAll({Key? key}) : super(key: key);

  @override
  _MostrarExtintoresAllState createState() => _MostrarExtintoresAllState();
}

class _MostrarExtintoresAllState extends State<MostrarExtintoresAll> {
  Future<List<dynamic>>? _futureExtintores;

  @override
  void initState() {
    super.initState();
    _futureExtintores = requestExtintoresAll();
  }

Future<List<dynamic>> requestExtintoresAll() async {  
  
  String url = "http://chris03-001-site1.htempurl.com/api/Paquetes";
  final response = await http.get(Uri.parse(url)); // Realiza la solicitud HTTP

  if (response.statusCode == 200) {
    final json = response.body;
    if (json != null) {    
      final List<dynamic> list = jsonDecode(json); // Convierte el JSON en un listado de objetos de Dart
      return list;
    } else {
      throw Exception('Failed to load data');
    }
  } else {
    throw Exception('Failed to load data');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(          
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          centerTitle: true,
          title: const Text(
            'Nuestro catalogo!',
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
      ),      
      
      body: FutureBuilder<dynamic>(
        future: _futureExtintores,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            final List<dynamic> extintoresList = snapshot.data as List<dynamic>;
            return ListView.builder(
              itemCount: extintoresList.length,
              itemBuilder: (BuildContext context, int index) {
                final pedido = extintoresList[index];

                return GestureDetector(
                  onTap: () {
                    const Duration(microseconds: 100);                    
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => admin_screen(),
                      ),
                    );
                  },
                  
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(                    
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(child: Column(                        
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Tipo: ${pedido['exti_Tipo']?.toString() ?? ''}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    ),
                                  ),

                                  const SizedBox(height: 8.0),
                                  Text(
                                    'Peso Kg.: ${pedido['exti_PesoKg']?.toString() ?? ''}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,                            
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  Text(
                                'Precio Lps.: ${pedido['exti_Precio']?.toString() ?? ''}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,                              
                                  fontSize: 20.0,
                                ),
                              ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 100,
                              height: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.network(
                                  //"assets/loghitoShido.png",
                                  pedido['exti_ImgUrl'].toString(), //?? 'assets/loghitoShido.png',

                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),            
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
