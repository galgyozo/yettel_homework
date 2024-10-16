import 'package:json_annotation/json_annotation.dart';
import 'package:yettel_homework/models/highway_order/highway_order_model.dart';

part 'highway_order_api_request_model.g.dart';

/// The [HighwayOrderApiRequest] class represents the data model for an API request
/// to submit one or more highway orders. It contains:
///
/// - `highwayOrders`: A list of [HighwayOrder] objects that represent the individual
///   orders to be processed in the request.
///
/// This class uses the `json_serializable` package to automatically generate
/// serialization and deserialization methods for converting to and from JSON.
///
/// The following methods are available:
///
/// - `HighwayOrderApiRequest.fromJson(Map<String, dynamic> json)`: A factory constructor
///   that creates an instance of [HighwayOrderApiRequest] from a JSON map.
/// - `toJson()`: A method that converts the [HighwayOrderApiRequest] instance to a JSON map.
///
/// The code for these methods is generated in the `highway_order_api_request.g.dart` file.
@JsonSerializable()
class HighwayOrderApiRequest {
  final List<HighwayOrder> highwayOrders;

  HighwayOrderApiRequest({
    required this.highwayOrders,
  });

  factory HighwayOrderApiRequest.fromJson(Map<String, dynamic> json) =>
      _$HighwayOrderApiRequestFromJson(json);
  Map<String, dynamic> toJson() => _$HighwayOrderApiRequestToJson(this);
}
