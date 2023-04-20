import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/admin_screen.dart';
import 'package:flutter_application_1/screens/tracking_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:async';

class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Barra de Búsqueda de Paquetes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PackageSearchScreen(),
    );
  }
}
Map<String, dynamic> datos = {};
class PackageSearchScreen extends StatefulWidget {
  @override
  _PackageSearchScreenState createState() => _PackageSearchScreenState();
}

class _PackageSearchScreenState extends State<PackageSearchScreen> {
  String _packageId = '';
  bool _isLoading = false;
  String? _errorText;
  Map<String, dynamic> packageData = {};

  Future<void> _fetchPackageData() async {
    if (_packageId != '' && _packageId != '0') {
      setState(() {
        _isLoading = true;
      });
      _errorText = null;
      final url = 'http://chris03-001-site1.htempurl.com/api/Paquetes';
      final response = await http.get(Uri.parse(url));

      setState(() {
        _isLoading = false;
        if (response.statusCode == 200) {
          final List<dynamic> jsonData = json.decode(response.body);
          print(_packageId);
          if (int.parse(_packageId) < jsonData.length) {
            packageData = jsonData[int.parse(_packageId)-1];
            datos = packageData;
          } else {
            _errorText = "El Tracking ingresado no coincide";
            packageData = {};
          }
        } else {
          packageData = {};
        }
      });
    } else {
      setState(() {
        _errorText = "Ingrese un ID de Tracking";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
    title: Text('Barra de Búsqueda de Paquetes'),

  ),
  body: ListView(
    children: [Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: TextField(
            keyboardType: TextInputType.number, // Define el tipo de teclado como números
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), // Aplica un formateador para permitir solo números
            ],
            onChanged: (value) {
              setState(() {
                _packageId = value;
              });
            },
            decoration: InputDecoration(
              labelText: 'ID de Tracking',
              errorText: _errorText,
              border: OutlineInputBorder(),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            _fetchPackageData();
          },
          child: Text('Buscar'),
        ),
        if (_isLoading)
          CircularProgressIndicator()
        else if (packageData.isNotEmpty)
          Card(
            margin: EdgeInsets.all(16.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PantallaDeAuditoria(trackingStatus: packageData['tracking'],)),
                );
              },
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ID del Paquete: ${packageData['paqu_ID']}'),
                    Text('Cliente: ${packageData['paqu_ClienteNombreCompleto']}'),
                    Text('Sucursal: ${packageData['sucu_Nombre']}'),
                    Text('Peso: ${packageData['paqu_Peso']}'),
                    Text('Fragil: ${packageData['paqu_Fragil']}'),
                    Text('Dirección: ${packageData['paqu_DireccionExacta']}'),
                    Text('Fecha de Salida: ${packageData['paqu_FechaSalida']}'),
                    Text('Estado de Tracking: ${packageData['tracking']}'),
                    Text('Fecha de Creación: ${packageData['paqu_FechaCreacion']}'),
                    SizedBox(height: 10,),
                    Row(
                      children: <Widget>[
                        Icon(Icons.arrow_forward_ios),
                        Text('Ver Paquete',style: TextStyle(fontSize: 18,color: Colors.blue,fontWeight: FontWeight.bold),),
                        Flexible(child: CardOption()),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        else
          Container(),
      ],
    ),
    ]
  ),
);
  }  
}

class CardOption extends StatefulWidget {
  @override
  _CardOptionState createState() => _CardOptionState();
}

class _CardOptionState extends State<CardOption> {
  String? _selectedOption; // Opción seleccionada en el menú emergente

  void _onOptionSelected(String value) {
    setState(() {
      _selectedOption = value;
    });

    // Aquí puedes agregar la lógica correspondiente para manejar la selección de opciones
    if (value == 'Eliminar') {
      print('Eliminar seleccionado');
      // Agrega aquí la lógica para el evento de Eliminar
    } else if (value == 'Editar') {
      print('Editar seleccionado');
      // Agrega aquí la lógica para el evento de Editar
    }
  }

  Future<void> _eliminarDatos() async {
  //Hacer la funcion de eliminar aqui y tener esperanzas de que funcione
}

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: _onOptionSelected,
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'Eliminar',
          child: ListTile(
            leading: Icon(Icons.delete), // Icono para la opción "Eliminar"
            title: Text('Eliminar'),
          ),
        ),
        PopupMenuItem<String>(
          value: 'Editar',
          child: ListTile(
            leading: Icon(Icons.edit), // Icono para la opción "Editar"
            title: Text('Editar'),
          ),
        ),
      ],
      child: ListTile(
        trailing: Icon(Icons.more_vert), // Icono del botón con menú emergente
      ),
    );
  }
}
