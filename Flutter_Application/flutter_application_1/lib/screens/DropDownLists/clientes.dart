import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/paquetesform_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String cliente = "";

class ClientesDDL extends StatefulWidget {
  @override
  _ClientesDDLState createState() => _ClientesDDLState();
}

class _ClientesDDLState extends State<ClientesDDL> {
  List<dynamic> _clientes = [];
  String _selectedCliente = 'Seleccione un Cliente';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final response =
        await http.get(Uri.parse('http://rapiexprezzz.somee.com/api/Clientes'));

    if (response.statusCode == 200) {
      setState(() {
        _clientes = jsonDecode(response.body);
      });
    } else {
      throw Exception('Error al obtener los clientes');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
    border: Border.all(color: errorCliente ? Colors.red : Colors.transparent),
    borderRadius: BorderRadius.circular(4.0),
  ),
      child: DropdownButton(
        value: _selectedCliente,
        onChanged: (newValue) {
          setState(() {
            _selectedCliente = newValue.toString();
            cliente = newValue.toString();
          });
        },
        items: [
          DropdownMenuItem(
            value: 'Seleccione un Cliente',
            child: Text('Seleccione un Cliente'),
          ),
          ..._clientes.map((cliente) {
            return DropdownMenuItem(
              value: cliente['pers_ID'].toString(),
              child: Text(cliente['clienteNombreCompleto']),
            );
          }).toList(),
        ],
        
      ),
    );
  }
}
