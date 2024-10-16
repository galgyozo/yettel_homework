import 'package:json_annotation/json_annotation.dart';

part 'county_model.g.dart';

/// The [County] class represents a data model for a county entity.
/// It contains two properties:
///
/// - `id`: A unique identifier for the county.
/// - `name`: The name of the county.
///
/// This class uses the `json_serializable` package to automatically
/// generate code for serializing to and from JSON format. The following
/// methods are available:
///
/// - `County.fromJson(Map<String, dynamic> json)`: A factory constructor
///   that creates a [County] instance from a JSON map.
/// - `toJson()`: A method that converts the [County] instance to a JSON map.
///
/// The code for serialization and deserialization is generated in the
/// `county.g.dart` file.
@JsonSerializable()
class County {
  final String id;
  final String name;

  County({
    required this.id,
    required this.name,
  });

  factory County.fromJson(Map<String, dynamic> json) => _$CountyFromJson(json);
  Map<String, dynamic> toJson() => _$CountyToJson(this);
}
