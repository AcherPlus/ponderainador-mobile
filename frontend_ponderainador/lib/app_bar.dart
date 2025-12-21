import 'package:flutter/material.dart';
import './styles/app_styles.dart';
import 'ajustes.dart';

class AppBarComponente extends StatelessWidget implements PreferredSizeWidget {
  final String texto;

  const AppBarComponente({super.key, required this.texto});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: Text(texto, style: const TextStyle(color: AppStyles.kWhiteColor)),

      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.settings),
          color: AppStyles.kWhiteColor,
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PaginaAjustes()),
          ),
        ),
      ],
    );
  }
}
