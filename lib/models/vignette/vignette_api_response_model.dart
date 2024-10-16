import 'package:json_annotation/json_annotation.dart';
import 'package:yettel_homework/models/county/county_model.dart';
import 'package:yettel_homework/models/vehicle/vehicle_category_model.dart';
import 'package:yettel_homework/models/vignette/vignette_model.dart';

part 'vignette_api_response_model.g.dart';

/// The [VignetteApiResponse] class represents the response model for an API request
/// that retrieves vignette information. It contains the following fields:
///
/// - `requestId`: A unique identifier for the API request.
/// - `statusCode`: The status code of the API response indicating success or error.
/// - `payload`: An instance of [HighwayVignetteInfo] containing detailed information
///   about the vignettes, vehicle categories, and counties.
/// - `dataType`: The type of data returned by the API.
///
/// This class utilizes the `json_serializable` package to generate methods for
/// serializing to and deserializing from JSON format.
///
/// The following methods are available:
///
/// - `VignetteApiResponse.fromJson(Map<String, dynamic> json)`: A factory constructor
///   that creates an instance of [VignetteApiResponse] from a JSON map.
/// - `toJson()`: A method that converts the [VignetteApiResponse] instance to a JSON map.
///
/// The generated serialization code can be found in the `vignette_api_response_model.g.dart` file.

@JsonSerializable()
class VignetteApiResponse {
  final int requestId;
  final String statusCode;
  final HighwayVignetteInfo payload;
  final String dataType;

  VignetteApiResponse({
    required this.requestId,
    required this.statusCode,
    required this.payload,
    required this.dataType,
  });

  factory VignetteApiResponse.fromJson(Map<String, dynamic> json) =>
      _$VignetteApiResponseFromJson(json);
  Map<String, dynamic> toJson() => _$VignetteApiResponseToJson(this);
}

/// The [HighwayVignetteInfo] class encapsulates the detailed information about highway
/// vignettes, including:
///
/// - `highwayVignettes`: A list of [Vignette] objects representing available vignettes.
/// - `vehicleCategories`: A list of [VehicleCategory] objects representing vehicle categories.
/// - `counties`: A list of [County] objects representing the counties associated with vignettes.
///
/// This class also leverages the `json_serializable` package for JSON serialization and
/// deserialization.
///
/// The following methods are available:
///
/// - `HighwayVignetteInfo.fromJson(Map<String, dynamic> json)`: A factory constructor
///   that creates an instance of [HighwayVignetteInfo] from a JSON map.
/// - `toJson()`: A method that converts the [HighwayVignetteInfo] instance to a JSON map.
///
/// The generated serialization code for this class is located in `vignette_api_response_model.g.dart`.

@JsonSerializable()
class HighwayVignetteInfo {
  final List<Vignette> highwayVignettes;
  final List<VehicleCategory> vehicleCategories;
  final List<County> counties;

  HighwayVignetteInfo({
    required this.highwayVignettes,
    required this.vehicleCategories,
    required this.counties,
  });

  factory HighwayVignetteInfo.fromJson(Map<String, dynamic> json) =>
      _$HighwayVignetteInfoFromJson(json);
  Map<String, dynamic> toJson() => _$HighwayVignetteInfoToJson(this);
}
