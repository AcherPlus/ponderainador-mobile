import 'package:flutter/material.dart';
import 'promedios.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ponderainador Mobile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(
          seedColor: const Color.fromRGBO(31, 74, 161, 1.0),
        ),
      ),
      home: const PromediosPagina(),
    );
  }
}
