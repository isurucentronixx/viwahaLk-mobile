// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SubLocation _$SubLocationFromJson(Map<String, dynamic> json) {
  return _SubLocation.fromJson(json);
}

/// @nodoc
mixin _$SubLocation {
  int? get id => throw _privateConstructorUsedError;
  String? get location_id => throw _privateConstructorUsedError;
  String? get sub_location_en => throw _privateConstructorUsedError;
  String? get sub_location_si => throw _privateConstructorUsedError;
  String? get sub_location_ta => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubLocationCopyWith<SubLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubLocationCopyWith<$Res> {
  factory $SubLocationCopyWith(
          SubLocation value, $Res Function(SubLocation) then) =
      _$SubLocationCopyWithImpl<$Res, SubLocation>;
  @useResult
  $Res call(
      {int? id,
      String? location_id,
      String? sub_location_en,
      String? sub_location_si,
      String? sub_location_ta});
}

/// @nodoc
class _$SubLocationCopyWithImpl<$Res, $Val extends SubLocation>
    implements $SubLocationCopyWith<$Res> {
  _$SubLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? location_id = freezed,
    Object? sub_location_en = freezed,
    Object? sub_location_si = freezed,
    Object? sub_location_ta = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      location_id: freezed == location_id
          ? _value.location_id
          : location_id // ignore: cast_nullable_to_non_nullable
              as String?,
      sub_location_en: freezed == sub_location_en
          ? _value.sub_location_en
          : sub_location_en // ignore: cast_nullable_to_non_nullable
              as String?,
      sub_location_si: freezed == sub_location_si
          ? _value.sub_location_si
          : sub_location_si // ignore: cast_nullable_to_non_nullable
              as String?,
      sub_location_ta: freezed == sub_location_ta
          ? _value.sub_location_ta
          : sub_location_ta // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubLocationImplCopyWith<$Res>
    implements $SubLocationCopyWith<$Res> {
  factory _$$SubLocationImplCopyWith(
          _$SubLocationImpl value, $Res Function(_$SubLocationImpl) then) =
      __$$SubLocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? location_id,
      String? sub_location_en,
      String? sub_location_si,
      String? sub_location_ta});
}

/// @nodoc
class __$$SubLocationImplCopyWithImpl<$Res>
    extends _$SubLocationCopyWithImpl<$Res, _$SubLocationImpl>
    implements _$$SubLocationImplCopyWith<$Res> {
  __$$SubLocationImplCopyWithImpl(
      _$SubLocationImpl _value, $Res Function(_$SubLocationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? location_id = freezed,
    Object? sub_location_en = freezed,
    Object? sub_location_si = freezed,
    Object? sub_location_ta = freezed,
  }) {
    return _then(_$SubLocationImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      location_id: freezed == location_id
          ? _value.location_id
          : location_id // ignore: cast_nullable_to_non_nullable
              as String?,
      sub_location_en: freezed == sub_location_en
          ? _value.sub_location_en
          : sub_location_en // ignore: cast_nullable_to_non_nullable
              as String?,
      sub_location_si: freezed == sub_location_si
          ? _value.sub_location_si
          : sub_location_si // ignore: cast_nullable_to_non_nullable
              as String?,
      sub_location_ta: freezed == sub_location_ta
          ? _value.sub_location_ta
          : sub_location_ta // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubLocationImpl implements _SubLocation {
  const _$SubLocationImpl(
      {this.id,
      this.location_id,
      this.sub_location_en,
      this.sub_location_si,
      this.sub_location_ta});

  factory _$SubLocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubLocationImplFromJson(json);

  @override
  final int? id;
  @override
  final String? location_id;
  @override
  final String? sub_location_en;
  @override
  final String? sub_location_si;
  @override
  final String? sub_location_ta;

  @override
  String toString() {
    return 'SubLocation(id: $id, location_id: $location_id, sub_location_en: $sub_location_en, sub_location_si: $sub_location_si, sub_location_ta: $sub_location_ta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubLocationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.location_id, location_id) ||
                other.location_id == location_id) &&
            (identical(other.sub_location_en, sub_location_en) ||
                other.sub_location_en == sub_location_en) &&
            (identical(other.sub_location_si, sub_location_si) ||
                other.sub_location_si == sub_location_si) &&
            (identical(other.sub_location_ta, sub_location_ta) ||
                other.sub_location_ta == sub_location_ta));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, location_id, sub_location_en,
      sub_location_si, sub_location_ta);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubLocationImplCopyWith<_$SubLocationImpl> get copyWith =>
      __$$SubLocationImplCopyWithImpl<_$SubLocationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubLocationImplToJson(
      this,
    );
  }
}

abstract class _SubLocation implements SubLocation {
  const factory _SubLocation(
      {final int? id,
      final String? location_id,
      final String? sub_location_en,
      final String? sub_location_si,
      final String? sub_location_ta}) = _$SubLocationImpl;

  factory _SubLocation.fromJson(Map<String, dynamic> json) =
      _$SubLocationImpl.fromJson;

  @override
  int? get id;
  @override
  String? get location_id;
  @override
  String? get sub_location_en;
  @override
  String? get sub_location_si;
  @override
  String? get sub_location_ta;
  @override
  @JsonKey(ignore: true)
  _$$SubLocationImplCopyWith<_$SubLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
