import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String restCountriesApiKey = dotenv.env['API_KEY'] ?? 'No hay ApiKey';
  static String unsplashApiKey =
      dotenv.env['UNSPLASH_API_KEY'] ?? 'No hay ApiKey';
  static String apiPaisUrl = dotenv.env['BASE_URL_PAIS'] ?? 'No existe la URL';
  static String apiImageUrl =
      dotenv.env['BASE_URL_IMAGE'] ?? 'No existe la URL';
}
