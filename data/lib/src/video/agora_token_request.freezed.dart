// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'agora_token_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AgoraTokenRequest _$AgoraTokenRequestFromJson(Map<String, dynamic> json) {
  return _AgoraTokenRequest.fromJson(json);
}

/// @nodoc
class _$AgoraTokenRequestTearOff {
  const _$AgoraTokenRequestTearOff();

  _AgoraTokenRequest call(
      {required String channelName, required String account}) {
    return _AgoraTokenRequest(
      channelName: channelName,
      account: account,
    );
  }

  AgoraTokenRequest fromJson(Map<String, Object?> json) {
    return AgoraTokenRequest.fromJson(json);
  }
}

/// @nodoc
const $AgoraTokenRequest = _$AgoraTokenRequestTearOff();

/// @nodoc
mixin _$AgoraTokenRequest {
  String get channelName => throw _privateConstructorUsedError;
  String get account => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AgoraTokenRequestCopyWith<AgoraTokenRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgoraTokenRequestCopyWith<$Res> {
  factory $AgoraTokenRequestCopyWith(
          AgoraTokenRequest value, $Res Function(AgoraTokenRequest) then) =
      _$AgoraTokenRequestCopyWithImpl<$Res>;
  $Res call({String channelName, String account});
}

/// @nodoc
class _$AgoraTokenRequestCopyWithImpl<$Res>
    implements $AgoraTokenRequestCopyWith<$Res> {
  _$AgoraTokenRequestCopyWithImpl(this._value, this._then);

  final AgoraTokenRequest _value;
  // ignore: unused_field
  final $Res Function(AgoraTokenRequest) _then;

  @override
  $Res call({
    Object? channelName = freezed,
    Object? account = freezed,
  }) {
    return _then(_value.copyWith(
      channelName: channelName == freezed
          ? _value.channelName
          : channelName // ignore: cast_nullable_to_non_nullable
              as String,
      account: account == freezed
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$AgoraTokenRequestCopyWith<$Res>
    implements $AgoraTokenRequestCopyWith<$Res> {
  factory _$AgoraTokenRequestCopyWith(
          _AgoraTokenRequest value, $Res Function(_AgoraTokenRequest) then) =
      __$AgoraTokenRequestCopyWithImpl<$Res>;
  @override
  $Res call({String channelName, String account});
}

/// @nodoc
class __$AgoraTokenRequestCopyWithImpl<$Res>
    extends _$AgoraTokenRequestCopyWithImpl<$Res>
    implements _$AgoraTokenRequestCopyWith<$Res> {
  __$AgoraTokenRequestCopyWithImpl(
      _AgoraTokenRequest _value, $Res Function(_AgoraTokenRequest) _then)
      : super(_value, (v) => _then(v as _AgoraTokenRequest));

  @override
  _AgoraTokenRequest get _value => super._value as _AgoraTokenRequest;

  @override
  $Res call({
    Object? channelName = freezed,
    Object? account = freezed,
  }) {
    return _then(_AgoraTokenRequest(
      channelName: channelName == freezed
          ? _value.channelName
          : channelName // ignore: cast_nullable_to_non_nullable
              as String,
      account: account == freezed
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AgoraTokenRequest implements _AgoraTokenRequest {
  _$_AgoraTokenRequest({required this.channelName, required this.account});

  factory _$_AgoraTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$$_AgoraTokenRequestFromJson(json);

  @override
  final String channelName;
  @override
  final String account;

  @override
  String toString() {
    return 'AgoraTokenRequest(channelName: $channelName, account: $account)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AgoraTokenRequest &&
            const DeepCollectionEquality()
                .equals(other.channelName, channelName) &&
            const DeepCollectionEquality().equals(other.account, account));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(channelName),
      const DeepCollectionEquality().hash(account));

  @JsonKey(ignore: true)
  @override
  _$AgoraTokenRequestCopyWith<_AgoraTokenRequest> get copyWith =>
      __$AgoraTokenRequestCopyWithImpl<_AgoraTokenRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AgoraTokenRequestToJson(this);
  }
}

abstract class _AgoraTokenRequest implements AgoraTokenRequest {
  factory _AgoraTokenRequest(
      {required String channelName,
      required String account}) = _$_AgoraTokenRequest;

  factory _AgoraTokenRequest.fromJson(Map<String, dynamic> json) =
      _$_AgoraTokenRequest.fromJson;

  @override
  String get channelName;
  @override
  String get account;
  @override
  @JsonKey(ignore: true)
  _$AgoraTokenRequestCopyWith<_AgoraTokenRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
