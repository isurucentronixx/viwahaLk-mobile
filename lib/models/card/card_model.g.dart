// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CardModel _$$_CardModelFromJson(Map<String, dynamic> json) => _$_CardModel(
      id: json['id'] as String?,
      imagePath: json['imagePath'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      starRating: json['starRating'] as String?,
      location: json['location'] as String?,
      mainLocation: json['mainLocation'] as String?,
      date: json['date'] as String?,
      type: json['type'] as String?,
      isFav: json['isFav'] as String?,
    );

Map<String, dynamic> _$$_CardModelToJson(_$_CardModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imagePath': instance.imagePath,
      'title': instance.title,
      'description': instance.description,
      'starRating': instance.starRating,
      'location': instance.location,
      'mainLocation': instance.mainLocation,
      'date': instance.date,
      'type': instance.type,
      'isFav': instance.isFav,
    };
