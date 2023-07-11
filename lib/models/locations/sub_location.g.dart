// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubLocation _$$_SubLocationFromJson(Map<String, dynamic> json) =>
    _$_SubLocation(
      id: json['id'] as int?,
      location_id: json['location_id'] as String?,
      sub_location_en: json['sub_location_en'] as String?,
      sub_location_si: json['sub_location_si'] as String?,
      sub_location_ta: json['sub_location_ta'] as String?,
    );

Map<String, dynamic> _$$_SubLocationToJson(_$_SubLocation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'location_id': instance.location_id,
      'sub_location_en': instance.sub_location_en,
      'sub_location_si': instance.sub_location_si,
      'sub_location_ta': instance.sub_location_ta,
    };
