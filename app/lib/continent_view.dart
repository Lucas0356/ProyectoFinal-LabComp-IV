import 'package:flutter/material.dart';
import 'package:proyecto_final/pais.dart';

class ContinentView extends StatelessWidget {
  final List<Pais> paises;
  final String continentName;

  const ContinentView({Key? key, required this.paises, required this.continentName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(continentName), // Nombre del continente en la parte superior
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
    return ListTile(
      title: Text(pais.name),
      subtitle: Text(pais.capital[0]),
      leading: Text(pais.flag),
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(builder: (context) => DetallesPaisScreen(pais: pais)));
      },
    );
  }
}
