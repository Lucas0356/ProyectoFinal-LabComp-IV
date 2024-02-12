import 'package:proyecto_final/domain/entities/entities.dart';

/* El datasource en domain es una clase abstracta, para que el día de mañana, si implementamos otra API, todo
esté adpatado, cumpliendo así con el principio de OPEN-CLOSE. En caso de utilizar otra API, dentro de
'infraestructure/datasources' crearemos un nuevo archivo con la API correspondiente que extienda de esta misma clase.
*/

abstract class PaisDataSource {
  Future<List<PaisSimplify>> getAfrica();
  Future<List<PaisSimplify>> getAmerica();

  Future<Pais> getPais(String paisID, String continent);
}
