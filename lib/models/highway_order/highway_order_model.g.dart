// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'highway_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HighwayOrder _$HighwayOrderFromJson(Map<String, dynamic> json) => HighwayOrder(
      type: json['type'] as String,
      category: json['category'] as String,
      cost: (json['cost'] as num).toDouble(),
    );

Map<String, dynamic> _$HighwayOrderToJson(HighwayOrder instance) =>
    <String, dynamic>{
      'type': instance.type,
      'category': instance.category,
      'cost': instance.cost,
    };
