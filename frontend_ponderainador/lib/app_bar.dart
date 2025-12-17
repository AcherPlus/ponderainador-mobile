import 'package:flutter/material.dart';

const kPrimaryColor = Color.fromRGBO(255, 255, 255, 1.0);

class PromediosAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String texto;
  final VoidCallback onPressed;

  const PromediosAppBar({
    super.key,
    required this.texto,
    required this.onPressed
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kPrimaryColor,
      title: Text(
        texto,
        style: const TextStyle(color: Colors.black)
      ),

      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: onPressed,
        ),

      ],
    );
  }
}