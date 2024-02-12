import 'package:proyecto_final/infraestructure/models/images/unsplash_response.dart';

class ImagesMapper {
  static List<String> getUnsplashURLPhoto(
      UnsplashResponse unsplashResponse, int cantidad) {
    if (unsplashResponse.results.isEmpty) {
      return [
        'https://www.malaco.com/wp-content/uploads/2016/06/no-photo-available-black-profile.jpg'
      ];
    }
    final results = unsplashResponse.results;
    final photos = List.generate((cantidad > 5) ? 5 : cantidad, (index) {
      final photo = results[index].urls.regular;
      return photo;
    });
    return photos;
  }
}
