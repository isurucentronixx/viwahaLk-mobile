// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'top_listing_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TopListingState {
  TopListing get topListing => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TopListingStateCopyWith<TopListingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopListingStateCopyWith<$Res> {
  factory $TopListingStateCopyWith(
          TopListingState value, $Res Function(TopListingState) then) =
      _$TopListingStateCopyWithImpl<$Res, TopListingState>;
  @useResult
  $Res call({TopListing topListing, bool isLoading});

  $TopListingCopyWith<$Res> get topListing;
}

/// @nodoc
class _$TopListingStateCopyWithImpl<$Res, $Val extends TopListingState>
    implements $TopListingStateCopyWith<$Res> {
  _$TopListingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topListing = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      topListing: null == topListing
          ? _value.topListing
          : topListing // ignore: cast_nullable_to_non_nullable
              as TopListing,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TopListingCopyWith<$Res> get topListing {
    return $TopListingCopyWith<$Res>(_value.topListing, (value) {
      return _then(_value.copyWith(topListing: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TopListingStateImplCopyWith<$Res>
    implements $TopListingStateCopyWith<$Res> {
  factory _$$TopListingStateImplCopyWith(_$TopListingStateImpl value,
          $Res Function(_$TopListingStateImpl) then) =
      __$$TopListingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TopListing topListing, bool isLoading});

  @override
  $TopListingCopyWith<$Res> get topListing;
}

/// @nodoc
class __$$TopListingStateImplCopyWithImpl<$Res>
    extends _$TopListingStateCopyWithImpl<$Res, _$TopListingStateImpl>
    implements _$$TopListingStateImplCopyWith<$Res> {
  __$$TopListingStateImplCopyWithImpl(
      _$TopListingStateImpl _value, $Res Function(_$TopListingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topListing = null,
    Object? isLoading = null,
  }) {
    return _then(_$TopListingStateImpl(
      topListing: null == topListing
          ? _value.topListing
          : topListing // ignore: cast_nullable_to_non_nullable
              as TopListing,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TopListingStateImpl implements _TopListingState {
  _$TopListingStateImpl(
      {this.topListing = const TopListing(), this.isLoading = true});

  @override
  @JsonKey()
  final TopListing topListing;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'TopListingState(topListing: $topListing, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopListingStateImpl &&
            (identical(other.topListing, topListing) ||
                other.topListing == topListing) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, topListing, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TopListingStateImplCopyWith<_$TopListingStateImpl> get copyWith =>
      __$$TopListingStateImplCopyWithImpl<_$TopListingStateImpl>(
          this, _$identity);
}

abstract class _TopListingState implements TopListingState {
  factory _TopListingState(
      {final TopListing topListing,
      final bool isLoading}) = _$TopListingStateImpl;

  @override
  TopListing get topListing;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$TopListingStateImplCopyWith<_$TopListingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
