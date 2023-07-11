// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'sub_categories.freezed.dart';
part 'sub_categories.g.dart';

@freezed
class SubCategories with _$SubCategories {
  const factory SubCategories({
    int? id,
    String? category_id,
    String? sub_category,
    String? created_at,
    String? updated_at,
    String? web_category,
  }) = _SubCategories;

  factory SubCategories.fromJson(Map<String, dynamic> json) =>
      _$SubCategoriesFromJson(json);
}
