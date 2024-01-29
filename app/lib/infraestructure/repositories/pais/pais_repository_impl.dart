import 'package:proyecto_final/domain/datasources/pais/pais_datasource.dart';
import 'package:proyecto_final/domain/entities/pais/pais_simplify.dart';
import 'package:proyecto_final/domain/repositories/pais/pais_repository.dart';
import 'package:proyecto_final/domain/entities/pais/pais.dart';

/*
El PaisRepositoryImpl se encarga de llamar a la implementación del PaisDataSource
sin importar qué clase la está implementando (es decir, sin importar que API estamos
utilizando). De esta forma, se cumple con lo previamente comentado.
*/

class PaisRepositoryImpl extends PaisRepository {
  final PaisDataSource paisDataSource;

  PaisRepositoryImpl(this.paisDataSource);

  @override
  Future<List<PaisSimplify>> getAfrica() {
    return paisDataSource.getAfrica();
  }

  @override
  Future<List<PaisSimplify>> getAmerica() {
    return paisDataSource.getAmerica();
  }

  @override
  Future<Pais> getPais(String paisID, String continent, String code) {
    return paisDataSource.getPais(paisID, continent, code);
  }
}
