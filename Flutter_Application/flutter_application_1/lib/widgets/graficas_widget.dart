import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:http/http.dart' as http;
import 'dart:convert';

class SalesData {
  final String Paquetes;
  final String Municipio;

  SalesData(this.Paquetes, this.Municipio);

factory SalesData.fromJson(Map<String, dynamic> json) {
    return SalesData(
      json['muni_Descripcion'].toString(),
      json['cantidad_Paquetes'].toString(),
    );
}

}

class MyBarChart extends StatefulWidget {
  @override
  _MyBarChartState createState() => _MyBarChartState();
}

class _MyBarChartState extends State<MyBarChart> {
  List<SalesData> _data = [];

  Future<void> _fetchData() async {
    final response = await http.get(Uri.parse("http://rapiexprezzz.somee.com/api/PaquetesXMunicipio"));
    final jsonData = json.decode(response.body);
    final List<dynamic> dataList = jsonData;
    final List<SalesData> newData = dataList
        .map((item) => SalesData.fromJson(item))
        .toList();
    setState(() {
      _data = newData;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
  final series = [
  new charts.Series(
    id: 'Prueba',
    data: _data,
    domainFn: (SalesData sales, _) => sales.Paquetes,
    measureFn: (SalesData sales, _) => int.parse(sales.Municipio),
    colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
  ),
];


    final chart = new charts.BarChart(
      series,
      animate: true,
      vertical: false,
    );

    return Column(
      children: [
        SizedBox(height: 10,),
        Text('Paquetes por Municipio',
        style: TextStyle(
          fontSize: 25
        ),
        ),
        SizedBox(
          height: 500.0,
          child: chart,
        ),
      ],
    );
  }
}
