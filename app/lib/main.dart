import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_final/config/router/app_router.dart';
import 'presentation/presentation.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(themeNotifierProvider);

    return MaterialApp.router(
      theme: appTheme.getTheme(),
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false, // Ruta inicial
    );
  }
}
