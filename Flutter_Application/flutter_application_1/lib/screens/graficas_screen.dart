import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/pruebas.dart';
import 'package:http/http.dart' as http;
import 'package:pie_chart/pie_chart.dart';

import 'index_screen.dart';

class Graficas extends StatefulWidget {
  @override
  State<Graficas> createState() => _GraficasState();
}

class _GraficasState extends State<Graficas> {
  bool isLoading = true;
  Map<String, double> dataMap = {};
  List<Color> colorList = [
    const Color(0xffD95AF3),
    const Color(0xff3EE094),
    const Color(0xff3398F6),
    const Color(0xffFA4A42),
    const Color(0xffFE9539),
    const Color(0xffFE94561),
    const Color(0xff7845fd4),
    const Color(0xff7865425),
    const Color(0xffF5464fd),
    const Color(0xffF45644),
    const Color(0xffF18445),
    const Color(0xffFE4566),
    const Color(0xffF456456),
    const Color(0xffF64564521),
    const Color(0xffF4568795),
    const Color(0xffF5646457),
    const Color(0xffFE646454),
  ];

  Future<void> _fetchExtintoresUsados() async {
    final response = await http.get(Uri.parse('http://chris03-001-site1.htempurl.com/api/PaquetesXMunicipio'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body) as List<dynamic>;
      print(jsonData);
      jsonData.forEach((item) {
        String descripcion = item['muni_Descripcion'];
        double valor = item['cantidad_Paquetes'].toDouble();
        dataMap[descripcion] = valor;
      });
      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load data from API');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchExtintoresUsados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gráfica de Paquetes por Municipio'),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  if (constraints.hasBoundedWidth && constraints.hasBoundedHeight) {
                    return PieChart(
                      dataMap: dataMap,
                      colorList: colorList,
                      chartRadius: MediaQuery.of(context).size.width / 2,
                      centerText: "Paquetes por municipio",
                      chartType: ChartType.disc,
                      animationDuration: Duration(seconds: 3),
                      chartValuesOptions: ChartValuesOptions(
                        showChartValues: true,
                        showChartValuesOutside: true,
                        showChartValuesInPercentage: true,
                        showChartValueBackground: false,
                      ),
                      legendOptions: LegendOptions(
                        showLegends: true,
                        legendShape: BoxShape.rectangle,
                        legendTextStyle: TextStyle(fontSize: 20),
                        legendPosition: LegendPosition.bottom,
                        showLegendsInRow: true,
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
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
