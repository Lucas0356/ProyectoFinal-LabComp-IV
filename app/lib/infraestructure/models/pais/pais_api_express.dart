class PaisFromApiExpress {
  final String name;
  final String flag;
  final String? code;
  final String id;
  final List<String> capital;
  final List<String> languages;

  PaisFromApiExpress({
    required this.name,
    required this.flag,
    this.code,
    required this.id,
    required this.capital,
    required this.languages,
  });

  factory PaisFromApiExpress.fromJson(Map<String, dynamic> json) =>
      PaisFromApiExpress(
        name: json["name"],
        flag: json["flag"],
        code: json["code"],
        id: json["id"],
        capital: List<String>.from(json["capital"].map((x) => x)),
        languages: List<String>.from(json["languages"].values),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "flag": flag,
        "code": code,
        "id": id,
        "capital": List<dynamic>.from(capital.map((x) => x)),
        "languages": languages,
      };
}
