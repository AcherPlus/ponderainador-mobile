import 'package:flutter/material.dart';

class NotaIndividualPagina extends StatelessWidget{
  const NotaIndividualPagina ({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('Acá iran los campos para la nota individual')
        ],
      ),
    );
  }
}