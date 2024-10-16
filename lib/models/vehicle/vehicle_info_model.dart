import 'package:json_annotation/json_annotation.dart';

part 'vehicle_info_model.g.dart';

/// The [VehicleInfo] class represents the response model for an API call
/// retrieving vehicle information. It contains the following fields:
///
/// - `statusCode`: The status code of the API response.
/// - `internationalRegistrationCode`: The international registration code of the vehicle.
/// - `type`: The type of vehicle.
/// - `name`: The name or model of the vehicle.
/// - `plate`: The license plate number of the vehicle.
/// - `country`: A [VehicleInfoCountry] object representing the country
///   of registration in multiple languages.
/// - `vignetteType`: The type of highway vignette applicable to the vehicle.
///
/// This class uses the `json_serializable` package to generate JSON serialization
/// and deserialization methods.
///
/// The following methods are available:
///
/// - `VehicleInfo.fromJson(Map<String, dynamic> json)`: A factory constructor
///   that creates an instance of [VehicleInfo] from a JSON map.
/// - `toJson()`: A method that converts the [VehicleInfo] instance to a JSON map.
///
/// The generated code is located in `vehicle_info_model.g.dart`.

@JsonSerializable()
class VehicleInfo {
  final String statusCode;
  final String internationalRegistrationCode;
  final String type;
  final String name;
  final String plate;
  final VehicleInfoCountry country;
  final String vignetteType;

  VehicleInfo({
    required this.statusCode,
    required this.internationalRegistrationCode,
    required this.type,
    required this.name,
    required this.plate,
    required this.country,
    required this.vignetteType,
  });

  factory VehicleInfo.fromJson(Map<String, dynamic> json) =>
      _$VehicleInfoFromJson(json);
  Map<String, dynamic> toJson() => _$VehicleInfoToJson(this);
}

/// The [VehicleInfoCountry] class represents the country details of the
/// vehicle in multiple languages, specifically:
///
/// - `hu`: The Hungarian name of the country.
/// - `en`: The English name of the country.
///
/// This class also uses `json_serializable` to generate the JSON serialization and deserialization code.
///
/// The following methods are available:
///
/// - `VehicleInfoCountry.fromJson(Map<String, dynamic> json)`: A factory constructor
///   that creates an instance of [VehicleInfoCountry] from a JSON map.
/// - `toJson()`: A method that converts the [VehicleInfoCountry] instance to a JSON map.
///
/// The generated serialization code resides in `vehicle_info_model.g.dart`.

@JsonSerializable()
class VehicleInfoCountry {
  final String hu;
  final String en;

  VehicleInfoCountry({
    required this.hu,
    required this.en,
  });

  factory VehicleInfoCountry.fromJson(Map<String, dynamic> json) =>
      _$VehicleInfoCountryFromJson(json);
  Map<String, dynamic> toJson() => _$VehicleInfoCountryToJson(this);
}
