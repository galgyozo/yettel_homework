// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'highway_order_api_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HighwayOrderApiResponse _$HighwayOrderApiResponseFromJson(
        Map<String, dynamic> json) =>
    HighwayOrderApiResponse(
      receivedOrders: (json['receivedOrders'] as List<dynamic>)
          .map((e) => HighwayOrder.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HighwayOrderApiResponseToJson(
        HighwayOrderApiResponse instance) =>
    <String, dynamic>{
      'receivedOrders': instance.receivedOrders,
    };
