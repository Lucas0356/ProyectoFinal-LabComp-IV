class PaisDetailsFromApiExpress {
  final Name name;
  final String flag;
  final String code;
  final String id;
  final List<String> capital;
  final List<String> languages;
  final int population;
  final List<String> currencies;
  final String region;
  final String subregion;
  final List<String> borders;

  PaisDetailsFromApiExpress({
    required this.name,
    required this.flag,
    required this.code,
    required this.id,
    required this.capital,
    required this.languages,
    required this.population,
    required this.currencies,
    required this.region,
    required this.subregion,
    required this.borders,
  });

  factory PaisDetailsFromApiExpress.fromJson(Map<String, dynamic> json) =>
      PaisDetailsFromApiExpress(
        name: Name.fromJson(json["name"]),
        flag: json["flag"],
        code: json["code"],
        id: json["id"],
        capital: List<String>.from(json["capital"].map((x) => x)),
        languages: List<String>.from(json["languages"].values),
        population: json["population"],
        currencies: List<String>.from(json["currencies"].keys),
        region: json["region"],
        subregion: json["subregion"],
        borders: (json["borders"] == null)
            ? ['COUNTRY WITHOUT BORDERS']
            : List<String>.from(json["borders"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name.toJson(),
        "flag": flag,
        "code": code,
        "id": id,
        "capital": List<dynamic>.from(capital.map((x) => x)),
        "languages": languages,
        "population": population,
        "currencies": currencies,
        "region": region,
        "subregion": subregion,
        "borders": List<dynamic>.from(borders.map((x) => x)),
      };
}

class Name {
  final String official;
  final String common;

  Name({
    required this.official,
    required this.common,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        official: json["official"],
        common: json["common"],
      );

  Map<String, dynamic> toJson() => {
        "official": official,
        "common": common,
      };
}
