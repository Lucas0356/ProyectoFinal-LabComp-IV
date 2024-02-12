import 'package:dio/dio.dart';
import 'package:proyecto_final/config/constants/environment.dart';
import 'package:proyecto_final/domain/datasources/images/images_datasource.dart';
import 'package:proyecto_final/infraestructure/infraestructure.dart';

class UnsplashDatasource extends ImagesDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.unsplash.com/search/',
      queryParameters: {
        'client_id': Environment.unsplashApiKey,
      },
    ),
  );

  @override
  Future<List<String>> getPhotos(String query) async {
    final response =
        await dio.get('/photos', queryParameters: {'query': query});

    final unsplashResponse =
        UnsplashResponse.fromJson(response.data as Map<String, dynamic>);
    final images = ImagesMapper.getUnsplashURLPhoto(
        unsplashResponse, unsplashResponse.results.length);

    return images;
  }
}
