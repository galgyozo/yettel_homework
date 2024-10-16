import 'package:json_annotation/json_annotation.dart';

part 'vehicle_category_model.g.dart';

/// The [VehicleCategory] class represents the model for vehicle categories in the context of
/// highway vignettes. It includes the following fields:
///
/// - `category`: The general vehicle category (e.g., car, truck).
/// - `vignetteCategory`: The vignette-specific category for the vehicle.
/// - `name`: A [VehicleCategoryName] object representing the name of the vehicle category
///   in different languages.
///
/// This class uses the `json_serializable` package to generate code for serialization
/// and deserialization to and from JSON.
///
/// The following methods are available:
///
/// - `VehicleCategory.fromJson(Map<String, dynamic> json)`: A factory constructor that creates
///   an instance of [VehicleCategory] from a JSON map.
/// - `toJson()`: A method that converts the [VehicleCategory] instance to a JSON map.
///
/// The generated serialization code is located in the `vehicle_category.g.dart` file.

@JsonSerializable()
class VehicleCategory {
  final String category;
  final String vignetteCategory;
  final VehicleCategoryName name;

  VehicleCategory({
    required this.category,
    required this.vignetteCategory,
    required this.name,
  });

  factory VehicleCategory.fromJson(Map<String, dynamic> json) =>
      _$VehicleCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$VehicleCategoryToJson(this);
}

/// The [VehicleCategoryName] class represents the multilingual name for a vehicle category.
/// It includes:
///
/// - `hu`: The Hungarian name of the vehicle category.
/// - `en`: The English name of the vehicle category.
///
/// Like [VehicleCategory], this class also uses the `json_serializable` package for JSON
/// serialization and deserialization.
///
/// The following methods are available:
///
/// - `VehicleCategoryName.fromJson(Map<String, dynamic> json)`: A factory constructor that creates
///   an instance of [VehicleCategoryName] from a JSON map.
/// - `toJson()`: A method that converts the [VehicleCategoryName] instance to a JSON map.
///
/// The generated serializati

@JsonSerializable()
class VehicleCategoryName {
  final String hu;
  final String en;

  VehicleCategoryName({
    required this.hu,
    required this.en,
  });

  factory VehicleCategoryName.fromJson(Map<String, dynamic> json) =>
      _$VehicleCategoryNameFromJson(json);
  Map<String, dynamic> toJson() => _$VehicleCategoryNameToJson(this);
}
