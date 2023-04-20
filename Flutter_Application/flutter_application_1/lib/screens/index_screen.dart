import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/admin_screen.dart';
import 'package:flutter_application_1/screens/pruebas.dart';
import 'package:flutter_application_1/screens/paquetesformedit_screen.dart';
import 'package:flutter_application_1/screens/tracking_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:async';

String? paqu_ID;
String? direccion;
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
        // Filtrar los registros eliminados lógicamente (estado = 0)
        final filteredData = jsonData.where((item) => item['paqu_Estado'] == true).toList();
        // Buscar el elemento con el ID especificado en la lista filtrada
        var package = filteredData.firstWhere((item) => item['paqu_ID'] == int.parse(_packageId), orElse: () => null);
        if (package != null) {
          packageData = package;
          datos = packageData;
          paqu_ID = _packageId;
          direccion = package['paqu_DireccionExacta'];
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
                    Row(
                      children: [
                        Text('ID del Paquete: ${packageData['paqu_ID']}',style: TextStyle(fontWeight: FontWeight.bold),),
                        Flexible(child: CardOption()),
                      ],
                    ),
                    Text('Cliente: ${packageData['paqu_ClienteNombreCompleto']}'),
                    Text('Sucursal: ${packageData['sucu_Nombre']}'),
                    Text('Peso: ${packageData['paqu_Peso']}'),
                    Row(
                      children: [
                        Text('Fragil:'),
                        Icon(packageData['paqu_Fragil'] == true ? Icons.check: Icons.close),
                      ],
                    ),
                    Text('Dirección: ${packageData['paqu_DireccionExacta']}'),
                    Text('Estado de Tracking: ${packageData['tracking']}'),
                    SizedBox(height: 10,),
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
      _eliminarDatos();
    } else if (value == 'Editar') {
      print('Editar seleccionado');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FormEditPaquete(id: paqu_ID,direccion:direccion ,)),
                );
    }
  }

  Future<void> _eliminarDatos() async {
  //Hacer la funcion de eliminar aqui y tener esperanzas de que funcione
  var url = Uri.parse('http://chris03-001-site1.htempurl.com/api/Paquetes/Delete');
var response = await http.post(
  url,
  headers: {'Content-Type': 'application/json'},
  body: json.encode({'paqu_ID': paqu_ID}),
);

  if (response.statusCode == 200) {
   var jsonResponse = json.decode(response.body);
if (jsonResponse != null && jsonResponse.length > 0) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => FloatingBottomNavigationBar()));
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Row(
          children: [
            Icon(Icons.warning), // Barra de progreso circular
            SizedBox(width: 10), // Espaciado horizontal
            Text('Ha ocurrido un error'), // Mensaje de texto
          ],  
        ),
        duration: Duration(seconds: 2), // Duración del SnackBar
      ),
    );
  }
  } else {
//Por si ocurre un error con la URL
print("Error de conexion o algo asi xd");
  }
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

 Editado (context){
return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Row(
          children: [
            Icon(Icons.warning), // Barra de progreso circular
            SizedBox(width: 10), // Espaciado horizontal
            Text('Ha ocurrido un error'), // Mensaje de texto
          ],  
        ),
        duration: Duration(seconds: 2), // Duración del SnackBar
      ),
    );
}


  Future<void> _AlertaExito(context) async {
    if(Alerta == true){
      print('hola');
         ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Row(
          children: [
            Icon(Icons.warning), // Barra de progreso circular
            SizedBox(width: 10), // Espaciado horizontal
            Text('Direccion de paquete editada exitosamente'), // Mensaje de texto
          ],  
        ),
        duration: Duration(seconds: 2), // Duración del SnackBar
      ),
    );
    }
}

