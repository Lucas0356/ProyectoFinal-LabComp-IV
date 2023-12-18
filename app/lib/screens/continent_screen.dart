import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final/models/pais.dart';

class ContinentScreen extends StatelessWidget {
  final List<Pais> paises;
  final String continentName;

  const ContinentScreen(
      {Key? key, required this.paises, required this.continentName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF2F9BFF),
        title: Text(
          continentName,
          style: const TextStyle(
              fontFamily: 'Jost', // Fuente que importamos
              fontSize: 34,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ), // Nombre del continente en la parte superior
      ),
      body: ListView.builder(
        itemCount: paises.length,
        itemBuilder: (context, index) {
          return _PaisTile(pais: paises[index], delay: index * 150);
        },
      ),
    );
  }
}

class _PaisTile extends StatelessWidget {
  final Pais pais;
  final int delay;

  const _PaisTile({Key? key, required this.pais, required this.delay})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: delay),
      duration: const Duration(seconds: 1),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            color: const Color(0xFF2F9BFF),
            height: 90,
            width: 200,
            child: ListTile(
              title: Text(
                pais.name,
                overflow:
                    TextOverflow.ellipsis, // Agregar elipsis si es necesario
                style: const TextStyle(
                    fontFamily: 'Jost', // Fuente que importamos
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              subtitle: Text(pais.capital[0],
                  style: const TextStyle(
                      fontFamily: 'Jost', // Fuente que importamos
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white54)),
              leading: Text(
                pais.flag,
                style: const TextStyle(fontSize: 35),
              ),
              minLeadingWidth: 40,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/registro',
                  arguments: pais,
                ); // Navega a la ruta '/registro' con los argumentos del país
              },
            ),
          ),
        ),
      ),
    );
  }
}
