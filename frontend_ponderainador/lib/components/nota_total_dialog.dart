import 'package:flutter/material.dart';

class NotaTotalDialog extends StatefulWidget {
  
  final double resultado;
  final VoidCallback onPressedCancelar;
  final VoidCallback onPressedGuardar;

  const NotaTotalDialog({
    super.key,
    required this.resultado,
    required this.onPressedCancelar,
    required this.onPressedGuardar,
  });

  @override
  State<NotaTotalDialog> createState() => _NotaTotalDialog();
}

class _NotaTotalDialog extends State<NotaTotalDialog> {
  
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 150,
        width: 300,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              child: Text(
                'Nota Total',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(height: 10.0),

            SizedBox(
              child: Text('Haz obtenido un puntaje de ${widget.resultado}', style: TextStyle(fontSize: 16)),
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