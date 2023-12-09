// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_notifications.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserNotificationImpl _$$UserNotificationImplFromJson(
        Map<String, dynamic> json) =>
    _$UserNotificationImpl(
      id: json['id'] as String?,
      datetime: json['datetime'] as String?,
      user_type: json['user_type'] as String?,
      user_id: json['user_id'] as String?,
      listing_id: json['listing_id'] as String?,
      type: json['type'] as String?,
      detail: json['detail'] as String?,
      checked: json['checked'] as String?,
      hide: json['hide'] as String?,
    );

Map<String, dynamic> _$$UserNotificationImplToJson(
        _$UserNotificationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'datetime': instance.datetime,
      'user_type': instance.user_type,
      'user_id': instance.user_id,
      'listing_id': instance.listing_id,
      'type': instance.type,
      'detail': instance.detail,
      'checked': instance.checked,
      'hide': instance.hide,
    };
