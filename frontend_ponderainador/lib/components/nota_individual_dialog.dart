import 'package:flutter/material.dart';

class NotaIndividualDialog extends StatefulWidget {
  final double resultadoMinimo;
  final double resultadoMaximo;
  final VoidCallback onPressedCancelar;
  final VoidCallback onPressedGuardar;

  const NotaIndividualDialog({
    super.key,
    required this.resultadoMinimo,
    required this.resultadoMaximo,
    required this.onPressedCancelar,
    required this.onPressedGuardar,
  });

  @override
  State<NotaIndividualDialog> createState() => _NotaIndividualDialog();
}

class _NotaIndividualDialog extends State<NotaIndividualDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 200,
        width: 300,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              child: Text(
                'Nota Individual',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(height: 10.0),

            SizedBox(
              child: Text(
                'Mínimo: ${widget.resultadoMinimo}',
                style: TextStyle(fontSize: 16),
              ),
            ),

            SizedBox(height: 10.0),

            SizedBox(
              child: Text(
                'Máximo: ${widget.resultadoMaximo}',
                style: TextStyle(fontSize: 16),
              ),
            ),

            SizedBox(height: 10.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: widget.onPressedCancelar,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    elevation: 0,
                  ),
                  child: Text('Cancelar'),
                ),

                const SizedBox(width: 10.0),

                ElevatedButton(
                  onPressed: widget.onPressedGuardar,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    elevation: 0,
                  ),
                  child: Text('Guardar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
