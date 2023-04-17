import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class departamentosddl extends StatefulWidget {
  @override
  _departamentosddlState createState() => _departamentosddlState();
}

class _departamentosddlState extends State<departamentosddl> {
  List<dynamic> _departamentos = [];
  String _selectedSucursal = 'Seleccione un Departamento';

  @override
  void initState() {
    super.initState();
    _getdepartamentosddl();
  }

  void _getdepartamentosddl() async {
    final response = await http.get(Uri.parse('http://rapiexprezzz.somee.com/api/Departamentos'));

    if (response.statusCode == 200) {
      setState(() {
        _departamentos = jsonDecode(response.body);
      });
    } else {
      throw Exception('Error al obtener los departamentosddl');
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
          value: 'Seleccione un Departamento',
          child: Text('Seleccione un Departamento'),
        ),
        ..._departamentos.map((sucursal) {
          return DropdownMenuItem(
            value: sucursal['dept_ID'].toString(),
            child: Text(sucursal['dept_Descripcion']),
          );
        }).toList(),
      ],
    );
  }
}
