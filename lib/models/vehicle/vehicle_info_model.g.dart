// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleInfo _$VehicleInfoFromJson(Map<String, dynamic> json) => VehicleInfo(
      statusCode: json['statusCode'] as String,
      internationalRegistrationCode:
          json['internationalRegistrationCode'] as String,
      type: json['type'] as String,
      name: json['name'] as String,
      plate: json['plate'] as String,
      country:
          VehicleInfoCountry.fromJson(json['country'] as Map<String, dynamic>),
      vignetteType: json['vignetteType'] as String,
    );

Map<String, dynamic> _$VehicleInfoToJson(VehicleInfo instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'internationalRegistrationCode': instance.internationalRegistrationCode,
      'type': instance.type,
      'name': instance.name,
      'plate': instance.plate,
      'country': instance.country,
      'vignetteType': instance.vignetteType,
    };

VehicleInfoCountry _$VehicleInfoCountryFromJson(Map<String, dynamic> json) =>
    VehicleInfoCountry(
      hu: json['hu'] as String,
      en: json['en'] as String,
    );

Map<String, dynamic> _$VehicleInfoCountryToJson(VehicleInfoCountry instance) =>
    <String, dynamic>{
      'hu': instance.hu,
      'en': instance.en,
    };
