// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'video_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VideoState {
  List<int> get users => throw _privateConstructorUsedError;
  List<String> get infoStrings => throw _privateConstructorUsedError;
  bool get isVideoEnabled => throw _privateConstructorUsedError;
  bool get isAudioEnabled => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VideoStateCopyWith<VideoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoStateCopyWith<$Res> {
  factory $VideoStateCopyWith(
          VideoState value, $Res Function(VideoState) then) =
      _$VideoStateCopyWithImpl<$Res>;
  $Res call(
      {List<int> users,
      List<String> infoStrings,
      bool isVideoEnabled,
      bool isAudioEnabled});
}

/// @nodoc
class _$VideoStateCopyWithImpl<$Res> implements $VideoStateCopyWith<$Res> {
  _$VideoStateCopyWithImpl(this._value, this._then);

  final VideoState _value;
  // ignore: unused_field
  final $Res Function(VideoState) _then;

  @override
  $Res call({
    Object? users = freezed,
    Object? infoStrings = freezed,
    Object? isVideoEnabled = freezed,
    Object? isAudioEnabled = freezed,
  }) {
    return _then(_value.copyWith(
      users: users == freezed
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<int>,
      infoStrings: infoStrings == freezed
          ? _value.infoStrings
          : infoStrings // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
abstract class _$$_VideoStateCopyWith<$Res>
    implements $VideoStateCopyWith<$Res> {
  factory _$$_VideoStateCopyWith(
          _$_VideoState value, $Res Function(_$_VideoState) then) =
      __$$_VideoStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<int> users,
      List<String> infoStrings,
      bool isVideoEnabled,
      bool isAudioEnabled});
}

/// @nodoc
class __$$_VideoStateCopyWithImpl<$Res> extends _$VideoStateCopyWithImpl<$Res>
    implements _$$_VideoStateCopyWith<$Res> {
  __$$_VideoStateCopyWithImpl(
      _$_VideoState _value, $Res Function(_$_VideoState) _then)
      : super(_value, (v) => _then(v as _$_VideoState));

  @override
  _$_VideoState get _value => super._value as _$_VideoState;

  @override
  $Res call({
    Object? users = freezed,
    Object? infoStrings = freezed,
    Object? isVideoEnabled = freezed,
    Object? isAudioEnabled = freezed,
  }) {
    return _then(_$_VideoState(
      users: users == freezed
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<int>,
      infoStrings: infoStrings == freezed
          ? _value._infoStrings
          : infoStrings // ignore: cast_nullable_to_non_nullable
              as List<String>,
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

class _$_VideoState implements _VideoState {
  _$_VideoState(
      {required final List<int> users,
      required final List<String> infoStrings,
      required this.isVideoEnabled,
      required this.isAudioEnabled})
      : _users = users,
        _infoStrings = infoStrings;

  final List<int> _users;
  @override
  List<int> get users {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  final List<String> _infoStrings;
  @override
  List<String> get infoStrings {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_infoStrings);
  }

  @override
  final bool isVideoEnabled;
  @override
  final bool isAudioEnabled;

  @override
  String toString() {
    return 'VideoState(users: $users, infoStrings: $infoStrings, isVideoEnabled: $isVideoEnabled, isAudioEnabled: $isAudioEnabled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VideoState &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            const DeepCollectionEquality()
                .equals(other._infoStrings, _infoStrings) &&
            const DeepCollectionEquality()
                .equals(other.isVideoEnabled, isVideoEnabled) &&
            const DeepCollectionEquality()
                .equals(other.isAudioEnabled, isAudioEnabled));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_users),
      const DeepCollectionEquality().hash(_infoStrings),
      const DeepCollectionEquality().hash(isVideoEnabled),
      const DeepCollectionEquality().hash(isAudioEnabled));

  @JsonKey(ignore: true)
  @override
  _$$_VideoStateCopyWith<_$_VideoState> get copyWith =>
      __$$_VideoStateCopyWithImpl<_$_VideoState>(this, _$identity);
}

abstract class _VideoState implements VideoState {
  factory _VideoState(
      {required final List<int> users,
      required final List<String> infoStrings,
      required final bool isVideoEnabled,
      required final bool isAudioEnabled}) = _$_VideoState;

  @override
  List<int> get users => throw _privateConstructorUsedError;
  @override
  List<String> get infoStrings => throw _privateConstructorUsedError;
  @override
  bool get isVideoEnabled => throw _privateConstructorUsedError;
  @override
  bool get isAudioEnabled => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_VideoStateCopyWith<_$_VideoState> get copyWith =>
      throw _privateConstructorUsedError;
}
