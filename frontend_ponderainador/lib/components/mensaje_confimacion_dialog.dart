import 'package:flutter/material.dart';

class MensajeConfirmacionDialog extends StatelessWidget {
  final String tituloExito;
  final String subTituloExito;
  final VoidCallback onPressedCancelar;
  final VoidCallback onPressedAceptar;

  const MensajeConfirmacionDialog({
    super.key,
    required this.tituloExito,
    required this.subTituloExito,
    required this.onPressedCancelar,
    required this.onPressedAceptar,
  });

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
                tituloExito,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(height: 10.0),

            SizedBox(
              child: Text(subTituloExito, style: TextStyle(fontSize: 16)),
            ),

            SizedBox(height: 10.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: onPressedCancelar,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    elevation: 0,
                  ),
                  child: Text('Cancelar'),
                ),

                const SizedBox(width: 10.0),

                ElevatedButton(
                  onPressed: onPressedAceptar,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    elevation: 0,
                  ),
                  child: Text('Sí'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
