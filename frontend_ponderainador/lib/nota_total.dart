import 'package:flutter/material.dart';
import 'package:frontend_ponderainador/components/nota_total_dialog.dart';
import './styles/app_styles.dart';
import './components/text_field_nota.dart';

class NotaTotalPagina extends StatefulWidget {
  const NotaTotalPagina({super.key});

  @override
  State<NotaTotalPagina> createState() => _NotaTotalPaginaState();
}

class _NotaTotalPaginaState extends State<NotaTotalPagina>{
  
  final TextEditingController _nota1Controller = TextEditingController();
  final TextEditingController _nota2Controller = TextEditingController();
  final TextEditingController _nota3Controller = TextEditingController();

  double calcularPromedio(double nota1, double nota2, double nota3) {
    return 0.3 * (nota1 + nota3) + 0.4 * nota2; 
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

          

          TextFieldNota(controller: _nota1Controller, titulo: 'Examen Parcial (30%)'),
          SizedBox(height: 20),

          TextFieldNota(controller: _nota2Controller, titulo: 'Examen Final (30%)'),
          SizedBox(height: 20),

          TextFieldNota(controller: _nota3Controller, titulo: 'Evaluación Continua (40%)'),
          SizedBox(height: 20),

          SizedBox(
            width: 300,
            height: 40,
            child: ElevatedButton.icon(
              onPressed: () {
                double n1 = double.tryParse(_nota1Controller.text) ?? 0.0;
                double n2 = double.tryParse(_nota2Controller.text) ?? 0.0;
                double n3 = double.tryParse(_nota3Controller.text) ?? 0.0;

                double resultado = calcularPromedio(n1, n2, n3);

                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return NotaTotalDialog(
                      resultado: resultado,
                      onPressedCancelar: () {
                        // Función
                      }, onPressedGuardar: () {
                        // Función
                      });
                  });
                
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
