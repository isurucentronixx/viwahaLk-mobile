// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'reviews.freezed.dart';
part 'reviews.g.dart';

@freezed
class Reviews with _$Reviews {
  const factory Reviews({
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
    String? user_image,
  }) = _Reviews;

  factory Reviews.fromJson(Map<String, dynamic> json) =>
      _$ReviewsFromJson(json);
}
