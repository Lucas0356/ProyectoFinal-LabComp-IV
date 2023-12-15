// home_screen.dart
import 'package:flutter/material.dart';
import 'package:proyecto_final/bottom_navigation.dart';
import 'package:proyecto_final/continent_view.dart';
import 'package:proyecto_final/home_view.dart';
import 'package:proyecto_final/pais.dart';

class HomeScreen extends StatefulWidget {
  static const name = 'home-screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 1; // Cambiar el valor inicial a 0

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        physics: NeverScrollableScrollPhysics(),
        children: [
          // Páginas de Continentes
          ContinentView(
            paises: paisesAmerica,
            continentName: 'América',
          ),
          // Página de Inicio
          HomeView(onTap: () {
            if (_currentIndex == 1) {
              // Si ya estamos en la página de inicio, no hacemos nada
              return;
            }
            _pageController.jumpToPage(1);
            setState(() {
              _currentIndex = 1;
            });
          }),

          ContinentView(
            paises: paisesAfrica,
            continentName: 'África',
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigation(
        currentIndex: _currentIndex,
        onPageChanged: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
      ),
    );
  }
}
