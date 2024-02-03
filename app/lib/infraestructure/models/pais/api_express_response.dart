import 'package:proyecto_final/infraestructure/models/pais/pais_api_express.dart';

class ApiExpressResponse {
  final int status;
  final int countryCount;
  final List<PaisFromApiExpress> countries;
  final String statusText;

  ApiExpressResponse({
    required this.status,
    required this.countryCount,
    required this.countries,
    required this.statusText,
  });

  factory ApiExpressResponse.fromJson(Map<String, dynamic> json) =>
      ApiExpressResponse(
        status: json["status"],
        countryCount: json["countryCount"],
        countries: List<PaisFromApiExpress>.from(
            json["countries"].map((x) => PaisFromApiExpress.fromJson(x))),
        statusText: json["statusText"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "countryCount": countryCount,
        "countries": List<dynamic>.from(countries.map((x) => x.toJson())),
        "statusText": statusText,
      };
}
