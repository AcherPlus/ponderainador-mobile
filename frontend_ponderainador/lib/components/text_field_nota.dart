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
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextField(
        controller: widget.controller,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
        ],
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: widget.titulo,
        ),
      ),
    );
  }
}
