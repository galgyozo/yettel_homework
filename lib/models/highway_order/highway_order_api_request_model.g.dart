// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'highway_order_api_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HighwayOrderApiRequest _$HighwayOrderApiRequestFromJson(
        Map<String, dynamic> json) =>
    HighwayOrderApiRequest(
      highwayOrders: (json['highwayOrders'] as List<dynamic>)
          .map((e) => HighwayOrder.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HighwayOrderApiRequestToJson(
        HighwayOrderApiRequest instance) =>
    <String, dynamic>{
      'highwayOrders': instance.highwayOrders,
    };
