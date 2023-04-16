import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class sucursalesddl extends StatefulWidget {
  @override
  _sucursalesddlState createState() => _sucursalesddlState();
}

class _sucursalesddlState extends State<sucursalesddl> {
  List<dynamic> _sucursales = [];
  String _selectedSucursal = 'Seleccione una Sucursal';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final response = await http.get(Uri.parse('http://rapiexprezzz.somee.com/api/Sucursales'));

    if (response.statusCode == 200) {
      setState(() {
        _sucursales = jsonDecode(response.body);
      });
    } else {
      throw Exception('Error al obtener las sucursales');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: _selectedSucursal,
      onChanged: (newValue) {
        setState(() {
          _selectedSucursal = newValue.toString();
        });
      },
      items: [
        DropdownMenuItem(
          value: 'Seleccione una sucursal',
          child: Text('Seleccione una sucursal'),
        ),
        ..._sucursales.map((sucursales) {
          return DropdownMenuItem(
            value: sucursales['sucu_ID'].toString(),
            child: Text(sucursales['sucu_Nombre']),
          );
        }).toList(),
      ],
    );
  }
}
