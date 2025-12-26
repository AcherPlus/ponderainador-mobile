import 'package:flutter/material.dart';
import 'package:frontend_ponderainador/components/guardar_datos.dart';
import 'package:frontend_ponderainador/components/mensaje_exitoso_dialog.dart';
import 'package:frontend_ponderainador/components/nota_total_dialog.dart';
import 'package:frontend_ponderainador/promedios.dart';
import './styles/app_styles.dart';
import './components/text_field_nota.dart';

class NotaTotalPagina extends StatefulWidget {
  const NotaTotalPagina({super.key});

  @override
  State<NotaTotalPagina> createState() => _NotaTotalPaginaState();
}

class _NotaTotalPaginaState extends State<NotaTotalPagina> {
  final TextEditingController _nota1Controller = TextEditingController();
  final TextEditingController _nota2Controller = TextEditingController();
  final TextEditingController _nota3Controller = TextEditingController();

  double calcularPromedio(double nota1, double nota2, double nota3) {
    double resultado = 0.3 * (nota1 + nota3) + 0.4 * nota2;
    return (resultado * 100).round() / 100;
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

          TextFieldNota(
            controller: _nota1Controller,
            titulo: 'Examen Parcial (30%)',
          ),
          SizedBox(height: 20),

          TextFieldNota(
            controller: _nota2Controller,
            titulo: 'Examen Final (30%)',
          ),
          SizedBox(height: 20),

          TextFieldNota(
            controller: _nota3Controller,
            titulo: 'Evaluación Continua (40%)',
          ),
          SizedBox(height: 20),

          SizedBox(
            width: 300,
            height: 40,
            child: ElevatedButton.icon(
              onPressed: () async {
                // Obtener texto de controladores
                String t1 = _nota1Controller.text;
                String t2 = _nota2Controller.text;
                String t3 = _nota3Controller.text;

                // Validación rápida
                bool esValido(String texto) {
                  if (texto.isEmpty) return false;
                  final double? n = double.tryParse(texto);
                  return (n != null && n >= 0 && n <= 20);
                }

                if (esValido(t1) && esValido(t2) && esValido(t3)) {
                  double n1 = double.tryParse(_nota1Controller.text) ?? 0.0;
                  double n2 = double.tryParse(_nota2Controller.text) ?? 0.0;
                  double n3 = double.tryParse(_nota3Controller.text) ?? 0.0;
                  double resultado = calcularPromedio(n1, n2, n3);

                  final bool? confirmado = await showDialog<bool>(
                    context: context,
                    builder: (BuildContext context) => NotaTotalDialog(
                      resultado: resultado,
                      onPressedCancelar: () {
                        Navigator.pop(context, false);
                      },
                      onPressedGuardar: () {
                        Navigator.pop(context, true);
                      },
                    ),
                  );

                  if (!mounted) return;

                  if (confirmado == true) {
                    await showDialog(
                      context: context,
                      builder: (BuildContext context) => GuardarDatosDialog(
                        onPressedCancelar: () {
                          Navigator.pop(context);
                        },
                        onPressedGuardar: () async {
                          Navigator.pop(context);

                          await showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                MensajeExitosoDialog(
                                  tituloExito: 'Resultado Guardado',
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const PromediosPagina(),
                                      ),
                                    );
                                  },
                                ),
                          );
                        },
                      ),
                    );
                  }
                }
                else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Por favor, ingresas las notas correctamente (0-20)'),
                      backgroundColor: Colors.redAccent,
                    )
                  );
                }
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
