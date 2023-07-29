// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:viwaha_lk/models/categories/sub_categories.dart';

part 'categories.freezed.dart';
part 'categories.g.dart';
@freezed
class Categories with _$Categories {
  const factory Categories({
    int? id,
    String? category,
    String? web_category,
    List<SubCategories?>? sub_categories,
   
  }) = _Categories;

  factory Categories.fromJson(Map<String, dynamic> json) => _$CategoriesFromJson(json);

  
}



