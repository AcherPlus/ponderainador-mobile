import 'package:flutter/material.dart';
import 'package:frontend_ponderainador/components/mensaje_confimacion_dialog.dart';
import 'package:frontend_ponderainador/components/mensaje_exitoso_dialog.dart';
import 'components/app_bar.dart';
import './styles/app_styles.dart';
import './components/editar_datos_dialog.dart';
import './promedios.dart';

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
                title: Text(
                  widget.item[widget.index]['titulo'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.item[widget.index]['subtitulo']),

                    SizedBox(height: 20.0),

                    Text(
                      'Resultados',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('- Examen Parcial: 12'),
                    Text('- Examen Final: 11'),
                    Text('- Evaluación Continua: 13'),

                    SizedBox(height: 10.0),

                    Text(
                      'Nota: 13',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),

                    SizedBox(height: 20.0),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            final bool? confirmado = await showDialog<bool>(
                              context: context,
                              builder: (BuildContext context) =>
                                  EditarDatosDialog(
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
                                barrierDismissible: false,
                                builder: (BuildContext context) =>
                                    MensajeExitosoDialog(
                                      tituloExito: 'Datos actualizados',
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
                            }
                          },
                          child: Text('Editar'),
                        ),

                        const SizedBox(width: 10.0),

                        ElevatedButton(
                          onPressed: () async {
                            final bool? confirmado = await showDialog<bool>(
                              context: context,
                              builder: (BuildContext context) =>
                                  MensajeConfirmacionDialog(
                                    tituloExito: 'Eliminar resultado',
                                    subTituloExito: '¿Estás seguro?',
                                    onPressedCancelar: () =>
                                        Navigator.pop(context, false),
                                    onPressedAceptar: () =>
                                        Navigator.pop(context, true),
                                  ),
                            );

                            if (!mounted) return;

                            if (confirmado == true) {
                              await showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) =>
                                    MensajeExitosoDialog(
                                      tituloExito: 'Resultado eliminado',
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
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppStyles.indicatorColor,
                            foregroundColor: AppStyles.kWhiteColor,
                          ),
                          child: const Text('Eliminar'),
                        ),
                      ],
                    ),
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
