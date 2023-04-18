import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage1(),
    );
  }
}

class admin_screen extends StatefulWidget {

  @override
  State<admin_screen> createState() => _admin_screenState();
}

class _admin_screenState extends State<admin_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  title: Text('RapiExprezzz'),
  flexibleSpace: Container(
    decoration: BoxDecoration(
      color: Colors.grey
    ),
  ),
),

      body: Container(
        child: ListView(
          children: [
            //Un poco de espacio arriba
            SizedBox(height: 20,),
       btnHistorialdePaquetes(context),
            //Division Historial de paqutes con Hacer un paquete
          ],
        ),
      )
    );
  }
}
List<Widget> listado(List<dynamic> info){

  List<Widget> lista = [];

  info.forEach((element) {
    var item = ItemWidget(
      paqu_ID: element["paqu_ID"].toString(),
      paqu_ClienteNombreCompleto: element["paqu_ClienteNombreCompleto"],
      sucu_Nombre: element["sucu_Nombre"],
       paqu_Peso: element["paqu_Peso"].toString(),
        muni_Descripcion: element["muni_Descripcion"],
         muni_DireccionExacta: element["paqu_DireccionExacta"],
           Tracking: element["tracking"],
    );
    lista.add(item);
  });

  return lista;
}

class ItemWidget extends StatelessWidget {
  final String paqu_ID;
  final String paqu_ClienteNombreCompleto;
  final String sucu_Nombre;
  final String paqu_Peso;
  final String muni_Descripcion;
  final String muni_DireccionExacta;
  final String Tracking;

  ItemWidget({
    required this.paqu_ID,
    required this.paqu_ClienteNombreCompleto,
    required this.sucu_Nombre,
    required this.paqu_Peso,
    required this.muni_Descripcion,
    required this.muni_DireccionExacta,
        required this.Tracking,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [
                Text(
                  'Tracking: ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  paqu_ID,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [
                Text(
                  'Cliente: ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  paqu_ClienteNombreCompleto,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [
                Text(
                  'Sucursal: ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  sucu_Nombre,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [
                Text(
                  'Peso (lb): ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  paqu_Peso,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [
                Text(
                  'Destino: ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  muni_Descripcion,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [
                Text(
                  'DireccionExacta: ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                  Flexible(
        child: Text(
          muni_DireccionExacta,
          style: TextStyle(fontSize: 16),
        ),
      ),
              ],
            ),
          ),
                Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [
                Text(
                  'Estado: ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                  Flexible(
        child: Text(
          Tracking,
          style: TextStyle(fontSize: 16),
        ),
      ),
              ],
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}

class HomePage1 extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage1> {
  final _progressNotifier = ValueNotifier<double>(0.0);

  @override
  void dispose() {
    _progressNotifier.dispose();
    super.dispose();
  }

  void _startProgress() async {
    await Future.delayed(Duration(seconds: 2));
    _progressNotifier.value = 0.25;
    await Future.delayed(Duration(seconds: 2));
    _progressNotifier.value = 0.5;
    await Future.delayed(Duration(seconds: 2));
    _progressNotifier.value = 0.75;
    await Future.delayed(Duration(seconds: 2));
    _progressNotifier.value = 1.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barra de estado'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Estado del pedido:',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 16.0),
            LinearProgressIndicator(
              value: _progressNotifier.value,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _startProgress,
              child: Text('Comenzar proceso'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
    final _searchController = TextEditingController();
  final _searchFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
      final searchId = _searchController.text.trim();
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.grey,
  title: TextField(
    controller: _searchController,
    focusNode: _searchFocusNode,
    decoration: InputDecoration(
      hintText: 'Buscar por ID de tracking...',
      border: InputBorder.none,
      suffixIcon: IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          _searchController.clear();
          _searchFocusNode.unfocus();
        },
      ),
    ),
    onChanged: (value) {
      setState(() {});
    },
  ),
  // ...
),
    
      body: FutureBuilder<dynamic>(
      future: _getListado(searchId: searchId.isNotEmpty ? searchId : null),
      builder: (context, item) {
        if (item.hasData) {
          return ListView(
            children: listado(item.data),
          );
        }
          else{
            return const Text("Sin data");
          }
        },
      ),
    );
  }
}

String url = "http://rapiexprezzz.somee.com/api/Paquetes";

Future<dynamic> _getListado({String? searchId}) async {
  final respuesta = await http.get(Uri.parse(url));
  if (respuesta.statusCode == 200) {
    final json = respuesta.body;
    final list = jsonDecode(json);
    if (searchId != null) {
      return list
          .where((element) =>
              element['paqu_ID'].toString().toLowerCase().contains(searchId.toLowerCase()))
          .toList();
    }
    return list;
  } else {
    print('Ha ocurrido un error');
  }
}

Widget btnHistorialdePaquetes(context){
  return Column(
    children: [
      ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyWidget()));
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
                Icon(Icons.access_time, color:  Colors.black,size: 50,),
                           //Espacio entre el icono y el texto
                                  SizedBox(width: 30,),
              //Espacio entre el texto y la flechita
              Expanded(child: Text('Historial de Paquetes',
                style: TextStyle(fontSize: 20, color: Colors.black),
              )),
            
              //Flechita xd
              Icon(Icons.arrow_forward_ios,  size: 30,color: Colors.black,),
            ],
          ),
        ),  
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
        ),
      ),        
    ],
  );
}