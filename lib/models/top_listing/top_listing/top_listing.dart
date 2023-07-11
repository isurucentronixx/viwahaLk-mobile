// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_listing.freezed.dart';
part 'top_listing.g.dart';

@freezed
class TopListing with _$TopListing {
  const factory TopListing({
    String? id,
    String? datetime,
    String? user_id,
    String? title,
    String? category,
    String? main_category,
    String? address,
    String? location,
    String? main_location,
    String? video,
    String? name,
    String? email,
    String? phone,
    String? whatsapp,
    String? website,
    String? designation,
    String? company,
    String? facebook,
    String? instagram,
    String? youtube,
    String? linkedin,
    String? description,
    String? amenities,
    String? saturday_open_time,
    String? saturday_close_time,
    String? sunday_open_time,
    String? sunday_close_time,
    String? monday_open_time,
    String? monday_close_time,
    String? tuesday_open_time,
    String? tuesday_close_time,
    String? wednesday_open_time,
    String? wednesday_close_time,
    String? thursday_open_time,
    String? thursday_close_time,
    String? friday_open_time,
    String? friday_close_time,
    String? always_open,
    String? open_holiday,
    String? images,
    String? thumb_images,
    String? views,
    String? active,
    String? premium,
    String? bank_receipt_image,
    String? price,
    String? ask_price,
    String? negotiable,
  }) = _TopListing;

  factory TopListing.fromJson(Map<String, dynamic> json) =>
      _$TopListingFromJson(json);
}
