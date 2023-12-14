import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  final VoidCallback onTap;

  const HomeView({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue, // Color de fondo de la página de inicio
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.85,
          width: MediaQuery.of(context).size.width * 0.9,
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
          decoration: BoxDecoration(
            color: Color(0xFFD9D9D9), // Color de fondo del contenedor principal
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50.0),
              topRight: Radius.circular(50.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'NationsExplorer',
                style: TextStyle(
                    fontFamily: 'Jost', // Fuente que importamos
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'Toda la info sobre países de:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                      color: Color(0xFF2F9BFF), // Color de fondo de América
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          'america.png', // Ruta de la imagen de América
                          width: 90,
                          height: 90,
                          fit: BoxFit.cover,
                        ),
                        Text('América'),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                      color: Color(0xFF2F9BFF), // Color de fondo de África
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          'africa.png', // Ruta de la imagen de África
                          width: 90,
                          height: 90,
                          fit: BoxFit.cover,
                        ),
                        Text('África'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
