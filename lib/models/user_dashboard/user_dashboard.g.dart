// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dashboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserDashboard _$$_UserDashboardFromJson(Map<String, dynamic> json) =>
    _$_UserDashboard(
      listings: json['listings'] as int?,
      messages: json['messages'] as int?,
      reviews: json['reviews'] as int?,
      referals: json['referals'] as int?,
    );

Map<String, dynamic> _$$_UserDashboardToJson(_$_UserDashboard instance) =>
    <String, dynamic>{
      'listings': instance.listings,
      'messages': instance.messages,
      'reviews': instance.reviews,
      'referals': instance.referals,
    };
