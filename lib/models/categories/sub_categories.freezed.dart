// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub_categories.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SubCategories _$SubCategoriesFromJson(Map<String, dynamic> json) {
  return _SubCategories.fromJson(json);
}

/// @nodoc
mixin _$SubCategories {
  int? get id => throw _privateConstructorUsedError;
  String? get category_id => throw _privateConstructorUsedError;
  String? get sub_category => throw _privateConstructorUsedError;
  String? get created_at => throw _privateConstructorUsedError;
  String? get updated_at => throw _privateConstructorUsedError;
  String? get web_category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubCategoriesCopyWith<SubCategories> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubCategoriesCopyWith<$Res> {
  factory $SubCategoriesCopyWith(
          SubCategories value, $Res Function(SubCategories) then) =
      _$SubCategoriesCopyWithImpl<$Res, SubCategories>;
  @useResult
  $Res call(
      {int? id,
      String? category_id,
      String? sub_category,
      String? created_at,
      String? updated_at,
      String? web_category});
}

/// @nodoc
class _$SubCategoriesCopyWithImpl<$Res, $Val extends SubCategories>
    implements $SubCategoriesCopyWith<$Res> {
  _$SubCategoriesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? category_id = freezed,
    Object? sub_category = freezed,
    Object? created_at = freezed,
    Object? updated_at = freezed,
    Object? web_category = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      category_id: freezed == category_id
          ? _value.category_id
          : category_id // ignore: cast_nullable_to_non_nullable
              as String?,
      sub_category: freezed == sub_category
          ? _value.sub_category
          : sub_category // ignore: cast_nullable_to_non_nullable
              as String?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String?,
      updated_at: freezed == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String?,
      web_category: freezed == web_category
          ? _value.web_category
          : web_category // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubCategoriesImplCopyWith<$Res>
    implements $SubCategoriesCopyWith<$Res> {
  factory _$$SubCategoriesImplCopyWith(
          _$SubCategoriesImpl value, $Res Function(_$SubCategoriesImpl) then) =
      __$$SubCategoriesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? category_id,
      String? sub_category,
      String? created_at,
      String? updated_at,
      String? web_category});
}

/// @nodoc
class __$$SubCategoriesImplCopyWithImpl<$Res>
    extends _$SubCategoriesCopyWithImpl<$Res, _$SubCategoriesImpl>
    implements _$$SubCategoriesImplCopyWith<$Res> {
  __$$SubCategoriesImplCopyWithImpl(
      _$SubCategoriesImpl _value, $Res Function(_$SubCategoriesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? category_id = freezed,
    Object? sub_category = freezed,
    Object? created_at = freezed,
    Object? updated_at = freezed,
    Object? web_category = freezed,
  }) {
    return _then(_$SubCategoriesImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      category_id: freezed == category_id
          ? _value.category_id
          : category_id // ignore: cast_nullable_to_non_nullable
              as String?,
      sub_category: freezed == sub_category
          ? _value.sub_category
          : sub_category // ignore: cast_nullable_to_non_nullable
              as String?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String?,
      updated_at: freezed == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String?,
      web_category: freezed == web_category
          ? _value.web_category
          : web_category // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubCategoriesImpl implements _SubCategories {
  const _$SubCategoriesImpl(
      {this.id,
      this.category_id,
      this.sub_category,
      this.created_at,
      this.updated_at,
      this.web_category});

  factory _$SubCategoriesImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubCategoriesImplFromJson(json);

  @override
  final int? id;
  @override
  final String? category_id;
  @override
  final String? sub_category;
  @override
  final String? created_at;
  @override
  final String? updated_at;
  @override
  final String? web_category;

  @override
  String toString() {
    return 'SubCategories(id: $id, category_id: $category_id, sub_category: $sub_category, created_at: $created_at, updated_at: $updated_at, web_category: $web_category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubCategoriesImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.category_id, category_id) ||
                other.category_id == category_id) &&
            (identical(other.sub_category, sub_category) ||
                other.sub_category == sub_category) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at) &&
            (identical(other.updated_at, updated_at) ||
                other.updated_at == updated_at) &&
            (identical(other.web_category, web_category) ||
                other.web_category == web_category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, category_id, sub_category,
      created_at, updated_at, web_category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubCategoriesImplCopyWith<_$SubCategoriesImpl> get copyWith =>
      __$$SubCategoriesImplCopyWithImpl<_$SubCategoriesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubCategoriesImplToJson(
      this,
    );
  }
}

abstract class _SubCategories implements SubCategories {
  const factory _SubCategories(
      {final int? id,
      final String? category_id,
      final String? sub_category,
      final String? created_at,
      final String? updated_at,
      final String? web_category}) = _$SubCategoriesImpl;

  factory _SubCategories.fromJson(Map<String, dynamic> json) =
      _$SubCategoriesImpl.fromJson;

  @override
  int? get id;
  @override
  String? get category_id;
  @override
  String? get sub_category;
  @override
  String? get created_at;
  @override
  String? get updated_at;
  @override
  String? get web_category;
  @override
  @JsonKey(ignore: true)
  _$$SubCategoriesImplCopyWith<_$SubCategoriesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
