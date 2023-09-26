// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_model.freezed.dart';
part 'card_model.g.dart';
@freezed
class CardModel with _$CardModel{
  const factory CardModel({
    String? id,
    String? imagePath,
    String? title,
    String? description,
    String? starRating,
    String? location,
    String? mainLocation,
    String? date,
    String? type,
    String? isFav,
   
  }) = _CardModel;

  factory CardModel.fromJson(Map<String, dynamic> json) => _$CardModelFromJson(json);

  
}



