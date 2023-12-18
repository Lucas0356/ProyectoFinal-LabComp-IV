import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:proyecto_final/models/pais.dart';

class ContinentScreen extends StatefulWidget {
  final String continentName;

  ContinentScreen({Key? key, required this.continentName}) : super(key: key);

  @override
  _ContinentScreenState createState() => _ContinentScreenState();
}

class _ContinentScreenState extends State<ContinentScreen> {
  late Future<List<PaisSimplify>> _paises;

  @override
  void initState() {
    super.initState();
    _paises = _getPaises();
  }

  Future<List<PaisSimplify>> _getPaises() async {
    final String url;

    // Determina la URL según el nombre del continente
    if (widget.continentName == "África") {
      url =
          "https://api-express-js-coutries-continents.onrender.com/api/v1/countries/africa/all";
    } else if (widget.continentName == "América") {
      url =
          "https://api-express-js-coutries-continents.onrender.com/api/v1/countries/america/all";
    } else {
      throw Exception("Continente no soportado");
    }

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'api_key':
            'M2QxCkPvTLMic3p', // Agrega la clave de API para autenticación.
      },
    );

    if (response.statusCode == 200) {
      List<PaisSimplify> parsedPaises = parsePaises(response.body);
      return parsedPaises;
    } else {
      throw Exception("Falló la conexión");
    }
  }

  List<PaisSimplify> parsePaises(String responseBody) {
    final List<dynamic> parsedList;

    // Determina la lista de países según el nombre del continente
    if (widget.continentName == "África") {
      parsedList = json.decode(responseBody)["africanCountries"];
    } else if (widget.continentName == "América") {
      parsedList = json.decode(responseBody)["americanCountries"];
    } else {
      throw Exception("Continente no soportado");
    }

    return parsedList.map((json) {
      return PaisSimplify(
        oficialName: json["name"],
        flag: json["flag"],
        capital: List<String>.from(json["capital"]),
      );
    }).toList();
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
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return _PaisTile(
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

class _PaisTile extends StatelessWidget {
  final PaisSimplify paisSimplify;
  final int delay;

  const _PaisTile({Key? key, required this.paisSimplify, required this.delay})
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
                paisSimplify.oficialName, // Acceder a la propiedad correcta
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontFamily: 'Jost',
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              subtitle: Text(paisSimplify.capital[0],
                  style: const TextStyle(
                      fontFamily: 'Jost',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white54)),
              leading: Text(
                paisSimplify.flag,
                style: const TextStyle(fontSize: 35),
              ),
              minLeadingWidth: 40,
              onTap: () {
                // Navigator.pushNamed(
                //   context,
                //   '/registro',
                //   arguments: paisSimplify,
                // );
              },
            ),
          ),
        ),
      ),
    );
  }
}
