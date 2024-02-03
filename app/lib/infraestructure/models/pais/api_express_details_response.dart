import 'package:proyecto_final/infraestructure/models/pais/pais_details_api_express.dart';

class ApiExpressDetailsResponse {
  final int status;
  final int countryCount;
  final List<PaisDetailsFromApiExpress> country;
  final String statusText;

  ApiExpressDetailsResponse({
    required this.status,
    required this.countryCount,
    required this.country,
    required this.statusText,
  });

  factory ApiExpressDetailsResponse.fromJson(Map<String, dynamic> json) =>
      ApiExpressDetailsResponse(
        status: json["status"],
        countryCount: json["countryCount"] ?? 0,
        country: List<PaisDetailsFromApiExpress>.from(
            json["country"].map((x) => PaisDetailsFromApiExpress.fromJson(x))),
        statusText: json["statusText"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "countryCount": countryCount,
        "country": List<dynamic>.from(country.map((x) => x.toJson())),
        "statusText": statusText,
      };
}
