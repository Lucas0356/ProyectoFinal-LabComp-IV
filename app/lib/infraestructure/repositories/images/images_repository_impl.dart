import 'package:proyecto_final/domain/datasources/images/images_datasource.dart';
import 'package:proyecto_final/domain/repositories/images/images_repository.dart';

class ImagesRepositoryImpl extends ImagesRepository {
  final ImagesDatasource imagesDatasource;

  ImagesRepositoryImpl({required this.imagesDatasource});

  @override
  Future<List<String>> getPhotos(String query) {
    return imagesDatasource.getPhotos(query);
  }
}
