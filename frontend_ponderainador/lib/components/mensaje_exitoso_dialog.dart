import 'package:flutter/material.dart';

class MensajeExitosoDialog extends StatelessWidget {
  final String tituloExito;
  final VoidCallback onPressed;

  const MensajeExitosoDialog({
    super.key,
    required this.tituloExito,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 130,
        width: 300,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(child: Text(tituloExito, style: TextStyle(fontSize: 20))),

            SizedBox(height: 20.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    elevation: 0,
                  ),
                  child: Text('Aceptar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
