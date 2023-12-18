import 'package:flutter/material.dart';
import 'package:proyecto_final/widgets/bottom_navigation.dart';
import 'package:proyecto_final/screens/continent_screen.dart';
import 'package:proyecto_final/widgets/home_widget.dart';

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
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        physics: const NeverScrollableScrollPhysics(),
        children: [
          // Página de Continente América
          const ContinentScreen(
            continentName: 'América',
          ),
          // Página de Inicio
          HomeWidget(onTap: () {
            if (_currentIndex == 1) {
              // Si ya estamos en la página de inicio, no hacemos nada
              return;
            }
            _pageController.jumpToPage(1);
            setState(() {
              _currentIndex = 1;
            });
          }),
          // Página de Continente África
          const ContinentScreen(
            continentName: 'África',
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigation(
        currentIndex: _currentIndex,
        onPageChanged: (index) {
          // Si te moves a una página paralela a la actual, se hace la animación sino no.
          if (_currentIndex - index == 1 ||
              _currentIndex - index == -1 ||
              _currentIndex - index == 0) {
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          } else {
            _pageController.jumpToPage(
              index,
            );
          }
        },
      ),
    );
  }
}
