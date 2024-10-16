// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleCategory _$VehicleCategoryFromJson(Map<String, dynamic> json) =>
    VehicleCategory(
      category: json['category'] as String,
      vignetteCategory: json['vignetteCategory'] as String,
      name: VehicleCategoryName.fromJson(json['name'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VehicleCategoryToJson(VehicleCategory instance) =>
    <String, dynamic>{
      'category': instance.category,
      'vignetteCategory': instance.vignetteCategory,
      'name': instance.name,
    };

VehicleCategoryName _$VehicleCategoryNameFromJson(Map<String, dynamic> json) =>
    VehicleCategoryName(
      hu: json['hu'] as String,
      en: json['en'] as String,
    );

Map<String, dynamic> _$VehicleCategoryNameToJson(
        VehicleCategoryName instance) =>
    <String, dynamic>{
      'hu': instance.hu,
      'en': instance.en,
    };
