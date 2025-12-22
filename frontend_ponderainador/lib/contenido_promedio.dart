import 'package:flutter/material.dart';
import 'package:frontend_ponderainador/styles/app_styles.dart';

class ContenidoPromedio extends StatelessWidget{
  ContenidoPromedio({super.key});

  final List<String> entries = <String>['A', 'B', 'C'];

  @override
  Widget build(BuildContext context){
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: entries.length,
      itemBuilder: (context, index) {
        return Card(
          color: Theme.of(context).colorScheme.primary,
          margin: EdgeInsets.all(10.0),
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
            trailing: Icon(Icons.arrow_right, color: AppStyles.kWhiteColor, size: 30.0,),
            minVerticalPadding: 15,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0)
            ),
          ),
        );
      },
    );
  }
}