import 'package:flutter/material.dart';
import 'package:proyecto_final/screens/detalles_pais_screen.dart';
import 'package:proyecto_final/models/pais.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/registro': (context) {
          final Pais pais = ModalRoute.of(context)?.settings.arguments as Pais;
          return DetallesPaisScreen(pais: pais);
        },
      },
      initialRoute: '/home', // Ruta inicial
    );
  }
}