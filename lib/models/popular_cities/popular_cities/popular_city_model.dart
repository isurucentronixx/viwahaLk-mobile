// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'popular_city_model.freezed.dart';
part 'popular_city_model.g.dart';

@freezed
class City with _$City {
  const factory City({
    String? id,
    String? name,
    String? image,
    String? ratings,
    
  }) = _City;

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
}
