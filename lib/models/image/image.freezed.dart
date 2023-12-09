// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ImageObject _$ImageObjectFromJson(Map<String, dynamic> json) {
  return _ImageObject.fromJson(json);
}

/// @nodoc
mixin _$ImageObject {
  String? get type => throw _privateConstructorUsedError;
  String? get path => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageObjectCopyWith<ImageObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageObjectCopyWith<$Res> {
  factory $ImageObjectCopyWith(
          ImageObject value, $Res Function(ImageObject) then) =
      _$ImageObjectCopyWithImpl<$Res, ImageObject>;
  @useResult
  $Res call({String? type, String? path, String? url});
}

/// @nodoc
class _$ImageObjectCopyWithImpl<$Res, $Val extends ImageObject>
    implements $ImageObjectCopyWith<$Res> {
  _$ImageObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? path = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageObjectImplCopyWith<$Res>
    implements $ImageObjectCopyWith<$Res> {
  factory _$$ImageObjectImplCopyWith(
          _$ImageObjectImpl value, $Res Function(_$ImageObjectImpl) then) =
      __$$ImageObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? type, String? path, String? url});
}

/// @nodoc
class __$$ImageObjectImplCopyWithImpl<$Res>
    extends _$ImageObjectCopyWithImpl<$Res, _$ImageObjectImpl>
    implements _$$ImageObjectImplCopyWith<$Res> {
  __$$ImageObjectImplCopyWithImpl(
      _$ImageObjectImpl _value, $Res Function(_$ImageObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? path = freezed,
    Object? url = freezed,
  }) {
    return _then(_$ImageObjectImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageObjectImpl implements _ImageObject {
  const _$ImageObjectImpl({this.type, this.path, this.url});

  factory _$ImageObjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageObjectImplFromJson(json);

  @override
  final String? type;
  @override
  final String? path;
  @override
  final String? url;

  @override
  String toString() {
    return 'ImageObject(type: $type, path: $path, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageObjectImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, path, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageObjectImplCopyWith<_$ImageObjectImpl> get copyWith =>
      __$$ImageObjectImplCopyWithImpl<_$ImageObjectImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageObjectImplToJson(
      this,
    );
  }
}

abstract class _ImageObject implements ImageObject {
  const factory _ImageObject(
      {final String? type,
      final String? path,
      final String? url}) = _$ImageObjectImpl;

  factory _ImageObject.fromJson(Map<String, dynamic> json) =
      _$ImageObjectImpl.fromJson;

  @override
  String? get type;
  @override
  String? get path;
  @override
  String? get url;
  @override
  @JsonKey(ignore: true)
  _$$ImageObjectImplCopyWith<_$ImageObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
