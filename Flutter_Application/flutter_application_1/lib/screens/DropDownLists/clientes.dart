import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class clientesddl extends StatefulWidget {
  @override
  _clientesddlState createState() => _clientesddlState();
}

class _clientesddlState extends State<clientesddl> {
  List<dynamic> _clientes = [];
  String _selectedCliente = 'Seleccione un Cliente';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final response = await http.get(Uri.parse('http://rapiexprezzz.somee.com/api/Clientes'));

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
    return DropdownButton(
      value: _selectedCliente,
      onChanged: (newValue) {
        setState(() {
          _selectedCliente = newValue.toString();
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
    );
  }
}
