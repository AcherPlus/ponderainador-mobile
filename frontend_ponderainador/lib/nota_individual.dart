import 'package:flutter/material.dart';
import './styles/app_styles.dart';

class NotaIndividualPagina extends StatefulWidget {
  const NotaIndividualPagina({super.key});

  @override
  State<NotaIndividualPagina> createState() => _NotaIndividualPaginaState();
}

class _NotaIndividualPaginaState extends State<NotaIndividualPagina> {
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

          SizedBox(
            width: 300,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: labelsInputs[0].isEmpty ? 'Nota 1' : labelsInputs[0],
              ),
            ),
          ),

          SizedBox(height: 20),

          SizedBox(
            width: 300,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: labelsInputs[1].isEmpty ? 'Nota 2' : labelsInputs[1],
              ),
            ),
          ),

          SizedBox(height: 20),

          SizedBox(
            width: 300,
            height: 40,
            child: ElevatedButton.icon(
              icon: Icon(Icons.check),
              label: Text('Calcular restante'),
              style: ElevatedButton.styleFrom(
                foregroundColor: AppStyles.kWhiteColor,
                backgroundColor: Theme.of(context).colorScheme.primary,
                iconColor: AppStyles.kWhiteColor,
                textStyle: TextStyle(fontSize: 16),
              ),
              onPressed: () => {
                // Futura función
              },
            ),
          ),
        ],
      ),
    );
  }
}
