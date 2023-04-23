import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/paquetesform_screen.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';


String? fechaFormateada;
class FechaSalidaInput extends StatefulWidget {
  @override
  _FechaSalidaInputState createState() => _FechaSalidaInputState();
}

class _FechaSalidaInputState extends State<FechaSalidaInput> {
late DateTime? _selectedDate = null;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
    border: Border.all(color: errorFechaSalida ? Colors.red : Colors.transparent), // Configura el color del borde según el valor de cliente
    borderRadius: BorderRadius.circular(4.0), // Configura el radio de borde
  ),
      child: Column(
        children: [
          TextFormField(
            onTap: () {
              DatePicker.showDatePicker(
                context,
                showTitleActions: true,
                minTime: DateTime(2022, 1, 1),
                maxTime: DateTime(2025, 12, 31),
                onConfirm: (date) {
                  setState(() {
                    String fecha = '';
                    _selectedDate = date;
                    DateFormat formatodeseado = DateFormat("yyyy-MM-dd"); // Crear una instancia de DateFormat con el formato deseado
                    fechaFormateada = formatodeseado.format(date);
                  });
                },
                currentTime: _selectedDate != null ? _selectedDate : DateTime.now(),
                locale: LocaleType.en,
              );
            },
            decoration: InputDecoration(
              hintText: 'Fecha de salida',
              border: OutlineInputBorder(),
              
            ),
            controller: TextEditingController(
      text: _selectedDate != null ? DateFormat('yyyy/MM/dd').format(_selectedDate!) : 'Seleccione una fecha',
    ),
            readOnly: true,
            validator: (value) {
              if (_selectedDate == null) {
                return 'Por favor seleccione una fecha';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
