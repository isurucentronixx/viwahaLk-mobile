// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_reviews.freezed.dart';
part 'user_reviews.g.dart';

@freezed
class UserReviews with _$UserReviews {
  const factory UserReviews({
    String? id,   
    String? datetime,  
    String? listing_id,   
    String? reply_id,         
    String? user_id,   
    String? message,   
    String? image,   
    String? rating,       
    String? firstname,       
    String? lastname,       
  }) = _UserReviews;

  factory UserReviews.fromJson(Map<String, dynamic> json) =>
      _$UserReviewsFromJson(json);
}
