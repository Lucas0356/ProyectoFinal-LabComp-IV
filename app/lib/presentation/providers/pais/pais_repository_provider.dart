import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_final/infraestructure/datasources/pais/api_express_datasource.dart';
import 'package:proyecto_final/infraestructure/repositories/pais/pais_repository_impl.dart';

// Llamamos al Datasource de la API que estamos utilizando. Si llegasemos a cambiar de API (por el motivo que sea),
// nuestra aplicación ya estaría preparada para esa adaptación sin tener que cambiar todo.

final paisRepositoryProvider = Provider((ref) {
  return PaisRepositoryImpl(ApiExpressDatasource());
});


/* Ejemplo de otra utilización:

final paisRepositoryProvider = Provider((ref) {
  return PaisRepositoryImpl(NuevaApiDatasource());
});

*/