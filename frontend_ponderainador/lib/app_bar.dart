import 'package:flutter/material.dart';
import 'package:frontend_ponderainador/ajustes.dart';

const kPrimaryColor = Color.fromRGBO(255, 255, 255, 1.0);

class PromediosAppBar extends StatelessWidget implements PreferredSizeWidget{

  const PromediosAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kPrimaryColor,
      title: Text(
        'Este es el botón de ajustes',
        style: const TextStyle(color: Colors.black)
      ),

      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const PaginaAjustes())),
        ),

      ],
    );
  }
}