// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dashboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDashboardImpl _$$UserDashboardImplFromJson(Map<String, dynamic> json) =>
    _$UserDashboardImpl(
      listings: json['listings'] as int?,
      messages: json['messages'] as int?,
      reviews: json['reviews'] as int?,
      referals: json['referals'] as int?,
    );

Map<String, dynamic> _$$UserDashboardImplToJson(_$UserDashboardImpl instance) =>
    <String, dynamic>{
      'listings': instance.listings,
      'messages': instance.messages,
      'reviews': instance.reviews,
      'referals': instance.referals,
    };
