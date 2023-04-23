import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/DropDownLists/clientes.dart';
import 'package:flutter_application_1/screens/auth/welcome_page.dart';
import 'package:flutter_application_1/screens/pruebas.dart';
import 'package:flutter_application_1/screens/tracking_screen.dart';
import 'package:http/http.dart' as http;
import 'graficas_screen.dart';
import 'index_screen.dart';

class Paquete {
  int? paquID;
  int? paquCliente;
  // Agrega otros campos necesarios del paquete

  Paquete({this.paquID, this.paquCliente});
}

class PaquetesClienteScreen extends StatefulWidget {
  @override
  _PaquetesClienteScreenState createState() => _PaquetesClienteScreenState();
}

class _PaquetesClienteScreenState extends State<PaquetesClienteScreen> {
  List<dynamic> _paquetes = []; 
  int _currentPage = 1;
  int _pageSize = 5;

  @override
  void initState() {
    super.initState();
    _fetchPaquetesCliente();
  }

  Future<void> _fetchPaquetesCliente() async {
var url = Uri.parse('http://chris03-001-site1.htempurl.com/api/Paquetes/PaquetesXCliente');
var response = await http.post(
  url,
  headers: {'Content-Type': 'application/json'},
  body: json.encode({'paqu_Cliente': pers_ID,}),
);

  if (response.statusCode == 200) {
    List<dynamic> paquetesData = json.decode(response.body);
    print(paquetesData);
    setState(() {
      _paquetes = paquetesData; // Asignar la respuesta directamente a _paquetes
    });
    } else {
      print('Error con la url');
      // Manejar error de API
    }
  }

  void _onNextPage() {
    setState(() {
      _currentPage++;
    });
  }

  void _onPrevPage() {
    setState(() {
      _currentPage--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paquetes del Cliente'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _pageSize,
              itemBuilder: (context, index) {
                final paqueteIndex = ((_currentPage - 1) * _pageSize) + index;
                if (paqueteIndex < _paquetes.length) {
                  final paquete = _paquetes[paqueteIndex];
                  return Card(
                    margin: EdgeInsets.all(16.0),
                    child: ListTile(
                         onTap: () {
                          datos = paquete;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PantallaDeAuditoria(trackingStatus: paquete['tracking'],)),
                );
              },
                      title: Text('Tracking ID: ${paquete['paqu_ID']}'),
                      subtitle: Text('Estado: ${paquete['tracking']}'),
                      // Agrega otros campos del paquete a la card
                    ),
                  );
                } else {
                  return null;
                }
              },
            ),
          ),
          ButtonBar(
            children: [
              ElevatedButton(
                onPressed: _currentPage > 1 ? _onPrevPage : null,
                child: Text('Anterior'),
              ),
              ElevatedButton(
                onPressed:
                    _paquetes.length > _currentPage * _pageSize ? _onNextPage : null,
                child: Text('Siguiente'),
              ),
              SizedBox(height: 80,)
            ],
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home),
        onPressed: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => FloatingBottomNavigationBar()));
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {          
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Index()));
                },
              ),
              IconButton(
                icon: Icon(Icons.show_chart),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Graficas()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
