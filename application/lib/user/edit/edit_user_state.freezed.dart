// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'edit_user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$EditUserStateTearOff {
  const _$EditUserStateTearOff();

  _EditUserState call(
      {required String? newProfileImagePath, required User user}) {
    return _EditUserState(
      newProfileImagePath: newProfileImagePath,
      user: user,
    );
  }
}

/// @nodoc
const $EditUserState = _$EditUserStateTearOff();

/// @nodoc
mixin _$EditUserState {
  String? get newProfileImagePath => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditUserStateCopyWith<EditUserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditUserStateCopyWith<$Res> {
  factory $EditUserStateCopyWith(
          EditUserState value, $Res Function(EditUserState) then) =
      _$EditUserStateCopyWithImpl<$Res>;
  $Res call({String? newProfileImagePath, User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$EditUserStateCopyWithImpl<$Res>
    implements $EditUserStateCopyWith<$Res> {
  _$EditUserStateCopyWithImpl(this._value, this._then);

  final EditUserState _value;
  // ignore: unused_field
  final $Res Function(EditUserState) _then;

  @override
  $Res call({
    Object? newProfileImagePath = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      newProfileImagePath: newProfileImagePath == freezed
          ? _value.newProfileImagePath
          : newProfileImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$EditUserStateCopyWith<$Res>
    implements $EditUserStateCopyWith<$Res> {
  factory _$EditUserStateCopyWith(
          _EditUserState value, $Res Function(_EditUserState) then) =
      __$EditUserStateCopyWithImpl<$Res>;
  @override
  $Res call({String? newProfileImagePath, User user});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$EditUserStateCopyWithImpl<$Res>
    extends _$EditUserStateCopyWithImpl<$Res>
    implements _$EditUserStateCopyWith<$Res> {
  __$EditUserStateCopyWithImpl(
      _EditUserState _value, $Res Function(_EditUserState) _then)
      : super(_value, (v) => _then(v as _EditUserState));

  @override
  _EditUserState get _value => super._value as _EditUserState;

  @override
  $Res call({
    Object? newProfileImagePath = freezed,
    Object? user = freezed,
  }) {
    return _then(_EditUserState(
      newProfileImagePath: newProfileImagePath == freezed
          ? _value.newProfileImagePath
          : newProfileImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$_EditUserState implements _EditUserState {
  _$_EditUserState({required this.newProfileImagePath, required this.user});

  @override
  final String? newProfileImagePath;
  @override
  final User user;

  @override
  String toString() {
    return 'EditUserState(newProfileImagePath: $newProfileImagePath, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EditUserState &&
            const DeepCollectionEquality()
                .equals(other.newProfileImagePath, newProfileImagePath) &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(newProfileImagePath),
      const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$EditUserStateCopyWith<_EditUserState> get copyWith =>
      __$EditUserStateCopyWithImpl<_EditUserState>(this, _$identity);
}

abstract class _EditUserState implements EditUserState {
  factory _EditUserState(
      {required String? newProfileImagePath,
      required User user}) = _$_EditUserState;

  @override
  String? get newProfileImagePath;
  @override
  User get user;
  @override
  @JsonKey(ignore: true)
  _$EditUserStateCopyWith<_EditUserState> get copyWith =>
      throw _privateConstructorUsedError;
}