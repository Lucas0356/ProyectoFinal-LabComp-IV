import 'package:flutter/material.dart';
import 'package:proyecto_final/pais.dart';

class ContinentView extends StatelessWidget {
  final List<Pais> paises;
  final String continentName;

  const ContinentView(
      {Key? key, required this.paises, required this.continentName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF2F9BFF),
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
          return _PaisTile(pais: paises[index]);
        },
      ),
    );
  }
}

class _PaisTile extends StatelessWidget {
  final Pais pais;

  const _PaisTile({Key? key, required this.pais}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Container(
          color: Color(0xFF2F9BFF),
          height: 90,
          width: 200,
          child: ListTile(
            title: Text(
              pais.name,
              overflow: TextOverflow.ellipsis, // Agregar elipsis si es necesario
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
    );
  }
}

