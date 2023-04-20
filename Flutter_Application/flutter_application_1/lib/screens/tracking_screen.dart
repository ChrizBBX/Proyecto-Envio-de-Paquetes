import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/index_screen.dart';

class PantallaDeAuditoria extends StatelessWidget {
  final String trackingStatus;

  PantallaDeAuditoria({required this.trackingStatus});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Auditoría de Seguimiento'),
      ),
      body: Padding(
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
              'Peso: ${datos['paqu_Peso']}',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Fragil: ${datos['paqu_Fragil']}',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Dirección: ${datos['paqu_DireccionExacta']}',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Fecha de Salida: ${datos['paqu_FechaSalida']}',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Estado de Tracking: $trackingStatus',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Fecha de Creación: ${datos['paqu_FechaCreacion']}',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text('Progreso del paquete:',style: TextStyle(fontSize: 17),),
            LinearProgressIndicator(
              value: _getProgressValue(trackingStatus),
            ),
          ],
        ),
      ),
    );
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
