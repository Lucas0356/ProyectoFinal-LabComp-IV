import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final/config/pais_items.dart/pais_items.dart';

class HomeWidget extends StatefulWidget {
  final VoidCallback onTap;

  const HomeWidget({Key? key, required this.onTap}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget>
    with AutomaticKeepAliveClientMixin {
  final bool iniciando = true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final size = MediaQuery.of(context).size;
    var left = false;

    // Container de Fondo
    return Container(
      height: size.height * 0.85,
      margin: EdgeInsets.only(
          top: size.height * 0.10,
          left: size.height * 0.02,
          right: size.height * 0.02),
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
          SizedBox(
            height: size.height * 0.04,
          ),
          FadeInDown(
            duration: const Duration(seconds: 1),
            child: Text(
              'NationsExplorer',
              style: TextStyle(
                  fontSize: size.height * 0.05,
                  fontWeight: FontWeight.w600), // SemiBold
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'All about countrys of',
            style: TextStyle(
                fontFamily: 'Jost', // Fuente que importamos
                fontSize: size.height * 0.03,
                fontWeight: FontWeight.w400), // Regular
          ),
          // Acá se empiezan a mostrar los continentes disponibles.
          Expanded(
            child: ListView(children: [
              // Dibuja los continentes cargados en paisItems.
              ...paisItems.map((pais) {
                left = !left;
                return _ContainerPais(
                    asset: pais.asset, text: pais.text, left: left);
              })
            ]),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
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
    final size = MediaQuery.of(context).size;
    final color = Theme.of(context).primaryColor;

    // Definimos la fila previamente, para invertirla si es que es necesario.
    List<Widget> row = [
      FadeIn(
        duration: const Duration(seconds: 2),
        child: Container(
          margin: EdgeInsets.only(left: left ? 20 : 0, right: left ? 0 : 20),
          child: Image.asset(
            asset,
            width: (size.width > 800) ? 150 : size.width * 0.2,
            height: (size.width > 800) ? 170 : size.width * 0.2,
            fit: BoxFit.cover,
          ),
        ),
      ),
      const Spacer(),
      FadeIn(
        duration: const Duration(seconds: 2),
        child: Container(
          margin: EdgeInsets.only(left: left ? 0 : 20, right: left ? 20 : 0),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ];

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        width: size.width * 0.8,
        height: size.height * 0.21,
        decoration: BoxDecoration(
          color: color,
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
