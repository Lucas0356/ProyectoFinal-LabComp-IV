import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_final/config/router/app_router.dart';
import 'package:proyecto_final/config/theme/app_theme.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  runApp(ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  MainApp({Key? key}) : super(key: key);
  final appTheme = AppTheme();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: appTheme.getTheme(),
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false, // Ruta inicial
    );
  }
}
