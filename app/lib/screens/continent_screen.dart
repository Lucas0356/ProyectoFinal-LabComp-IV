import 'package:flutter/material.dart';
import 'package:proyecto_final/api/continent_service.dart';
import 'package:proyecto_final/models/pais.dart';
import 'package:proyecto_final/widgets/pais_tile.dart';

class ContinentScreen extends StatefulWidget {
  final String continentName;

  const ContinentScreen({Key? key, required this.continentName})
      : super(key: key);

  @override
  ContinentScreenState createState() => ContinentScreenState();
}

class ContinentScreenState extends State<ContinentScreen> {
  late Future<List<PaisSimplify>> _paises;

  @override
  void initState() {
    super.initState();
    _paises = _getPaises();
  }

  Future<List<PaisSimplify>> _getPaises() async {
    // Crear una instancia de ContinentService
    final continentService = ContinentService();

    // Llamar al método en la instancia
    return continentService.getPaisesPorContinente(widget.continentName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF2F9BFF),
        title: Text(
          widget.continentName,
          style: const TextStyle(
              fontFamily: 'Jost',
              fontSize: 34,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
      ),
      body: FutureBuilder<List<PaisSimplify>>(
        future: _paises,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return PaisTile(
                  paisSimplify: snapshot.data![index],
                  delay: index * 150,
                );
              },
            );
          }
        },
      ),
    );
  }
}
