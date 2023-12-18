import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http; // Importamos como http
import 'package:proyecto_final/models/pais.dart';

class ContinentService {
  Future<List<PaisSimplify>> getPaisesPorContinente(
      String continentName) async {
    final String baseUrl = dotenv.get('BASE_URL');

    final String endpoint;
    if (continentName == "África") {
      endpoint = "africa/all";
    } else if (continentName == "América") {
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
      List<PaisSimplify> parsedPaises =
          parsePaises(response.body, continentName);
      return parsedPaises;
    } else {
      throw Exception("Falló la conexión");
    }
  }

  // Función para hacer el pase de la data obtenida por la api
  List<PaisSimplify> parsePaises(String responseBody, String continentName) {
    final List<dynamic> parsedList;

    // Determina la lista de países según el nombre del continente
    if (continentName == "África") {
      parsedList = json.decode(responseBody)["africanCountries"];
    } else if (continentName == "América") {
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
}
