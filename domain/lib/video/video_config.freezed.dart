// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'video_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$VideoConfigTearOff {
  const _$VideoConfigTearOff();

  _VideoConfig call(
      {required String meetingId,
      required bool isVideoEnabled,
      required bool isAudioEnabled}) {
    return _VideoConfig(
      meetingId: meetingId,
      isVideoEnabled: isVideoEnabled,
      isAudioEnabled: isAudioEnabled,
    );
  }
}

/// @nodoc
const $VideoConfig = _$VideoConfigTearOff();

/// @nodoc
mixin _$VideoConfig {
  String get meetingId => throw _privateConstructorUsedError;
  bool get isVideoEnabled => throw _privateConstructorUsedError;
  bool get isAudioEnabled => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VideoConfigCopyWith<VideoConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoConfigCopyWith<$Res> {
  factory $VideoConfigCopyWith(
          VideoConfig value, $Res Function(VideoConfig) then) =
      _$VideoConfigCopyWithImpl<$Res>;
  $Res call({String meetingId, bool isVideoEnabled, bool isAudioEnabled});
}

/// @nodoc
class _$VideoConfigCopyWithImpl<$Res> implements $VideoConfigCopyWith<$Res> {
  _$VideoConfigCopyWithImpl(this._value, this._then);

  final VideoConfig _value;
  // ignore: unused_field
  final $Res Function(VideoConfig) _then;

  @override
  $Res call({
    Object? meetingId = freezed,
    Object? isVideoEnabled = freezed,
    Object? isAudioEnabled = freezed,
  }) {
    return _then(_value.copyWith(
      meetingId: meetingId == freezed
          ? _value.meetingId
          : meetingId // ignore: cast_nullable_to_non_nullable
              as String,
      isVideoEnabled: isVideoEnabled == freezed
          ? _value.isVideoEnabled
          : isVideoEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isAudioEnabled: isAudioEnabled == freezed
          ? _value.isAudioEnabled
          : isAudioEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$VideoConfigCopyWith<$Res>
    implements $VideoConfigCopyWith<$Res> {
  factory _$VideoConfigCopyWith(
          _VideoConfig value, $Res Function(_VideoConfig) then) =
      __$VideoConfigCopyWithImpl<$Res>;
  @override
  $Res call({String meetingId, bool isVideoEnabled, bool isAudioEnabled});
}

/// @nodoc
class __$VideoConfigCopyWithImpl<$Res> extends _$VideoConfigCopyWithImpl<$Res>
    implements _$VideoConfigCopyWith<$Res> {
  __$VideoConfigCopyWithImpl(
      _VideoConfig _value, $Res Function(_VideoConfig) _then)
      : super(_value, (v) => _then(v as _VideoConfig));

  @override
  _VideoConfig get _value => super._value as _VideoConfig;

  @override
  $Res call({
    Object? meetingId = freezed,
    Object? isVideoEnabled = freezed,
    Object? isAudioEnabled = freezed,
  }) {
    return _then(_VideoConfig(
      meetingId: meetingId == freezed
          ? _value.meetingId
          : meetingId // ignore: cast_nullable_to_non_nullable
              as String,
      isVideoEnabled: isVideoEnabled == freezed
          ? _value.isVideoEnabled
          : isVideoEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isAudioEnabled: isAudioEnabled == freezed
          ? _value.isAudioEnabled
          : isAudioEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_VideoConfig implements _VideoConfig {
  _$_VideoConfig(
      {required this.meetingId,
      required this.isVideoEnabled,
      required this.isAudioEnabled});

  @override
  final String meetingId;
  @override
  final bool isVideoEnabled;
  @override
  final bool isAudioEnabled;

  @override
  String toString() {
    return 'VideoConfig(meetingId: $meetingId, isVideoEnabled: $isVideoEnabled, isAudioEnabled: $isAudioEnabled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VideoConfig &&
            const DeepCollectionEquality().equals(other.meetingId, meetingId) &&
            const DeepCollectionEquality()
                .equals(other.isVideoEnabled, isVideoEnabled) &&
            const DeepCollectionEquality()
                .equals(other.isAudioEnabled, isAudioEnabled));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(meetingId),
      const DeepCollectionEquality().hash(isVideoEnabled),
      const DeepCollectionEquality().hash(isAudioEnabled));

  @JsonKey(ignore: true)
  @override
  _$VideoConfigCopyWith<_VideoConfig> get copyWith =>
      __$VideoConfigCopyWithImpl<_VideoConfig>(this, _$identity);
}

abstract class _VideoConfig implements VideoConfig {
  factory _VideoConfig(
      {required String meetingId,
      required bool isVideoEnabled,
      required bool isAudioEnabled}) = _$_VideoConfig;

  @override
  String get meetingId;
  @override
  bool get isVideoEnabled;
  @override
  bool get isAudioEnabled;
  @override
  @JsonKey(ignore: true)
  _$VideoConfigCopyWith<_VideoConfig> get copyWith =>
      throw _privateConstructorUsedError;
}
