import 'package:freezed_annotation/freezed_annotation.dart';

part 'sub_location.freezed.dart';
part 'sub_location.g.dart';

@freezed
class SubLocation with _$SubLocation {
  const factory SubLocation({
    int? id,
    String? location_id,
    String? sub_location_en,
    String? sub_location_si,
    String? sub_location_ta,
  }) = _SubLocation;

  factory SubLocation.fromJson(Map<String, dynamic> json) =>
      _$SubLocationFromJson(json);
}
