// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dashboard.freezed.dart';
part 'user_dashboard.g.dart';

@freezed
class UserDashboard with _$UserDashboard {
  const factory UserDashboard({
    int? listings,   
    int? messages,   
    int? reviews,   
    int? referals,   
  }) = _UserDashboard;

  factory UserDashboard.fromJson(Map<String, dynamic> json) =>
      _$UserDashboardFromJson(json);
}
