import 'package:flutter/material.dart';
import 'app_bar.dart';
import './styles/app_styles.dart';

class DetallesPagina extends StatefulWidget {
  final List<Map<String, dynamic>> item;
  final int index;

  const DetallesPagina({super.key, required this.item, required this.index});

  @override
  State<DetallesPagina> createState() => _DetallesPaginaState();
}

class _DetallesPaginaState extends State<DetallesPagina> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponente(),
      body: Center(
        child: Column(
          children: <Widget>[
            Card(
              color: Theme.of(context).colorScheme.primary,
              margin: EdgeInsets.all(20.0),
              child: ListTile(
                title: Text(widget.item[widget.index]['titulo']),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.item[widget.index]['subtitulo']),
                    
                    SizedBox(height: 20.0),
                    
                    Text('Resultados'),
                    Text('Examen Parcial: 12'),
                    Text('Examen Final: 11'),
                    Text('Evaluación Continua: 13'),

                    SizedBox(height: 10.0),

                    Text('Nota: 13'),

                    SizedBox(height: 20.0),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(onPressed: () => {
                          print('Próxima función')
                        }, child: Text(
                          'Editar'
                        )),
                        
                        const SizedBox(width: 10.0,),
                        
                        ElevatedButton(onPressed: () => {
                          print('Próxima función')
                        }, child: Text('Eliminar'))
                      ],
                    )
                  ],
                ),
                textColor: AppStyles.kWhiteColor,
                minVerticalPadding: 15,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
