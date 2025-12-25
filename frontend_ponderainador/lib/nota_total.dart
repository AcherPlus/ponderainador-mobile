import 'package:flutter/material.dart';
import './styles/app_styles.dart';

class NotaTotalPagina extends StatelessWidget {
  const NotaTotalPagina({super.key});

  double calcularPromedio(double nota1, nota2, nota3) {
    double resultado = 0.3 * (nota1 + nota3) + 0.4 * nota2;
    return resultado;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Text(
              'Nota Total',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),

          SizedBox(
            width: 300,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Examen Parcial (30%)',
              ),
            ),
          ),

          SizedBox(height: 20),

          SizedBox(
            width: 300,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Examen Final (30%)',
              ),
            ),
          ),

          SizedBox(height: 20),

          SizedBox(
            width: 300,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Evaluación Continua (40%)',
              ),
            ),
          ),

          SizedBox(height: 20),

          SizedBox(
            width: 300,
            height: 40,
            child: ElevatedButton.icon(
              onPressed: () => {
                // Futura función
              },
              icon: Icon(Icons.check),
              label: Text('Calcular nota'),
              style: ElevatedButton.styleFrom(
                foregroundColor: AppStyles.kWhiteColor,
                backgroundColor: Theme.of(context).colorScheme.primary,
                iconColor: AppStyles.kWhiteColor,
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
