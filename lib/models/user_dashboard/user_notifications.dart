// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_notifications.freezed.dart';
part 'user_notifications.g.dart';

@freezed
class UserNotification with _$UserNotification {
  const factory UserNotification({
    String? id,   
    String? datetime,   
    String? user_type,   
    String? user_id,   
    String? listing_id,   
    String? type,   
    String? detail,   
    String? checked,   
    String? hide,       
  }) = _UserNotification;

  factory UserNotification.fromJson(Map<String, dynamic> json) =>
      _$UserNotificationFromJson(json);
}
