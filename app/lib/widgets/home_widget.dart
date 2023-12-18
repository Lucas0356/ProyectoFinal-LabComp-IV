import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  final VoidCallback onTap;
  final bool iniciando = true;
  const HomeWidget({Key? key, required this.onTap}) : super(key: key);

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
            color: Color.fromRGBO(
                235, 235, 235, 1), // Color de fondo del contenedor principal
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50.0),
              topRight: Radius.circular(50.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeInDown(
                duration: const Duration(seconds: 1),
                child: const Text(
                  'NationsExplorer',
                  style: TextStyle(
                      fontFamily: 'Jost', // Fuente que importamos
                      fontSize: 34,
                      fontWeight: FontWeight.w600), // SemiBold
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'All about countrys of',
                style: TextStyle(
                    fontFamily: 'Jost', // Fuente que importamos
                    fontSize: 20,
                    fontWeight: FontWeight.w400), // Regular
              ),
              const SizedBox(height: 50),
              const _ContainerPais(
                asset: 'assets/america.png',
                text: 'América',
                left: true,
              ),
              const SizedBox(height: 40),
              const _ContainerPais(
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
    Key? key,
    required this.asset,
    required this.text,
    required this.left,
  }) : super(key: key);

  final String asset;
  final String text;
  final bool left;

  @override
  Widget build(BuildContext context) {
    List<Widget> row = [
      FadeIn(
        duration: const Duration(seconds: 4),
        child: Container(
          margin: EdgeInsets.only(left: left ? 20 : 0, right: left ? 0 : 20),
          child: Image.asset(
            asset,
            width: 110,
            height: 110,
            fit: BoxFit.cover,
          ),
        ),
      ),
      const Spacer(),
      FadeIn(
        duration: const Duration(seconds: 4),
        child: Container(
          margin: EdgeInsets.only(left: left ? 0 : 20, right: left ? 20 : 0),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 40,
              fontFamily: 'Jost',
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 150,
        decoration: BoxDecoration(
          color: const Color(0xFF2F9BFF),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: left ? row : row.reversed.toList(),
        ),
      ),
    );
  }
}
