// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_slider_model.freezed.dart';
part 'main_slider_model.g.dart';

@freezed
class MainSlider with _$MainSlider {
  const factory MainSlider({
    String? id,
    String? url,
    String? order,
    String? status,
    
  }) = _MainSlider;

  factory MainSlider.fromJson(Map<String, dynamic> json) => _$MainSliderFromJson(json);
}