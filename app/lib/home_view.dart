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
          decoration: const BoxDecoration(
            color: Color(0xFFD9D9D9), // Color de fondo del contenedor principal
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50.0),
              topRight: Radius.circular(50.0),
            ),
          ),
          child: const Column(
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
                style: TextStyle(
                    fontFamily: 'Jost', // Fuente que importamos
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 50),
              _ContainerPais(
                asset: 'assets/america.png',
                text: 'América',
                left: true,
              ),
              SizedBox(height: 40),
              _ContainerPais(
                asset: 'assets/africa.png',
                text: 'África',
                left: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContainerPais extends StatelessWidget {
  const _ContainerPais({
    super.key,
    required this.asset,
    required this.text,
    required this.left,
  });

  final String asset;
  final String text;
  final bool left;

  @override
  Widget build(BuildContext context) {
    List<Widget> row = [
      Image.asset(
        asset,
        width: 110,
        height: 110,
        fit: BoxFit.cover,
      ),
      const SizedBox(width: 50), // Espacio entre el texto y la imagen
      Text(text,
          style: const TextStyle(
              fontSize: 30,
              fontFamily: 'Jost',
              fontWeight: FontWeight.w500, // Fuente que importamos
              color: Colors.white)),
    ];

    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 150,
      decoration: BoxDecoration(
        color: const Color(0xFF2F9BFF), // Color de fondo de África
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: left ? row : row.reversed.toList(),
      ),
    );
  }
}
