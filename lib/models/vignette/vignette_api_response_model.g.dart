// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vignette_api_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VignetteApiResponse _$VignetteApiResponseFromJson(Map<String, dynamic> json) =>
    VignetteApiResponse(
      requestId: (json['requestId'] as num).toInt(),
      statusCode: json['statusCode'] as String,
      payload:
          HighwayVignetteInfo.fromJson(json['payload'] as Map<String, dynamic>),
      dataType: json['dataType'] as String,
    );

Map<String, dynamic> _$VignetteApiResponseToJson(
        VignetteApiResponse instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'statusCode': instance.statusCode,
      'payload': instance.payload,
      'dataType': instance.dataType,
    };

HighwayVignetteInfo _$HighwayVignetteInfoFromJson(Map<String, dynamic> json) =>
    HighwayVignetteInfo(
      highwayVignettes: (json['highwayVignettes'] as List<dynamic>)
          .map((e) => Vignette.fromJson(e as Map<String, dynamic>))
          .toList(),
      vehicleCategories: (json['vehicleCategories'] as List<dynamic>)
          .map((e) => VehicleCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      counties: (json['counties'] as List<dynamic>)
          .map((e) => County.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HighwayVignetteInfoToJson(
        HighwayVignetteInfo instance) =>
    <String, dynamic>{
      'highwayVignettes': instance.highwayVignettes,
      'vehicleCategories': instance.vehicleCategories,
      'counties': instance.counties,
    };
