import 'package:flutter/material.dart';
import 'package:proyecto_final/mapa.dart';

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
        children: const [
          ContinentScreen(continent: Continent.america),
          ContinentScreen(continent: Continent.africa),
        ],
      ),
      /* bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.public),
            label: 'América',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.public),
            label: 'África',
          ),
        ],
      ),*/
      bottomNavigationBar: BottomNavBarFb1(),
    );
  }
}

class ContinentScreen extends StatelessWidget {
  final Continent continent;

  const ContinentScreen({Key? key, required this.continent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: continent == Continent.america ? Colors.blue : Colors.green,
      child: Center(
        child: Text(
          continent == Continent.america ? 'América' : 'África',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

enum Continent {
  america,
  africa,
}
