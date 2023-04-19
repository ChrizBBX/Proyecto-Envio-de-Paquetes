import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_application_1/screens/paquetesform_screen.dart';
String municipio = "";
String departamento = "";
class DepartamentosDDL extends StatefulWidget {
  @override
  _DepartamentosDDLState createState() => _DepartamentosDDLState();
}

class _DepartamentosDDLState extends State<DepartamentosDDL> {
  List<dynamic> _departamentos = [];
  String _selectedDepartamento = 'Seleccione un departamento';
  List<dynamic> _municipios = [];
  String _selectedMunicipio = 'Seleccione un municipio';

  @override
  void initState() {
    super.initState();
    _getDepartamentos();
  }

  Future<void> _getMunicipios(String departamentoId) async {
    final response = await http.post(
      Uri.parse('http://chris03-001-site1.htempurl.com/api/Municipios'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'dept_ID': departamentoId}),
    );

    if (response.statusCode == 200) {
      setState(() {
        _municipios = jsonDecode(response.body);
        _selectedMunicipio = 'Seleccione un municipio';
      });
    } else {
      throw Exception('Error al cargar los municipios');
    }
  }

  Future<void> _getDepartamentos() async {
    final response = await http.get(Uri.parse('http://chris03-001-site1.htempurl.com/api/Departamentos'));

    if (response.statusCode == 200) {
      setState(() {
        _departamentos = jsonDecode(response.body);
        _selectedDepartamento = 'Seleccione un departamento';
      });
    } else {
      throw Exception('Error al obtener los departamentos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
    border: Border.all(color: errorDepartamento ? Colors.red : Colors.transparent),
    borderRadius: BorderRadius.circular(4.0),
  ),
          child: DropdownButton<String>(
            value: _selectedDepartamento,
            onChanged: (newValue) async {
              setState(() {
                _selectedDepartamento = newValue!;
                departamento = newValue;
              });
              if (_selectedDepartamento != 'Seleccione un departamento') {
                await _getMunicipios(_selectedDepartamento);
              } else {
                setState(() {
                  _municipios = [];
                  _selectedMunicipio = 'Seleccione un municipio';
                });
              }
            },
            items: [
              DropdownMenuItem(
                value: 'Seleccione un departamento',
                child: Text('Seleccione un departamento'),
              ),
              ..._departamentos.map((departamento) {
                return DropdownMenuItem(
                  value: departamento['dept_ID'].toString(),
                  child: Text(departamento['dept_Descripcion']),
                );
              }).toList(),
            ],
          ),
        ),
        SizedBox(height: 10,),
        Container(
                    decoration: BoxDecoration(
    border: Border.all(color: errorMunicipio ? Colors.red : Colors.transparent),
    borderRadius: BorderRadius.circular(4.0),
  ),
          child: DropdownButton<String>(
            value: _selectedMunicipio,
            onChanged: (newValue) {
              setState(() {
                _selectedMunicipio = newValue!;
                municipio = newValue;
              });
            },
            items: [
              DropdownMenuItem(
                value: 'Seleccione un municipio',
                child: Text('Seleccione un municipio'),
              ),
              ..._municipios.map((municipio) {
                return DropdownMenuItem(
                  value: municipio['muni_ID'].toString(),
                  child: Text(municipio['muni_Descripcion']),
                );
              }).toList(),
            ],
          ),
        ),
      ],
    );
  }
}
