import 'package:flutter/material.dart';
import 'detalles.dart';
import './styles/app_styles.dart';

class ContenidoPromedio extends StatelessWidget {
  ContenidoPromedio({super.key});

  // final List<String> entries = <String>['A', 'B', 'C'];

  final List<Map<String, dynamic>> entries = [
    {
      'titulo': 'Título 1',
      'subtitulo': 'Subtítulo 1',
      'ex_parcial': 12,
      'ex_final': 10,
      'ev_continua': 15,
    },
    {
      'titulo': 'Título 2',
      'subtitulo': 'Subtítulo 2',
      'ex_parcial': 14,
      'ex_final': 6,
      'ev_continua': 18,
    },
    {
      'titulo': 'Título 3',
      'subtitulo': 'Subtítulo 3',
      'ex_parcial': 11,
      'ex_final': 17,
      'ev_continua': 15,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            'Mis Promedios',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            itemCount: entries.length,
            itemBuilder: (context, index) {
              return Card(
                color: Theme.of(context).colorScheme.primary,
                margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                child: ListTile(
                  title: Text(entries[index]['titulo']),
                  subtitle: Text(entries[index]['subtitulo']),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetallesPagina(item: entries, index: index),
                      ),
                    );
                  },
                  textColor: AppStyles.kWhiteColor,
                  trailing: Icon(
                    Icons.arrow_right,
                    color: AppStyles.kWhiteColor,
                    size: 30.0,
                  ),
                  minVerticalPadding: 15,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
