import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_final/infraestructure/datasources/images/unsplash_datasource.dart';
import 'package:proyecto_final/infraestructure/repositories/images/images_repository_impl.dart';

// Llamamos al Datasource de la API que estamos utilizando. Si llegasemos a cambiar de API (por el motivo que sea),
// nuestra aplicación ya estaría preparada para esa adaptación sin tener que cambiar todo.

final imageRepositoryProvider = Provider((ref) {
  return ImagesRepositoryImpl(imagesDatasource: UnsplashDatasource());
});


/* Ejemplo de otra utilización:

final imageRepositoryProvider = Provider((ref) {
  return ImageRepositoryImpl(PixaBayDatasource());
});

*/