import 'package:json_annotation/json_annotation.dart';
import 'package:yettel_homework/models/highway_order/highway_order_model.dart';

part 'highway_order_api_response_model.g.dart';

/// The [HighwayOrderApiResponse] class represents the response model for an API
/// request regarding highway orders. It contains:
///
/// - `receivedOrders`: A list of [HighwayOrder] objects that represent the orders
///   returned in the response.
///
/// This class uses the `json_serializable` package to generate code for serializing
/// to and from JSON format.
///
/// The following methods are available:
///
/// - `HighwayOrderApiResponse.fromJson(Map<String, dynamic> json)`: A factory constructor
///   that creates an instance of [HighwayOrderApiResponse] from a JSON map.
/// - `toJson()`: A method that converts the [HighwayOrderApiResponse] instance to a JSON map.
///
/// The generated code resides in the `highway_order_api_response.g.dart` file.

@JsonSerializable()
class HighwayOrderApiResponse {
  final List<HighwayOrder> receivedOrders;

  HighwayOrderApiResponse({
    required this.receivedOrders,
  });

  factory HighwayOrderApiResponse.fromJson(Map<String, dynamic> json) =>
      _$HighwayOrderApiResponseFromJson(json);
  Map<String, dynamic> toJson() => _$HighwayOrderApiResponseToJson(this);
}
