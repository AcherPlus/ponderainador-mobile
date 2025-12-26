import 'package:flutter/material.dart';
import 'package:frontend_ponderainador/components/guardar_datos.dart';
import 'package:frontend_ponderainador/components/mensaje_exitoso_dialog.dart';
import 'package:frontend_ponderainador/components/nota_individual_dialog.dart';
import 'package:frontend_ponderainador/promedios.dart';
import './styles/app_styles.dart';
import './components/text_field_nota.dart';

class NotaIndividualPagina extends StatefulWidget {
  const NotaIndividualPagina({super.key});

  @override
  State<NotaIndividualPagina> createState() => _NotaIndividualPaginaState();
}

class _NotaIndividualPaginaState extends State<NotaIndividualPagina> {
  final TextEditingController _nota1Controller = TextEditingController();
  final TextEditingController _nota2Controller = TextEditingController();

  String? selectedValue;

  final List<String> entries = [
    'Examen Parcial (30%)',
    'Examen Final (30%)',
    'Evaluación Continua (40%)',
  ];

  List<String> labelsInputs = ['', ''];

  void _actualizarLabels(String? valorMenu) {
    setState(() {
      if (valorMenu == entries[0]) {
        labelsInputs = [entries[1], entries[2]];
      } else if (valorMenu == entries[1]) {
        labelsInputs = [entries[0], entries[2]];
      } else if (valorMenu == entries[2]) {
        labelsInputs = [entries[0], entries[1]];
      }
    });
  }

  List<double> calcularRestante(String? valorMenu, double nota1, double nota2) {
    double notaMin;
    double notaMax;

    if (valorMenu == 'Examen Parcial (30%)') {
      notaMin = (10.5 - (0.3 * nota1 + 0.4 * nota2)) / 0.3;
      notaMax = (0.3 * 20) + (0.3 * nota1) + (0.4 * nota2);
    } else if (valorMenu == 'Examen Final (30%)') {
      notaMin = (10.5 - (0.3 * nota1 + 0.4 * nota2)) / 0.3;
      notaMax = (0.3 * nota1) + (0.3 * 20) + (0.4 * nota2);
    } else if (valorMenu == 'Evaluación Continua (40%)') {
      notaMin = (10.5 - (0.3 * nota1 + 0.3 * nota2)) / 0.4;
      notaMax = (0.3 * nota1) + (0.3 * nota2) + (0.4 * 20);
    } else {
      return [0.0, 0.0];
    }

    return [(notaMin * 100).round() / 100, (notaMax * 100).round() / 100];
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Text(
              'Nota Individual',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),

          SizedBox(
            width: 300,
            child: DropdownButtonFormField<String>(
              hint: const Text('Seleccionar nota'),
              items: entries.map((String item) {
                return DropdownMenuItem<String>(value: item, child: Text(item));
              }).toList(),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nota a calcular',
              ),
              onChanged: (String? newValue) {
                selectedValue = newValue;
                _actualizarLabels(newValue);
              },
            ),
          ),

          SizedBox(height: 20),

          TextFieldNota(
            controller: _nota1Controller,
            titulo: labelsInputs[0].isEmpty ? 'Nota 1' : labelsInputs[0],
          ),
          SizedBox(height: 20),

          TextFieldNota(
            controller: _nota2Controller,
            titulo: labelsInputs[1].isEmpty ? 'Nota 2' : labelsInputs[1],
          ),
          SizedBox(height: 20),

          SizedBox(
            child: Text(
              'Con nota mínima negativa, apruebas de todos modos.',
              style: TextStyle(fontSize: 12),
            ),
          ),

          SizedBox(height: 20.0),

          SizedBox(
            width: 300,
            height: 40,
            child: ElevatedButton.icon(
              onPressed: () async {
                if (selectedValue == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Por favor, seleccione la nota que busca.'),
                      backgroundColor: Colors.redAccent,
                    ),
                  );
                  return;
                }

                // Obtener texto de controladores
                String t1 = _nota1Controller.text;
                String t2 = _nota2Controller.text;

                // Validación rápida
                bool esValido(String texto) {
                  if (texto.isEmpty) return false;
                  final double? n = double.tryParse(texto);
                  return (n != null && n >= 0 && n <= 20);
                }

                if (esValido(t1) && esValido(t2)) {
                  double n1 = double.tryParse(_nota1Controller.text) ?? 0.0;
                  double n2 = double.tryParse(_nota2Controller.text) ?? 0.0;
                  List<double> resultado = calcularRestante(
                    selectedValue,
                    n1,
                    n2,
                  );

                  final bool? confirmado = await showDialog<bool>(
                    context: context,
                    builder: (BuildContext context) => NotaIndividualDialog(
                      resultadoMinimo: resultado[0],
                      resultadoMaximo: resultado[1],
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
              },
              icon: Icon(Icons.check),
              label: Text('Calcular restante'),
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
