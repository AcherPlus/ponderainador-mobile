import 'package:flutter/material.dart';
import 'contenido_promedio.dart';
import 'nota_individual.dart';
import 'nota_total.dart';
import 'app_bar.dart';
import 'navigation_bar.dart';

class PromediosPagina extends StatefulWidget {
  const PromediosPagina({super.key});

  @override
  State<PromediosPagina> createState() => _PromediosPaginaState();
}

class _PromediosPaginaState extends State<PromediosPagina> {
  int _indiceActual = 0;

  final List<Widget> _pantallas = [
    ContenidoPromedio(),
    NotaTotalPagina(),
    NotaIndividualPagina()
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponente(),

      body: _pantallas[_indiceActual],

      bottomNavigationBar: NavigationBarComponente(
        currentIndex: _indiceActual,
        onIndexChanged: (nuevoIndice) {
          setState(() {
            _indiceActual = nuevoIndice;
          });
        }
      ),
    );
  }
}
