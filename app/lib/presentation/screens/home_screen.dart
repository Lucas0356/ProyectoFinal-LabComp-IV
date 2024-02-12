import 'package:flutter/material.dart';
import '../presentation.dart';

class HomeScreen extends StatefulWidget {
  static const name = 'home-screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(initialPage: 1);
  int _currentIndex = 1; // Cambiar el valor inicial a 1

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        // Si el usuario cambia de página scrolleando (izq o der) actualizamos el currentIndex
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          // Página de Continente América (0)
          ContinentScreen(
            continentName: 'America',
          ),
          // Página de Inicio (1)
          HomeWidget(),
          // Página de Continente África (2)
          ContinentScreen(
            continentName: 'Africa',
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigation(
        currentIndex: _currentIndex,
        onPageChanged: (index) {
          if (_currentIndex == index) return;
          // Si te moves a una página paralela a la actual, no se hace la animación de paginado.
          if (_currentIndex == 0 && index == 2 ||
              _currentIndex == 2 && index == 0) {
            _pageController.jumpToPage(
              index,
            );
          } else {
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          }
        },
      ),
    );
  }
}
