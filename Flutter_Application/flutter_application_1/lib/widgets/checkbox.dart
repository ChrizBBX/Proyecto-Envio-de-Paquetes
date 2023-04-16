import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class checkbox extends StatefulWidget {

  @override
  State<checkbox> createState() => _checkboxState();
}

class _checkboxState extends State<checkbox> {
  bool _isChecked = false;
  @override
Widget build(BuildContext context) {
  return Column(
    children: [
      CheckboxListTile(
        title: Text('Fragil'),
        value: _isChecked,
        onChanged: (bool? value) {
          setState(() {
            _isChecked = value!;
          });
        },
        controlAffinity: ListTileControlAffinity.leading, // Mover el control a la izquierda
      ),
    ],
  );
}
}