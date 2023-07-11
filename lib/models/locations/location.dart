// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:viwaha_lk/models/locations/sub_location.dart';

part 'location.freezed.dart';
part 'location.g.dart';

@freezed
class Location with _$Location {
  const factory Location({
    int? id,
    String? location_id,
    String? location_en,
    String? location_si,
    String? location_ta,
    List<SubLocation?>? sub_locations,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}
