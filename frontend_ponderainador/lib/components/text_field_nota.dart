import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldNota extends StatefulWidget {
  final TextEditingController controller;
  final String titulo;

  const TextFieldNota({
    super.key,
    required this.controller,
    required this.titulo,
  });

  @override
  State<TextFieldNota> createState() => _TextFieldNotaState();
}

class _TextFieldNotaState extends State<TextFieldNota> {
  String? _errorText;

  @override
  void dispose(){
    widget.controller.dispose();
    super.dispose();
  }

  void _validarInput(String value){
    setState(() {
      final double? numero = double.tryParse(value);

      if (value.isEmpty) {
        _errorText = 'No puede estar vacío';
      }
      else if (numero == null) {
        _errorText = 'Formato inválido';
      }
      else if (numero < 0 || numero > 20) {
        _errorText = 'Debe estar entre 0 y 20';
      }
      else {
        _errorText = null;
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextField(
        controller: widget.controller,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^(\d{0,2}(\.\d{0,2})?)')),
        ],
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: widget.titulo,
          errorText: _errorText,
        ),
        onChanged: _validarInput,
      ),
    );
  }
}
