import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
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
    final String baseUrl = dotenv.get('BASE_URL');

    final String endpoint;
    if (widget.continentName == "África") {
      endpoint = "africa/all";
    } else if (widget.continentName == "América") {
      endpoint = "america/all";
    } else {
      throw Exception("Continente no soportado");
    }

    final String url = baseUrl + endpoint;

    final String apiKey = dotenv.env['API_KEY']!;

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'api_key': apiKey,
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
