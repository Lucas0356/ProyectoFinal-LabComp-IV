import 'package:dio/dio.dart';
import 'package:proyecto_final/config/constants/environment.dart';
import 'package:proyecto_final/domain/datasources/pais/pais_datasource.dart';
import 'package:proyecto_final/domain/entities/entities.dart';
import 'package:proyecto_final/infraestructure/infraestructure.dart';

/*
Esta implementación de PaisDataSource, es propia de la api de ApiExpress. Si el día
de mañana queremos utilizar otra API, solo tendríamos que crear una nueva clase que extienda de PaisDataSource.
*/

class ApiExpressDatasource extends PaisDataSource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api-express-continents.onrender.com/api/v1/countries/',
      headers: {
        'api_key': Environment.restCountriesApiKey,
      },
    ),
  );

  List<PaisSimplify> _jsonToPaisSimplify(Map<String, dynamic> json) {
    final apiResponse = ApiExpressResponse.fromJson(json);
    final List<PaisSimplify> countries = apiResponse.countries
        .map((pais) => PaisMapper.paisApiExpresstoPaisSimplify(pais))
        .toList();

    countries.sort((a, b) => a.name.compareTo(b.name));

    return countries;
  }

  @override
  Future<List<PaisSimplify>> getAfrica() async {
    final response = await dio.get('/africa/all');

    return _jsonToPaisSimplify(response.data);
  }

  @override
  Future<List<PaisSimplify>> getAmerica() async {
    final response = await dio.get('/america/all');

    return _jsonToPaisSimplify(response.data);
  }

  @override
  Future<Pais> getPais(String paisID, String continent) async {
    // ignore: prefer_typing_uninitialized_variables
    final response = await dio.get('/$continent/$paisID');

    if (response.statusCode != 200) {
      throw Exception('No se encontró ningún país con el ID: $paisID');
    }

    final paisDetails = ApiExpressDetailsResponse.fromJson(response.data);
    final pais = PaisMapper.paisApiExpresstoPais(paisDetails.country[0]);

    return pais;
  }
}
