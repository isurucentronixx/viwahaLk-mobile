// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_slider_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MainSlider _$MainSliderFromJson(Map<String, dynamic> json) {
  return _MainSlider.fromJson(json);
}

/// @nodoc
mixin _$MainSlider {
  String? get id => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get order => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MainSliderCopyWith<MainSlider> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainSliderCopyWith<$Res> {
  factory $MainSliderCopyWith(
          MainSlider value, $Res Function(MainSlider) then) =
      _$MainSliderCopyWithImpl<$Res, MainSlider>;
  @useResult
  $Res call({String? id, String? url, String? order, String? status});
}

/// @nodoc
class _$MainSliderCopyWithImpl<$Res, $Val extends MainSlider>
    implements $MainSliderCopyWith<$Res> {
  _$MainSliderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? url = freezed,
    Object? order = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MainSliderCopyWith<$Res>
    implements $MainSliderCopyWith<$Res> {
  factory _$$_MainSliderCopyWith(
          _$_MainSlider value, $Res Function(_$_MainSlider) then) =
      __$$_MainSliderCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? url, String? order, String? status});
}

/// @nodoc
class __$$_MainSliderCopyWithImpl<$Res>
    extends _$MainSliderCopyWithImpl<$Res, _$_MainSlider>
    implements _$$_MainSliderCopyWith<$Res> {
  __$$_MainSliderCopyWithImpl(
      _$_MainSlider _value, $Res Function(_$_MainSlider) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? url = freezed,
    Object? order = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_MainSlider(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MainSlider implements _MainSlider {
  const _$_MainSlider({this.id, this.url, this.order, this.status});

  factory _$_MainSlider.fromJson(Map<String, dynamic> json) =>
      _$$_MainSliderFromJson(json);

  @override
  final String? id;
  @override
  final String? url;
  @override
  final String? order;
  @override
  final String? status;

  @override
  String toString() {
    return 'MainSlider(id: $id, url: $url, order: $order, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MainSlider &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, url, order, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MainSliderCopyWith<_$_MainSlider> get copyWith =>
      __$$_MainSliderCopyWithImpl<_$_MainSlider>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MainSliderToJson(
      this,
    );
  }
}

abstract class _MainSlider implements MainSlider {
  const factory _MainSlider(
      {final String? id,
      final String? url,
      final String? order,
      final String? status}) = _$_MainSlider;

  factory _MainSlider.fromJson(Map<String, dynamic> json) =
      _$_MainSlider.fromJson;

  @override
  String? get id;
  @override
  String? get url;
  @override
  String? get order;
  @override
  String? get status;
  @override
  @JsonKey(ignore: true)
  _$$_MainSliderCopyWith<_$_MainSlider> get copyWith =>
      throw _privateConstructorUsedError;
}
