// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocationImpl _$$LocationImplFromJson(Map<String, dynamic> json) =>
    _$LocationImpl(
      id: json['id'] as int?,
      location_id: json['location_id'] as String?,
      location_en: json['location_en'] as String?,
      location_si: json['location_si'] as String?,
      location_ta: json['location_ta'] as String?,
      sub_locations: (json['sub_locations'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : SubLocation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$LocationImplToJson(_$LocationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'location_id': instance.location_id,
      'location_en': instance.location_en,
      'location_si': instance.location_si,
      'location_ta': instance.location_ta,
      'sub_locations': instance.sub_locations,
    };
