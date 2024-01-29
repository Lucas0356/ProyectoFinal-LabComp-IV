import 'package:proyecto_final/domain/entities/pais/pais.dart';
import 'package:proyecto_final/domain/entities/pais/pais_simplify.dart';

/* El datasource en domain es una clase abstracta, para que el día de mañana, si implementamos otra API, todo
esté adpatado, cumpliendo así con el principio de OPEN-CLOSE. En caso de utilizar otra API, dentro de
'infraestructure/datasources' crearemos un nuevo archivo con la API correspondiente que extienda de esta misma clase.
*/

abstract class PaisDataSource {
  Future<List<PaisSimplify>> getAmerica();
  Future<List<PaisSimplify>> getAfrica();
  Future<Pais> getPais(String paisID, String continent, String code);
}
