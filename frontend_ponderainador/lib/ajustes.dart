import 'package:flutter/material.dart';
import 'package:frontend_ponderainador/app_bar.dart';

class PaginaAjustes extends StatelessWidget {
  const PaginaAjustes({
    super.key
  });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: PromediosAppBar()
    );
  }
}