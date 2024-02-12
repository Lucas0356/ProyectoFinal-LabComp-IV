import 'package:proyecto_final/domain/entities/entities.dart';
import 'package:proyecto_final/infraestructure/infraestructure.dart';

class PaisMapper {
  static PaisSimplify paisApiExpresstoPaisSimplify(
          PaisFromApiExpress paisFromApi) =>
      PaisSimplify(
          name: paisFromApi.name,
          capital: paisFromApi.capital[0],
          flag: paisFromApi.flag,
          id: paisFromApi.id,
          code: paisFromApi.code);

  static Pais paisApiExpresstoPais(PaisDetailsFromApiExpress paisFromApi) =>
      Pais(
          oficialName: paisFromApi.name.official,
          name: paisFromApi.name.common,
          flag: paisFromApi.flag,
          code: paisFromApi.code,
          id: paisFromApi.id,
          languages: paisFromApi.languages,
          capital: paisFromApi.capital,
          population: paisFromApi.population,
          region: paisFromApi.region,
          subregion: paisFromApi.subregion,
          borders: paisFromApi.borders,
          currencies: paisFromApi.currencies);
}
