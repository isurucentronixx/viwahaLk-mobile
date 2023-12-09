// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vendor_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VendorState {
  Vendor get vendor => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VendorStateCopyWith<VendorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VendorStateCopyWith<$Res> {
  factory $VendorStateCopyWith(
          VendorState value, $Res Function(VendorState) then) =
      _$VendorStateCopyWithImpl<$Res, VendorState>;
  @useResult
  $Res call({Vendor vendor, bool isLoading});

  $VendorCopyWith<$Res> get vendor;
}

/// @nodoc
class _$VendorStateCopyWithImpl<$Res, $Val extends VendorState>
    implements $VendorStateCopyWith<$Res> {
  _$VendorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vendor = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      vendor: null == vendor
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as Vendor,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $VendorCopyWith<$Res> get vendor {
    return $VendorCopyWith<$Res>(_value.vendor, (value) {
      return _then(_value.copyWith(vendor: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VendorStateImplCopyWith<$Res>
    implements $VendorStateCopyWith<$Res> {
  factory _$$VendorStateImplCopyWith(
          _$VendorStateImpl value, $Res Function(_$VendorStateImpl) then) =
      __$$VendorStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Vendor vendor, bool isLoading});

  @override
  $VendorCopyWith<$Res> get vendor;
}

/// @nodoc
class __$$VendorStateImplCopyWithImpl<$Res>
    extends _$VendorStateCopyWithImpl<$Res, _$VendorStateImpl>
    implements _$$VendorStateImplCopyWith<$Res> {
  __$$VendorStateImplCopyWithImpl(
      _$VendorStateImpl _value, $Res Function(_$VendorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vendor = null,
    Object? isLoading = null,
  }) {
    return _then(_$VendorStateImpl(
      vendor: null == vendor
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as Vendor,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$VendorStateImpl implements _VendorState {
  _$VendorStateImpl({this.vendor = const Vendor(), this.isLoading = true});

  @override
  @JsonKey()
  final Vendor vendor;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'VendorState(vendor: $vendor, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VendorStateImpl &&
            (identical(other.vendor, vendor) || other.vendor == vendor) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vendor, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VendorStateImplCopyWith<_$VendorStateImpl> get copyWith =>
      __$$VendorStateImplCopyWithImpl<_$VendorStateImpl>(this, _$identity);
}

abstract class _VendorState implements VendorState {
  factory _VendorState({final Vendor vendor, final bool isLoading}) =
      _$VendorStateImpl;

  @override
  Vendor get vendor;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$VendorStateImplCopyWith<_$VendorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
