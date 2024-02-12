import 'package:proyecto_final/domain/entities/entities.dart';

/* 
El repository en domain es una clase abstracta, por el mismo motivo que el datasource. Por si no se entiende,
la función del repository solo es llamar al datasource, cumpliendo así con una limpia y ordenada estructura.
*/

abstract class PaisRepository {
  Future<List<PaisSimplify>> getAfrica();
  Future<List<PaisSimplify>> getAmerica();

  Future<Pais> getPais(String paisID, String continent);
}
