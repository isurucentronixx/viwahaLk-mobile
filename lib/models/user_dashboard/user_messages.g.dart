// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_messages.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Message _$$_MessageFromJson(Map<String, dynamic> json) => _$_Message(
      id: json['id'] as String?,
      datetime: json['datetime'] as String?,
      user_id: json['user_id'] as String?,
      listing_id: json['listing_id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      date: json['date'] as String?,
      guests: json['guests'] as String?,
      message: json['message'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$$_MessageToJson(_$_Message instance) =>
    <String, dynamic>{
      'id': instance.id,
      'datetime': instance.datetime,
      'user_id': instance.user_id,
      'listing_id': instance.listing_id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'date': instance.date,
      'guests': instance.guests,
      'message': instance.message,
      'title': instance.title,
    };
