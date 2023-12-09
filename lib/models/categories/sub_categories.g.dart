// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_categories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubCategoriesImpl _$$SubCategoriesImplFromJson(Map<String, dynamic> json) =>
    _$SubCategoriesImpl(
      id: json['id'] as int?,
      category_id: json['category_id'] as String?,
      sub_category: json['sub_category'] as String?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
      web_category: json['web_category'] as String?,
    );

Map<String, dynamic> _$$SubCategoriesImplToJson(_$SubCategoriesImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_id': instance.category_id,
      'sub_category': instance.sub_category,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'web_category': instance.web_category,
    };
