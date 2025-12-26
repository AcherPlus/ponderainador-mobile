import 'package:flutter/material.dart';

class GuardarDatosDialog extends StatefulWidget {
  final VoidCallback onPressedCancelar;
  final VoidCallback onPressedGuardar;

  const GuardarDatosDialog({
    super.key,
    required this.onPressedCancelar,
    required this.onPressedGuardar,
  });

  @override
  State<GuardarDatosDialog> createState() => _GuardarDatosDialogState();
}

class _GuardarDatosDialogState extends State<GuardarDatosDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 250,
        width: 300,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              child: Text('Guardar Resultados', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),

            SizedBox(height: 20.0),

            SizedBox(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nombre',
                ),
              ),
            ),

            SizedBox(height: 20.0),

            SizedBox(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Descripción',
                ),
              ),
            ),

            SizedBox(height: 20.0),

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
