import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';


class FechaSalidaInput extends StatefulWidget {
  @override
  _FechaSalidaInputState createState() => _FechaSalidaInputState();
}

class _FechaSalidaInputState extends State<FechaSalidaInput> {
late DateTime? _selectedDate = null;


  @override
  Widget build(BuildContext context) {
    return Column(
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
                  _selectedDate = date;
                });
              },
              currentTime: _selectedDate != null ? _selectedDate : DateTime.now(),
              locale: LocaleType.es,
            );
          },
          decoration: InputDecoration(
            labelText: "Fecha de salida",
            labelStyle: TextStyle(fontSize: 22),
            border: OutlineInputBorder(),
          ),
          controller: TextEditingController(
  text: _selectedDate != null ? DateFormat('dd/MM/yyyy').format(_selectedDate!) : 'Seleccione una fecha',
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
    );
  }
}
