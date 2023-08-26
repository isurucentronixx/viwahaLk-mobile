// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_messages.freezed.dart';
part 'user_messages.g.dart';

@freezed
class Message with _$Message {
  const factory Message({
    String? id,   
    String? datetime,   
    String? user_id,   
    String? listing_id,   
    String? name,   
    String? email,   
    String? phone,   
    String? date,   
    String? guests,   
    String? message,   
    String? title,   
    String? image,   
       
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}
