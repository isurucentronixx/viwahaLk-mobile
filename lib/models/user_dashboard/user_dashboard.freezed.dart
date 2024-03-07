// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_dashboard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserDashboard _$UserDashboardFromJson(Map<String, dynamic> json) {
  return _UserDashboard.fromJson(json);
}

/// @nodoc
mixin _$UserDashboard {
  int? get listings => throw _privateConstructorUsedError;
  int? get messages => throw _privateConstructorUsedError;
  int? get reviews => throw _privateConstructorUsedError;
  int? get referals => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDashboardCopyWith<UserDashboard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDashboardCopyWith<$Res> {
  factory $UserDashboardCopyWith(
          UserDashboard value, $Res Function(UserDashboard) then) =
      _$UserDashboardCopyWithImpl<$Res, UserDashboard>;
  @useResult
  $Res call({int? listings, int? messages, int? reviews, int? referals});
}

/// @nodoc
class _$UserDashboardCopyWithImpl<$Res, $Val extends UserDashboard>
    implements $UserDashboardCopyWith<$Res> {
  _$UserDashboardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listings = freezed,
    Object? messages = freezed,
    Object? reviews = freezed,
    Object? referals = freezed,
  }) {
    return _then(_value.copyWith(
      listings: freezed == listings
          ? _value.listings
          : listings // ignore: cast_nullable_to_non_nullable
              as int?,
      messages: freezed == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as int?,
      reviews: freezed == reviews
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as int?,
      referals: freezed == referals
          ? _value.referals
          : referals // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDashboardImplCopyWith<$Res>
    implements $UserDashboardCopyWith<$Res> {
  factory _$$UserDashboardImplCopyWith(
          _$UserDashboardImpl value, $Res Function(_$UserDashboardImpl) then) =
      __$$UserDashboardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? listings, int? messages, int? reviews, int? referals});
}

/// @nodoc
class __$$UserDashboardImplCopyWithImpl<$Res>
    extends _$UserDashboardCopyWithImpl<$Res, _$UserDashboardImpl>
    implements _$$UserDashboardImplCopyWith<$Res> {
  __$$UserDashboardImplCopyWithImpl(
      _$UserDashboardImpl _value, $Res Function(_$UserDashboardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listings = freezed,
    Object? messages = freezed,
    Object? reviews = freezed,
    Object? referals = freezed,
  }) {
    return _then(_$UserDashboardImpl(
      listings: freezed == listings
          ? _value.listings
          : listings // ignore: cast_nullable_to_non_nullable
              as int?,
      messages: freezed == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as int?,
      reviews: freezed == reviews
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as int?,
      referals: freezed == referals
          ? _value.referals
          : referals // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDashboardImpl implements _UserDashboard {
  const _$UserDashboardImpl(
      {this.listings, this.messages, this.reviews, this.referals});

  factory _$UserDashboardImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDashboardImplFromJson(json);

  @override
  final int? listings;
  @override
  final int? messages;
  @override
  final int? reviews;
  @override
  final int? referals;

  @override
  String toString() {
    return 'UserDashboard(listings: $listings, messages: $messages, reviews: $reviews, referals: $referals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDashboardImpl &&
            (identical(other.listings, listings) ||
                other.listings == listings) &&
            (identical(other.messages, messages) ||
                other.messages == messages) &&
            (identical(other.reviews, reviews) || other.reviews == reviews) &&
            (identical(other.referals, referals) ||
                other.referals == referals));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, listings, messages, reviews, referals);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDashboardImplCopyWith<_$UserDashboardImpl> get copyWith =>
      __$$UserDashboardImplCopyWithImpl<_$UserDashboardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDashboardImplToJson(
      this,
    );
  }
}

abstract class _UserDashboard implements UserDashboard {
  const factory _UserDashboard(
      {final int? listings,
      final int? messages,
      final int? reviews,
      final int? referals}) = _$UserDashboardImpl;

  factory _UserDashboard.fromJson(Map<String, dynamic> json) =
      _$UserDashboardImpl.fromJson;

  @override
  int? get listings;
  @override
  int? get messages;
  @override
  int? get reviews;
  @override
  int? get referals;
  @override
  @JsonKey(ignore: true)
  _$$UserDashboardImplCopyWith<_$UserDashboardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
