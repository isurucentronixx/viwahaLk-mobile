// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Location _$LocationFromJson(Map<String, dynamic> json) {
  return _Location.fromJson(json);
}

/// @nodoc
mixin _$Location {
  int? get id => throw _privateConstructorUsedError;
  String? get location_id => throw _privateConstructorUsedError;
  String? get location_en => throw _privateConstructorUsedError;
  String? get location_si => throw _privateConstructorUsedError;
  String? get location_ta => throw _privateConstructorUsedError;
  List<SubLocation?>? get sub_locations => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationCopyWith<Location> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationCopyWith<$Res> {
  factory $LocationCopyWith(Location value, $Res Function(Location) then) =
      _$LocationCopyWithImpl<$Res, Location>;
  @useResult
  $Res call(
      {int? id,
      String? location_id,
      String? location_en,
      String? location_si,
      String? location_ta,
      List<SubLocation?>? sub_locations});
}

/// @nodoc
class _$LocationCopyWithImpl<$Res, $Val extends Location>
    implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? location_id = freezed,
    Object? location_en = freezed,
    Object? location_si = freezed,
    Object? location_ta = freezed,
    Object? sub_locations = freezed,
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
      location_en: freezed == location_en
          ? _value.location_en
          : location_en // ignore: cast_nullable_to_non_nullable
              as String?,
      location_si: freezed == location_si
          ? _value.location_si
          : location_si // ignore: cast_nullable_to_non_nullable
              as String?,
      location_ta: freezed == location_ta
          ? _value.location_ta
          : location_ta // ignore: cast_nullable_to_non_nullable
              as String?,
      sub_locations: freezed == sub_locations
          ? _value.sub_locations
          : sub_locations // ignore: cast_nullable_to_non_nullable
              as List<SubLocation?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LocationCopyWith<$Res> implements $LocationCopyWith<$Res> {
  factory _$$_LocationCopyWith(
          _$_Location value, $Res Function(_$_Location) then) =
      __$$_LocationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? location_id,
      String? location_en,
      String? location_si,
      String? location_ta,
      List<SubLocation?>? sub_locations});
}

/// @nodoc
class __$$_LocationCopyWithImpl<$Res>
    extends _$LocationCopyWithImpl<$Res, _$_Location>
    implements _$$_LocationCopyWith<$Res> {
  __$$_LocationCopyWithImpl(
      _$_Location _value, $Res Function(_$_Location) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? location_id = freezed,
    Object? location_en = freezed,
    Object? location_si = freezed,
    Object? location_ta = freezed,
    Object? sub_locations = freezed,
  }) {
    return _then(_$_Location(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      location_id: freezed == location_id
          ? _value.location_id
          : location_id // ignore: cast_nullable_to_non_nullable
              as String?,
      location_en: freezed == location_en
          ? _value.location_en
          : location_en // ignore: cast_nullable_to_non_nullable
              as String?,
      location_si: freezed == location_si
          ? _value.location_si
          : location_si // ignore: cast_nullable_to_non_nullable
              as String?,
      location_ta: freezed == location_ta
          ? _value.location_ta
          : location_ta // ignore: cast_nullable_to_non_nullable
              as String?,
      sub_locations: freezed == sub_locations
          ? _value._sub_locations
          : sub_locations // ignore: cast_nullable_to_non_nullable
              as List<SubLocation?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Location implements _Location {
  const _$_Location(
      {this.id,
      this.location_id,
      this.location_en,
      this.location_si,
      this.location_ta,
      final List<SubLocation?>? sub_locations})
      : _sub_locations = sub_locations;

  factory _$_Location.fromJson(Map<String, dynamic> json) =>
      _$$_LocationFromJson(json);

  @override
  final int? id;
  @override
  final String? location_id;
  @override
  final String? location_en;
  @override
  final String? location_si;
  @override
  final String? location_ta;
  final List<SubLocation?>? _sub_locations;
  @override
  List<SubLocation?>? get sub_locations {
    final value = _sub_locations;
    if (value == null) return null;
    if (_sub_locations is EqualUnmodifiableListView) return _sub_locations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Location(id: $id, location_id: $location_id, location_en: $location_en, location_si: $location_si, location_ta: $location_ta, sub_locations: $sub_locations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Location &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.location_id, location_id) ||
                other.location_id == location_id) &&
            (identical(other.location_en, location_en) ||
                other.location_en == location_en) &&
            (identical(other.location_si, location_si) ||
                other.location_si == location_si) &&
            (identical(other.location_ta, location_ta) ||
                other.location_ta == location_ta) &&
            const DeepCollectionEquality()
                .equals(other._sub_locations, _sub_locations));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      location_id,
      location_en,
      location_si,
      location_ta,
      const DeepCollectionEquality().hash(_sub_locations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LocationCopyWith<_$_Location> get copyWith =>
      __$$_LocationCopyWithImpl<_$_Location>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocationToJson(
      this,
    );
  }
}

abstract class _Location implements Location {
  const factory _Location(
      {final int? id,
      final String? location_id,
      final String? location_en,
      final String? location_si,
      final String? location_ta,
      final List<SubLocation?>? sub_locations}) = _$_Location;

  factory _Location.fromJson(Map<String, dynamic> json) = _$_Location.fromJson;

  @override
  int? get id;
  @override
  String? get location_id;
  @override
  String? get location_en;
  @override
  String? get location_si;
  @override
  String? get location_ta;
  @override
  List<SubLocation?>? get sub_locations;
  @override
  @JsonKey(ignore: true)
  _$$_LocationCopyWith<_$_Location> get copyWith =>
      throw _privateConstructorUsedError;
}
