// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_reviews.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserReviews _$$_UserReviewsFromJson(Map<String, dynamic> json) =>
    _$_UserReviews(
      id: json['id'] as String?,
      datetime: json['datetime'] as String?,
      listing_id: json['listing_id'] as String?,
      reply_id: json['reply_id'] as String?,
      user_id: json['user_id'] as String?,
      message: json['message'] as String?,
      image: json['image'] as String?,
      rating: json['rating'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
    );

Map<String, dynamic> _$$_UserReviewsToJson(_$_UserReviews instance) =>
    <String, dynamic>{
      'id': instance.id,
      'datetime': instance.datetime,
      'listing_id': instance.listing_id,
      'reply_id': instance.reply_id,
      'user_id': instance.user_id,
      'message': instance.message,
      'image': instance.image,
      'rating': instance.rating,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
    };
