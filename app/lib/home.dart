import 'package:flutter/material.dart';
import 'package:proyecto_final/continent_view.dart';
import 'package:proyecto_final/mapa.dart';
import 'package:proyecto_final/pais.dart';

class HomeScreen extends StatefulWidget {
  static const name = 'home-screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

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
        physics: NeverScrollableScrollPhysics(), // Esto deshabilita el desplazamiento manual
        children: [
          ContinentView(paises: paisesAmerica, continentName: 'América',), // Mostrará países de América
          ContinentView(paises: paisesAfrica, continentName: 'África',),  // Mostrará países de África
        ],
      ),
      bottomNavigationBar: BottomNavBarFb1(
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