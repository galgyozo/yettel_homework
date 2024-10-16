import 'package:json_annotation/json_annotation.dart';

part 'highway_order_model.g.dart';

/// The [HighwayOrder] class represents the data model for an individual highway order.
/// It contains the following properties:
///
/// - `type`: The type of the highway order (e.g., vignette type).
/// - `category`: The vehicle category for which the highway order is applied.
/// - `cost`: The cost of the highway order.
///
/// This class uses the `json_serializable` package to generate code for converting
/// to and from JSON format.
///
/// The following methods are available:
///
/// - `HighwayOrder.fromJson(Map<String, dynamic> json)`: A factory constructor that creates
///   an instance of [HighwayOrder] from a JSON map.
/// - `toJson()`: A method that converts the [HighwayOrder] instance to a JSON map.
///
/// The serialization code is generated in the `highway_order.g.dart` file.

@JsonSerializable()
class HighwayOrder {
  final String type;
  final String category;
  final double cost;

  HighwayOrder({
    required this.type,
    required this.category,
    required this.cost,
  });

  factory HighwayOrder.fromJson(Map<String, dynamic> json) =>
      _$HighwayOrderFromJson(json);
  Map<String, dynamic> toJson() => _$HighwayOrderToJson(this);
}
