import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/index_screen.dart';
import 'dart:ui';

class PantallaDeAuditoria extends StatelessWidget {
  final String trackingStatus;

  PantallaDeAuditoria({required this.trackingStatus});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Auditoría de Seguimiento'),
      ),
      body: Card(
        elevation: 10,
         margin: EdgeInsets.all(16.0),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ID del Paquete: ${datos['paqu_ID']}',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Text(
                'Cliente: ${datos['paqu_ClienteNombreCompleto']}',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                'Sucursal: ${datos['sucu_Nombre']}',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                'Peso: ${datos['paqu_Peso']}' + '(lb)',
                style: TextStyle(fontSize: 16.0),
              ),
           Row(
                        children: [
                          Text('Fragil:'),
                          Icon(datos['paqu_Fragil'] == true ? Icons.check: Icons.close),
                        ],
                      ),
              Text(
                'Dirección: ${datos['paqu_DireccionExacta']}',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                'Estado de Tracking: $trackingStatus',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text('Progreso del paquete:',style: TextStyle(fontSize: 17),),
              LinearProgressIndicator(
                value: _getProgressValue(trackingStatus),
                backgroundColor: Color.fromARGB(255, 247, 156, 150),
              ),
              Gif()
            ],
          ),
        ),
      ),
    );
  }

  Widget Gif (){
    if(trackingStatus == "Preparacion"){
    return Center(
      child: SizedBox(
        height: 250,
        width: 250,
        child: Image.asset('assets/images/Preparacion.gif'),
      ),
    );
    }else if(trackingStatus == "Empaquetado"){
     return Center(
      child: SizedBox(
        height: 250,
        width: 250,
        child: Image.asset('assets/images/Empaquetado.gif'),
      ),
    );
    }else if(trackingStatus == "En Camino"){
      print('Encamino');
      return Center(
      child: SizedBox(
        height: 250,
        width: 250,
        child: Image.asset('assets/images/Encamino.gif'),
      ),
    );
    }else if(trackingStatus == "Entregado"){
       return Center(
      child: SizedBox(
        height: 250,
        width: 250,
        child: Image.asset('assets/images/Entregado.gif'),
      ),
    );
    }else{
      return Container();
    }
  }

  double _getProgressValue(String status) {
    switch (status) {
      case 'Preparacion':
        return 0.25;
      case 'Empaquetado':
        return 0.5;
      case 'En Camino':
        return 0.75;
      case 'Entregado':
        return 1.0;
      default:
        return 0.0;
    }
  }
}
