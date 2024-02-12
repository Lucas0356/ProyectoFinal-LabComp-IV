// Clase que representa la información detallada de un país.
class Pais {
  final String oficialName; // Nombre oficial del país.
  final String name; // Nombre del país.
  final String flag; // Bandera del país.
  final String code; // Código del país.
  final String id; // Identificador del país.
  final List<String> languages; // Lista de idiomas hablados en el país.
  final List<String> capital; // Lista de capitales del país.
  final int population; // Población del país.
  final String region; // Región geográfica del país.
  final String subregion; // Subregión geográfica del país.
  final List<String> borders; // Lista de países limítrofes.
  final List<String> currencies; // Lista de monedas utilizadas en el país.

  Pais({
    required this.oficialName,
    required this.name,
    required this.flag,
    required this.code,
    required this.id,
    required this.languages,
    required this.capital,
    required this.population,
    required this.region,
    required this.subregion,
    required this.borders,
    required this.currencies,
  });
}
