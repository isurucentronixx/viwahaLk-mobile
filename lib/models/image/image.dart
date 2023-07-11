// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'image.freezed.dart';
part 'image.g.dart';

@freezed
class ImageObject with _$ImageObject {
  const factory ImageObject({
    String? type,
    String? path,
    String? url,
  }) = _ImageObject;

  factory ImageObject.fromJson(Map<String, dynamic> json) =>
      _$ImageObjectFromJson(json);
}
