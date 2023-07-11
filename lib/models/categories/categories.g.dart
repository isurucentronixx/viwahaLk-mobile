// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Categories _$$_CategoriesFromJson(Map<String, dynamic> json) =>
    _$_Categories(
      id: json['id'] as int?,
      category: json['category'] as String?,
      web_category: json['web_category'] as String?,
      sub_categories: (json['sub_categories'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : SubCategories.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CategoriesToJson(_$_Categories instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'web_category': instance.web_category,
      'sub_categories': instance.sub_categories,
    };
