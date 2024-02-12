import 'package:go_router/go_router.dart';
import 'package:proyecto_final/presentation/screens/detalles_pais_screen.dart';
import 'package:proyecto_final/presentation/screens/home_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
        name: HomeScreen.name,
        path: '/',
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
              name: DetallesPaisScreen.name,
              path: 'registro/:id',
              builder: (context, state) {
                final paisID = state.pathParameters['id'] ?? 'no-id';

                return DetallesPaisScreen(
                  paisID: paisID,
                );
              }),
        ]),
  ],
);
