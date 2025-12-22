import 'package:flutter/material.dart';
import 'package:frontend_ponderainador/styles/app_styles.dart';

class ContenidoPromedio extends StatelessWidget {
  ContenidoPromedio({super.key});

  final List<String> entries = <String>['A', 'B', 'C'];

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
                  title: Text(entries[index]),
                  subtitle: Text('Este es un subtítulo'),
                  onTap: () {
                    print('Presionado en $index');

                    // Example navigation:
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => DetailScreen(item: items[index])),
                    // );
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
