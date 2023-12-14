import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  final VoidCallback onTap;

  const HomeView({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors
          .blue, // Color de fondo de la página de inicio (puedes personalizarlo)
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'App países flutter',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
